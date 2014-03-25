Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSLRQ-0007wm-Fk
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 07:06:33 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return
 detected bit-flips in erased-page
Date: Tue, 25 Mar 2014 07:05:58 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB5659@DBDE04.ent.ti.com>
References: <1395730699-14687-1-git-send-email-pekon@ti.com>
In-Reply-To: <1395730699-14687-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,


>
>fixes: commit 62116e5171e00f85a8d53f76e45b84423c89ff34
>       mtd: nand: omap2: Support for hardware BCH error correction.
>
>In omap_elm_correct_data(), if bitflip_count in an erased-page is within t=
he
>correctable limit (< ecc.strength), then it is not indicated back to the c=
aller
>ecc->read_page().
>This mis-guides upper layers like MTD and UBIFS layer to assume erased-pag=
e as
>perfectly clean and use it for writing even if actual bitflip_count was
>dangerously high (bitflip_count > mtd->bitflip_threshold).
>
>This patch fixes this above issue, by returning 'stats' to caller
>ecc->read_page() under all scenarios.
>
>Reported-by: Brian Norris <computersforpeace@gmail.com>
>Signed-off-by: Pekon Gupta <pekon@ti.com>
>---
I you think this qualifies for stable then please mark it for
CC: <stable@vger.kernel.org> # 3.9.x+


with regards, pekon
