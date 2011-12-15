Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=TX2EHSOBE006.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbFFr-0004zd-PG
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2011 17:38:04 +0000
Message-ID: <4EEA2F38.2090807@freescale.com>
Date: Thu, 15 Dec 2011 11:32:40 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Li Yang <leoli@freescale.com>
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <4EDEAEB9.6020703@freescale.com> <1323724195.2297.11.camel@koala>
 <4EE66EFE.1050608@freescale.com> <1323724784.2297.20.camel@koala>
 <4EE6725C.3050706@freescale.com> <4EE6BC9B.4000602@freescale.com>
 <4EE8612C.9050104@freescale.com> <4EE903CE.1010903@freescale.com>
 <CADRPPNRRXTWzBEvY=vhe9+v0b8Ntq8KNoaXFN8pQZGmMc-dJYw@mail.gmail.com>
In-Reply-To: <CADRPPNRRXTWzBEvY=vhe9+v0b8Ntq8KNoaXFN8pQZGmMc-dJYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, dedekind1@gmail.com, dwmw2@infradead.org,
 LiuShuo <b35362@freescale.com>, linux-kernel@vger.kernel.org,
 shuo.liu@freescale.com, linux-mtd@lists.infradead.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/14/2011 10:59 PM, Li Yang wrote:
> The limitation of the proposed bad block marker migration is that you
> need to make sure the migration is done and only done once.  If it is
> done more than once, the factory bad block marker is totally messed
> up.  It requires a complex mechanism to automatically guarantee the
> migration is only done once, and it still won't be 100% safe.
> 
> I would suggest we use a much easier compromise that we form the BBT
> base on the factory bad block marker on first use of the flash, and
> after that the factory bad block marker is dropped.  We just relies on
> the BBT for information about bad blocks.  Although by doing so we
> can't regenerate the BBT again,  as there is mirror for the BBT I
> don't think we have too much risk.

I have corrupted the BBT too often during development (e.g. a bug makes
all accesses fail, so the upper layers decide to mark everything bad) to
be comfortable with this.

Elsewhere in the thread I suggested a way to let the marker be in either
the bbt or in a dedicated block, depending on whether it's a development
situation where the BBT needs to be erasable.

-Scott
