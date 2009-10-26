Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N2Jm7-0008O1-By
	for linux-mtd@lists.infradead.org; Mon, 26 Oct 2009 07:14:00 +0000
Date: Mon, 26 Oct 2009 08:13:52 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 14/16] pcmcia: use dynamic debug infrastructure,
	deprecate CS_CHECK (misc drivers)
Message-ID: <20091026071352.GA26980@isilmar.linta.de>
References: <20091024194219.GA19546@comet.dominikbrodowski.net>
	<1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
	<1256539331.29885.360.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1256539331.29885.360.camel@localhost>
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-usb@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,

On Mon, Oct 26, 2009 at 08:42:11AM +0200, Artem Bityutskiy wrote:
> On Sat, 2009-10-24 at 21:43 +0200, Dominik Brodowski wrote:
> > Convert PCMCIA drivers to use the dynamic debug infrastructure, instead of
> > requiring manual settings of PCMCIA_DEBUG.
> > 
> > Also, remove all usages of the CS_CHECK macro and replace them with proper
> > Linux style calling and return value checking. The extra error reporting may
> > be dropped, as the PCMCIA core already complains about any (non-driver-author)
> > errors.
> > 
> > CC: linux-mtd@lists.infradead.org
> > CC: linux-usb@vger.kernel.org
> > Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
> 
> Have you been able to test the driver after the clean-up?

No, I don't have all that much PCMCIA hardware -- and specifically none for
the drivers which were modified in this patch (parport, ixj-telephony,
sl811; pcmcia_mtd is marked broken anyway).

Best,
	Dominik
