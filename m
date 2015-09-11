Message-ID: <1441965076.23394.7.camel@mhfsdcap03>
Subject: Re: [PATCH 3/3] arm64: dts: mt8173: Add nor flash node
From: bayi.cheng <bayi.cheng@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Jagan Teki
 <jteki@openedev.com>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll
 <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>, "Kumar
 Gala" <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Date: Fri, 11 Sep 2015 17:51:16 +0800
In-Reply-To: <55EF7346.5040607@kernel.org>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-4-git-send-email-bayi.cheng@mediatek.com>
 <CAD6G_RTR2r8ETMQ14uGosRn-85sssvVsFT4BjK9SkVSfMkG8Dw@mail.gmail.com>
 <CAAEAJfCg+O=b9pfndG2WfxKVk9gvcqHUL0MV4fDpHj_9CaCBbQ@mail.gmail.com>
 <55EF7346.5040607@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-09-08 at 18:46 -0500, Rob Herring wrote:
> On 09/08/2015 10:18 AM, Ezequiel Garcia wrote:
> > On 8 September 2015 at 08:53, Jagan Teki <jteki@openedev.com> wrote:
> >> On 8 September 2015 at 15:19, Bayi Cheng <bayi.cheng@mediatek.com> wrote:
> >>> Add Mediatek nor flash node
> >>>
> >>> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> >>> ---
> >>>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>> index d18ee42..a14f005 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>> @@ -365,6 +365,16 @@
> >>>                         status = "disabled";
> >>>                 };
> >>>
> >>> +               nor_flash: nor@1100d000 {
> >>
> >> Based on the comments from 1/3 - this notation needs to be change something like
> >> qspi0: quadspi@1100d000
> >>
> > 
> > Actually, to follow ePAPR recomendations it should be named as flash@1100d000.
> > (See ePAPR, 2.2.2 Generic Names Recommendation).
> 
> The flash device node should, but this is the controller which should be
> "spi" IMO even if this is not a general purpose controller.
> 
> Rob
> 
HI Rob, Thanks for your instruct! I will fix it !
