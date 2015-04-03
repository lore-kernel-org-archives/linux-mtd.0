Received: from ozlabs.org ([103.22.144.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdxJ5-000313-9B
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2015 08:50:27 +0000
Message-ID: <1428051002.27245.1.camel@ellerman.id.au>
Subject: Re: [PATCH 0/2] Add a MTD driver for OpenPower PNOR flash
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 03 Apr 2015 19:50:02 +1100
In-Reply-To: <1427868330.741478.119647151764.0.gpush@pablo>
References: <1427868330.741478.119647151764.0.gpush@pablo>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-04-01 at 14:05 +0800, Jeremy Kerr wrote:
> Hi all,
> 
> This series implements a simple mtd device to allow access to the PNOR
> flash on OpenPower machines. The flash is accessed through firmware
> calls.
> 
> Patch 1/2 adds the Linux interface to these calls. Patch 2/2 adds a mtd
> driver that uses these calls.
> 
> Because there's two subsystems involved here, there are a couple of
> methods to merge this:
> 
>  1) The powerpc folks take 1/2, and the mtd folks take 2/2, to be
>     applied once 1/2 is available (Michael has created a topic branch for
>     this in the past, which can make things a little easier), or

Unfortunately the topic branch approach is problematic for this series, because
we already have changes to opal.h in powerpc-next that clash.

I can still make a topic branch, but it would have to include ~10 powerpc
commits prior to this patch.

>  2) One of the maintainers takes both patches, once the other has acked
>     their patch. I'd suggest that it goes through the powerpc tree in
>     this case, as that will be less likely to conflict.

If the mtd maintainers are happy with it this would be the easier approach in
this instance.

cheers
