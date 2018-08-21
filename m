Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs7j4-0001ry-AT
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 14:33:43 +0000
Received: by mail-wm0-x241.google.com with SMTP id y139-v6so397045wmc.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2018 07:33:27 -0700 (PDT)
Subject: Re: [PATCH v2 06/29] mtd: Add support for reading MTD devices via the
 nvmem API
To: Boris Brezillon <boris.brezillon@bootlin.com>, Alban <albeu@free.fr>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
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
 <20180821005327.0d312a85@tock> <20180821074404.23aaeb6b@bbrezillon>
 <20180821142716.0adcdd56@eos> <20180821145725.3b385399@bbrezillon>
 <20180821155706.2adf3b4c@eos> <20180821162644.5a1d7799@bbrezillon>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2d5761f4-2c27-5a23-a635-9205124c993a@linaro.org>
Date: Tue, 21 Aug 2018 15:33:22 +0100
MIME-Version: 1.0
In-Reply-To: <20180821162644.5a1d7799@bbrezillon>
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



On 21/08/18 15:26, Boris Brezillon wrote:
>> This also has the side effect that nvmem cells defined in DT don't
>> appear in sysfs, unlike those defined from board code.
> Wow, that's not good. I guess we'll want to make that consistent at
> some point.
> 
support for sysfs entries per cell is not available in nvmem. However 
there is nvmem sysfs entry per provider which can be read by the user 
space if required.


--srini
