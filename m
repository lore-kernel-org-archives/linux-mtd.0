Received: from mail-yh0-f45.google.com ([209.85.213.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhGE7-0002DA-DN
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 10:34:28 +0000
Received: by mail-yh0-f45.google.com with SMTP id z6so6484681yhz.18
 for <linux-mtd@lists.infradead.org>; Mon, 05 May 2014 03:34:05 -0700 (PDT)
Date: Mon, 5 May 2014 07:33:35 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 3/3] nandtest: Introduce multiple reads & check iterations
Message-ID: <20140505103335.GF2873@arch.cereza>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05 May 10:07 AM, Gupta, Pekon wrote:
> >From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On
> >
> >The current nandtest performs a simple test which consists of:
> >
> >  1. erase block
> >  2. write data
> >  3. read and verify
> >
> >In order to improve the nandtest strength, this commit adds a new
> >parameter
> >to increase the number of "read and verify" iterations. In other
> >words,
> >the test now consists of:
> >
> >  1. erase block
> >  2. write data
> >  3. read and verify (N times)
> >
> >This seem to apply more pressure on a NAND driver's ECC engine and
> >has been
> >used to discover stability problems with an old OMAP2.
> >
> If you are just re-verifying "reads", then you may be testing unstable bits [1],
> which is not a valid driver's fault but a problem arising due to sudden power-cut.
> If you really want to test driver then iterate all the steps (erase -> write -> read)
> multiple times. Same as what is done in torture_peb() test.
> 	@@ drivers/mtd/ubi/io.c: torture_peb()
> 

I'm sorry Pekon, but your comment makes no sense to me.

First of all, we're adding a new nandtest capability. The tool *already*
handles multiple erase/write/read cycle (by using the --passes parameter)
and one can already use it to stress drivers. This is not under discussion.

However, while testing the OMAP2 NAND driver provided in TI SKD 6.0.0
(the one with a v3.2 kernel) the nandtest was left running a large number
of times, using the --passes parameter each block was erase/write/read
lots and lots of times. So, *that* particular test passed without issues.

And still, since we were still observing instability when doing filesystem
operations we developed this new test, which consists in
erase/write/read/.../read.

Now, since each block is *erased* before the write/read/.../read loop, how is
this related to the unstable bit issue?

In case it's not clear, we never did *any* power-cutting, and still this
improved test quickly showed ECC read errors in the mentioned driver.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
