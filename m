Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNNzk-000445-QG
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 17:30:49 +0000
Received: by mail-pf0-x244.google.com with SMTP id i123so3449924pfg.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 10:30:28 -0700 (PDT)
Date: Wed, 13 Jul 2016 10:30:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/8] mtd-utils: Fix return status in mtd_torture test
 function
Message-ID: <20160713173024.GA10487@google.com>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461622409-14970-2-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 26, 2016 at 12:13:22AM +0200, Richard Weinberger wrote:
> From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> 
> This patch fixes the return status of the mtd_torture function
> in libmtd.
> 
> The torture test function is currently only used by the ubiformat
> utilitiy to check if a block is bad after a write fails (blocks are
> marked bad if the function returns an error status). However, the
> way the function was written, it ALWAYS returns an error value
> irregardless of whether it failed or not.
> 
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Seems like everyone's reviewed this, but no one applied it. (Richard,
did we get you push access to mtd-utils yet?)

Applied patch 1.

Brian
