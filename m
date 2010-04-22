Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4vLC-0001P6-Oc
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 12:17:11 +0000
Date: Thu, 22 Apr 2010 14:17:02 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH] [MTD] Fix JFFS2 sync silent failure
Message-ID: <20100422121702.GG27309@logfs.org>
References: <20100417184016.GA17345@logfs.org>
	<20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
	<20100419102056.GS27497@kernel.dk>
	<20100422055448.GA27309@logfs.org>
	<20100422090303.GA27497@kernel.dk>
	<20100422103953.GB27497@kernel.dk>
	<20100422115539.GE27309@logfs.org>
	<20100422120837.GE27497@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100422120837.GE27497@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 April 2010 14:08:37 +0200, Jens Axboe wrote:
> 
> I totally agree, we want some way to catch this problem in the future.
> Really the check needs to be something ala:
> 
>         if (!sb->s_bdi && mnt_has_storage_backing() && rw_mount)
>                 yell_and_fail;
> 
> but I'm not sure how best to accomplish that. We can check for ->s_bdev
> and mtd like you did, but that does not catch network file systems for
> instance.

One way would be to either add a flag to all safe filesystems or create
a noop_bdi for them.  It adds a line of code and some bytes[*] per
instance to most filesystems, but that's the only catchall I can think
of.

I guess if noone comes up with a better plan I'll look into that.

[*] Maybe we can steal a bit somewhere to make it less expensive.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
