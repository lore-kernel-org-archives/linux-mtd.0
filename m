Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ANzsE-00006C-KX
	for <linux-mtd@lists.infradead.org>; Sun, 23 Nov 2003 19:26:22 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: Rick Bronson <rick@efn.org>, linux-mtd@lists.infradead.org
Date: Mon, 24 Nov 2003 08:31:08 +1300
References: <E1ANwSn-0000bd-00@c-67-164-61-95.client.comcast.net>
In-Reply-To: <E1ANwSn-0000bd-00@c-67-164-61-95.client.comcast.net>
MIME-Version: 1.0
Message-Id: <20031123192443.CA92B15942@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: nand_write_ecc() broken?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 24 November 2003 04:47, Rick Bronson wrote:
> Hi,
>
>   The routine nand_write_ecc() doesn't seem to account for bad blocks.
> If I write an image over a known bad block, nand_erase() correctly
> identifies and skips over the bad block (via nand_block_bad()) but
> nand_write_ecc() seems to ignore the bad blocks.
>
>   Anyone experienced the same problem?
>
> I'm using 11/16/03 cvs version of mtd on an ARM, linux-2.4.19, and
> here's my config:
>
> CONFIG_JFFS2_FS=y
> CONFIG_JFFS2_FS_DEBUG=0
> CONFIG_JFFS2_FS_NAND=y
>
>  Here's my hardware specific NAND stuff:
>
> 	my_nand->eccmode = NAND_ECC_SOFT;  /* enable ECC */
> 	my_nand->chip_delay = 20;
>

Writing to known bad blocks is not necessarily a problem, depending on how 
the block became bad (eg. bad block marking). Bad block managemnet is not 
really an mtd responsibility, but that of the file system/block device driver.

-- CHarles
