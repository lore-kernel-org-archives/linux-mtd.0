Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwkT-0006tn-9X
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:57:22 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so2739132pdi.19
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 10:57:00 -0700 (PDT)
Date: Wed, 9 Apr 2014 10:56:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/9] mtd: spi-nor: drop \t after #define
Message-ID: <20140409175656.GF32070@ld-irv-0074>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <201404091940.14392.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201404091940.14392.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 09, 2014 at 07:40:14PM +0200, Marek Vasut wrote:
> On Wednesday, April 09, 2014 at 07:32:46 PM, Brian Norris wrote:
> > +#define OPCODE_DUAL_READ        0x3b    /* Read data bytes (Dual SPI) */
> > +#define OPCODE_QUAD_READ        0x6b    /* Read data bytes (Quad SPI) */
> 
> This is still a little non-standard -- or rather -- inconsistent here. You 
> should use space after #define and \t after the name I'd say. I'd also say these 
> two slipped your attention as the others do it just like that.

Thanks. I think I noticed this at one point, but in my patch juggling, I
never straightened it out. I'll send v2 eventually. And in the meantime,
I'm keeping my patches here:

  http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/spinor

Brian
