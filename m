Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCvFC-0006dB-7o
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 18:06:11 +0000
Received: by mail-ie0-f177.google.com with SMTP id at1so3552418iec.8
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2014 10:05:48 -0800 (PST)
Date: Mon, 10 Feb 2014 10:05:39 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand_ids: Add device parameters for Toshiba's
 TC58NVG1S3ETAI0 NAND EEPROM
Message-ID: <20140210180539.GA18440@ld-irv-0074>
References: <1389089083-29694-1-git-send-email-sr@denx.de>
 <20140120190441.GJ8919@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EA685A2@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA685A2@DBDE04.ent.ti.com>
Cc: Stefan Roese <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Tue, Jan 21, 2014 at 07:33:04AM +0000, Pekon Gupta wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >>On Tue, Jan 07, 2014 at 11:04:43AM +0100, Stefan Roese wrote:
> >> Toshiba's TC58NVG1S3ETAI0 is a single 3.3V 2 Gbit (2,214,592,512 bits) NAND
> >> Electrically Erasable and Programmable Read-Only Memory (NAND E2PROM)
> >> organized as (2048 + 64) bytes x 64 pages x 2048 blocks.
> >>
> >> Signed-off-by: Stefan Roese <sr@denx.de>
> [...]
> >> @@ -31,6 +31,9 @@ struct nand_flash_dev nand_flash_ids[] = {
> >>  	 * listed by full ID. We list them first so that we can easily identify
> >>  	 * the most specific match.
> >>  	 */
> >> +	{"TC58NVG1S3ETAI0 2G 3.3V 8-bit",
> >> +		{ .id = {0x98, 0xda, 0x90, 0x15, 0x76, 0x00, 0x00, 0x00} },
> >> +		  SZ_2K, SZ_256, SZ_128K, 0, 5, 64, NAND_ECC_INFO(1, SZ_512) },
> >
> >I have to NAK this in its current form, for two reasons:
> >
> >1) This is not a specific enough ID string. It conflicts with another
> >NAND which was recently supported.
> >
> >2) This patch may not really be needed at all. The "full ID" listing is
> >only for NAND which can't be detected via other means (e.g., ONFI, or
> >traditional extended ID parsing). Is this NAND mis-detected in Linus'
> >current tree? As I read the code, it should correctly identify this
> >NAND's device size, page size, OOB size, etc.

FYI, I meant for there to be a logical break between the above paragraph
and the following commit reference. The following commit is simply a
reference with some information about 1 and 2. It is well documented in
its description, so please read it if you are interested in Toshiba's
SLC NAND.

> >See this commit for reference:
> >
> >commit 60c6738245612df9499b340c15edf48b8f3e7981
> >Author: Brian Norris <computersforpeace@gmail.com>
> >Date:   Tue Jun 25 13:17:59 2013 -0700
> >
> >    mtd: nand: detect OOB size for Toshiba 24nm raw SLC
> >
> >   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=60c6738245612df9499b340c15edf48b8f3e7981
> >
> >It adds support for a class of Toshiba 24nm NAND, including this one:
> >
> >    24nm SLC 2Gbit TC58NVG1S3HTA00
> >    ID: 0x98 0xda 0x90 0x15 0x76 0x16 0x08 0x00
> >
> >Please reconcile your patch with the comments found there.
> >
> 
> Yes, I think this is a different technology part..

Yes, it is a different technology part. But this patch is not specific
enough to make any distinction between them.

> because though the page-size = 2048B is same, but OOB-size = 64B.
> However, with your OOB-size is detected as 128B.

Stefan should read my patch, then determine the way forward -- either
with a more specific ID string or (as I suspect) by dropping this patch
altogether as it is unnecessary.

For reference, I believe the correct 6-byte ID string would be:

  98, DA 90, 15, 76, 14

And then you would notice that the 6th byte differs from the one I
quoted from my patch. So the 6th ID byte is important.

But again, I don't think this patch is needed at all. This flash (a 43nm
Toshiba SLC) should be detected just fine through ID decoding that is
already present.

> Best part is the datasheet of this part does not mention anything about the 6th byte :-).
> So, I think we can first  read 6th-byte (using READID command), and figure out difference
> between your part and this one, then based on it append the OOB-calculation to you patch. Ok ?

I actually have had several discussions with Toshiba about their SLC. I
have quite a few tables of 6-byte ID strings from them due to these kind
of difficulties, and I believe I convinced them to include the 6th byte
ID information in datasheets for their new parts (not sure if they will
do this retroactively for older ones). Somewhere, I have at least one
doc from Toshiba that they gave the OK for me to post publicly. If you
want it and I can scrounge it up, I'll try to get it out there.

Brian
