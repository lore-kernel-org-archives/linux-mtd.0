Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178apr-0004vy-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 07:03:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0205161315020.26329-100000@localhost.localdomain> 
References: <Pine.LNX.4.44.0205161315020.26329-100000@localhost.localdomain> 
To: Paul <paul@oz.net>
Cc: Studying MTD <studying_mtd@yahoo.com>, linux-mtd@lists.infradead.org
Subject: Re: FAT for NAND Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 07:03:23 +0100
Message-ID: <32431.1021615403@redhat.com>
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

paul@oz.net said:
>  Perhaps I used the wrong terminology when I said "FAT12 translation",
> but doesn't the firmware on a USB SmartMedia reader have to be able to
>  parse the SSFDC Physical Format Specification, such as the CIS (Card
> Information Structure)?  This is the part that seems to be missing in
> sddr09.c, and the upper level stuff (e.g. fs/fat/inode.c) only handles
>  pure FAT12.  In that case, sddr09.c isn't as useful to us as
> previously suggested.

OK, I thought there was more knowledge about the SmartMedia translation 
layer in the driver than that -- after all, if they were going to do it in 
firmware they could have just presented it as a standard USB-storage device 
and not required a special driver.

Have you also looked at the updated driver at 
	ftp://ftp.kernel.org/pub/linux/kernel/people/aeb/

--
dwmw2
