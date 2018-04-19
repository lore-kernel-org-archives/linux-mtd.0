From: Lionel Debieve <lionel.debieve@st.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy
 <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 <linux-mtd@lists.infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>, Lee Jones <lee.jones@linaro.org>,
 <tglx@linutronix.de>, <haver@linux.vnet.ibm.com>,
 <u.kleine-koenig@pengutronix.de>, <joel@clambassador.com>,
 <schwarzerf@gmail.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: [Resend PATCH 0/1] mtd: ubi: Update ubi-media.h to dual license
Date: Thu, 19 Apr 2018 10:13:22 +0200
Message-ID: <20180419081323.16597-1-lionel.debieve@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As expected, resend the patch about license change.

Following previous mail about the dual license update for ubi-media.h file
(ie http://lists.infradead.org/pipermail/linux-mtd/2018-January/078878.html),
this is the corresponding patch about the requested change.

Lionel Debieve (1):
  Update license template using SPDX. Move the global layout of UBI
    headers to dual license helping UBI to be the standard solution for
    raw NAND management.

 drivers/mtd/ubi/ubi-media.h | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

-- 
2.15.1
