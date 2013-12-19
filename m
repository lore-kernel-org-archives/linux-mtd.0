Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtXye-0005bc-6g
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 07:25:00 +0000
Received: by mail-pa0-f50.google.com with SMTP id kl14so783265pab.37
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2013 23:24:36 -0800 (PST)
Date: Wed, 18 Dec 2013 23:24:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH RESEND 0/3] pxa3xx-nand: Support 2 KiB page size devices
Message-ID: <20131219072427.GA10846@norris-Latitude-E6410>
References: <1387403050-23965-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387403050-23965-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Seif Mazareeb <seif@marvell.com>, Simon Guinot <sguinot@lacie.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 18, 2013 at 06:44:07PM -0300, Ezequiel Garcia wrote:
> PATCH 1 fixes a problem that can be triggered by writing a blank
> page (0xff). The bug itself was found by Arnaud Ebalard while testing 2048B
> page size support on the Armada 370/XP variant, yet the bug can be reproduced
> on the driver's PXA variant.
> 
> The other two patches enable the support for 2048B pages on the Armada 370/XP
> variant.
> 
> PATCH 2 reduces the I/O overhead on flash devices that won't need the extended
> command semantics, by changing the way the cmdfunc() variants are used. The
> decision of which cmdfunc() should be used is now made based on the page size
> and not on thec ontroller variant.
> 
> PATCH 3, consolidates the ECC initialization -mostly to avoid code duplication-
> since the A370/XP variant can also support smaller pages, with no-BCH
> requirements.
> 
> I think the driver looks slightly cleaner after this work, but feel free to
> provide any feedback or advise differently.

These patches look good to me. Pushed to l2-mtd.git. Thanks!

Brian
