Received: from dsl-dt-207-34-112-i157-cgy.nucleus.com ([207.34.112.157] helo=mail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hTH1-0007NW-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2002 10:31:23 +0000
Date: Sun, 3 Mar 2002 03:42:38 -0700
From: Ray Lehtiniemi <rayl@otii.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 question
Message-ID: <20020303034238.G14453@otii.com>
References: <20020302175237.C14453@otii.com> <11116.1015150073@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11116.1015150073@redhat.com>; from dwmw2@infradead.org on Sun, Mar 03, 2002 at 10:07:53AM +0000
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

On Sun, Mar 03, 2002 at 10:07:53AM +0000, David Woodhouse wrote:

> Presumably this is without the -p option? :)

yah :-)



> > so maybe it's just a problem with the reader?
> 
> Mount the image on your host and verify this. I'm more inclined to believe
> it's the jffs2reader at fault than mkfs.jffs2. 
> 
> 	insmod mtdram total_size=8192 erase_size=64
> 	dd if=/dev/mtd0 of=/dev/mtd0
> 	mount -t jffs2 /dev/mtdblock0 /mnt/spare

ok, i ended up copying the jffs2 image into the actual flash on the board,
and it was indeed fine.  it definitely looks like a reader problem.


thanks

-- 
---------------------------------------------------------------------------
    Ray Lehtiniemi <rayl@mail.com> <rayl@otii.com>
