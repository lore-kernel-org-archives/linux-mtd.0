Date: Mon, 26 Oct 2009 10:19:09 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: dedekind1@gmail.com
Subject: Re: [PATCH 14/16] pcmcia: use dynamic debug infrastructure,
	deprecate CS_CHECK (misc drivers)
Message-ID: <20091026101909.271c109e@lxorguk.ukuu.org.uk>
In-Reply-To: <1256541991.29885.376.camel@localhost>
References: <20091024194219.GA19546@comet.dominikbrodowski.net>
	<1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
	<1256539331.29885.360.camel@localhost>
	<20091026071352.GA26980@isilmar.linta.de>
	<1256541991.29885.376.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-usb@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > No, I don't have all that much PCMCIA hardware -- and specifically none for
> > the drivers which were modified in this patch (parport, ixj-telephony,
> > sl811; pcmcia_mtd is marked broken anyway).
> 
> This driver is old and ugly, and it is even possible that no one uses it
> anymore, so I guess getting clean-ups without testing is ok for it.
> However, in that case the clean-up patches should be reviewable, which I
> wouldn't say about your patch :-)
> 
> Could you please split it on several smaller patches, each doing one
> thing only?

pcmcia_mtd has been marked broken for how long - better to delete it ?
It's in the git history if anyone ever wants to resurrect it.
