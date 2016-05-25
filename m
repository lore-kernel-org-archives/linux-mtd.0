Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5e50-0003Uc-RQ
 for linux-mtd@lists.infradead.org; Wed, 25 May 2016 19:02:55 +0000
Received: by mail-oi0-f68.google.com with SMTP id x130so13831721oia.3
 for <linux-mtd@lists.infradead.org>; Wed, 25 May 2016 12:02:33 -0700 (PDT)
Date: Wed, 25 May 2016 14:02:31 -0500
From: Rob Herring <robh@kernel.org>
To: Baruch Siach <baruch@tkos.co.il>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: drop "soft_bch" from example
Message-ID: <20160525190231.GA20560@rob-hp-laptop>
References: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch@tkos.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 25, 2016 at 06:45:10AM +0300, Baruch Siach wrote:
> Commit 32698aafc9f0 (Documentation: devicetree: deprecate "soft_bch"
> nand-ecc-mode value, 2016-04-22) deprecated "soft_bch". Update the example to
> match.
> 
> Cc: Rafał Miłecki <zajec5@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
