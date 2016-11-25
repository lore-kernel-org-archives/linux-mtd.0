Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
To: Shawn Lin <shawn.lin@rock-chips.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
 <1479437945-27918-3-git-send-email-shawn.lin@rock-chips.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <020fe898-8476-42cd-9591-d2bc97263457@gmail.com>
Date: Fri, 25 Nov 2016 14:55:12 +0100
MIME-Version: 1.0
In-Reply-To: <1479437945-27918-3-git-send-email-shawn.lin@rock-chips.com>
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

On 11/18/2016 03:59 AM, Shawn Lin wrote:
> Add rockchip serial flash controller driver
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

[...]

> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
> +{
> +	int i;
> +
> +	for (i = 0; i < sfc->num_chip; i++)
> +		mtd_device_unregister(&(sfc->flash[sfc->num_chip].nor.mtd));
                                                   ^^^^^^^^^^^^^
This will always unregister the same flash, no ? This cannot work.

> +}

[...]

-- 
Best regards,
Marek Vasut
