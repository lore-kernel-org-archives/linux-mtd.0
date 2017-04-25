Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d372i-0007SB-JK
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 20:26:39 +0000
Received: by mail-wm0-x243.google.com with SMTP id z129so28158977wmb.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 13:26:16 -0700 (PDT)
Subject: Re: [PATCH v8 3/4] mtd: spi-nor: introduce Double Transfer Rate (DTR)
 SPI protocols
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
References: <cover.1493149757.git.cyrille.pitchen@wedev4u.fr>
 <44562d5d511d8fef8c21ea7e10f32cf727b147b8.1493149757.git.cyrille.pitchen@wedev4u.fr>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <aaabe07a-fd00-8156-7082-3200238a0d60@gmail.com>
Date: Tue, 25 Apr 2017 22:26:06 +0200
MIME-Version: 1.0
In-Reply-To: <44562d5d511d8fef8c21ea7e10f32cf727b147b8.1493149757.git.cyrille.pitchen@wedev4u.fr>
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

On 04/25/2017 10:08 PM, Cyrille Pitchen wrote:
> From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> 
> This patch introduces support to Double Transfer Rate (DTR) SPI protocols.
> DTR is used only for Fast Read operations.
> 
> According to manufacturer datasheets, whatever the number of I/O lines
> used during instruction (x) and address/mode/dummy (y) clock cycles, DTR
> is used only during data (z) clock cycles of SPI x-y-z protocols.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
