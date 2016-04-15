Received: from smtprelay0151.hostedemail.com ([216.40.44.151]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arAIs-0002KV-Lo
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 20:25:23 +0000
Message-ID: <1460751891.19090.45.camel@perches.com>
Subject: Re: [PATCH 09/12] mtd: nand: fsmc: validate ECC setup by checking
 algorithm directly
From: Joe Perches <joe@perches.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 15 Apr 2016 13:24:51 -0700
In-Reply-To: <1460751818.19090.43.camel@perches.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-10-git-send-email-zajec5@gmail.com>
 <1460751818.19090.43.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-04-15 at 13:23 -0700, Joe Perches wrote:
> Why not just add NAND_ECC_SOFT above the default case?

Nevermind, misread.
