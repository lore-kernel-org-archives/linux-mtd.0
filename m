Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U3oK-0002mu-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 10:42:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020125103941.26958.qmail@web8101.in.yahoo.com> 
References: <20020125103941.26958.qmail@web8101.in.yahoo.com> 
To: Ramya Ravichandran <rrhsin@yahoo.co.in>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Cf Card vs DiskOnChip 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 Jan 2002 10:53:20 +0000
Message-ID: <4181.1011956000@redhat.com>
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

rrhsin@yahoo.co.in said:
> 
>    I am a newbie  developing a embedded linux controller for an
> industrial environment. I am unable to decide whether to use a Compact
> Flash card or DiskOnChip.With 128MB I need to get the whole thing
> running. Can someone plese tell me as which one to use and why? 

People have reported severe reliability problems with CF cards. With the 
DiskOnChip, all the translation stuff to emulate a block device is done in 
software, which is probably a better option.

The downside of the DiskOnChip is that the Linux driver doesn't do wear 
levelling, although it's easy enough to add, and that the vendor's driver 
is a binary-only module and hence of dubious legality.

I would go for the DiskOnChip and add wear levelling support - all you need 
to do it make it randomly pick a clean block for erasure occasionally, to 
make sure stuff moves around over time.


--
dwmw2
