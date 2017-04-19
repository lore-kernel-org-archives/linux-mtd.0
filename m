Received: from mail-yw0-f195.google.com ([209.85.161.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0yC9-00048q-5Z
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 22:35:30 +0000
Received: by mail-yw0-f195.google.com with SMTP id 203so3820320ywe.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 15:35:08 -0700 (PDT)
Date: Wed, 19 Apr 2017 17:35:06 -0500
From: Rob Herring <robh@kernel.org>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Document the STM32 QSPI bindings
Message-ID: <20170419223506.slmoivl3oenp5nub@rob-hp-laptop>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-2-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492103757-22375-2-git-send-email-ludovic.Barre@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 13, 2017 at 07:15:56PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch adds documentation of device tree bindings for the STM32
> QSPI controller.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-quadspi.txt      | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt

Acked-by: Rob Herring <robh@kernel.org>
