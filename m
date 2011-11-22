Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSy6i-0008Bc-OH
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 21:42:25 +0000
Received: by ywa12 with SMTP id 12so799055ywa.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 13:42:23 -0800 (PST)
Subject: Re: [PATCH] mtd: ndfc: fix typo in structure dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tony Breeds <tony@bakeyournoodle.com>, David Woodhouse
 <dwmw2@infradead.org>
Date: Tue, 22 Nov 2011 23:42:14 +0200
In-Reply-To: <20111122043904.GA22504@thor.bakeyournoodle.com>
References: <20111122043904.GA22504@thor.bakeyournoodle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321998141.2222.21.camel@koala>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-22 at 15:39 +1100, Tony Breeds wrote:
> In commit 9d7948c50055e74b693ce9e99a709b2e5bbc1942 (mtd: ndfc: use
> ofpart through generic parsing) we dereference a non pointer type
> causing the following compiler error:
> drivers/mtd/nand/ndfc.c: In function 'ndfc_chip_init':
> drivers/mtd/nand/ndfc.c:191: error: invalid type argument of '->' (have 'struct mtd_part_parser_data')
> 
> Fix that.
> 
> Signed-off-by: Tony Breeds <tony@bakeyournoodle.com>

Pushed to l2-mtd-2.6.git, thanks.

This has to be sent to Linus this release cycle.

Artem.
