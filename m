Date: Thu, 11 Sep 2014 12:20:30 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: atmel_nand: retrieve NFC clock
Message-ID: <20140911152029.GA16666@arch>
References: <1410446617-29572-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1410446617-29572-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexandre,

On 11 Sep 04:43 PM, Alexandre Belloni wrote:
> @@ -2276,6 +2280,16 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	nfc->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(nfc->clk)) {
> +		dev_warn(&pdev->dev, "NFC clock is missing");
> +		return 0;
> +	}
> +

The binding documentation makes no mention to a clock.

Anyway, with or without the docs I think this patch breaks DT backward
compatibility.

Or am I missing something?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
