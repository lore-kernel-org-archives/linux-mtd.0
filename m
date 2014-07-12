Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5rNx-0002NK-QT
 for linux-mtd@lists.infradead.org; Sat, 12 Jul 2014 07:06:18 +0000
Received: by mail-pd0-f173.google.com with SMTP id r10so2553545pdi.32
 for <linux-mtd@lists.infradead.org>; Sat, 12 Jul 2014 00:05:56 -0700 (PDT)
Date: Sat, 12 Jul 2014 00:05:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Subject: Re: Fwd: [RESEND PATCH] mtd: cfi_cmdset_0001.c: add support for
 Sharp LH28F640BF NOR
Message-ID: <20140712070553.GE23883@brian-ubuntu>
References: <1401745115-7449-1-git-send-email-andrea.adami@gmail.com>
 <CAAQYJAuD1DHnycrhmh72WGg54ZaHDrVoXseVfFWXgfttrPdH=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAQYJAuD1DHnycrhmh72WGg54ZaHDrVoXseVfFWXgfttrPdH=Q@mail.gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrea,

On Thu, Jul 03, 2014 at 09:42:31AM +0200, Andrea Adami wrote:
> this one was part of a patchset composed of 3 patches, see
> https://lkml.org/lkml/2014/6/3/763
> 
> The other two have been merged in 3.16-rc3:
> 9218310  ARM: 8084/1: sa1100: collie: revert back to cfi_probe
> 3abe742 ARM: 8085/1: sa1100: collie: add top boot mtd partition
> 
> Now the actual situation with 3.16-rc3 is bad, the nor is locked at
> boot and buffer write is broken.
> 
> Ideally the present patch should be sent upstream as fix for the next -rc.

Hmm, I'll see what I can do about this. In the future, you should
probably ensure that the dependent patch gets merged before trying to
make use of it in another subsystem.

Applied to l2-mtd.git. It looks pretty targeted, so I'll queue it up
with a few other -stable fixes that are going out in the next week.

Brian
