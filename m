Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MqPM-0000My-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 14:31:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02062413502007.08285@tux> 
References: <02062413502007.08285@tux> 
To: esn@cotas.dk
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with Jffs2 on this board 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jun 2002 14:30:54 +0100
Message-ID: <17578.1025011854@redhat.com>
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

esn@cotas.dk said:
>  Now, I try to compile a new one from the latest from CVS on
> infradead.org. But I simply can't make it compile, as I get:

> compr_zlib.c:15:2: #error "The userspace support got too messy and was
>  removed. Update your mkfs.jffs2"

cd mtd/util ; rm compr_zlib.c ; cvs up compr_zlib.c

It used to be a symlink to the kernel one. Now it isn't. CVS will have got 
upset and refused to put the next file there because the symlink is in the 
way.

--
dwmw2
