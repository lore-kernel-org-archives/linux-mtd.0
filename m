MIME-Version: 1.0
Date: Fri, 18 Jun 2010 13:33:29 +0800
Message-ID: <AANLkTimrYNN0JYnWw5peeuVYkiOF7Yz5Hn5oIBXdlg9m@mail.gmail.com>
Subject: [PATCH 0/25] update pxa3xx nand
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <david.woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series are used to upgrade NAND controller of PXA series.

1. Support multi chips.
2. Support new NAND controller in PXA series.
3. Support MLC NAND.
4. Support BCH ECC.
5. Optimize flash definition.
