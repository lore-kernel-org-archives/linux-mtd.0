Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w9Mt-0002C0-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 22:45:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <014f01c15c03$c45a8b10$456c020a@SENSORIA> 
References: <014f01c15c03$c45a8b10$456c020a@SENSORIA> 
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch to prevent jffs2 from make changes to other filesystems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Oct 2001 22:55:04 +0100
Message-ID: <15804.1003874104@redhat.com>
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


baoha@sensoria.com said:
>  I would like to propose the following patch to temporarily fix the
> problem of jffs2 making changes to other filesystems stored on MTD
> partitions. 

You can't do it like that - you'll get crap on the filesystem sometimes, 
during normal operation. We have logic in there to abort the mount at the 
end, if no valid nodes were found, but other data were. Is that failing or 
are you using an obsolete version?

Line 147 of scan.c should read:
 printk(KERN_NOTICE "Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes\n");

Does it? Why doesn't it get triggered?

--
dwmw2
