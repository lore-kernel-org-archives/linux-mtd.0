Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMiQN-0002SW-MF
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 20:03:00 +0000
Received: by obdeg2 with SMTP id eg2so15745015obd.0
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2015 13:02:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438717590-4263-1-git-send-email-salah.triki@acm.org>
References: <1438717590-4263-1-git-send-email-salah.triki@acm.org>
Date: Tue, 4 Aug 2015 22:02:38 +0200
Message-ID: <CAFLxGvzu2zeKPicKewy2dKwj4aza=U1k+RA_c2R+Mjr4OG5f=w@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Remove NULL checks from jffs2_destroy_slab_caches
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Salah Triki <salah.triki@acm.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 4, 2015 at 9:46 PM, Salah Triki <salah.triki@acm.org> wrote:
> kmem_cache_destroy can be called with NULL values. Thus, the checks that
> precede the calls are useless.

Since when?
I don't see a !NULL check in kmem_cache_destroy().

-- 
Thanks,
//richard
