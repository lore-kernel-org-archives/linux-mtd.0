Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxKCr-0004VC-4n
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2011 14:17:41 +0000
Received: by wwc33 with SMTP id 33so446628wwc.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Mar 2011 06:17:39 -0800 (PST)
Subject: Re: [RFC PATCH] mtd: mxc_nand: fix OOB corruption when page size > 2k
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <c3d5dae673b532b4a4dbdb8edc6626aa49d7a626.1299679613.git.baruch@tkos.co.il>
References: <c3d5dae673b532b4a4dbdb8edc6626aa49d7a626.1299679613.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Mar 2011 16:16:11 +0200
Message-ID: <1299680171.2741.16.camel@localhost>
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
>  	if (mtd->writesize == 2048)
>  		this->ecc.layout = oob_largepage;
> +	if (nfc_is_v21() && mtd->writesize == 4096)
> +		this->ecc.layout = &nandv2_hw_eccoob_4k;

Nitpick, but this could be "else if".

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
