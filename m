MIME-Version: 1.0
In-Reply-To: <20161020170739.lgt2ywm346vm47zd@lukather>
References: <cover.bb1e4a568bc16ada5254cad063f4afbaa1ca5906.1476951078.git-series.maxime.ripard@free-electrons.com>
 <0df42247c3348e7f6aed945e5669cec87f96f7ac.1476951078.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66w0sTzn_SWH4rrpWKOosSxALV8ot3CBQbGhwLxvX1vxw@mail.gmail.com>
 <20161020170739.lgt2ywm346vm47zd@lukather>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Oct 2016 12:10:26 +0800
Message-ID: <CAGb2v64Ai+8sUPyH9aTnKUw1ROmQNxzCEqUXrT4v8Q-nipqR3Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] ARM: gr8: Add missing pwm channel 1 pin
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Mylene Josserand <mylene.josserand@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 1:07 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Thu, Oct 20, 2016 at 10:10:03PM +0800, Chen-Yu Tsai wrote:
>> On Thu, Oct 20, 2016 at 4:12 PM, Maxime Ripard
>> <maxime.ripard@free-electrons.com> wrote:
>> > The PWM controller has two different channels, but only the first pin was
>> > exposed in the DTSI. Add the other one.
>> >
>> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>>
>> Acked-by: Chen-Yu Tsai <wens@csie.org>
>>
>> > ---
>> >  arch/arm/boot/dts/ntc-gr8.dtsi | 7 +++++++
>> >  1 file changed, 7 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/ntc-gr8.dtsi b/arch/arm/boot/dts/ntc-gr8.dtsi
>> > index 74aff795e723..fad7381630f3 100644
>> > --- a/arch/arm/boot/dts/ntc-gr8.dtsi
>> > +++ b/arch/arm/boot/dts/ntc-gr8.dtsi
>> > @@ -854,6 +854,13 @@
>> >                                 allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> >                         };
>> >
>> > +                       pwm1_pins_a: pwm1@0 {
>>
>> Nit: really don't need "_a" and "@0" here.
>
> Fixed and applied.

Oops, you forgot to fix the label in the chip-pro dts:

  DTC     arch/arm/boot/dts/ntc-gr8-chip-pro.dtb
ERROR (phandle_references): Reference to non-existent node or label
"pwm1_pins_a"

ERROR: Input tree has errors, aborting (use -f to force output)
scripts/Makefile.lib:313: recipe for target
'arch/arm/boot/dts/ntc-gr8-chip-pro.dtb' failed

ChenYu
