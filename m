Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtWa-0001rg-7g
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 11:49:28 +0000
Received: by laah2 with SMTP id h2so500691laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2011 03:49:26 -0800 (PST)
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Tue, 06 Dec 2011 13:49:19 +0200
In-Reply-To: <4EDD1F90.300@freescale.com>
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <1323067628.2316.29.camel@koala> <4EDD1F90.300@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323172165.2163.3.camel@koala>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-12-05 at 13:46 -0600, Scott Wood wrote:
> Because this is a controller resource, shared by multiple NAND chips
> that may be different page sizes (even if not, it's adding another point
> of synchronization required between initialization of different chips).
>  I don't think it's worth the gymnastics to save a few KiB.

OK, I see.

Artem.
