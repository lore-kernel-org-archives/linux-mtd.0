Received: from sproxy.gmx.de ([213.165.64.20] helo=mail.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 186rGz-0000Ry-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 11:44:33 +0000
Message-ID: <005b01c27e7e$cff78740$b910340a@datus.com>
From: "Holger Speck" <hospe@gmx.de>
To: <linux-mtd@lists.infradead.org>
Subject: cfi_cmdset_0002.c: Timeout for writing
Date: Mon, 28 Oct 2002 13:37:43 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello,

Is this correct?

Line 511 in cfi_cmdset_0002.c, function do_write_oneword:
<  timeo = jiffies + (HZ/1000); /* setting timeout to 1ms for now */

Timeo is set to jiffies because HZ/1000 = 0. This don't work in our
integration.
We use MTD in a non-linux environment. jiffies are emulated (10 ms)
Nevertheless I think, it's not correct?

Greetings,
Holger
