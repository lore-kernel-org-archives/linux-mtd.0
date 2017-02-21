Date: Tue, 21 Feb 2017 09:06:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "open list:MEMORY TECHNOLOGY..."
 <linux-mtd@lists.infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, Haavard
 Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt
 <egtvedt@samfundet.no>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Josh
 Wu <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala
 <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Message-ID: <20170221090610.6d531b94@bbrezillon>
In-Reply-To: <CAHp75Vc_q-bEzA2-hVpHyR0GZ8mXxwJ8-UjECe31T04mb67q4w@mail.gmail.com>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
 <CAHp75VdwQGP-qa0c0KQwrdpZmCGc3RuEsJ-E-XLbBzQSn4Yxcg@mail.gmail.com>
 <20170220213803.7ba5591e@bbrezillon>
 <20170220215009.0ecbf5a1@bbrezillon>
 <CAHp75VczsC9WdZWR9iCRh2JoNLFZyOtodrsDRYQoyaN7nkyf=A@mail.gmail.com>
 <CAHp75Vc_q-bEzA2-hVpHyR0GZ8mXxwJ8-UjECe31T04mb67q4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Feb 2017 01:54:37 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, Feb 21, 2017 at 1:40 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Feb 20, 2017 at 10:50 PM, Boris Brezillon
> > <boris.brezillon@free-electrons.com> wrote:  
> >> On Mon, 20 Feb 2017 21:38:03 +0100
> >> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >>  
> >>> On Mon, 20 Feb 2017 22:27:17 +0200
> >>> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >>>  
> >>> > On Mon, Feb 20, 2017 at 2:28 PM, Boris Brezillon
> >>> > <boris.brezillon@free-electrons.com> wrote:
> >>> >  
> >>> > >  drivers/mtd/nand/atmel/nand-controller.c | 2269 +++++++++++++++++++++++++++
> >>> > >  drivers/mtd/nand/atmel_nand.c            | 2479 ------------------------------  
> >>> >
> >>> > Does -M -C help you?
> >>> > At least it would help reviewers
> >>> >  
> >>>
> >>> No it doesn't, because files were not just moved around using git mv,
> >>> it's a complete rewrite of the driver. IIUC, you're about to review
> >>> this submission, or are you just trolling like last time?  
> >>
> >> My bad, I mistaken you with someone else. Sorry for being harsh, but my
> >> explanation stands ;-).  
> >
> > No problem. I was asking since it so big and on first glance looks
> > like a partial copy (I dunno if parameter to -C makes it somehow
> > useful), though I can't review this. It's too big to me. Sorry I'm
> > really not trolling, just didn't read commit message carefully.  
> 
> Okay, I very quickly looked into the code, what I noticed
> - you like extra parens and empty lines in some cases (not big deal)

Can you point specific places where you think these are not needed?

> - some functions perhaps might have been refactored to have common
> pieces in error handling, though I didn't read core carefully.

Again, be more precise.

> 
> Most important part I have noticed is a GPIO request.
> I didn't get why you almost repeat gpiod_get() in case of platform data?
> Shouldn't we have GPIO look up table?
> Can we use builtin device properties (for GPIO and/or overall)?

Sorry but I don't get it. Can give an example of what you'd like me to
do?

Thanks,

Boris
