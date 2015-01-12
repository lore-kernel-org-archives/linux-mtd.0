From: Arnd Bergmann <arnd@arndb.de>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v6 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Date: Mon, 12 Jan 2015 09:21:05 +0100
Message-ID: <5265608.Ut8IQVYZc5@wuerfel>
In-Reply-To: <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com>
References: <1421047734-30818-1-git-send-email-wangzhou1@hisilicon.com>
 <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com,
 linux-mtd@lists.infradead.org, haojian.zhuang@gmail.com, caizhiyong@huawei.com,
 yubingxu@hisilicon.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 12 January 2015 15:28:53 Zhou Wang wrote:
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> ---

I haven't looked at earlier versions, but it looks very good to
me overall. Just add a patch description above please.

One tiny detail:

> +static const struct of_device_id nfc_id_table[] = {
> +	{ .compatible = "hisilicon,504-nfc" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, nfc_id_table);
> +
> +static struct platform_driver hisi_nfc_driver = {
> +	.driver = {
> +		.name  = "hisi_nand",
> +		.of_match_table = of_match_ptr(nfc_id_table),
> +		.pm = &hisi_nfc_pm_ops,
> +	},
> +	.probe		= hisi_nfc_probe,
> +	.remove		= hisi_nfc_remove,
> +};

Remove the of_match_ptr() macro here to avoid a warning when
CONFIG_OF is not set.

	Arnd
