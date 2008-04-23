Subject: Re: JFFS2 needs approx 72B of RAM per file
From: David Woodhouse <dwmw2@infradead.org>
To: j.lambrecht@televic.com
In-Reply-To: <47FAAACB.2060800@telenet.be>
References: <47FAAACB.2060800@telenet.be>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2008 10:25:22 +0100
Message-Id: <1208942722.9212.750.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, ecos-discuss@ecos.sourceware.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-04-08 at 01:14 +0200, Jürgen Lambrecht wrote:
> Hello to ecos-discuss and especially linux-mtd,
> 
> Tests have revealed to me that jffs2 does not only need raw nodes in RAM 
> (I use CYGNUM_FS_JFFS2_RAW_NODE_REF_CACHE_POOL_SIZE to have this 
> statically), but also "eats RAM" per file in flash.
> I want to remove this allocation, but I don't know if this is possible, 
> what are the disadvantages....?
> (my basic problem is that I have not enough RAM on my board, but it is 
> too late to change HW for the running projects)
> 
> After reading some jffs2 documentation, I think that my problem is the 
> inode cache?

I don't think so -- I think the raw node references are likely to be the
major contributing factor. It should be easy enough to check though,
surely? 

The problem, fundamentally, is that JFFS2 has no structure on the
medium. We have to _remember_ where every node (log entry) is.

I recently did some work to reduce the amount of memory per node from 16
to 8 bytes -- dropping a ->next pointer by using arrays of the things,
and dropping the 'length' field by observing that it's actually
redundant with 'offset' and '->next->offset' 99% of the time, and
finding tricks to make it redundant _100%_ of the time. If you're not
already using the latest JFFS2 code, it's worth doing that.

I say "recently" -- it's been over the last two years or so, but I don't
think eCos is using the results yet. It'd be good if someone would take
responsibility for merging newer JFFS2 code into eCos (or just tell me
it's not going to happen, and I'll stop trying to keep it feasible).

I extract the JFFS2 core files for use in eCos automatically, into a git
tree at git.infradead.org/users/dwmw2/jffs2-ecos-core.git -- this tracks
Linus' git tree and shuffles the files into the arrangement that they
have in the eCos source tree.

The intention was that someone working on eCos would periodically pull
from that tree into something like the 'jffs2-ecos.git' tree next to it,
which also has the eCos-specific files, and then build and test on eCos.
It doesn't seem to have happened though.

Another way to reduce the amount of memory taken would be to reduce the
number of nodes, which might be achieved by increasing the 'page size'. 
JFFS2 on Linux never writes a data node which crosses from one MMU page
to another, but on eCos you could relax that quite easily and write
larger data nodes -- which depending on the files you store may well
mean you have fewer of them.

-- 
dwmw2
