Date: Tue, 21 Aug 2018 07:07:34 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Alban <albeu@free.fr>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Grygorii Strashko <grygorii.strashko@ti.com>, "David S . Miller"
 <davem@davemloft.net>, Naren <naren.kernel@gmail.com>, Mauro Carvalho
 Chehab <mchehab+samsung@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Lukas Wunner <lukas@wunner.de>, Dan Carpenter
 <dan.carpenter@oracle.com>, Florian Fainelli <f.fainelli@gmail.com>, Ivan
 Khoronzhuk <ivan.khoronzhuk@linaro.org>, Sven Van Asbroeck
 <svendev@arcx.com>, Paolo Abeni <pabeni@redhat.com>, David Lechner
 <david@lechnology.com>, Andrew Lunn <andrew@lunn.ch>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 06/29] mtd: Add support for reading MTD devices via
 the nvmem API
Message-ID: <20180821070734.6dd1734d@bbrezillon>
In-Reply-To: <20180820232748.608c3667@tock>
References: <20180810080526.27207-1-brgl@bgdev.pl>
 <20180810080526.27207-7-brgl@bgdev.pl>
 <20180817182720.6a6e5e8e@bbrezillon> <20180819133106.0420df5f@tock>
 <20180819184609.6dcdbb9a@bbrezillon>
 <5b8c30b8-41e1-d59e-542b-fef6c6469ff0@linaro.org>
 <20180820202038.5d3dc195@bbrezillon> <20180820232748.608c3667@tock>
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

On Mon, 20 Aug 2018 23:27:48 +0200
Alban <albeu@free.fr> wrote:

> On Mon, 20 Aug 2018 20:20:38 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> 
> > On Mon, 20 Aug 2018 11:43:34 +0100
> > Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
> >   
> > > 
> > > Overall am still not able to clear visualize on how MTD bindings with 
> > > nvmem cells would look in both partition and un-partition usecases?
> > > An example DT would be nice here!!    
> > 
> > Something along those lines:  
> 
> We must also have a compatible string on the nvmem-cells node to make
> sure we don't clash with the old style MTD partitions,

That's not possible, because we don't have a reg prop in the
nvmem-cells node.

> or some other
> device specific binding.

This one might happen.

Was Rob okay with this compatible? If he was, I guess we can go for
this binding. Srinivas, any objection?

> 
> > 
> > 	mtdnode {
> > 		nvmem-cells {  
>                         compatible = "nvmem-cells";
> > 			#address-cells = <1>;
> > 			#size-cells = <1>;
> > 
> > 			cell@0 {
> > 				reg = <0x0 0x14>;
> > 			};
> > 		};
> > 
> > 		partitions {
> > 			compatible = "fixed-partitions";
> > 			#address-cells = <1>;
> > 			#size-cells = <1>;
> > 
> > 			partition@0 {
> > 				reg = <0x0 0x20000>;
> > 
> > 				nvmem-cells {  
>                                         compatible = "nvmem-cells";
> > 					#address-cells = <1>;
> > 					#size-cells = <1>;
> > 
> > 					cell@0 {
> > 						reg = <0x0 0x10>;
> > 					};
> > 				};
> > 			};
> > 		};
> > 	};  
> 
> 
> Alban
