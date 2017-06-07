Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIZWu-0004S2-5O
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 11:53:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v5 02/23] mtd: nand: add a shorthand to generate nand_ecc_caps
 structure
Date: Wed,  7 Jun 2017 20:52:11 +0900
Message-Id: <1496836352-8016-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct nand_ecc_caps was designed as flexible as possible to support
multiple stepsizes (like sunxi_nand.c).

So, we need to write multiple arrays even for the simplest case.
I guess many controllers support a single stepsize, so here is a
shorthand macro for the case.

It allows to describe like ...

NAND_ECC_CAPS_SINGLE(denali_pci_ecc_caps, denali_calc_ecc_bytes, 512, 8, 15);

... instead of

static const int denali_pci_ecc_strengths[] = {8, 15};
static const struct nand_ecc_step_info denali_pci_ecc_stepinfo = {
        .stepsize = 512,
        .strengths = denali_pci_ecc_strengths,
        .nstrengths = ARRAY_SIZE(denali_pci_ecc_strengths),
};
static const struct nand_ecc_caps denali_pci_ecc_caps = {
        .stepinfos = &denali_pci_ecc_stepinfo,
        .nstepinfos = 1,
        .calc_ecc_bytes = denali_calc_ecc_bytes,
};

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v5:
  - Newly added

Changes in v4: None
Changes in v3: None
Changes in v2: None

 include/linux/mtd/nand.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c28a5792eed6..c08954a39657 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -500,6 +500,20 @@ struct nand_ecc_caps {
 	int (*calc_ecc_bytes)(int step_size, int strength);
 };
 
+/* a shorthand to generate struct nand_ecc_caps with only one ECC stepsize */
+#define NAND_ECC_CAPS_SINGLE(__name, __calc, __step, ...)	\
+static const int __name##_strengths[] = { __VA_ARGS__ };	\
+static const struct nand_ecc_step_info __name##_stepinfo = {	\
+	.stepsize = __step,					\
+	.strengths = __name##_strengths,			\
+	.nstrengths = ARRAY_SIZE(__name##_strengths),		\
+};								\
+static const struct nand_ecc_caps __name = {			\
+	.stepinfos = &__name##_stepinfo,			\
+	.nstepinfos = 1,					\
+	.calc_ecc_bytes = __calc,				\
+}
+
 /**
  * struct nand_ecc_ctrl - Control structure for ECC
  * @mode:	ECC mode
-- 
2.7.4
