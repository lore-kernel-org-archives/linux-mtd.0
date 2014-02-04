Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAeKG-0004yG-Br
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2014 11:38:00 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: RE: [PATCH v7 0/6] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
Date: Tue, 4 Feb 2014 11:37:28 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6DAA5@DBDE04.ent.ti.com>
References: <1389942797-4632-1-git-send-email-pekon@ti.com>
In-Reply-To: <1389942797-4632-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 "Balbi, Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Gupta, Pekon
>*changes v6 -> v7*
>[PATCH 1/6] <no change>
>[PATCH 2/6] <no change>
>[PATCH 3/6] <dropped older version, refer commit message>
> - erased-page detection done based on count of zero-bits in OOB & DATA
> - incorporated some feedbacks from Brian Norris <computersforpeace@gmail.=
com>
>	http://lists.infradead.org/pipermail/linux-mtd/2014-January/051533.html
>	http://lists.infradead.org/pipermail/linux-mtd/2014-January/051534.html
>[PATCH 4/6] <new> remove redundant bit-flip counting for erased-page
>[PATCH 5/6] <minor cleanup>
>[PATCH 6/6] <minor cleanup>
>
Request you to please review this one, as it would keep me going for other
Clean-ups and optimizations on top of this series.

with regards, pekon
