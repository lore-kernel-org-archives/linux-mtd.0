Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Ns4O-0003LF-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jan 2002 08:57:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB84064B132B@srvmail-mtl.montreal.ubisoft.org> 
References: <9A1957CB9FC45A4FA6F35961093ABB84064B132B@srvmail-mtl.montreal.ubisoft.org> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to Sync properly ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 Jan 2002 09:08:16 +0000
Message-ID: <31110.1010480896@redhat.com>
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

pallaire@gameloft.com said:
> Do you know any of the standard FS that will support sync ??

Linux has no way to signal to the block device driver that it should flush 
the write cache - so _no_ Linux filesystem can get it right, even on 
disc drives with write caches. It's just more obvious with the large write 
cache on the mtdblock device, that's all. 

Linux is broken. Unless Linux gets unbroken and starts to deal with block 
devices having internal write caches, the only option you have is to 
disable the caching completely.

> because for the moment the dirver for my ST falsh will only write 128k
> at a time ... I would have to change my hardware to use Intel Flash,
> to be able to use JFFS 1 or 2.

I thought you could write the ST flash in 8-byte chunks?



--
dwmw2
