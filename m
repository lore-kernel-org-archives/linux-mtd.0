Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5Vq2-0004JP-PE
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 07:33:35 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Stefan Roese <sr@denx.de>
Subject: RE: [PATCH] mtd: nand_ids: Add device parameters for Toshiba's
 TC58NVG1S3ETAI0 NAND EEPROM
Date: Tue, 21 Jan 2014 07:33:04 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA685A2@DBDE04.ent.ti.com>
References: <1389089083-29694-1-git-send-email-sr@denx.de>
 <20140120190441.GJ8919@ld-irv-0074>
In-Reply-To: <20140120190441.GJ8919@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Tue, Jan 07, 2014 at 11:04:43AM +0100, Stefan Roese wrote:
>> Toshiba's TC58NVG1S3ETAI0 is a single 3.3V 2 Gbit (2,214,592,512 bits) N=
AND
>> Electrically Erasable and Programmable Read-Only Memory (NAND E2PROM)
>> organized as (2048 + 64) bytes x 64 pages x 2048 blocks.
>>
>> Signed-off-by: Stefan Roese <sr@denx.de>
[...]
>> @@ -31,6 +31,9 @@ struct nand_flash_dev nand_flash_ids[] =3D {
>>  	 * listed by full ID. We list them first so that we can easily identif=
y
>>  	 * the most specific match.
>>  	 */
>> +	{"TC58NVG1S3ETAI0 2G 3.3V 8-bit",
>> +		{ .id =3D {0x98, 0xda, 0x90, 0x15, 0x76, 0x00, 0x00, 0x00} },
>> +		  SZ_2K, SZ_256, SZ_128K, 0, 5, 64, NAND_ECC_INFO(1, SZ_512) },
>
>I have to NAK this in its current form, for two reasons:
>
>1) This is not a specific enough ID string. It conflicts with another
>NAND which was recently supported.
>
>2) This patch may not really be needed at all. The "full ID" listing is
>only for NAND which can't be detected via other means (e.g., ONFI, or
>traditional extended ID parsing). Is this NAND mis-detected in Linus'
>current tree? As I read the code, it should correctly identify this
>NAND's device size, page size, OOB size, etc.
>
>See this commit for reference:
>
>commit 60c6738245612df9499b340c15edf48b8f3e7981
>Author: Brian Norris <computersforpeace@gmail.com>
>Date:   Tue Jun 25 13:17:59 2013 -0700
>
>    mtd: nand: detect OOB size for Toshiba 24nm raw SLC
>
>   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D60c6738245612df9499b340c15edf48b8f3e7981
>
>It adds support for a class of Toshiba 24nm NAND, including this one:
>
>    24nm SLC 2Gbit TC58NVG1S3HTA00
>    ID: 0x98 0xda 0x90 0x15 0x76 0x16 0x08 0x00
>
>Please reconcile your patch with the comments found there.
>

Yes, I think this is a different technology part..
because though the page-size =3D 2048B is same, but OOB-size =3D 64B.
However, with your OOB-size is detected as 128B.

Best part is the datasheet of this part does not mention anything about the=
 6th byte :-).
So, I think we can first  read 6th-byte (using READID command), and figure =
out difference
between your part and this one, then based on it append the OOB-calculation=
 to you patch. Ok ?

ID byte 5, bit[7]:=20
	1 -> BENAND=20
	0 -> raw SLC   <<----- SLC NAND

ID byte 6, bits[2:0]:   <<----- 6th byte has no mention in datasheet
	100b -> 43nm=20
	 101b -> 32nm
	 110b -> 24nm
	 111b -> Reserved

But sincerely, why is Toshiba doing all this ?
It would hit them only, as their devices will lack support on mainline kern=
els and u-boots.
(Or their customers would have to carry custom patches all along).
I tried convincing Toshiba to get their parts ONFI compliant, but they were=
 too reluctant.


with regards, pekon
