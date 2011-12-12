Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaD35-0005DF-SW
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:04:37 +0000
Received: by lahc1 with SMTP id c1so681148lah.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:04:34 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd/nand : set Nand flash page address to FBAR and
 FPAR correctly
From: Artem Bityutskiy <dedekind1@gmail.com>
To: shuo.liu@freescale.com
Date: Mon, 12 Dec 2011 23:04:25 +0200
In-Reply-To: <1323423775-26951-1-git-send-email-shuo.liu@freescale.com>
References: <1323423775-26951-1-git-send-email-shuo.liu@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323723871.2297.9.camel@koala>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
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

On Fri, 2011-12-09 at 17:42 +0800, shuo.liu@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> If we use the Nand flash chip whose number of pages in a block is greater
> than 64(for large page), we must treat the low bit of FBAR as being the
> high bit of the page address due to the limitation of FCM, it simply uses
> the low 6-bits (for large page) of the combined block/page address as the
> FPAR component, rather than considering the actual block size.

Pushed this one to l2-mtd-2.6.git, thanks!

Artem.
