In-Reply-To: <200806171241.08371.manningc2@actrix.gen.nz>
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: mtd partitions limited to 4 GB?
MIME-Version: 1.0
Message-ID: <OF8B8E1CD6.3EC346B9-ON8825746C.005D5388-8825746C.005DC6FF@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 18 Jun 2008 10:04:20 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd-bounces@lists.infradead.org, Mitch Bradley <wmb@firmworks.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > In drivers/mtd/mtdpart.c, struct mtd_part has  "u_int32_t offset", 
thus
> > (apparently) limiting the partition start offset to 4 GiB.  Similarly,
> > struct mtd_partition in include/linux/mtd/partititions.h has 
"u_int32_t
> > size" and "u_int32_offset".
> 
> As Josh says it is not just an mtd_part issue, but the whole guts of mtd 

> suffer from this. The actual mtd_xxx interface to the kernel is close 
enough 
> for most purposes.
> 

<snip>

> It is more than just changing the 32 to 64 bit types.
> 

It is indeed more than just a type change, as I'm discovering :\.  I'm 
currently working on a change that will allow greater than 2GiB size, but 
since my project isn't going to have any partitions in it, I wasn't aware 
of any limitations there.  As I go through my work I'll try and keep it in 
mind, but I'm mired in the NAND layer and make no promises.  I'm trying to 
do this in small increments rather than a wholesale change that introduces 
numerous bugs :).

Bruce
