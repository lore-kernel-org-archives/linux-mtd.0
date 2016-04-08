Received: from smtprelay0105.hostedemail.com ([216.40.44.105]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoZcG-0006OG-Dw
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 16:50:41 +0000
Message-ID: <1460134198.1800.37.camel@perches.com>
Subject: Re: [PATCH V2] mtd: nand: pasemi: switch to pr_* functions
From: Joe Perches <joe@perches.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Egor
 Martovetsky <egor@pasemi.com>, Olof Johansson <olof@lixom.net>, David
 Woodhouse <dwmw2@infradead.org>,  Brian Norris
 <computersforpeace@gmail.com>, "open list:LINUX FOR POWERPC PA SEMI
 PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Fri, 08 Apr 2016 09:49:58 -0700
In-Reply-To: <1460114003-19926-1-git-send-email-zajec5@gmail.com>
References: <1460111589-18781-1-git-send-email-zajec5@gmail.com>
 <1460114003-19926-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-04-08 at 13:13 +0200, Rafał Miłecki wrote:
> 1) Use pr_fmt to keep messages consistent
> 2) Don't warn if kzalloc fails as it dumps stack on its own
> 3) Use %pR format for displaying whole resource to avoid:
> warning: format ‘%08llx’ expects type ‘long long unsigned int’, but
> argument 2 has type ‘resource_size_t’

thanks
