Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Qy1o-00077h-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 21:55:28 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C45F441.B65F5F31@comdev.cc> 
References: <3C45F441.B65F5F31@comdev.cc>  <19201.1011213161@redhat.com> <3C45DC51.599F4E7B@comdev.cc> <20020116163239.99399.qmail@web13206.mail.yahoo.com> <8630.1011205354@redhat.com> <19249.1011213352@redhat.com> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: different crash (was Re: JFFS2 is crashing the kernel) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 16 Jan 2002 22:06:27 +0000
Message-ID: <21352.1011218787@redhat.com>
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

adam.wozniak@comdev.cc said:
> Id: build.c,v 1.22 2002/01/09 16:30:57 dwmw2 Exp  

Bugger. There was a bug in 1.21 which could cause the symptoms you saw - 
but I fixed it in 1.22.

Now I'm confused. It's possible that the shuffling around of code for 
portability, although it shouldn't have changed the behaviour in any 
significant way, has introduced a bug.

I suspect you have a node or inocache on the list which has been freed and
shouldn't be there.

If this were reproducible, I'd want you to add debugging printks to 
jffs2_{alloc,free}_raw_node_ref similar to the ones in the inocache 
alloc/free functions. Also to jffs2_raw_ref_to_inum() to print raw and raw->
next_in_ino each time round the loop you identified. 

Then boot with debugging (level 1) enabled and log _all_ messages, even the 
KERN_DEBUG ones, from the time the filesystem is first mounted.

--
dwmw2
