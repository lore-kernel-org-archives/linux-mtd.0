Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16njhK-0005Xw-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 17:16:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001201c1cf6b$64df4a50$be04010a@MTG016> 
References: <001201c1cf6b$64df4a50$be04010a@MTG016> 
To: "Sebastian" <sebastian.vaitus@masstechgroup.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: No space left on device 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 20 Mar 2002 17:27:33 +0000
Message-ID: <8945.1016645253@redhat.com>
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

sebastian.vaitus@masstechgroup.com said:
>  I was able to create a JFFS2 image with mkfs.jffs2, erase the flash,
> and then copy the image to the flash ( about 200 bytes). I can mount
> the mtdblock and browse the files on the JFFS2 file system, but I
> cannot make any changes to the existing files or add new ones.
> Everytime I try to modify it I get the 'No space left on device'
> error.

Please compile with CONFIG_JFFS2_FS_DEBUG=1, set the console loglevel to 9 
so that you see all the KERN_DEBUG messages, and log the output over a 
serial console while you reproduce this and also run 'df'. 

--
dwmw2
