Received: from www.sohosted5.com ([193.138.249.49] helo=server5.sohosted.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiUSf-0003xy-76
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 06:22:26 -0500
From: Stefan Roese <ml@stefan-roese.de>
To: MTD mail list <linux-mtd@lists.infradead.org>
Subject: Access functions in ndfc.c
Date: Fri, 10 Nov 2006 12:22:22 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200611101222.23443.ml@stefan-roese.de>
Cc: Josh Boyer <jwboyer@gmail.com>, Frank Haverkamp <haver@vnet.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Another remark: I think we should switch from the __raw_read/_write
access functions to out_/in_be32 functions. As I understand this
is the common way to access CPU internal memory mapped registers.

Any comments on this? If nobody objects I will prepare another path for this.

Best regards,
Stefan
