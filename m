Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Molg-0004r8-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jan 2002 11:13:40 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020105025042.A23360@baldur.yggdrasil.com> 
References: <20020105025042.A23360@baldur.yggdrasil.com> 
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Patch: linux-2.5.2-pre8/drivers/mtd compilation fixes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 05 Jan 2002 11:24:23 +0000
Message-ID: <4082.1010229863@redhat.com>
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

adam@yggdrasil.com said:
> 	The following patch updates linux-2.5.2-pre8/drivers/mtd to compile.
> This entails some kdev_t fixes and other updates for changes to the
> block device driver interface.

Looks sane - thanks. I see no harm in sending it to Linus. Could you run 
the blkmtd.c changes past spse@secret.org.uk first, though?

> 	In the case of one routine (ftl_reread_partitions), there was a goto
> to a nonexistant label (goto leave), so I think there may have been an
> incomplete patch applied to this subdirectory to begin with

Not in my tree - strange. Oh well, I'll deal with it when 2.5 stabilises 
and I stop ignoring it.

> (also, drivers/mtd/bootldr.c refers to a nonexistant "struct tag", but that
> file is apparently not currently compiled anyhow). 

Currently, it's only compiled in the iPAQ kernel tree, where it works - I'm
waiting for the iPAQ people and Russell to stop arguing about how it should
be done, so the result will work in the proper ARM tree (and hence Linus'
tree) too.

Btw, where did you get the address 'mtd@infradead.org' from? The list moved 
a while ago, and I was going to remove the forwarding some time soon.

--
dwmw2
