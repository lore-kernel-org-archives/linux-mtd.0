Received: from lixom.net ([66.141.50.11] helo=mail.lixom.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPS8R-0004Bp-05
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2009 01:44:05 +0000
Date: Tue, 20 Jan 2009 19:46:59 -0600
From: Olof Johansson <olof@lixom.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc: more printing warning fixes for the l64 to
	ll64 conversion
Message-ID: <20090121014659.GA7000@lixom.net>
References: <20090121111651.7d6e87ec.sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090121111651.7d6e87ec.sfr@canb.auug.org.au>
Cc: Nick Spence <nick.spence@freescale.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@ozlabs.org, Egor Martovetsky <egor@pasemi.com>,
	Paul Mackerras <paulus@samba.org>,
	Doug Thompson <dougthompson@xmission.com>,
	Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	bluesmoke-devel@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 21, 2009 at 11:16:51AM +1100, Stephen Rothwell wrote:
> These are all powerpc specific drivers.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

pasemi_nand.c pieces:

Acked-by: Olof Johansson <olof@lixom.net>
