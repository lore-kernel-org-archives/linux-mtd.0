Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZNz7-000825-5f
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 16:42:09 +0000
Received: by mail-ie0-f176.google.com with SMTP id u16so4194432iet.7
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 09:41:48 -0700 (PDT)
Date: Thu, 24 Oct 2013 09:41:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS: assert failed in ubifs_tnc_next_ent
Message-ID: <20131024164144.GC23337@ld-irv-0074.broadcom.com>
References: <20131023220950.GW23337@ld-irv-0074.broadcom.com>
 <20131024013150.GB23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131024013150.GB23337@ld-irv-0074.broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 23, 2013 at 06:31:50PM -0700, Brian Norris wrote:
> I'll retry on 3.12-rc and with a few extra backported
> fixes on 3.8.

It looks like I was just missing a few upstream bugfixes. That's what I
get for not properly following -stable properly :(

With the additional backporting of these two commits, my filesystem
tests survived overnight:

  commit 2928f0d0c5ebd6c9605c0d98207a44376387c298
  Author: Adam Thomas <adamthomas1111@gmail.com>
  Date:   Sat Feb 2 22:32:31 2013 +0000

      UBIFS: fix use of freed ubifs_orphan objects

  commit 8afd500cb52a5d00bab4525dd5a560d199f979b9
  Author: Adam Thomas <adamthomas1111@gmail.com>
  Date:   Sat Feb 2 22:35:08 2013 +0000

      UBIFS: fix double free of ubifs_orphan objects

Sorry for the noise. I guess this is a lesson for others, though. Greg
KH isn't joking when he says "all users must upgrade"!

Brian
