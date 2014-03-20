Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQcvz-0000lU-Eg
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 13:22:59 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v9 3/5] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page detection for BCHx_HW ECC schemes
Date: Thu, 20 Mar 2014 13:22:26 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB4AAD@DBDE04.ent.ti.com>
References: <1395149206-23713-1-git-send-email-pekon@ti.com>
 <1395149206-23713-4-git-send-email-pekon@ti.com>
 <20140320092746.GH31517@norris-Latitude-E6410>
In-Reply-To: <20140320092746.GH31517@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Artem
 Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
[...]

>I see we update 'stat', but in the case that this is a correctable
>erased page, don't we just ignore it? i.e., you'll hit this case below
>(not shown here):
>
>	/* Check if any error reported */
>	if (!is_error_reported)
>		return 0;
>
>Perhaps this should be changed to:
>
>	if (!is_error_reported)
>		return stat;
>
>?
>
Thanks much. nice catch. I missed this scenario. I have just sent a fix for=
 this.

[PATCH] mtd: nand: omap: ecc.correct: omap_elm_correct_data: return number =
of bit-flips detected in erased-page

with regards, pekon
