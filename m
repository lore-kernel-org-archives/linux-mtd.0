Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F1f8n-0002PV-R8
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 02:32:33 -0500
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ITN00N5U0Y10P@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 16:32:26 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0ITN00AYD0Y14Q@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 16:32:25 +0900 (KST)
Date: Wed, 25 Jan 2006 16:32:25 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <20060124124710.GA29129@angel.research.nokia.com>
To: 'Jarkko Lavinen' <jarkko.lavinen@nokia.com>
Message-id: <0ITN00AYE0Y14Q@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: Erase verify problem with OneNAND
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jakko 

I think it's same problem related with Double Density Package (DDP) previous

In erase call path, there's no DDP select. It only set DFS, FBA as following

% onenand_command()
        if (block != -1) {
                /* Write 'DFS, FBA' of Flash */
                value = onenand_block_address(this, block);
                this->write_word(value, this->base +
ONENAND_REG_START_ADDRESS1);
        }

I think we have to add 

	  /* Select DataRAM for DDP */
              value = onenand_bufferram_address(this, block);
              this->write_word(value, this->base +
ONENAND_REG_START_ADDRESS2);

Now I can't have a DDP chip I can't test.  please test this code and
feekback

And "Newly-erased block contained word ..." is also happend on my board in
latest omap kernel tree.
Now I also debugging this problem

Regards,
Kyungmin Park

> -----Original Message-----
> From: Jarkko Lavinen [mailto:jarkko.lavinen@nokia.com] 
> Sent: Tuesday, January 24, 2006 9:47 PM
> To: Kyungmin Park
> Cc: linux-mtd@lists.infradead.org
> Subject: Erase verify problem with OneNAND
> 
> Hi Kyungmin
> 
> I have a strange erase verify read problem with OneNand. It occurs
> strangely when crossing the 128MB border, first erasing (and
> presumably verifying) a block on other side and then erasing another
> block on the other side. Then verify reads garbage.
> 
> I am using CVS head for the drivers/mtd but the JFFS2 part is from the
> 2.6.15 kernel, before Erase Block Headers were committed. 
> Onenand_base.c
> is rev 1.15. The test board has muxed 256MB OneNand.
> 
> I see JFFS2 repeatably complaining "Newly-erased block contained
> word...".  This comes from fs/jffs2/erase.c:jffs2_block_check_erase()
> which reads the erased block and checks all the bits are 1.
> 
> I see this occuring when I flash JFFS2 root image and boot it. Our
> bootloader leaves unused erase blocks empty, without cleanmarker.
> When JFFS2 sees an empty block, it has to erase it again since there 
> is no cleanmarker. After erasing, it reads the first page to see it 
> really is empty.
> 
> For some reason the first verify read at physical offset 0x7fe0000 
> (JFFS2 report offset 0x07b60000 relative to the partition offset 
> 0x480000) fails but retry succeeds -- which means the block was 
> correctly erased but the first verify reads some garbage.
> 
> This is tricky to debug, since the problem disappears if I increase 
> MTD debug level. On the other hand the verify problem seems to appear
> always after after flashing and booting the board.
> 
> I have modified jffs2_block_check_erase() to retry the verify read
> if garbage is seen at the erased page.  I am using MTD debug level
> 0 and changed onenand_erase to report at that level to see when it 
> is being called.
> 
> The repeatably occuring one:
> 
>   ...
>   onenand_erase: start = 0x08040000, len = 131072
>   onenand_erase: start = 0x08020000, len = 131072
>   onenand_erase: start = 0x08000000, len = 131072
>   onenand_erase: start = 0x07fe0000, len = 131072
>   Newly-erased block contained word 0x45e0f628 at offset 0x07b60000
>   Read OK after 1 retries
>   onenand_erase: start = 0x07fc0000, len = 131072
>   onenand_erase: start = 0x07fa0000, len = 131072
>   onenand_erase: start = 0x07f80000, len = 131072
>   ...
> 
> Another exmaple, less frequent:
> 
>   onenand_erase: start = 0x04ce0000, len = 131072
>   onenand_erase: start = 0x04cc0000, len = 131072
>   onenand_erase: start = 0x04ca0000, len = 131072
>   onenand_erase: start = 0x0ffe0000, len = 131072
>   Newly-erased block contained word 0x7ea4c at offset 0x0fb60000
>   Read OK after 1 retries
> 
> Jarkko Lavinen
> 
> 
