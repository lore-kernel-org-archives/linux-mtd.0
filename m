Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhFoi-0008So-Md
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 10:08:13 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: RE: [PATCH 3/3] nandtest: Introduce multiple reads & check iterations
Date: Mon, 5 May 2014 10:07:45 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?iso-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On
>
>The current nandtest performs a simple test which consists of:
>
>  1. erase block
>  2. write data
>  3. read and verify
>
>In order to improve the nandtest strength, this commit adds a new
>parameter
>to increase the number of "read and verify" iterations. In other
>words,
>the test now consists of:
>
>  1. erase block
>  2. write data
>  3. read and verify (N times)
>
>This seem to apply more pressure on a NAND driver's ECC engine and
>has been
>used to discover stability problems with an old OMAP2.
>
If you are just re-verifying "reads", then you may be testing unstable bits=
 [1],
which is not a valid driver's fault but a problem arising due to sudden pow=
er-cut.
If you really want to test driver then iterate all the steps (erase -> writ=
e -> read)
multiple times. Same as what is done in torture_peb() test.
	@@ drivers/mtd/ubi/io.c: torture_peb()

[1] http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

With regards, pekon
