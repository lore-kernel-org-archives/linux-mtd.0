Received: from law14-oe27.law14.hotmail.com ([64.4.20.84] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MqoW-0004Lx-IW
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 16:01:32 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 2 Jun 2003 20:32:16 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE27eYvUAA3qj0002e477@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: uclinux-dev@uclinux.org
Subject: do_map_probe function problem.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks

I get an error in do_map_probe function.

Code  never returns from this line

drv = get_mtd_chip_driver(name);
if (!drv && !request_module(name))
  drv = get_mtd_chip_driver(name);
 if (!drv)
  return NULL;
ret = drv->probe(map);

What could be going here. Where can I find the defninition of 
struct mtd_chip_driver

Vikram
