Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Js5B-0002F6-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 09:41:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D0D9DA9.6090404@emsoftltd.com> 
References: <3D0D9DA9.6090404@emsoftltd.com>  <3D0D981D.8040602@emsoftltd.com> <18852.1024302161@redhat.com> 
To: Jason Chan <jason@emsoftltd.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Block management routine for MTD NandFlash driver? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 09:41:50 +0100
Message-ID: <19294.1024303310@redhat.com>
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
>     I trying to use EXT2 for my nandflash driver. Is that OK? 

No. You need _some_ kind of file system which is capable of dealing with 
flash -- either a real file system directly on the flash such as JFFS2, or 
a 'translation layer' like the SmartMedia one or NFTL if you really need to 
use ext2 for some reason.

--
dwmw2
