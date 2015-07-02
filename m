Received: from 206-248-167-68.dsl.teksavvy.com ([206.248.167.68]
 helo=mail.isoar.ca)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAk3p-0002hp-Mo
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2015 19:22:14 +0000
Received: from localhost ([127.0.0.1])
 by mail.isoar.ca with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
 (Exim 4.80.1 #2) id 1ZAk3R-0005xz-AX
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2015 15:21:49 -0400
Message-ID: <55958F4C.1020002@isoar.ca>
Date: Thu, 02 Jul 2015 15:21:48 -0400
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Hang on reboot in nand_get_device()
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm experiencing a hang on reboot with a Freescale P1022 PowerPC system, with a
dual chip-select NAND part (specified in the device tree as two separate 
devices), and kernel v4.0.6.

It appears to be a hang in mtd/nand/nand_base.c:nand_get_device() waiting on
chip->controller->active.

Shouldn't nand_shutdown(), or perhaps a special case in nand_get_device() for
FL_SHUTDOWN, set chip->controller->active = NULL before returning?

This seems to fix the problem for me, but I don't know all the code well enough
to know whether doing so is appropriate, or sufficient.

~~Andrew E. Mileski
