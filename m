Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjWxd-0007yW-8R
 for linux-mtd@lists.infradead.org; Thu, 02 Mar 2017 20:04:26 +0000
Date: Thu, 2 Mar 2017 21:03:51 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Moritz Fischer
 <moritz.fischer@ettus.com>
Subject: Re: [PATCH 3/3] nvmem: core: Allow allocating several anonymous
 nvmem devices
Message-ID: <20170302210351.1f740ffc@bbrezillon>
In-Reply-To: <1488484223-844-4-git-send-email-albeu@free.fr>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-4-git-send-email-albeu@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu,  2 Mar 2017 20:50:23 +0100
Alban <albeu@free.fr> wrote:

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

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
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
