Received: from vs137042.vserver.de ([62.75.137.42] helo=wamasoft.de)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ju08S-00059H-UT
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 07:01:49 +0000
Message-Id: <200805080701.m4871jL8015834@wamasoft.de>
From: "Markus Wagner" <markus.wagner@wamasoft.de>
To: <vernoninhand@gmail.com>
Subject: AW: Problems mounting jffs2 image on nor flash > Erase at
	0x....failed	immediately: -EROFS. Is the sector locked?
Date: Thu, 8 May 2008 08:59:50 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <48226D8F.3030603@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hello,
>
> i have some problems to mount my jffs2 image on my NOR-Flash.
> I ported UBoot and Linux to my new board.
> So far UBoot works well but Linux has some problems to mount the flash.
>
> I can read from my flash with the dd command.
> But when I mount the flash with 'mount -t jffs2 /dev/mtdblock4 /mnt/' I
get the error: 'Erase at 0x...... failed immediately: -EROFS. Is the sector
locked?'
>
> Some Infos:
> Its an Intel P33 Strataflash.
>
> <SNIP>
>
> It seems to me that the kernel doesn't know that the flash is protected
after power up.
>
> How can I get it to work?
> Where should I look at?
>
> Thanks for your help.
> Markus
>
>   
>You did not mention exactly which device you are using. I just posted a 
>patch to the list that added more StrataFlash devices to the fixup table 
>so they are unlocked at power up.

>See [PATCH] mtd: add more StrataFlash chip ids that need powerup fixup

>Vern

It s a 28F256P33 Strataflash.

I have done a workaround in add_mtd_partitions()
If I detect the filesystem partition I fire a manually unlock to it.
Works so far.

But I will search your patch in the archive.
Seems to be the better solution.

Thx
Markus
