Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOLQq-0005kz-S8
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 10:03:19 +0000
Received: from player730.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A89A282AB2
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 12:02:44 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Jun 2017 12:02:34 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Colin King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][mtd-next] mtd: parser: print hex size_t value using
 correct %zx printk format specifier
In-Reply-To: <20170623090023.9482-1-colin.king@canonical.com>
References: <20170623090023.9482-1-colin.king@canonical.com>
Message-ID: <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-06-23 11:00, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Use %zx instead of %X for size_t variable offset, fixes build warning:
> 
> warning: format '%X' expects argument of type 'unsigned int', but 
> argument
> 2 has type 'size_t {aka long unsigned int}' [-Wformat=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I sent similar patch few hours earlier:
[PATCH] mtd: parsers: trx: fix pr_err format for printing offset
https://patchwork.ozlabs.org/patch/779789/

Brian: you may pick the one with nicer commit message, whichever one you
prefer :)
