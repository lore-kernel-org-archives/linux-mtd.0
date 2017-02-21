Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
 <CAHp75VdwQGP-qa0c0KQwrdpZmCGc3RuEsJ-E-XLbBzQSn4Yxcg@mail.gmail.com>
 <20170220213803.7ba5591e@bbrezillon> <20170220215009.0ecbf5a1@bbrezillon>
 <CAHp75VczsC9WdZWR9iCRh2JoNLFZyOtodrsDRYQoyaN7nkyf=A@mail.gmail.com>
 <CAHp75Vc_q-bEzA2-hVpHyR0GZ8mXxwJ8-UjECe31T04mb67q4w@mail.gmail.com>
 <20170221090610.6d531b94@bbrezillon>
 <CAHp75VfZfj-8ih3vg63w_dAq8xXE2Whu1bANXRcXS1_EGNq43A@mail.gmail.com>
 <20170221112641.6276c001@bbrezillon>
 <CAHp75Vcb9gtzF7LvH74JwL4dTUyQvKmg=dnTXKfjhVHuyK3WXg@mail.gmail.com>
 <20170221122050.421dae48@bbrezillon>
CC: Richard Weinberger <richard@nod.at>, "open list:MEMORY TECHNOLOGY..."
 <linux-mtd@lists.infradead.org>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu
 <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 devicetree <devicetree@vger.kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <79c21ac6-88ac-c75b-ebcb-aabdd842f6ca@microchip.com>
Date: Tue, 21 Feb 2017 14:47:45 +0100
MIME-Version: 1.0
In-Reply-To: <20170221122050.421dae48@bbrezillon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 21/02/2017 à 12:20, Boris Brezillon a écrit :
>>> (in this case, avr32).  
>> It's dead de facto.
>>
>> When last time did you compile kernel for it? What was the version of kernel?
>> Did it get successfully?

Alexandre answered to this one.

>> When are we going to remove avr32 support from kernel completely?
> I'll let Nicolas answer that one.

It's not up to me to decide this, the community only can decide to
remove the support from the kernel.
What I can tell, and it's been the case for a handful of years now, is
that Atmel/Microchip will not work on this platform anymore and won't
stop a removal of this platform from the Linux kernel.

I know that the dual approach DT/non-DT for some drivers is somehow
painful but I don't see AVR32 moving to DT in the near future...

Regards,
-- 
Nicolas Ferre
