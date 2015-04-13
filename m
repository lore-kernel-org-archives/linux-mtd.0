Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhVu0-0002Jd-Mk
 for linux-mtd@lists.infradead.org; Mon, 13 Apr 2015 04:23:17 +0000
Received: by pddn5 with SMTP id n5so93761304pdd.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2015 21:22:52 -0700 (PDT)
Message-ID: <1428898964.2881.9.camel@cyril>
Subject: Re: [PATCH 0/2] Add a MTD driver for OpenPower PNOR flash
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Date: Mon, 13 Apr 2015 14:22:44 +1000
In-Reply-To: <1427868330.741478.119647151764.0.gpush@pablo>
References: <1427868330.741478.119647151764.0.gpush@pablo>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
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
> 
>  2) One of the maintainers takes both patches, once the other has acked
>     their patch. I'd suggest that it goes through the powerpc tree in
>     this case, as that will be less likely to conflict.
> 
Ping about this patchset. What do the MTD maintainers think?

Hi David,

Jeremy mentioned you might be interested in seeing these.


Thanks,

Cyril

> Either way, I'm happy.
> 
> Cheers,
> 
> 	
> Jeremy
> 
> ---
> Cyril Bur (2):
>       powerpc/powernv: Add interfaces for flash device access
>       drivers/mtd: add powernv flash MTD abstraction driver
> 
