Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 188e13-0005ej-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 09:59:29 +0000
Message-ID: <000f01c283ec$cf3a7330$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <linux-mtd@lists.infradead.org>
Subject: how to handle the invalid block of the NAND flash?
Date: Mon, 4 Nov 2002 18:27:43 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi! all,
    I know that the NAND flash memory is not guaranteed to be good in all
block. Has the MTD/NAND driver handle this condition? If not, how to
implement this?

Thanks.
Paul
