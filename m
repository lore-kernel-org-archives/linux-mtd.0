Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U4or-0002sK-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 11:46:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C513E7B.6010808@smartbridges.com> 
References: <3C513E7B.6010808@smartbridges.com>  <20020125103941.26958.qmail@web8101.in.yahoo.com> <4181.1011956000@redhat.com> 
To: Nikhil Goel <nikhil@smartbridges.com>
Cc: Ramya Ravichandran <rrhsin@yahoo.co.in>,
    linux-mtd@lists.infradead.org
Subject: Re: Cf Card vs DiskOnChip 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 Jan 2002 11:57:55 +0000
Message-ID: <12290.1011959875@redhat.com>
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

nikhil@smartbridges.com said:
>  Isn't that similar to the implementation of JFFS? So a DiskOnChip
> running on the CVS based driver with JFFS should suffice for
> wear-levelling! if I am missing some piece here, what should I rtfm? 

You could use JFFS on the DiskOnChip. You can't use JFFS2 at the moment 
because it doesn't properly support NAND flash - there are a few extra 
constraints that JFFS2 doesn't meet. It's not too hard to fix though - 
various people have indicated an interest in working on it.

--
dwmw2
