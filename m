Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgjtI-0004sS-Ti
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 01:39:37 +0000
Received: by padhy16 with SMTP id hy16so189810047pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 18:39:16 -0700 (PDT)
Received: from google.com ([2620:0:1000:1301:1146:c7ed:39be:6638])
 by smtp.gmail.com with ESMTPSA id w5sm21856252pbs.31.2015.09.28.18.39.15
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=AES128-SHA256 bits=128/128);
 Mon, 28 Sep 2015 18:39:15 -0700 (PDT)
Date: Mon, 28 Sep 2015 18:39:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: cmdlinepart: allow small partitions
Message-ID: <20150929013913.GZ31505@google.com>
References: <1434744607-26621-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1434744607-26621-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 19, 2015 at 01:10:06PM -0700, Brian Norris wrote:
> I'm not sure why we have a PAGE_SIZE restriction on this partition
> parser.
> 
> If we really wanted the restriction, I would expect it to be a
> restriction for *all* parsers, so we'd move it to the MTD core
> 
> At any rate, while small partitions may not be useful (they'll often be
> smaller than the eraseblock size and therefore can only be used
> read-only), they still have use as a read-only partition.
> 
> This restriction is especially annoying because it aborts the entire
> MTD's cmdline parsing, leaving it unpartitioned.
> 
> So, let's kill the restriction and only check for zero-sized partitions,
> which I expect we don't want to allow.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Anyone know a good reason why this restriction should be here?

No comments :)

Applied both
