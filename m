Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGxM1-0003d1-Vq
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 23:18:58 +0000
Received: by mail-pa0-x233.google.com with SMTP id uo6so223838860pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 15:18:37 -0800 (PST)
Date: Wed, 6 Jan 2016 15:18:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: tests: consolidate kmalloc/memset 0 call to kzalloc
Message-ID: <20160106231834.GO109450@google.com>
References: <1451575282-27169-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451575282-27169-1-git-send-email-hofrat@osadl.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 31, 2015 at 04:21:22PM +0100, Nicholas Mc Guire wrote:
> This is an API consolidation only. The use of kmalloc + memset to 0
> is equivalent to kzalloc.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Applied to l2-mtd.git
