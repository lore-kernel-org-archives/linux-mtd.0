Message-ID: <554CDD8C.7050000@wwwdotorg.org>
Date: Fri, 08 May 2015 10:00:12 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: tegra: add "nor-jedec" flash compatible binding
References: <1431066098-19821-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1431066098-19821-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/08/2015 12:21 AM, Rafał Miłecki wrote:
> Starting with commits
> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
> we have "nor-jedec" binding indicating support for JEDEC identification.

The documentation looks quite incomplete. "nor-jedec" sounds like it's 
intended to be something generic. As such, it should be documented in 
e.g. Documentation/devicetree/bindings/mtd/nor-jedec.txt, not buried in 
one particular flash device's binding. If it's not intended to be 
generic, why isn't the existing "winbond,w25q32dw" enough?

Equally, "nor-jedec" doesn't sound like the right name. It doesn't 
differentiate between SPI and parallel NOR flash, which presumably need 
different compatible values, since the programming model is quite 
different, and the compatible value is supposed to define/imply the 
SW-visible programming model.
