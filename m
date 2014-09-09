Received: from mail-qc0-f170.google.com ([209.85.216.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRLTU-0003qE-9T
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 13:28:48 +0000
Received: by mail-qc0-f170.google.com with SMTP id r5so17818214qcx.29
 for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2014 06:28:22 -0700 (PDT)
Date: Tue, 9 Sep 2014 10:27:08 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2 1/3] nand: omap2: Add support for flash-based bad
 block table
Message-ID: <20140909132708.GA3315@arch.hh.imgtec.org>
References: <1410175636-4036-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410175636-4036-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540EBBEC.0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <540EBBEC.0@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09 Sep 11:35 AM, Roger Quadros wrote:
> Ezequiel,
> 
> On 09/08/2014 02:27 PM, Ezequiel Garcia wrote:
> > This commit adds a new platform-data boolean property that enables use
> > of a flash-based bad block table. This can also be enabled by setting
> > the 'nand-on-flash-bbt' devicetree property.
> 
> I'm not much aware of how on-flash-BBT works internally, but will it break things if
> we keep on-flash-BBT "enabled" as the default option and add a DT property only to
> explicitly disable the on-flash-BBT?
> 

No, that wouldn't work because the DT property already exists and it works to
enable the flash BBT when it's present.

Documentation/devicetree/bindings/mtd/nand.txt

Of course, we can add a new no-nand-on-flash-bbt, but I really don't see the
point. Users can just put the property in all the devicetree board files where
it's needed.

And moreover, I don't want to change the default behavior of the driver; it's
better to allow to *add* a new feature, if such feature is desired.
Otherwise, users with some data in a flash's last blocks would be wiped and
replaced with the BBT.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
