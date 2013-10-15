Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWBXC-0005Kv-Kx
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 20:48:07 +0000
Received: by mail-ie0-f178.google.com with SMTP id to1so19571987ieb.9
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2013 13:47:45 -0700 (PDT)
Date: Tue, 15 Oct 2013 13:47:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/2] pxa3xx: Data buffer dynamic allocation
Message-ID: <20131015204741.GW23337@ld-irv-0074.broadcom.com>
References: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Fri, Oct 04, 2013 at 03:30:36PM -0300, Ezequiel Garcia wrote:
> As part of my work to support the NAND controllers in Armada 370/XP SoC
> here's a tiny set of patches to replace the currently data buffer allocation
> based in a hardcoded buffer size, into a dynamic scheme.
> 
> We first use kmalloc to request a 256 bytes (big enough for the ONFI paramater
> page) and then re-allocate (either with kmalloc or using DMA allocators) using
> the detected page size.
> 
> The first patch is required to perform the initial NAND operations (READID
> and friends) using programmable I/O since the DMA buffers are not ready
> at such early stage.
> 
> The second patch performs to actual dynamic allocation and it's exactly
> the same patch I sent a few weeks ago:
> 
>   http://patchwork.ozlabs.org/patch/275982/
> 
> Daniel: Can you test these two If they look fine we can add them now,
> being an improvement to the driver pxa3xx beyond the Armada 370/XP effort.

Thanks for sending these out separately from your other series. They are
independently useful and look good to me. And thanks, Daniel, for the
testing.

Pushed to l2-mtd.git!

Brian
