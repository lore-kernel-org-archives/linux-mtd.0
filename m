Received: from mtxmxout1.matrox.com ([138.11.2.91])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TSw6f-0004DN-51
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2012 20:38:45 +0000
Received: from venus.matrox.com (venus.matrox.com [192.168.1.30])
 by mtxmxout1.matrox.com (Postfix) with ESMTP id AE38F45BD21
 for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2012 16:38:42 -0400 (EDT)
Received: (from ssmsp@localhost)
 by venus.matrox.com (8.14.4/8.13.2) id q9TKcgE5003437
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2012 16:38:42 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by venus.matrox.com (Postfix) with ESMTP id 6AB8FF4DB6
 for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2012 16:38:42 -0400 (EDT)
Received: from pluton.matrox.com (pluton.matrox.com [192.168.8.7])
 by venus.matrox.com (Postfix) with ESMTP id 4FE5CF4DB5
 for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2012 16:38:42 -0400 (EDT)
Received: from harvey-pc.matrox.com (dyn-152-224.matrox.com [192.168.152.224])
 by pluton.matrox.com (Postfix) with ESMTP id 3B00C7F45F
 for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2012 16:38:42 -0400 (EDT)
Date: Mon, 29 Oct 2012 16:42:27 -0400
From: Christopher Harvey <charvey@matrox.com>
To: linux-mtd@lists.infradead.org
Subject: state of support for "external ECC hardware"
Message-ID: <20121029204227.GA32300@harvey-pc.matrox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I know of at least one Micron NAND chip that has the ability to handle
ECC completely on the NAND chip itself. All the host has to do is send
data and the OOB section is updated automatically. The automatic ECC
hardware can be enabled and disabled with the "Set Feature" command,
(0xEF) and bit flips are reported via get status after page reads. I
don't see support for this in 2.6.37, and a quick check in the logs
doesn't show anything new for these chips in the latest version of the
kernel. Any idea floating around on this list? Are these chips going
to be the future for NAND and does Linux care about them?

thanks,
Chris
