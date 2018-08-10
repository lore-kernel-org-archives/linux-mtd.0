Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fo2rS-00070V-Jy
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2018 08:33:31 +0000
Received: by mail-wm0-x241.google.com with SMTP id y2-v6so1018771wma.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Aug 2018 01:33:20 -0700 (PDT)
Subject: Re: [PATCH v2 03/29] nvmem: add a notifier chain
To: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "David S . Miller" <davem@davemloft.net>, Naren <naren.kernel@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lukas Wunner <lukas@wunner.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Sven Van Asbroeck <svendev@arcx.com>, Paolo Abeni <pabeni@redhat.com>,
 Alban Bedel <albeu@free.fr>, Rob Herring <robh@kernel.org>,
 David Lechner <david@lechnology.com>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180810080526.27207-1-brgl@bgdev.pl>
 <20180810080526.27207-4-brgl@bgdev.pl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <343dde5f-7e92-426f-89e4-1bfcf6714337@linaro.org>
Date: Fri, 10 Aug 2018 09:33:16 +0100
MIME-Version: 1.0
In-Reply-To: <20180810080526.27207-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 10/08/18 09:05, Bartosz Golaszewski wrote:
> +int nvmem_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&nvmem_notifier, nb);
> +}
> +EXPORT_SYMBOL_GPL(nvmem_register_notifier);
> +
> +int nvmem_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&nvmem_notifier, nb);
> +}
> +EXPORT_SYMBOL_GPL(nvmem_unregister_notifier);
> +
Kerneldoc is missing for these both exported symbols too!

--srini
