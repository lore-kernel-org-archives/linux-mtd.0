Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15p4lA-0005c6-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2001 10:25:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011003182904.C21578@wohnheim.fh-wedel.de> 
References: <20011003182904.C21578@wohnheim.fh-wedel.de>  <20011002091421.A15650@recycle.lbl.gov> <30731.1002040544@redhat.com> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org,
    Larry Doolittle <ldoolitt@recycle.lbl.gov>
Subject: Re: JFFS2_RESERVED_BLOCKS_* 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 Oct 2001 10:34:32 +0100
Message-ID: <32571.1002188072@redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  Formal proof is a tough one. But the difference between theoretical
> and practical minimum should be a couple of bugs, that might be found
> with a bigger userbase.

True, but people are using this in production, so just changing the default
isn't particularly sane. 

Changing the default would also require that I (or someone) actually has
enough time available in the near future to _fix_ those bugs when they turn
up. I'm hoping that we can get a contract soon which involves reducing the
GC overhead, and I can spend some real time on it. Until then, I have to 
leave it at the overly-conservative current value.

I can point you at some of the offending bugs already. We decompress and 
recompress data on garbage-collection. If it's not changing, we should just 
copy the compressed version intact. If it _is_ changing because the block 
we're garbage-collecting is partially obsoleted by later writes, we should
make sure the new compressed version isn't larger than the old version 
unless we have slack space. If it would exceed the available space, we need 
to copy it intact and keep the old version number. 

We probably also need to make the decisions on whether to allow writes more 
fine-grained - actually working on the number of bytes available not the 
number of blocks.

> What wheel do I have to turn, to lower the limit myself? 

This one's been answered. If it breaks, you get to keep both pieces :)

--
dwmw2
