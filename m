Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16njpd-0005YW-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 17:25:01 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <004c01c1cf77$9f28e5c0$0200a8c0@telia.com> 
References: <004c01c1cf77$9f28e5c0$0200a8c0@telia.com>  <200203061645.g26Gjl806741@skylab.outpostsentinel.com> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: compr_zlib.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 20 Mar 2002 17:36:12 +0000
Message-ID: <9417.1016645772@redhat.com>
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

Joakim.Tjernlund@lumentis.se said:
> OK, a new compression type will be cleaner. What should be done with
> compression types  not supported? Can't say that I understand the
> logic behind the unsupported nodes. 

I think we should mount the filesystem read only. We're going to get I/O 
errors on parts of files that we can't decompress.

> What do you think about STREAM_END_SPACE? Should it be changed to
> something bigger? 

STREAM_END_SPACE is supposed to be the amount of space we need at the end 
of the output buffer to sync up and complete the output. I suspect we 
should just use a different limit for the minimum amount of data we'll 
bother to compress.

> What is the maximum amount of data JFFS2 will try to compress in one
> go? 

One page - normally 4KiB, sometimes 8KiB. I've been pondering changing that 
to get better compression but that might break compatibility so it'd have 
to be an obvious win.

> I am thinking of adjusting  windowBits and memLevel, now they
> default to 128 KB each which seems a bit too much.

Sounds reasonable. Would that mean we can also reduce the amount of memory 
preallocated for the deflate workspace, which is currently about 400KiB?

> Will you accept a patch against the stable branch?

> Also there has been a few performance improvements lately and I would
> like to see them in the stable branch as well. We are using them all
> and no problems so far. Any chance that will happen? 

I would rather not change the stable branch. That sort of defeats the 
object of having it in the first place. There are three types of changes in 
the trunk since that branch was taken:
	1. Cosmetic changes and code reshuffles for eCos portability.
	   These shouldn't affect functionality at all.
	2. NAND support, which shouldn't affect NOR flash adversely.
	3. The aforementioned performance enhancements.

If you want to use the performance enhancements, I'd rather you worked on, 
and tested, the trunk code. 

--
dwmw2
