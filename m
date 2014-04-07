Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXCHS-0003ZB-PE
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 16:20:20 +0000
Received: by mail-la0-f41.google.com with SMTP id gl10so5139778lab.28
 for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2014 09:19:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <CAGnW=BZh6==DS2eNUBwNVXR-+4xTpsPuVPLPx=i+zwTQUkCckw@mail.gmail.com>
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
 <05521479-afd6-4c52-afbb-ef3fe2dafd18@CH1EHSMHS001.ehs.local>
 <20980858CB6D3A4BAE95CA194937D5E73EAB952B@DBDE04.ent.ti.com>
 <CAGnW=BZh6==DS2eNUBwNVXR-+4xTpsPuVPLPx=i+zwTQUkCckw@mail.gmail.com>
Date: Mon, 7 Apr 2014 21:49:51 +0530
Message-ID: <CAGnW=Bb9QK1tp=z4S9z4ynMQ2JEn5=7dEOf=Aw7b8TaRS8WFrA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] Devicetree: Add pl353 smc controller devicetree
 binding information
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Lee Jones \(lee.jones@linaro.org\)" <lee.jones@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "joern@logfs.org" <joern@logfs.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "acourbot@nvidia.com" <acourbot@nvidia.com>,
 "kpc528@gmail.com" <kpc528@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob@landley.net" <rob@landley.net>,
 "galak@codeaurora.org" <galak@codeaurora.org>, "Khoronzhuk,
 Ivan" <ivan.khoronzhuk@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 28, 2014 at 3:13 PM, punnaiah choudary kalluri
<kalluripunnaiahchoudary@gmail.com> wrote:
> On Fri, Mar 28, 2014 at 2:28 PM, Gupta, Pekon <pekon@ti.com> wrote:
>>>From: Punnaiah Choudary Kalluri [mailto:punnaiah.choudary.kalluri@xilinx.com]
>>>
>>>Add pl353 static memory controller devicetree binding information.
>>>
>>>Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>>>---
>>> .../bindings/memory-controllers/pl353-smc.txt      |   53 ++++++++++++++++++++
>>> 1 files changed, 53 insertions(+), 0 deletions(-)
>>> create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>>>
>>>diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-
>>>controllers/pl353-smc.txt
>>>new file mode 100644
>>>index 0000000..623c1c6
>>>--- /dev/null
>>>+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>>>@@ -0,0 +1,53 @@
>>>+Device tree bindings for ARM PL353 static memory controller
>>>+
>>>+PL353 static memory controller supports two kinds of memory
>>>+interfaces.i.e NAND and SRAM/NOR interfaces.
>>>+The actual devices are instantiated from the child nodes of pl353 smc node.
>>>+
>>>+Required properties:
>>>+- compatible          : Should be "arm,pl353-smc-r2p1"
>>>+- reg                 : Controller registers map and length.
>>>+- clock-names         : List of input clock names - "ref_clk", "aper_clk"
>>>+                        (See clock bindings for details).
>>>+- clocks              : Clock phandles (see clock bindings for details).
>>>+- address-cells       : Address cells, must be 1.
>>>+- size-cells          : Size cells. Must be 1.
>>>+
>>>+Child nodes:
>>>+ For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
>>>+supported as child nodes.
>>>+
>>>+Mandatory timing properties for child nodes:
>>>+- arm,nand-cycle-t0   : Read cycle time(t_rc).
>>>+- arm,nand-cycle-t1   : Write cycle time(t_wc).
>>>+- arm,nand-cycle-t2   : re_n assertion delay(t_rea).
>>>+- arm,nand-cycle-t3   : we_n de-assertion delay(t_wp).
>>>+- arm,nand-cycle-t4   : Status read time(t_clr)
>>>+- arm,nand-cycle-t5   : ID read time(t_ar)
>>>+- arm,nand-cycle-t6   : busy to re_n(t_rr)
>>>+
>>
>> It would be good to have DT-bindings with meaningful names,
>> and suffixed with timing units like "ns" | "ps".
>
> Ok.  I will add this information.
>
>> Also, as many of these timing parameters are common across NAND device
>> vendors, so why not get them added to  generic NAND bindings list.
>>         Documentation/devicetree/bindings/mtd/nand.txt
>>
>
> Let me check on this and I will get back to you.

Ok. I think the timing parameters defined in ONFI-1.0 spec can be added to the
generic NAND binding list. So that the NAND controllers which have provision for
configuring any of these timing parameters can use the generic binding info
for accessing the NAND device.

I will update accordingly and send v2 patches soon.

Punnaiah
>
> Punnaiah
>
>> Another driver using similar bindings for NAND device timings
>>         [RFC 13/47] mtd: nand: stm_nand_bch: provide Device Tree support
>>         http://lists.infradead.org/pipermail/linux-mtd/2014-March/052890.html
>>
>>
>> with regards, pekon
