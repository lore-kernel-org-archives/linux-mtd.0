Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTSIs-0005DA-Fy
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 08:38:25 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Gerhard Sittig <gsi@denx.de>, David Mosberger <davidm@egauge.net>
Subject: RE: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Date: Fri, 28 Mar 2014 08:37:47 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB9500@DBDE04.ent.ti.com>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <20140327112722.GQ3998@book.gsilab.sittig.org>
In-Reply-To: <20140327112722.GQ3998@book.gsilab.sittig.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>From: Gerhard Sittig [mailto:gsi@denx.de]
>>On Thu, 2014-03-27 at 06:56 +0000, Gupta, Pekon wrote:
>> >From: David Mosberger

[...]

>> >+/**
>> >+ * nand_read_page_on_die - [INTERN] read raw page data without ecc
>> >+ * @mtd: mtd info structure
>> >+ * @chip: nand chip info structure
>> >+ * @buf: buffer to store read data
>> >+ * @oob_required: caller requires OOB data read to chip->oob_poi
>> >+ * @page: page number to read
>> >+ */
>> >+static int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chi=
p *chip,
>> >+				 uint8_t *buf, int oob_required, int page)
>> >+{
>> >+	uint32_t failed;
>> >+	int ret;
>> >+
>> >+	failed =3D mtd->ecc_stats.failed;
>> >+
>>
>> This is the entry point of chip->ecc.read_page(),  So, your first call t=
o ecc.read_buf
>> should have happened here, not in check_for_bitflips(). And you should h=
ave just
>> passed the read_buffer to for checking of bit-flips.
>>
>> >+	ret =3D check_read_status_on_die(mtd, chip, page);
>> Also this should have been part of nand_chip->ecc.correct() interface.
>
>AFAIU the sequence of commands which the NAND chip requires
>doesn't quite map to the sequence of what the MTD layer does
>(emit the read command, read the data, optionally check ECC)
>
>when "on die ECC" is enabled, the chip requires a sequence of
>- read page command (READ0, addresses, READSTART)
>- status check (mandatory! cmd 70, to check FAIL and REWRITE bits)
>- re-enter data read mode (READ0, _without_ addresses and START)
>- fetch data bytes
>
I checked Micron Datasheet for "MT29F4G16ABADAWP by name
"m60a_4gb_8gb_16gb_ecc_nand.pdf" and on its=20
"Figure 39: READ PAGE (00h-30h) Operation with Internal ECC Enabled"
There is no mention of above third step.

As per the "figure 39" a READ_PAGE Operation with internal ECC enabled
requires following sequence..
- [00h] <address> <address> ... <address> [30h]  /* READ_PAGE command */
- [70h] <status> [00h]        /* READ_STATUS command */
And after that data comes our serial on the bus. So in that case you can


>actually the READ0 plus READSTART does a transfer from the chip's
>array into the chip's caches, before data is fetched out of the
>chip into the SoC; the repeated READ0 does some kind of "rewind"
>from status output to data output, it doesn't re-read the array
>within the chip
>
Agree.. All I'm saying is if you merge "check_read_status_on_die()" into
nand_read_page_on_die() then this would map to normal NAND driver flow.

nand_read_page_on_die( ... ) {
 (a)	chip->cmdfunc(mtd, NAND_CMD_READ0, column, page);  /* READ_PAGE comman=
d */

 (b)	/* Check ECC status of page just transferred into NAND's page buffer: =
*/
	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
	status =3D chip->read_byte(mtd);

(c)	/* Read the data out from the NAND device */
	chip->read_buf(mtd, buf, mtd->writesize);
	if (oob_required)
		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);

(d)	/* check for ECC errors */
	if (status & NAND_STATUS_FAIL) {
		/* Page has invalid ECC, but still pass to above layers */
		return -EBADMSG;
	} else if (status & NAND_STATUS_REWRITE) {
		bitflip_count =3D chip->ecc.correct( mtd, buf, , ... )
		return bitflip_count;
	} else {
		return 0;
	}
}

Where; chip->ecc.correct =3D check_for_bitflips();

Above implementation, as you already fetch the data from NAND device
at the start, it saves you from one extra read done in check_for_bitflips()
+	/* Read entire page w/OOB area with on-die ECC on: */
+	chip->read_buf(mtd, chkbuf, read_size);

Also, you have to return the read_data, even in case of ECC failures,
which was not earlier done in check_read_status_on_die()

[...]

>> (1) read buffer (with on-die ECC =3D=3D ON)
>> (2) check for bit-flips (just pass the read_buffer)
>> (3) correct bit-flips (again just pass read_buffer)
>> Then probably you don't need this call, and you can re-use existing gene=
ric
>> NAND driver implementations.
>
>unfortunately this is not possible according to the chip's
>datasheet; even if you _evaluate_ the status only later, you have
>to _fetch_ it before the data, and thus do the command re-issue
>dance, and cannot use nand_command_lp() since it automatically
>does READSTART for READ0
>
I have broken (1) into (a) + (b) + (c) above.
And (2) + (3) =3D (d), where, (3) is actually chip->ecc.correct() =3D check=
_for_bitflips().

Hope that clarifies the intend..


With regards, pekon
