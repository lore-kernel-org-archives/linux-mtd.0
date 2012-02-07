From: Stefan Roese <sr@denx.de>
To: devicetree-discuss@lists.ozlabs.org
Subject: Re: [PATCH 4/6 V2] of/mtd/nand: add generic bindings and helpers
Date: Tue, 7 Feb 2012 10:45:30 +0100
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <201202061720.24996.sr@denx.de> <20120207041606.GD15647@game.jcrosoft.org>
In-Reply-To: <20120207041606.GD15647@game.jcrosoft.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201202071045.30128.sr@denx.de>
Cc: linux-mtd@lists.infradead.org,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 07 February 2012 05:16:06 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > - nand-on-flash-bbt: boolean to enable on flash bbt option if not
> > > present false
> > 
> > Why not use an "empty" type (without argument) for nand-on-flash-bbt
> > then?
> 
> I want to be able to disable it

Then just don't add this property.
 
> I send a patch to add a helper to manage boolean
> 
> this will allow to disable a boolean
> 
>     is-ok;          => true
>     is-ok = <1>;    => true
>     is-ok = <0>;    => false

Okay, fine with me.

Thanks,
Stefan
