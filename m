Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 174om0-0003d0-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 May 2002 21:07:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020505002518.GA3665@buici.com> 
References: <20020505002518.GA3665@buici.com> 
To: elf@buici.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Unclear about unwriteprotecting 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 May 2002 21:07:36 +0100
Message-ID: <10076.1020715656@redhat.com>
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

elf@buici.com said:
> I've built the mtd driver into a 2.2.17 kernel using the mtd-20000704
> version.  I am accessing a DOC 2000 (24MB) that was created using the
> M-Systems's doc driver.  It has two partitions, one formatted for
> ext2.

> The NFTL driver sees the partitions find and I can mount them.
> However, I cannot write.  Nothing in the code or on the list has
> enlightened me.  What am I missing? 

You're using code that's almost two years old. Don't do that.

--
dwmw2
