Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlWpn-0000Z2-UU
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 04:34:45 +0000
Received: by mail-vc0-f172.google.com with SMTP id hz11so4400973vcb.17
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 20:34:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1385526078.44550720@f276.i.mail.ru>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <1385526078.44550720@f276.i.mail.ru>
Date: Tue, 26 Nov 2013 20:34:22 -0800
Message-ID: <CAN8TOE-PccHVcsdy8QrbLKuOpz1ysKNAbhxv3JuXMmWfU1GWpA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Tue, Nov 26, 2013 at 8:21 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> ...
>> We're dealing with a similar issue in other drivers currently, and I
>> think it's worth straightening out the issue for all systems.
>>
>> On Wed, Nov 13, 2013 at 03:58:02PM +0400, Alexander Shiyan wrote:
>> > This patch adds a property to automatically determine the NAND
>> > bus width by CFI/ONFI information from chip. This property works
>> > if the bus width is not specified explicitly.
>>
>> This issue brings up a few questions in my mind, which are relevant to
>> device tree in general.
>>
>> First of all, do we need a device tree property at all, for something
>> that is auto-detectable?
>>
>> Related: is a device tree consumer (like Linux) supposed to be a
>> validator, or simply a best-effort? I'm considering the following case:
>> if Linux is allowed to auto-detect some property which also has a device
>> tree binding (e.g., "nand-bus-width", in
>> Documentation/devicetree/bindings/mtd/nand.txt), what should happen if
>> the binding happens to be incorrect? IOW, what if the device tree
>> specifies buswidth is x16, but Linux correctly detects it as x8?
>> Shouldn't we make the best effort to bring the hardware up, regardless
>> of what the device tree says?
>>
>> So for something like this GPIO driver, I'm thinking that Linux should
>> just use NAND_BUSWIDTH_AUTO all the time [*]. But (as I'm hinting above)
>> that would allow DTB firmware implementors to be lazier and have a
>> technically-incorrect "nand-bus-width" or "bank-width" binding, since
>> they know it can reliably be detected and overridden by Linux.
>>
>> [*] Except where resource_size(res) < 2, as Alexander already has in
>> this patch.
>>
>> > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
>> > ---
>> >  .../devicetree/bindings/mtd/gpio-control-nand.txt        |  3 +++
>> >  drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
>> >  2 files changed, 15 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > index 36ef07d..fe4e960 100644
>> > --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > @@ -19,6 +19,9 @@ Optional properties:
>> >    defaults to 1 byte.
>> >  - chip-delay : chip dependent delay for transferring data from array to
>> >    read registers (tR).  If not present then a default of 20us is used.
>> > +- gpio-control-nand,bank-width-auto : Device bus width is determined
>> > +  automatically by CFI/ONFI information from chip if "bank-width"
>> > +  parameter is omitted (Boolean).
>>
>> If we do resort to a new binding for auto-buswidth, it should be a
>> generic one that all NAND drivers can use. Maybe a separate boolean
>> "nand-bus-width-auto" and if it is present, then it overrules the
>> presence (or lack) of the "nand-bus-width" boolean property?
>> Or is it possible to extend "nand-bus-width" to allow the value of 0 to
>> mean automatic?
>
> This was be my first implementation of this feature, but rejected...
> http://permalink.gmane.org/gmane.linux.drivers.mtd/47302

Huh? Your original patch was not correct (it removed properties) and
it was not comprehensive in its description -- it didn't cover any of
the topics in my questions above. It wasn't rejected for any reason
related to my questions here.

My question is whether we can leave the documented
bus-width/bank-width binding in place, but just change the Linux
implementation to perform auto-detection instead of just using the
binding directly. And if the answer is "no", then we need a new
binding like your current patch, except that it should be usable for
all NAND.

Brian
