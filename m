Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Jrmg-0002DL-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 09:22:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D0D981D.8040602@emsoftltd.com> 
References: <3D0D981D.8040602@emsoftltd.com> 
To: Jason Chan <jason@emsoftltd.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Block management routine for MTD NandFlash driver? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 09:22:41 +0100
Message-ID: <18852.1024302161@redhat.com>
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

jason@emsoftltd.com said:
>     Any bad block management routine (eg. Invalid block table ) is
> implemented for MTD NandFlash driver? It seems that the ECC routine is
> not enough for my nandflash driver. And  I need a more robust bad
> block management routine for that.

The low-level hardware driver does not implement and bad block management. 
That is done by whatever file system or translation layer you use on the 
flash. What are you intending to use? JFFS2?

--
dwmw2
