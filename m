Received: from school.cyberec.com ([202.153.122.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Jry9-0002EK-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 09:34:37 +0100
Message-ID: <3D0D9DA9.6090404@emsoftltd.com>
Date: Mon, 17 Jun 2002 16:28:25 +0800
From: Jason Chan <jason@emsoftltd.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Bad Block management routine for MTD NandFlash driver?
References: <3D0D981D.8040602@emsoftltd.com> <18852.1024302161@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David,
    I trying to use EXT2 for my nandflash driver. Is that OK?

When I make a EXT2 file system on the nandflash driver, the 
mtd/nand/nand.c show a error message that "nand_erase: Failed erase", 
and it keep looping the same statement.

Since I may use other filesystem in the future, eg. CRAMFS or VFAT, I 
have no idea on the completeness of the filesystem on the bad block 
managment. So how can enable use the translation layer to manage my bad 
block?

David Woodhouse wrote:

>jason@emsoftltd.com said:
>
>>    Any bad block management routine (eg. Invalid block table ) is
>>implemented for MTD NandFlash driver? It seems that the ECC routine is
>>not enough for my nandflash driver. And  I need a more robust bad
>>block management routine for that.
>>
>
>The low-level hardware driver does not implement and bad block management. 
>That is done by whatever file system or translation layer you use on the 
>flash. What are you intending to use? JFFS2?
>
>--
>dwmw2
>
>


-- 
Best Regards,

Jason Chan
Emsoft Ltd.
