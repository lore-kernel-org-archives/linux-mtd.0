Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxfXc-0005P5-RD
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 13:04:33 +0000
Received: by bwz1 with SMTP id 1so1969937bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 05:04:30 -0800 (PST)
Subject: Re: [RFC PATCH] mtd: mxc_nand: fix OOB corruption when page size > 2k
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <c3d5dae673b532b4a4dbdb8edc6626aa49d7a626.1299679613.git.baruch@tkos.co.il>
References: <c3d5dae673b532b4a4dbdb8edc6626aa49d7a626.1299679613.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Mar 2011 15:02:59 +0200
Message-ID: <1299762179.6676.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-09 at 16:12 +0200, Baruch Siach wrote:
> When page size is 4k, ecc.total is set to 8*9, and this causes
> nand_write_page_hwecc() to read past the initialized part of the eccpos array,
> which corrupts chip->oob_poi with bogus values from ecc_calc.
> 
> Fix this by creating a proper nand_ecclayout for 4k flashes.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
