Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hSjM-0007L7-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2002 09:56:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020302175237.C14453@otii.com> 
References: <20020302175237.C14453@otii.com> 
To: Ray Lehtiniemi <rayl@otii.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 03 Mar 2002 10:07:53 +0000
Message-ID: <11116.1015150073@redhat.com>
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

rayl@otii.com said:
>  shouldn't number 4 also result in an 8MB image? 

Er, yes - probably. That looks like a getopt bug. I'm not sure what we 
could do differently.

>  second, if the very first dirent of the --root= argument is itself a
> dir, then it is not put into the jffs2 image.

>  i recreated my toplevel tree, ensuring that the first dirent was a
> file, not a directory.  now, all items show up just fine in the
> jffs2reader output, but the jffs2 image is the same size as it was
> before.

Presumably this is without the -p option? :)

> so maybe it's just a problem with the reader?

Mount the image on your host and verify this. I'm more inclined to believe
it's the jffs2reader at fault than mkfs.jffs2. 

	insmod mtdram total_size=8192 erase_size=64
	dd if=/dev/mtd0 of=/dev/mtd0
	mount -t jffs2 /dev/mtdblock0 /mnt/spare


--
dwmw2
