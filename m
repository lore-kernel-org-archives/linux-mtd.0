Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctX7t-0006Wl-PJ
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:16:23 +0000
Received: by mail-wr0-x244.google.com with SMTP id p52so10686458wrc.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 03:16:01 -0700 (PDT)
Subject: Re: [PATCH 0/2] mtd: spi-nor: add stm32 qspi driver
To: Ludovic BARRE <ludovic.barre@st.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <5224f3cd-a128-9e72-c0c8-62a137ceeb79@wedev4u.fr>
 <d1c2f0a9-302d-ea7c-5d1b-ad32b9950ed4@st.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e04fa293-63d4-7a7e-a998-37aab31167e5@gmail.com>
Date: Thu, 30 Mar 2017 12:15:57 +0200
MIME-Version: 1.0
In-Reply-To: <d1c2f0a9-302d-ea7c-5d1b-ad32b9950ed4@st.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/30/2017 09:31 AM, Ludovic BARRE wrote:
> hi Cyrille
> 
> I see your patch series
> 
> [PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories
> 
> No problem, I rebase my V2 onto your patch

I still didn't review that, so it might take a bit until it hits
mainline. I think the stm32 stuff looks pretty OK, so we can take that
before the SFDP stuff, no?

-- 
Best regards,
Marek Vasut
