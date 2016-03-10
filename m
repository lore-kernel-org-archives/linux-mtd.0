Received: from mail-by2on0063.outbound.protection.outlook.com ([207.46.100.63]
 helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae7gy-0003uD-LB
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 21:00:21 +0000
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
To: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602060842.38290.marex@denx.de> <56B879BD.2070608@ti.com>
 <201602081627.57666.marex@denx.de> <56BB60F1.9070306@opensource.altera.com>
 <56BB629D.2040209@denx.de>
CC: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alan Tull
 <atull@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, "Dinh
 Nguyen" <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
From: Graham Moore <grmoore@opensource.altera.com>
Message-ID: <56E1DF45.901@opensource.altera.com>
Date: Thu, 10 Mar 2016 14:55:33 -0600
MIME-Version: 1.0
In-Reply-To: <56BB629D.2040209@denx.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/10/2016 10:17 AM, Marek Vasut wrote:

[...]

> All right, so we will just add a special property or compat string for
> the TI SoC. But we need to get this driver mainlined first :)
>

Hi Marek,

How's that mainlining going?  You probably noticed this patch needed 
some refactoring for 4.4.  In the course of testing, we realized this 
driver needs to enable its clock.

Do you have a 4.4 or later version in your tree?  I'd like to add the 
clock enabling.

-Graham
