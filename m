Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDzTD-0003W3-NZ
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 20:34:57 +0000
Received: by mail-pf0-x241.google.com with SMTP id f27so41347410pfe.0
 for <linux-mtd@lists.infradead.org>; Thu, 25 May 2017 13:34:35 -0700 (PDT)
Date: Thu, 25 May 2017 13:34:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V4 1/2] mtd: add support for partition parsers
Message-ID: <20170525203432.GC114788@google.com>
References: <20170227130633.4020-1-zajec5@gmail.com>
 <20170330123527.30181-1-zajec5@gmail.com>
 <20170511182126.GG70297@google.com>
 <d2eb6a73-38c7-498a-b32d-cd75b5ae1cf2@gmail.com>
 <12299bb6-a34d-5b84-616d-d1f4d067c8dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12299bb6-a34d-5b84-616d-d1f4d067c8dd@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 23, 2017 at 11:06:37AM +0200, Rafał Miłecki wrote:
> On 05/23/2017 10:14 AM, Rafał Miłecki wrote:
> >On 05/11/2017 08:21 PM, Brian Norris wrote:
> >>Maybe a better way to handle that offset modification is to either pass
> >>in the offset to add_mtd_partitions() (e.g., as a simple parameter), or
> >>else adapt add_mtd_partitions() to handle receiving a non-master as the
> >>first parameter. (Then you just pass "slave", and add_mtd_partitions()
> >>handle it with something like "if (mtd_is_partition(...))".)
> >>
> >>Then I wonder how we want the parenting structure to work; should the
> >>sub-partition have the "master" as its parent, or the original
> >>partition? I thought Richard had mentioned some problems with the
> >>existing parenting structure (with CONFIG_MTD_PARTITIONED_MASTER)
> >>already, but I don't remember what those were.
> >>
> >>Also, if you're "parsing" the slave, but "adding" to the master, then
> >>the bounds-checking logic in add_mtd_partitions() won't properly apply,
> >>and you'll be able to create sub-partitions that extend beyond the
> >>slave, right? If so, then I think (after auditing add_mtd_partitions() a
> >>little closer, and possibly adjusting some of its comments) you might
> >>really just want to pass 'slave', not 'slave->master'.
> >
> >I like this idea!
> 
> Oh, it's not that simple. Passing struct mtd_part to the add_mtd_partitions
> is simple, but it's getting complex afterwards.
> 
> 1) We can't simply adjust offset in add_mtd_partitions as we are still
>    dealing with const struct mtd_partition (note: const).
> 2) We can't adjust offset after calling allocate_partition as this would
>    bypass some validation happening in the allocate_partition.

I think I was assuming you'd use a tree structure, in which case you
don't have to modify the offsets at all. The offsets would get
translated by, e.g., a recursive call to part_read() (the subpartition's
part_read() would call the parent partition's part_read(), which would
adjust the offset and call the master's ->read() callback).

Or maybe the recursion (and tree structure) is not a great idea. You
came up with a mostly-OK solution that keeps a flat tree structure and
no recursion in your next version.

> 3) Passing an extra argume to the allocate_partition is a bad idea as it
>    already receives uint64_t cur_offset - this would be confusing.

Yeah, might be. But I think you came up with a different solution
anyway.

Brian
