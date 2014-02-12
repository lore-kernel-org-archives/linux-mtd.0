Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDUVJ-0008Tj-Ns
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 07:45:10 +0000
Received: by mail-pd0-f174.google.com with SMTP id z10so8580640pdj.5
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 23:44:46 -0800 (PST)
Date: Tue, 11 Feb 2014 23:44:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Message-ID: <20140212074442.GB3500@norris-Latitude-E6410>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
 <20140117203347.GC3843@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA67E79@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA67E79@DBDE04.ent.ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Seif Mazareeb <seif@marvell.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 20, 2014 at 06:21:35AM +0000, Pekon Gupta wrote:
> >From: Ezequiel Garcia 
> >I'm not implying we should deprecate the recently added "ti-nand-ecc-opt",
> >but just want to know it's eventually possible.
> >
> Yes, this is good approach for long-term, and it can replace "ti-nand-ecc-opt"
> "ti-nand-ecc-opt" is not new DT binding, it just got some new values added
> However, you have to convince DT Maintainers to get this in, and then deprecate
> other vendor specific bindings. It would be difficult to maintain backward
> compatibility to these bindings, if we move to 'nand-ecc-strength'.

I don't see why it would be difficult to support both the more generic
nand-ecc-strength and the OMAP-specific ti-nand-ecc-opt in the same
driver. OMAP NAND would just have to define a helper that translates
properties like "bch8" into a strength and sector size (8 and 512,
respectively). From then on, you can treat them identically.

> At some-point we need to get some concrete guidelines from DT Maintainers on
> how long we should support deprecated bindings in our code, And what is the
> age of DT binding. I think David Woodhouse should throw more light, as he had
> some discussions & ideas on about DT binding life, during a linux conference.

Barring some new direction from the DT folks, I believe DT is an eternal
ABI. We can and should maintain compatibility forever. And in this case,
I don't think it's that hard.

Brian
