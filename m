Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYW7N-0004P5-NQ
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2016 09:52:26 +0000
Subject: Re: [PATCH v5 12/26] memory: omap-gpmc: Move device tree binding to
 correct location
To: Rob Herring <robh@kernel.org>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-13-git-send-email-rogerq@ti.com>
 <20160223205012.GA24158@rob-hp-laptop>
CC: <tony@atomide.com>, <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <56CD7D1B.5010007@ti.com>
Date: Wed, 24 Feb 2016 11:51:23 +0200
MIME-Version: 1.0
In-Reply-To: <20160223205012.GA24158@rob-hp-laptop>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23/02/16 22:50, Rob Herring wrote:
> On Fri, Feb 19, 2016 at 11:15:34PM +0200, Roger Quadros wrote:
>> omap-gpmc.c is a memory controller so move the binding to the
>> right place.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>>  Documentation/devicetree/bindings/bus/ti-gpmc.txt  | 130 ---------------------
>>  .../bindings/memory-controllers/omap-gpmc.txt      | 130 +++++++++++++++++++++
> 
> am335x is not an OMAP, so wasn't ti-gpmc a better name?

The driver is named drivers/memory/omap-gpmc.c.

> 
>>  2 files changed, 130 insertions(+), 130 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/bus/ti-gpmc.txt
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> 
> Next time, use the git format-patch -M option.

Indeed.

> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Thanks.

cheers,
-roger
