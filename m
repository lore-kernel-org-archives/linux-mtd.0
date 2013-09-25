Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOtAb-0001As-4w
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 17:46:41 +0000
Received: by mail-ob0-f169.google.com with SMTP id wp4so4178obc.0
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 10:46:14 -0700 (PDT)
Date: Wed, 25 Sep 2013 10:46:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 1/4] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Message-ID: <20130925174609.GU4550@ld-irv-0074.broadcom.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-2-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA15ED7@DBDE04.ent.ti.com>
 <20130925134619.GG10746@radagast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130925134619.GG10746@radagast>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "olof@lixom.net" <olof@lixom.net>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 08:46:19AM -0500, Felipe Balbi wrote:
> + akpm
> 
> On Tue, Sep 24, 2013 at 01:04:05PM -0500, Gupta, Pekon wrote:
> > 
> > > 
> > > This patch
> > > - updates DT binding for selection of ecc-scheme
> > > - updates DT binding for detection of ELM h/w engine
> > > - removes following obselete ECC schemes
> > > 	OMAP_ECC_HAMMING_CODE_DEFAULT (S/W based 1-bit Hamming
> > > ECC)
> > > 	OMAP_ECC_HAMMING_CODE_HW_ROMCODE (H/W based 1-bit
> > > Hamming ECC scheme)
> > > - updates DT binding documentation for mtd/gpmc-nand
> > > 
> > > Signed-off-by: Pekon Gupta <pekon@ti.com>
> > > ---
> > 
> > Dear Olof and other DT Maintainers,
> > 
> > This patch series has missed multiple merge windows, and
> > much of the other development work on mtd/nand/omap
> > driver is gated due to this.
> > So, request you to please review this patch set and Ack it
> > if all your mentioned concerns are resolved.

I've been waiting on Olof's response for this one. It seems like you
addressed his comments well enough for me, although (in line with his
comments) you are admittedly still breaking the DT ABI for these
devices. IMO, that's OK given the low quality of the original bindings.

I will make my own last pass at this series and push it to l2-mtd.git if
it looks OK.

Brian
