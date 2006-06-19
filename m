Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsJi3-0008F8-Ky
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 09:22:38 -0400
Received: from [192.168.0.3] (telperion.ee.elatec.si [192.168.0.3])
	by lorien.ee.elatec.si (8.12.11.20060308/8.12.11) with ESMTP id
	k5JCKia5020459
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 14:20:44 +0200
Message-ID: <4496A162.5080305@epico.si>
Date: Mon, 19 Jun 2006 15:06:42 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND problems with at91 kernels
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'am running kernel 2.6.17 on AT91RM9200 board with Samsung 32MiB NAND.
I've been experiencing a lot of NAND flash errors (running JFFS2 or 
YAFFS)  which
traced down to busy delay handling. Asking on linux-arm-kernel list I've 
got a link to
this message thread:

http://lists.infradead.org/pipermail/linux-mtd/2005-September/013625.html

I've patched nand_base:nand_read_oob with the patch attached to the 
above mail and
it seems to solve my problems - I'am going to run some test for the next 
couple of days
just to be shure.

Is there any reason why this patch was not accepted and more importantly 
can I expect
more delay related problems which apperantly show only on some platforms.

Thanks,

savin
