Received: from mindseal.comm2000.it ([194.133.0.6] helo=relay.comm2000.it)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DNtm-0007sh-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 11:10:46 +0100
Received: from Athlon ([212.97.52.190])
	by relay.comm2000.it (8.11.2/MFAGMM-19990726) with SMTP id f5MAB8a16866
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 12:11:08 +0200
Message-ID: <001601c0fb03$b2e9bbf0$230d0dc3@Athlon>
From: "Paolo Marini" <paolom@prisma-eng.it>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2: endian problem ?
Date: Fri, 22 Jun 2001 12:11:26 +0200
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

Hi all,
I am trying to have a working JFFS2 on an RPX-CLLF card (Motorola 860, big
endian).

It happens that every time I mount the jfss2, the flash gets formatted. I
dumped the flash block, and the bytes seem to be in the wrong order (e.g.
magic number and nodetype swapped, and also magic number with the two bytes
swapped). I tested it against a jffs2 image build for big endian with
mkfs.jffs2, and the order of bytes is reversed. Reading a flash block
containing e.g. card FW is ok. I am using the latest mtd on a 2.4.2 kernel.

Anyone can help me ?

Thanks a lot

Paolo Marini
