Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RugTA-0006zp-75
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 08:32:09 +0000
Received: from mail617.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 1C5561008AE9
 for <linux-mtd@lists.infradead.org>; Tue,  7 Feb 2012 09:29:00 +0100 (CET)
Date: Tue, 7 Feb 2012 05:16:06 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 4/6 V2] of/mtd/nand: add generic bindings and helpers
Message-ID: <20120207041606.GD15647@game.jcrosoft.org>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1328524512-18159-1-git-send-email-plagnioj@jcrosoft.com>
 <201202061720.24996.sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201202061720.24996.sr@denx.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17:20 Mon 06 Feb     , Stefan Roese wrote:
> Hi Jean-Christophe,
> 
> On Monday 06 February 2012 11:35:11 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > - nand-ecc-mode : String, operation mode of the NAND ecc mode.
> >   Supported values are: "none", "soft", "hw", "hw_syndrome",
> > "hw_oob_first", "soft_bch".
> > - nand-bus-width : 8 or 16 bus width if not present 8
> > - nand-on-flash-bbt: boolean to enable on flash bbt option if not present
> > false
> 
> Why not use an "empty" type (without argument) for nand-on-flash-bbt then?
I want to be able to disable it

I send a patch to add a helper to manage boolean

this will allow to disable a boolean

    is-ok;          => true
    is-ok = <1>;    => true
    is-ok = <0>;    => false

Best Regards,
J.
