Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdhcP-0004as-Eg
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 16:05:22 +0000
Received: by padcy3 with SMTP id cy3so88234028pad.3
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 09:04:59 -0700 (PDT)
Date: Thu, 2 Apr 2015 09:04:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: Add simple read disturb test
Message-ID: <20150402160451.GF32500@ld-irv-0074>
References: <1427984026-31100-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427984026-31100-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 02, 2015 at 04:13:46PM +0200, Richard Weinberger wrote:
> This simple MTD tests allows the user to see when read disturb happens.
> By reading blocks over and over it reports flipped bits.
> Currently it reports only flipped bits of the worst page of a block.
> If within block X page P1 has 3 bit flips and P6 4, it will report 4.
> By default every 50th block is read.

Didn't read through this much yet, but why do we need another in-kernel
test that coul (AFAICT) be easily replicated in userspace? The same goes
for several of the other tests, I think, actually. But at least with
those, we have a history of keeping them around, so it's not too much
burden [1].

Brian

[1] Although there are some latent issues in these tests that are still
getting get worked out (e.g., bad handling of 64-bit casting; too large
of stacks; uninterruptibility). The latter two would not even exist if
we were in user space.
