Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ0Pn-00065n-Fl
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 21:27:04 +0000
Received: by mail-ot1-f65.google.com with SMTP id t5so13671867otk.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2018 13:26:52 -0800 (PST)
Date: Mon, 17 Dec 2018 15:26:50 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@st.com>
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/3] dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND
 controller documentation
Message-ID: <20181217212650.GA20603@bogus>
References: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
 <1544781488-18723-2-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544781488-18723-2-git-send-email-christophe.kerello@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 14, 2018 at 10:58:06AM +0100, Christophe Kerello wrote:
> This patch adds the documentation of the device tree bindings for the STM32
> FMC2 NAND controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt

Please add acks/reviewed-bys when posting new versions.

Rob
