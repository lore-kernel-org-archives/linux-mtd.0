Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e9d5r-0003mJ-3H
 for linux-mtd@lists.infradead.org; Tue, 31 Oct 2017 20:25:05 +0000
From: Richard Weinberger <richard@nod.at>
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Dike <jdike@addtoit.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 uml-devel <user-mode-linux-devel@lists.sourceforge.net>,
 user-mode-linux-user@lists.sourceforge.net,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] kconfig: kill off GENERIC_IO option
Date: Tue, 31 Oct 2017 21:24:45 +0100
Message-ID: <2622270.9EZoQM9MUq@blindfold>
In-Reply-To: <CAL_JsqKECkQbBVhRdYEq57iR1wh7W0vn1j1cEDE16sNydpy9Bw@mail.gmail.com>
References: <20171016221631.23472-1-robh@kernel.org>
 <CAL_JsqKECkQbBVhRdYEq57iR1wh7W0vn1j1cEDE16sNydpy9Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 31. Oktober 2017, 20:34:35 CET schrieb Rob Herring:
> On Mon, Oct 16, 2017 at 5:16 PM, Rob Herring <robh@kernel.org> wrote:
> > The GENERIC_IO option is set for every architecture except tile and score
> > as those define NO_IOMEM. The option only controls visibility of
> > CONFIG_MTD which doesn't appear to be necessary for any reason, so let's
> > just remove GENERIC_IO.
> 
> Andrew, there's no clear owner for this, can you take it?

Well, I can take it via the UML since I maintain UML and MTD. :)

Thanks,
//richard
