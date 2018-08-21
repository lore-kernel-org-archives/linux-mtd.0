Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs5Ke-0005ui-VQ
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 12:00:27 +0000
Received: by mail-wm0-x244.google.com with SMTP id n11-v6so2607833wmc.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2018 05:00:08 -0700 (PDT)
Subject: Re: [PATCH v2 06/29] mtd: Add support for reading MTD devices via the
 nvmem API
To: Alban <albeu@free.fr>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "David S . Miller" <davem@davemloft.net>, Naren <naren.kernel@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lukas Wunner <lukas@wunner.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Sven Van Asbroeck <svendev@arcx.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, David Lechner <david@lechnology.com>,
 Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180810080526.27207-1-brgl@bgdev.pl>
 <20180810080526.27207-7-brgl@bgdev.pl> <20180817182720.6a6e5e8e@bbrezillon>
 <20180819133106.0420df5f@tock> <20180819184609.6dcdbb9a@bbrezillon>
 <5b8c30b8-41e1-d59e-542b-fef6c6469ff0@linaro.org>
 <20180820202038.5d3dc195@bbrezillon>
 <e0ec3194-fd3a-9b3d-fba8-f88447eb56e9@linaro.org>
 <20180821133916.3a1c51b1@eos>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6db14f9c-edd3-5e43-839c-953bb03097ff@linaro.org>
Date: Tue, 21 Aug 2018 13:00:04 +0100
MIME-Version: 1.0
In-Reply-To: <20180821133916.3a1c51b1@eos>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 21/08/18 12:39, Alban wrote:
> However we still have the a potential address space clash between the
> nvmem cells and the main device binding.
Can you elaborate?

--srini
