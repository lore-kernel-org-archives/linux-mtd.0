Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqtMG-0000DF-J9
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 01:47:29 +0000
Received: by padhk11 with SMTP id hk11so205346684pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 18:47:07 -0700 (PDT)
Date: Mon, 26 Oct 2015 18:47:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 4/5] mtd: ofpart: document the lock flag.
Message-ID: <20151027014705.GO13239@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <83fbf31ad895446837f8e01f77a1ff7c63d62251.1439911625.git.hramrach@gmail.com>
 <20151011200412.GF3696@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151011200412.GF3696@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 11, 2015 at 01:04:12PM -0700, Brian Norris wrote:
> On Tue, Aug 18, 2015 at 03:34:08PM -0000, Michal Suchanek wrote:
> > The lock flag of ofpart is undocumented. Add to binding doc.
> 
> Good catch. There are a lot of small corners of very old code that never
> really got reviewed properly, I expect...
> 
> (And the flag looks very odd. Why exactly is it in the partitions?)
> 
> And now that I'm looking further...does this flag even *do* anything?
> AFAICT, it doesn't set the master device flags -- only the partition
> flags. But MTD drivers currently never see the partition flags -- they
> only see the master struct mtd_info. I think the only way anyone could
> observe the effect of this flag is to read the MTD flags from sysfs. And
> that's pretty useless.
> 
> If my understanding is correct, then I'd rather completely remove the
> code that "handles" this flag, rather than codify it in the docs.

I've tested and confirmed: this only sets the flags for the partition
(*NOT* for the master device), so the only visible effect of this
property is to change sysfs flags. I'll send out a patch to kill this
property entirely.

Brian
