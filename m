Received: from mail-ig0-f174.google.com ([209.85.213.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3u8X-0000Dk-10
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 21:06:02 +0000
Received: by mail-ig0-f174.google.com with SMTP id hl1so11844077igb.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2014 13:05:34 -0800 (PST)
Date: Thu, 16 Jan 2014 13:05:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: m25p80: Use OPCODE_QUAD_READ_4B for 4-byte addressing
Message-ID: <20140116210529.GF8919@ld-irv-0074>
References: <1389800935-6468-1-git-send-email-geert@linux-m68k.org>
 <201401160109.34499.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201401160109.34499.marex@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Sourav Poddar <sourav.poddar@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 16, 2014 at 01:09:34AM +0100, Marek Vasut wrote:
> On Wednesday, January 15, 2014 at 04:48:55 PM, Geert Uytterhoeven wrote:
> > From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> > 
> > commit 3487a63955c34ea508bcf4ca5131ddd953876e2d ("drivers: mtd: m25p80: add
> > quad read support") in -next added both the 3-byte OPCODE_QUAD_READ and the
> > 4-byte OPCODE_QUAD_READ_4B, but incorrectly uses OPCODE_QUAD_READ for both
> > 3-byte and 4-byte addressing.
> > 
> > Use OPCODE_QUAD_READ_4B in the 4-byte case to fix this.

Wow, I noticed this and had a patch privately queued over a month ago
for this, but I forgot to send it out... Thanks for noticing!

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> 
> Looks all right.
> 
> Acked-by: Marek Vasut <marex@denx.de>

Pushed to l2-mtd.git.

Brian
