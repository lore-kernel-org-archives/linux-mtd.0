Received: from [202.108.35.243] (helo=sina.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rVHZ-0006Pa-00
	for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2002 03:41:26 +0100
Message-ID: <20020331023459.8404.qmail@sina.com>
From: fyaowen <fyaowen@sina.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Re: problem with build jffs2 filesystem 
MIME-Version: 1.0
Date: Sun, 31 Mar 2002 10:34:58 +0800
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


----- Original Message -----
From:David Woodhouse <dwmw2@infradead.org>
To:fyaowen <fyaowen@sina.com>
Subject:Re: problem with build jffs2 filesystem 
Date:Sat, 30 Mar 2002 23:30:23 +0800
 >fyaowen@sina.com said:
 >>    dd if=jffs2.image of=/dev/mtd7
 >>    mount -t jffs2 /dev/mtd7 /mnt
 >> After I gave out this instruction, all partitions on Neponset were
 >> erased.  
 >
 >That mount command should have failed. You cannot mount the character 
 >device. 
ls -l /dev
brw-r--r--    1 root     root      31,   7 Jan 28 14:16 mtd7

I have no mtdblocks, only mtd* instead. The major number of mtd7
is 31. So mtd7 is a block device, isn't it?

 >
 >--
 >dwmw2
 >
 >
 >
 >

______________________________________

===================================================================
新浪免费电子邮箱 (http://mail.sina.com.cn)
新浪分类信息：二手市场走一走，该出手时就出手！ (http://classad.sina.com.cn/2shou/)
