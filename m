Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZKdT-0008I0-J7
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 13:07:36 +0000
Date: Thu, 24 Oct 2013 10:07:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v10 04/10] mtd: nand: omap: fix device scan:
 NAND_CMD_READID, NAND_CMD_RESET, CMD_CMD_PARAM use only x8 bus
Message-ID: <20131024130703.GA9958@localhost>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-5-git-send-email-pekon@ti.com>
 <20131022201624.GL23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA29DB8@DBDE04.ent.ti.com>
 <5267690C.9080005@gmail.com> <20131023125516.GA2458@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA2A0CB@DBDE04.ent.ti.com>
 <20131023132457.GD2458@localhost> <20131023144652.GI2458@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA2A783@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2A783@DBDE04.ent.ti.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>, "olof@lixom.net" <olof@lixom.net>,
 "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

On Thu, Oct 24, 2013 at 12:59:26PM +0000, Gupta, Pekon wrote:
> Hi Ezequiel,
> 
> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> > I won't be able to make too much progress without some help or without
> > squeezing my brains out :P
> > 
> > Care to push some git branch on some random repo with DT support for
> > the NAND cape in the Beaglebone?
> > 
> Apologies for delay, I was testing and preparing a newer version of patch-set..
> 
> Please find the beagle-bone DTS attached. However, consider this as RFC
> only, as I'm waiting for current series which has some DT-binding updates
> to get accepted first.
> 
> Commit log in the patch would also guide you for some board tweaks
> for enabling NAND cape on beagle-bone (LT/white)..
> (I have recently sent v11 of the patch series incorporating last few
>  comments from Brian about nand_scan_ident().)
> 

Thanks! I'll give this a try.

Anyway, for future reference, it's really easier for testers and
reviewers to just push the code in some public git repo (github? gitorious?).

This way I don't have to apply the patches from my mailbox,
but just checkout a branch...
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
