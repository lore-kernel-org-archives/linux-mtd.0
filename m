Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eBmy-0000eY-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 10:19:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F147ztYnkp66U4PEFn7000023b4@hotmail.com> 
References: <F147ztYnkp66U4PEFn7000023b4@hotmail.com> 
To: "Brian Peterson" <purdue1996@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 read only file system 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 Jan 2003 10:50:13 +0000
Message-ID: <8318.1043923813@passion.cambridge.redhat.com>
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

purdue1996@hotmail.com said:
>  During some testing of power loss scenarios, I lose the ability to
> use the  device. The kernel boots and after it cleans up from the
> unclean unmount, I  receive kernel messages indicating "Argh! No free
> blocks found!..."

We should be able to fix this.

> What level of confidence is there that the read only partition would
> be  protected from this problem. In other words, can the data located
> in the  Read only partition be trusted? 

The data on the read only partition cannot be trusted any more than the 
data in the read-write partition. It's all in one big pseudo-filesystem, 
the partitioning is purely cosmetic.

--
dwmw2
