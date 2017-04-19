Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0s6T-00083M-R1
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 16:05:15 +0000
Received: by mail-io0-x243.google.com with SMTP id k87so4669114ioi.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 09:04:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492616112.17682.266.camel@infradead.org>
References: <20170419152305.17226-1-andrew.smirnov@gmail.com>
 <1492616112.17682.266.camel@infradead.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 19 Apr 2017 09:04:52 -0700
Message-ID: <CAHQ1cqGmjf9Jqs7FtY7tWr1koBm9nni3PQt_hM2B4RSQ46gC1g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] mtd: dataflash: Replace C99 types with their
 kernel counterparts
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[ +cc: Marek, since I accidentally dropped him off CC list ]

On Wed, Apr 19, 2017 at 8:35 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2017-04-19 at 08:23 -0700, Andrey Smirnov wrote:
>> No functional change intended.
>
> FWIW I *deliberately* used the proper C datatypes throughout all of the
> MTD code instead of the silly kernel-speshul datatypes. To the extent
> of *fixing* submissions to be written in C when they were using the
> silly kernel types instead.
>
> There is a reason for the __u32 type in userspace APIs. There is
> basically no reason for 'u32' et al, just to save a trivial few
> characters in the type name. We might as well be using the proper
> language types.
>
> I appreciate that not everyone agrees with that, but at least it used
> to be consistent throughout the code I was maintaining. I'll defer to
> the currently active maintainers though...

This conversion was an explicit request from Marek, see
https://marc.info/?l=linux-kernel&m=149192751625941

Thanks,
Andrey Smirnov
