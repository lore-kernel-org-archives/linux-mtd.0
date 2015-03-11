Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVpP2-0003tn-ON
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 22:47:01 +0000
Received: by padbj1 with SMTP id bj1so14929172pad.12
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2015 15:46:39 -0700 (PDT)
Date: Wed, 11 Mar 2015 15:46:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Message-ID: <20150311224632.GD32500@ld-irv-0074>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <201503112322.46491.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201503112322.46491.marex@denx.de>
Cc: devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 11, 2015 at 11:22:46PM +0100, Marek Vasut wrote:
> On Wednesday, March 11, 2015 at 10:57:25 PM, Brian Norris wrote:
> > Almost all flash that are "compatible" with m25p80 support the JEDEC
> > READ ID opcode (0x95)
> 
> On the 2/2 patch, you claim READ ID is 0x9F . You might want to sort
> this inconsistency :) Otherwise ...

Ugh, it should be 0x9F of course. Thanks for noticing. I'll fix this
in the commit message and doc before applying, if I don't get other
complaints.

> Reviewed-by: Marek Vasut <marex@denx.de>

Thanks for the review!

Brian
