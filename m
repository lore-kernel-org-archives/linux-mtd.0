Received: from rwcrmhc52.attbi.com ([216.148.227.88])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qmPG-0007Ll-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2002 04:18:38 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Erich Schubert <erich@debian.org>,
 linux-mtd@lists.infradead.org
Subject: Re: another question: what can break?
Date: Sun, 15 Sep 2002 23:16:03 -0400
References: <20020916002848.GB23510@bombadil.xmldesign.de>
In-Reply-To: <20020916002848.GB23510@bombadil.xmldesign.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020916031806.QNX26805.rwcrmhc52.attbi.com@there>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

If you specify the "--enable-diskonchip-biosnetboot" when compiling GRUB, 
this should not affect your normal boot sequence, as long as your "network 
boot first" option is turned off.

GRUB installs an INT 18h handler in this case -- but the handler will not be 
called by the BIOS unless you have the network boot option enabled.

The real danger (as others can attest to as well) is *not* using the 
biosnetboot option.  In this case, GRUB installs an INT 19h (bootstrap) 
handler.  This completely takes over the booting process, making it necessary 
to remove (or erase) the DoC to restore the BIOS boot sequence.

In other words, the biosnetboot option -- if your BIOS supports it -- is the 
most flexible, least risky way to boot from the DoC with GRUB.

There is an additional GRUB patch that allows you to bypass the DoC boot 
entirely -- by pressing the CTRL key while booting:

http://lists.infradead.org/pipermail/linux-mtd/2002-August/005730.html

Erich Schubert wrote:
> Right now the system boots from the hard disc, if a hard disc is
> connected, and from the flash if there is no HD.
> If i enable network boot it tries that first;
> then falls back to HD, then Flash.
>
> ** Do i risk to change this behaviour when installing grub?
>
> http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html
>
> my bios has a "network boot first" yes/no toggle (i can network boot)
> but i don't want grub to break that... (i'd like to keep that as
> fallback...)
>
> can i get grub to hook _behind_ the hard disk boot?
> like some floppy vector? (so i could select A,C and C,A as boot sequence
> to switch between hard disc and grub)
>
> Gruss,
> Erich Schubert
