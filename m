Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D5ljn-0007MX-Ny
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2005 09:19:08 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 7FAF82F017
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2005 15:19:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 74EF9117CB
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2005 15:19:03 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id A86FD11700
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2005 15:19:02 +0100 (CET)
Message-ID: <42232855.3020408@imc-berlin.de>
Date: Mon, 28 Feb 2005 15:19:01 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: SUMMARY for JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

IIUC then the SUMMARY stuff goes into JFFS3.
But are there any plans to officially include it into the JFFS2 code?

It's quite cumbersome to update MTD CVS and then merge the patch 
http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050211.patch by hand.

Since its a compile time option is there anything speaking against such inclusion?

Thanks!

-- 
Steven
