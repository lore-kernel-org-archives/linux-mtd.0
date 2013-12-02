Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnZXY-0007T6-4g
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 19:52:21 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brain Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: RE: [PATCH v4 0/4] optimize and clean-up of OMAP NAND and ELM driver
Date: Mon, 2 Dec 2013 19:51:50 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA510F4@DBDE04.ent.ti.com>
References: <1385374141-10934-1-git-send-email-pekon@ti.com>
In-Reply-To: <1385374141-10934-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>Subject: [PATCH v4 0/4] optimize and clean-up of OMAP NAND and ELM driver
>
>
>*changes from v3* (feedbacks from Brian Norris <computersforpeace@gmail.co=
m>)
>[PATCH 2/4] reverted back macros used for clearing & masking gpmc_ecc_conf=
ig reg
>[PATCH 4/4]
>- updated: using 'pr_fmt(fmt)' to suffix DRIVER_NAME to error messages
>- removed: local 'eccsteps' in ELM driver, instead using nand_chip->ecc.st=
eps
>- cleanup: consitent use of DRIVER_NAME and removed irrelavant white-space=
 changes
>

[...]

>This patch affects following data-paths:
>[PATCH 1/4] nand_chip->ecc.correct(): Detects and corrects ECC errors on r=
ead accesses.
>[PATCH 2/4] nand_chip->ecc.calculate(): Calculates and fetches ECC syndrom=
e from controller.
>[PATCH 3/4] nand_chip->ecc.hwctl(): Configures H/W controller for Read/Wri=
te data acccesses.
>[PATCH 4/4] ELM driver: add checks and updates code for scalability.
>
>Pekon Gupta (4):
>  mtd: nand: omap: optimized chip->ecc.correct() for H/W ECC schemes
>  mtd: nand: omap: optimize chip->ecc.calculate() for H/W ECC schemes
>  mtd: nand: omap: optimize chip->ecc.hwctl() for H/W ECC schemes
>  mtd: devices: elm: add checks ELM H/W constrains, driver code cleanup
>

Just a ping..
Do you have any further updates on this series ?
If this is clean, I just want to rebase and send last pending series for=20
omap2.c driver.


with regards, pekon
