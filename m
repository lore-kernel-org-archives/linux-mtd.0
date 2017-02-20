MIME-Version: 1.0
In-Reply-To: <20170220215009.0ecbf5a1@bbrezillon>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
 <CAHp75VdwQGP-qa0c0KQwrdpZmCGc3RuEsJ-E-XLbBzQSn4Yxcg@mail.gmail.com>
 <20170220213803.7ba5591e@bbrezillon> <20170220215009.0ecbf5a1@bbrezillon>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Feb 2017 01:40:47 +0200
Message-ID: <CAHp75VczsC9WdZWR9iCRh2JoNLFZyOtodrsDRYQoyaN7nkyf=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Haavard Skinnemoen <hskinnemoen@gmail.com>,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Wenyou Yang <wenyou.yang@atmel.com>,
 Josh Wu <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 20, 2017 at 10:50 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Mon, 20 Feb 2017 21:38:03 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>
>> On Mon, 20 Feb 2017 22:27:17 +0200
>> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>>
>> > On Mon, Feb 20, 2017 at 2:28 PM, Boris Brezillon
>> > <boris.brezillon@free-electrons.com> wrote:
>> >
>> > >  drivers/mtd/nand/atmel/nand-controller.c | 2269 +++++++++++++++++++++++++++
>> > >  drivers/mtd/nand/atmel_nand.c            | 2479 ------------------------------
>> >
>> > Does -M -C help you?
>> > At least it would help reviewers
>> >
>>
>> No it doesn't, because files were not just moved around using git mv,
>> it's a complete rewrite of the driver. IIUC, you're about to review
>> this submission, or are you just trolling like last time?
>
> My bad, I mistaken you with someone else. Sorry for being harsh, but my
> explanation stands ;-).

No problem. I was asking since it so big and on first glance looks
like a partial copy (I dunno if parameter to -C makes it somehow
useful), though I can't review this. It's too big to me. Sorry I'm
really not trolling, just didn't read commit message carefully.

-- 
With Best Regards,
Andy Shevchenko
