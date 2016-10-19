Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwkZW-0002c1-RI
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 06:41:55 +0000
Message-ID: <1476859284.18750.115.camel@gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut
 <marex@denx.de>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, nicolas.ferre@atmel.com, Boris Brezillon
 <boris.brezillon@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
Date: Wed, 19 Oct 2016 09:41:24 +0300
In-Reply-To: <20161018184651.GA71760@google.com>
References: <0a3eaa21fb0f38743308c9cc9fc5d2373f4877de.1476802288.git.cyrille.pitchen@atmel.com>
 <d4e954c1-0bbb-fc16-4e9a-46c25ec4fb9e@denx.de>
 <CAFLxGvy9okx1cHnRhq2U-u574PzAk=Tampw1Fmvp4KzY8vnDnw@mail.gmail.com>
 <3d45f698-08e9-e672-d405-1ab9bfec1222@atmel.com>
 <cf010a6c-b642-0994-bbfd-c86d5ab24e6e@nod.at>
 <20161018184651.GA71760@google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-10-18 at 11:46 -0700, Brian Norris wrote:
> I could go with either method I suppose, but I don't personally like
> the
> idea of splitting out the various bits of MTD into *completely*
> independent lines of development. As long as someone (not necessarily
> me) can manage pulling the sub-subsystems together, I think it would
> make sense to have 1 PR for Linus for non-UBI/FS MTD changes.

I think this is a good point. MTD is pretty much a "don't care"
subsystem for Linus, an I do not think he'll appreciate 2 or more micro
MTD pull requests. It makes a lot more sense to consolidate all this
under a single tree MTD tree and make a single pull request.
