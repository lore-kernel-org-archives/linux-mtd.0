Received: from cpsmtpb-ews02.kpnxchange.com ([213.75.39.5])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwTSX-0005NE-J2
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 09:11:59 +0000
Message-ID: <1388135456.5072.3.camel@x220>
Subject: Re: [PATCH] mtd: nand: remove pasemi_nand driver
From: Paul Bolle <pebolle@tiscali.nl>
To: Olof Johansson <olof@lixom.net>
Date: Fri, 27 Dec 2013 10:10:56 +0100
In-Reply-To: <1388123524-9000-1-git-send-email-olof@lixom.net>
References: <1388123524-9000-1-git-send-email-olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-12-26 at 21:52 -0800, Olof Johansson wrote:
> The PA Semi platform is sparsely used these days (with just a handful
> of known users out there). I'm 100% sure none of them use the MTD NAND
> driver -- most standard use cases include PCI-e SATA controllers for
> storage instead, and boot is done from LPC NOR flash.
> 
> So, there's little reason to keep carrying a driver that's not used by
> anybody and that just gets hit by some tree-wide or tools-based changes
> every now and then.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  drivers/mtd/nand/pasemi_nand.c |  238 ----------------------------------------
>  1 file changed, 238 deletions(-)
>  delete mode 100644 drivers/mtd/nand/pasemi_nand.c

If this gets accepted we should remove the related entry in
drivers/mtd/nand/Kconfig and the related line in
drivers/mtd/nand/Makefile too, shouldn't we?


Paul Bolle
