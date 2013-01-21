Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tx8AM-00041r-JD
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 03:35:23 +0000
Message-ID: <50FCB75D.1000200@freescale.com>
Date: Mon, 21 Jan 2013 11:34:53 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: question: Why the nand_wait() wait for 20ms for nand program.
References: <50F9023D.5040408@freescale.com> <50F93F65.90805@parrot.com>
In-Reply-To: <50F93F65.90805@parrot.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8818=E6=97=A5 20:26, Matthieu CASTET =E5=86=
=99=E9=81=93:
> Huang Shijie a =C3=A9crit :
>> Hi all:
>> Why the nand_wait() wait for 20ms for nand program. could we
>> expand this time to 40ms? I have a nand chip : Micron MT29F64G08CBABAW=
P.
>> The chip's BUSY/READY pin may needs more then 20ms to become ready,
>> though its
>> datasheet tells me the tPROG's max value is 2.5ms.
>>
> Don't you have an hardware problem (missing pullup/down on ready busy p=
in) ?
>
> If the datasheet say the max value is 2.5 ms , how it can be more than =
20 ms.

I finally found the root cause.

I added the do_gettimeofday() in the nand_wait() to measure the=20
READY/BUSY time. The code is like this:
---------------------------------------------------- code start=20
-----------------------------------------------------------------------

+static struct timeval start, finish;
+static int my_nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
+{
+
+ unsigned long timeo =3D jiffies;
+ int status, state =3D chip->state;
+ int check =3D 0;
+
+ if (state =3D=3D FL_ERASING)
+ timeo +=3D (HZ * 400) / 1000;
+ else
+ timeo +=3D (HZ * 20) / 1000;
+
+ led_trigger_event(nand_led_trigger, LED_FULL);
+
+ /*
+ * Apply this short delay always to ensure that we do wait tWB in any
+ * case on any machine.
+ */
+ ndelay(100);
+
+ if ((state =3D=3D FL_ERASING) && (chip->options & NAND_IS_AND))
+ chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
+ else
+ chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+
+ do_gettimeofday(&start);
+
+ if (in_interrupt() || oops_in_progress)
+ panic_nand_wait(mtd, chip, timeo);
+ else {
+ while (time_before(jiffies, timeo)) {
+ if (chip->dev_ready) {
+ if (chip->dev_ready(mtd)) {
+ do_gettimeofday(&finish);
+ check =3D 1;
+ break;
+ }
+ } else {
+ if (chip->read_byte(mtd) & NAND_STATUS_READY)
+ break;
+ }
+ cond_resched();
+ }
+ }
+ led_trigger_event(nand_led_trigger, LED_OFF);
+
+ status =3D (int)chip->read_byte(mtd);
+ if (check =3D=3D 0) {
+ long ms, us;
+
+ /* get it here. */
+ do_gettimeofday(&finish);
+
+ us =3D (finish.tv_sec * USEC_PER_SEC + finish.tv_usec)
+ - (start.tv_sec * USEC_PER_SEC + start.tv_usec);
+ ms =3D us / USEC_PER_MSEC;
+
+ printk("[ %s : ], status : %x, <%lu, %lu>, < %lu, %lu>, <%lu, %lu>, Js=20
<%lu, %lu>\n",
+ __func__, status, finish.tv_sec, start.tv_sec,
+ finish.tv_usec, start.tv_usec, ms, us);
+
+ }
+ start =3D finish =3D (struct timeval) {0, 0};
+ return status;
+}

/**
* __nand_unlock - [REPLACEABLE] unlocks specified locked blocks
* @mtd: mtd info
@@ -2180,7 +2247,8 @@ static int nand_write_page(struct mtd_info *mtd,=20
struct nand_chip *chip,
if (!cached || !(chip->options & NAND_CACHEPRG)) {

chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
- status =3D chip->waitfunc(mtd, chip);
+ status =3D my_nand_wait(mtd, chip);
+
/*
* See if operation failed and additional status checks are
* available.
--=20
------------------------------------------------------------------------c=
ode=20
end=20
here.--------------------------------------------------------------------=
--------


The code tells me that it will wait for 20ms, but in actually, the=20
kernel may breaks the while loop in JUST 1ms.
My CONFIG_HZ is 100.

Any idea about this?

thanks.
Huang Shijie









>
> Matthieu
>
