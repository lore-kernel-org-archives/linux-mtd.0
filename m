Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16QyFn-0007AU-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 22:09:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C45FA96.8DE3EDAA@comdev.cc> 
References: <3C45FA96.8DE3EDAA@comdev.cc>  <3C45F441.B65F5F31@comdev.cc> <19201.1011213161@redhat.com> <3C45DC51.599F4E7B@comdev.cc> <20020116163239.99399.qmail@web13206.mail.yahoo.com> <8630.1011205354@redhat.com> <19249.1011213352@redhat.com> <21352.1011218787@redhat.com> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: different crash (was Re: JFFS2 is crashing the kernel) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 16 Jan 2002 22:20:55 +0000
Message-ID: <21682.1011219655@redhat.com>
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
> Is it possible that I could have had a kernel with build.c rev 1.21
> which wrote bad data to flash, then upgraded the kernel with a build.c
> rev 1.22 then got the crash?

No, it's an in-memory thing. Versions between 1.17 and 1.21 inclusive have
this bug - it's triggered if there are deleted inodes with still-valid nodes
on the flash. We free the inocaches too early, while they're still on the
lists.

> I'm a little distant from the actual test lab, so I don't have the
> whole history of the machine which crashed.  I also have machines in
> the field which are running with a build.c rev 1.21 or earlier.  Are
> they likely to be susceptable to this? 

For production machines, I'd recommend using the jffs2-2_4-branch from CVS. 
That has a couple of bugfixes which turned up during the eCos port, but not 
the rest of the code-shuffling. The latter _shouldn't_ make any difference, 
but there's no harm in being safe.

--
dwmw2
