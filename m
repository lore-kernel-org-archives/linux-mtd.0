Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Qy99-00079c-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 22:03:03 +0000
Message-ID: <3C45FA96.8DE3EDAA@comdev.cc>
Date: Wed, 16 Jan 2002 14:11:34 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: different crash (was Re: JFFS2 is crashing the kernel)
References: <3C45F441.B65F5F31@comdev.cc>  <19201.1011213161@redhat.com> <3C45DC51.599F4E7B@comdev.cc> <20020116163239.99399.qmail@web13206.mail.yahoo.com> <8630.1011205354@redhat.com> <19249.1011213352@redhat.com> <21352.1011218787@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> adam.wozniak@comdev.cc said:
> > Id: build.c,v 1.22 2002/01/09 16:30:57 dwmw2 Exp
> 
> Bugger. There was a bug in 1.21 which could cause the symptoms you saw -
> but I fixed it in 1.22.
> 
> Now I'm confused. It's possible that the shuffling around of code for
> portability, although it shouldn't have changed the behaviour in any
> significant way, has introduced a bug.
> 
> I suspect you have a node or inocache on the list which has been freed and
> shouldn't be there.
> 
> If this were reproducible, I'd want you to add debugging printks to
> jffs2_{alloc,free}_raw_node_ref similar to the ones in the inocache
> alloc/free functions. Also to jffs2_raw_ref_to_inum() to print raw and raw->
> next_in_ino each time round the loop you identified.
> 
> Then boot with debugging (level 1) enabled and log _all_ messages, even the
> KERN_DEBUG ones, from the time the filesystem is first mounted.
> 
> --
> dwmw2

Is it possible that I could have
had a kernel with build.c rev 1.21 which wrote bad data to flash,
then upgraded the kernel with a build.c rev 1.22
then got the crash?

I'm a little distant from the actual test lab, so I don't have the whole
history of the machine which crashed.  I also have machines in the field
which are running with a build.c rev 1.21 or earlier.  Are they likely
to be susceptable to this?

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
