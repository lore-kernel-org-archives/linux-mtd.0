Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSxXG-0005JT-AJ
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 21:05:47 +0000
Received: by ywa12 with SMTP id 12so758321ywa.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 13:05:45 -0800 (PST)
Subject: Re: [PATCH 2/3] mtd/nand : set Nand flash page address to FBAR and
 FPAR correctly
From: Artem Bityutskiy <dedekind1@gmail.com>
To: LiuShuo <b35362@freescale.com>
Date: Tue, 22 Nov 2011 23:05:38 +0200
In-Reply-To: <4EC5BE16.9080205@freescale.com>
References: <1321349355-1639-1-git-send-email-b35362@freescale.com>
 <1321349355-1639-2-git-send-email-b35362@freescale.com>
 <1321568016.2272.29.camel@koala> <4EC5BE16.9080205@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321995943.2222.3.camel@koala>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tang Yuantian <b29983@freescale.com>,
 linux-mtd@lists.infradead.org, Jerry Huang <Chang-Ming.Huang@freescale.com>,
 scottwood@freescale.com, akpm@linux-foundation.org, leoli@freescale.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-11-18 at 10:08 +0800, LiuShuo wrote:
> Ok and I want to add another patch before 3/3.
> 
> -LiuShuo
> > On Tue, 2011-11-15 at 17:29 +0800, b35362@freescale.com wrote:
> >> From: Liu Shuo<b35362@freescale.com>
> >>
> >> If we use the Nand flash chip whose number of pages in a block is greater
> >> than 64(for large page), we must treat the low bit of FBAR as being the
> >> high bit of the page address due to the limitation of FCM, it simply uses
> >> the low 6-bits (for large page) of the combined block/page address as the
> >> FPAR component, rather than considering the actual block size.
> > Looks like this patch depends on the previous white-space clean-up patch
> > - could you please refactor it (and 3/3 too) and resend?
> Ok and I am going to add another new patch before 3/3.

Sure, send 3/3 as well because this one depends on the cleanup patch, so
cannot be applied independently.

Artem.
