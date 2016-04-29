Received: from mail-am1on0059.outbound.protection.outlook.com ([157.56.112.59]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aw9W1-0000hc-8o
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 14:35:34 +0000
From: Han Xu <han.xu@nxp.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: gpmi: get correct free oob space
Date: Fri, 29 Apr 2016 14:35:10 +0000
Message-ID: <DB5PR0401MB1845A3F3CF3B52E1257B344A97660@DB5PR0401MB1845.eurprd04.prod.outlook.com>
References: <1460498793-19431-1-git-send-email-han.xu@nxp.com>
 <20160413004351.40064fcd@bbrezillon>,<20160429103102.10ca50f7@bbrezillon>
In-Reply-To: <20160429103102.10ca50f7@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



________________________________________
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Sent: Friday, April 29, 2016 2:31 AM
To: Han Xu
Cc: richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com; linux=
-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpmi: get correct free oob space

Hi Han,

On Wed, 13 Apr 2016 00:43:51 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Han,
>
> On Tue, 12 Apr 2016 17:06:33 -0500
> Han Xu <han.xu@nxp.com> wrote:
>
> > change the way to calculate pagesize to get correct free oob space for
> > legacy_set_geometry function.
>
> Are you sure it's safe to expose free OOB bytes in this case? Do you
> know why it wasn't done before?

You did not answer this question. Do you want me to drop this patch. If
that's not the case, can you confirm it does not break platforms that
didn't have those free OOB bytes exposed before this change.

I think it's safe to expose the free OOB and also tested on my side, no
issue found.

Thanks,

Boris


--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
