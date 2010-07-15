Received: from webbox687.server-home.net ([195.149.74.151])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZLYJ-0001GT-Oc
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2010 10:20:28 +0000
Received: from comm.systec-electronic.de (178-25-112-77-dynip.superkabel.de
	[178.25.112.77])
	by webbox687.server-home.net (Postfix) with ESMTP id 5DD9877803D
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jul 2010 12:20:20 +0200 (CEST)
Received: from ws-stein.localnet (ws-stein.systec-electronic.de
	[192.168.10.93])
	by comm.systec-electronic.de (Postfix) with ESMTP id 082F297C068
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jul 2010 12:20:18 +0200 (CEST)
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: linux-mtd@lists.infradead.org
Subject: CFI for 2x 16 bit NOR-FLash on one chipselect?
Date: Thu, 15 Jul 2010 12:20:16 +0200
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201007151220.16650.alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

we are planning to use 2x 16bit NOR-Flash on one chipselect to use the 32bit 
bus. Now I'm wondering if this setup is supported by the CFI driver included 
in linux?

Best regards,
Alexander
