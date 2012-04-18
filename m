Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKMUM-0006i4-V9
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 04:27:34 +0000
Received: by yenm10 with SMTP id m10so3891305yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 21:27:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHvCehVVPoORvmV=WZESDkb_9es1B7W9ojFv9P3W1ANpQyQ1xA@mail.gmail.com>
References: <CAHvCehVVPoORvmV=WZESDkb_9es1B7W9ojFv9P3W1ANpQyQ1xA@mail.gmail.com>
Date: Tue, 17 Apr 2012 21:27:29 -0700
Message-ID: <CAN8TOE9wiM-8arLQCbgHkmXESkFiF=jyVJoa16PebfKom=sDPw@mail.gmail.com>
Subject: Re: UBI use subpage and verify fail when write on nandflash
From: Brian Norris <computersforpeace@gmail.com>
To: b w <wdjjwb@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Jon Povey <jon.povey@racelogic.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Jon,

On Tue, Apr 17, 2012 at 7:19 AM, b w <wdjjwb@gmail.com> wrote:
> Hello,
> =A0 =A0Use linux 2.6.32,ARM,nandflash(support subpage),config
> CONFIG_MTD_NAND_VERIFY_WRITE. UBI attach fail on empty flash.I found
> when UBI write VID header to the second subpage of eraseblock,will
> call function "nand_write_page",this function write a whole page(i
> think the page size is 2048),the unset bit of the buf is filled with
> 0xff,after write,
>
> #ifdef CONFIG_MTD_NAND_VERIFY_WRITE
> =A0 =A0 =A0 =A0/* Send command to read back the data */
> =A0 =A0 =A0 =A0chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
>
> =A0 =A0 =A0 =A0if (chip->verify_buf(mtd, buf, mtd->writesize))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EIO;
> #endif
>
> now,the buf for verify is not equal to the buf which write,because the
> buf which read from flash contains EC header ?
>
> I found there is topic also mention subpage:
> http://lists.infradead.org/pipermail/linux-mtd/2010-September/031822.html

Hmm, not sure if this is exactly the same issue, but it is related.
It's worth CC'ing Jon to see if he pursued this at all.

Brian
