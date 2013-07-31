Received: from mail1.efacec.com ([213.58.212.93])
 by merlin.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4XKg-0000Uz-AH
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 14:24:55 +0000
Message-ID: <51F91E08.7030409@efacec.com>
Date: Wed, 31 Jul 2013 15:24:08 +0100
From: =?ISO-8859-1?Q?An=EDbal_Almeida_Pinto?= <anibal.pinto@efacec.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>,
 "davinci-linux-open-source@linux.davincidsp.com"
 <Davinci-linux-open-source@linux.davincidsp.com>
Subject: JFFS2 impact when don't have sub page access
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fernando Gomes <fernando.gomes@efacec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I' am using an OMAP L138 with a NAND SLC (MT29F4G08)

I was making some tests with Ubifs but found some errors due to OMAP=20
don't support sub pages access:

[  128.344667] UBI error: ubi_io_read: error -74 (ECC error) while=20
reading 512 bytes from PEB 2:512, read 512 bytes
[  128.883945] UBI error: ubi_io_read: error -74 (ECC error) while=20
reading 512 bytes from PEB 1766:512, read 512 bytes
[  128.884072] UBI: run torture test for PEB 1766

The error will continue on loop.

The mtd_tests failed on mtd_supgatetest:

[ 63.870866] mtd_subpagetest: MTD device: 0
[ 63.870929] mtd_subpagetest: MTD device size 262144, eraseblock size=20
131072, page size 2048, subpage size 512, count of eraseblocks 2, pages=20
per eraseblock 64, OOB size 64
[ 63.871052] mtd_subpagetest: scanning for bad eraseblocks
[ 63.871097] mtd_subpagetest: scanned 2 eraseblocks, 0 are bad
[ 63.871126] mtd_subpagetest: erasing whole device
[ 63.872731] mtd_subpagetest: erased 2 eraseblocks
[ 63.872756] mtd_subpagetest: writing whole device
[ 63.873873] mtd_subpagetest: written up to eraseblock 0
[ 63.874943] mtd_subpagetest: written 2 eraseblocks
[ 63.874969] mtd_subpagetest: verifying all eraseblocks
[ 63.875620] mtd_subpagetest: error: read failed at 0x0
[ 63.875667] mtd_subpagetest: error -74 occurred

and disabling the sub page access enable the use of UBIFS [1].

Is there any impact on jffs2 partitions if sub page write are enable on=20
OMAP L138?

Thanks.

[1] -=20
http://davinci-linux-open-source.1494791.n2.nabble.com/UBI-crashes-fixing-N=
AND-subpage-writes-td5485828.html=20
(message from 2010/09/29)

Regards,
An=EDbal
