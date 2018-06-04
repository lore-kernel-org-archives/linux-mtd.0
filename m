From: Lionel Debieve <lionel.debieve@st.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy
 <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 <linux-mtd@lists.infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>, Lee Jones <lee.jones@linaro.org>,
 <tglx@linutronix.de>, <haver@linux.vnet.ibm.com>,
 <u.kleine-koenig@pengutronix.de>, <joel@clambassador.com>,
 <schwarzerf@gmail.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 <paulmck@linux.vnet.ibm.com>
Subject: [Resend PATCH 1/1] mtd: ubi: Update ubi-media.h to dual license
Date: Mon, 4 Jun 2018 15:21:37 +0200
Message-ID: <20180604132137.32136-2-lionel.debieve@st.com>
In-Reply-To: <20180604132137.32136-1-lionel.debieve@st.com>
References: <20180604132137.32136-1-lionel.debieve@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update license template using SPDX. Move the global layout
of UBI headers to dual license helping UBI to be the standard
solution for raw NAND management.

Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Artem Bityutskiy <dedekind1@gmail.com>
Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/ubi-media.h | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index bfceae5a890e..195ff8ca8211 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -1,28 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
 /*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
- *
+ * Copyright (C) International Business Machines Corp., 2006
  * Authors: Artem Bityutskiy (Битюцкий Артём)
  *          Thomas Gleixner
  *          Frank Haverkamp
  *          Oliver Lohmann
  *          Andreas Arnez
- */
-
-/*
+ *
  * This file defines the layout of UBI headers and all the other UBI on-flash
  * data structures.
  */
-- 
2.15.1
