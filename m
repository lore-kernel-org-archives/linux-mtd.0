MIME-Version: 1.0
In-Reply-To: <201508241945.33577.marex@denx.de>
References: <cover.1440410236.git.cyrille.pitchen@atmel.com>
 <201508241303.52066.marex@denx.de> <55DB4EA6.9090807@atmel.com>
 <201508241945.33577.marex@denx.de>
From: Jonas Gorski <jogo@openwrt.org>
Date: Tue, 25 Aug 2015 11:46:08 +0200
Message-ID: <CAOiHx=kExyKAoGW4ciWHHxGNosNR0VdvHHrSqeo7RH1rNOXgig@mail.gmail.com>
Subject: Re: [PATCH linux-next v4 5/5] mtd: atmel-quadspi: add driver for
 Atmel QSPI controller
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Ben Hutchings <ben@decadent.org.uk>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 nicolas.ferre@atmel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Gabor Juhos <juhosg@openwrt.org>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Bean Huo (beanhuo)" <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2015 at 7:45 PM, Marek Vasut <marex@denx.de> wrote:
> On Monday, August 24, 2015 at 07:04:38 PM, Cyrille Pitchen wrote:
>> Hi Marek,
>
> Hi!
>
>> Le 24/08/2015 13:03, Marek Vasut a =C3=A9crit :
>> > On Monday, August 24, 2015 at 12:14:00 PM, Cyrille Pitchen wrote:
>> >> This driver add support to the new Atmel QSPI controller embedded int=
o
>> >> sama5d2x SoCs. It expects a NOR memory to be connected to the QSPI
>> >> controller.
>
> [...]
>
>> >> +  /* Compute address parameters */
>> >> +  switch (cmd->enable.bits.address) {
>> >> +  case 4:
>> >> +          ifr |=3D QSPI_IFR_ADDRL;
>> >> +          /*break;*/ /* fallback to the 24bit address case */
>> >
>> > What's this commented out bit of code for ? :-)
>>
>> I just wanted to stress out there was no missing "break;".
>> I've reworded the comment to:
>> /* No "break" on purpose: fallback to the 24bit address case. */
>
> Oh, the address is in bytes . I see, yes, it makes sense to be more
> explicit here about the purpose of the fallback. I think this change
> in the comment will make it easier for everyone who comes back in a
> few years and reads this code.

I think you are looking for the term "(switch case) fallthrough", not
"fallback". "Fallback" makes it sound like there is something missing,
or an invalid state.


Jonas
