Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVPlo-0005vH-Qh
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 23:42:58 +0000
Received: by mail-ot1-f66.google.com with SMTP id w25so5363123otm.13
 for <linux-mtd@lists.infradead.org>; Fri, 07 Dec 2018 15:42:46 -0800 (PST)
Date: Fri, 7 Dec 2018 17:42:44 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@st.com>
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [ v3 1/3] dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND
 controller documentation
Message-ID: <20181207234244.GA19886@bogus>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-2-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543509663-26128-2-git-send-email-christophe.kerello@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 Nov 2018 17:41:01 +0100, Christophe Kerello wrote:
> This patch adds the documentation of the device tree bindings for the STM32
> FMC2 NAND controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
