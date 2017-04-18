Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0cDu-0000Fx-Ng
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 23:07:51 +0000
Received: by mail-wm0-x243.google.com with SMTP id d79so2006269wmi.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 16:07:30 -0700 (PDT)
Subject: Re: [PATCH v7 4/4] mtd: spi-nor: introduce Octo SPI protocols
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <cover.1492554665.git.cyrille.pitchen@atmel.com>
 <fa0c5c607bcc0916c0f8f66e24d717f326054573.1492554665.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4563f2e7-0f3b-4b4e-58d8-40b4653429f0@gmail.com>
Date: Wed, 19 Apr 2017 01:06:43 +0200
MIME-Version: 1.0
In-Reply-To: <fa0c5c607bcc0916c0f8f66e24d717f326054573.1492554665.git.cyrille.pitchen@atmel.com>
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

On 04/19/2017 12:51 AM, Cyrille Pitchen wrote:
> This patch starts adding support to Octo SPI protocols (SPI x-y-8).
> 
> Op codes for Fast Read and/or Page Program operations using Octo SPI
> protocols are not known yet (no JEDEC specification has defined them yet)
> but we'd rather introduce the Octo SPI protocols now so it's done as it
> should be.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
