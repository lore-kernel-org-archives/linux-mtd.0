Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZfcW-0005H9-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:37:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200207251914.g6PJEbs25931@hofr.at> 
References: <200207251914.g6PJEbs25931@hofr.at> 
To: Der Herr Hofrat <der.herr@mail.hofr.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MAX_NAME in jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:37:34 +0100
Message-ID: <14897.1028068654@redhat.com>
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

der.herr@mail.hofr.at said:
> 
>  is there a particular reson for jffs and jffs2 to have a 254
> character filename limit and ext2/ext3/reiserfs 255 (probably others to -
> excluding minix/msdos/M$) ?? There probably is hardly a case where this
> will realy hurt, but a test bit it so I wondered what the reson for this
>  254 is... 

ISTR there may have been a reason in JFFS, but I can't remember it. JFFS2 
just inherited it -- one of the few things that hasn't actually changed. We 
want to keep file names relatively short because dirent nodes can't be 
split across eraseblock boundaries.


--
dwmw2
