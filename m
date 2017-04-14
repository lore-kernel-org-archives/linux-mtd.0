Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz3yv-00049Q-Ru
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 16:21:59 +0000
Received: by mail-wr0-x241.google.com with SMTP id u18so13030384wrc.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Apr 2017 09:21:37 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
To: Ludovic Barre <ludovic.Barre@st.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-3-git-send-email-ludovic.Barre@st.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring
 <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b0238aad-38a1-3b06-ac2e-45f658041661@gmail.com>
Date: Fri, 14 Apr 2017 18:15:06 +0200
MIME-Version: 1.0
In-Reply-To: <1492103757-22375-3-git-send-email-ludovic.Barre@st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/13/2017 07:15 PM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> The quadspi is a specialized communication interface targeting single,
> dual or quad SPI Flash memories.
> 
> It can operate in any of the following modes:
> -indirect mode: all the operations are performed using the quadspi
>  registers
> -read memory-mapped mode: the external Flash memory is mapped to the
>  microcontroller address space and is seen by the system as if it was
>  an internal memory
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
