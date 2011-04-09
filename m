Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8bM1-0006jo-Gx
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2011 16:49:46 +0000
Received: by wyb28 with SMTP id 28so4724967wyb.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Apr 2011 09:49:43 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 9 Apr 2011 22:19:42 +0530
Message-ID: <BANLkTik+nBf4TJ3BrxQuRa_sLr-8W2wdTw@mail.gmail.com>
Subject: Does NOR chip drivers support PPB protection
From: RAGHAVENDRA V K <vk.raghavendra@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does cfi_cmdset_0002.c support persistent protection? There are few
chips that support this protection scheme where a device reset is
needed to unlock locked sectors.

RAGHAVENDRA.V.K.
