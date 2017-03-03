Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjk98-0004MH-UK
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 10:09:13 +0000
Received: by mail-wm0-x229.google.com with SMTP id n11so11398658wma.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Mar 2017 02:08:49 -0800 (PST)
Subject: Re: [PATCH 3/3] nvmem: core: Allow allocating several anonymous nvmem
 devices
To: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-4-git-send-email-albeu@free.fr>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Moritz Fischer <moritz.fischer@ettus.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4440721f-c66d-c3bf-812b-da4defeeacce@linaro.org>
Date: Fri, 3 Mar 2017 10:08:46 +0000
MIME-Version: 1.0
In-Reply-To: <1488484223-844-4-git-send-email-albeu@free.fr>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 02/03/17 19:50, Alban wrote:
> Currently the nvmem core expect the config to provide a name and ID
> that are then used to create the device name. When no device name is
> given 'nvmem' is used. However if there is several such anonymous
> devices they all get named 'nvmem0', which doesn't work.
>
> To fix this problem use the ID from the config only when the config
> also provides a name. When no name is provided take the uinque ID of
> the nvmem device instead.
>
> Signed-off-by: Alban <albeu@free.fr>
> ---

Thanks for the Fix, looks good to me, I will queue this up once rc1 is out.


>  drivers/nvmem/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 408b521..8c830a8 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -468,7 +468,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>  	np = config->dev->of_node;
>  	nvmem->dev.of_node = np;
>  	dev_set_name(&nvmem->dev, "%s%d",
> -		     config->name ? : "nvmem", config->id);
> +		     config->name ? : "nvmem",
> +		     config->name ? config->id : nvmem->id);
>
>  	nvmem->read_only = of_property_read_bool(np, "read-only") |
>  			   config->read_only;
>
