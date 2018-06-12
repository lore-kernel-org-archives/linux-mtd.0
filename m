Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSh75-0000Dj-Gd
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 11:05:25 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: denali: add more clocks
Date: Tue, 12 Jun 2018 13:05:03 +0200
Message-ID: <3063058.uoHcm7uEyX@blindfold>
In-Reply-To: <20180612130329.1c17311f@bbrezillon>
References: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNASM53scdd-OZOj_7404Eru3a98uNLagip_GdkrSSaG3-Q@mail.gmail.com>
 <20180612130329.1c17311f@bbrezillon>
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

Am Dienstag, 12. Juni 2018, 13:03:29 CEST schrieb Boris Brezillon:
> On Tue, 12 Jun 2018 19:36:06 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 
> > Maybe, the commit title should be:
> > 
> > mtd: rawnand: denali: add more clocks and improve setup_data_interface
> 
> Or you split that in 2 commits, one retrieving the new clks, and the
> other one fixing/improving ->setup_data_interface().

Yeah, please split the patch. It needs to go into -stable as well.
One patch should just unbreak the driver.

Thanks,
//richard
