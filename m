Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CodM5-0005s9-HE
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 02:55:50 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 0C1DB2F016
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 08:55:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 011CB11675
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 08:55:48 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 569767A1E
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 08:55:47 +0100 (CET)
Message-ID: <41E4D801.2000502@imc-berlin.de>
Date: Wed, 12 Jan 2005 08:55:45 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2: disabling GC?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

what would be the impact if I disabled the GC thread on my embedded system?

I use an JFFS2 partition as root fs. But usually only write to it on firmware 
update...

Thanks!

-- 
Steven Scholz
imc Measurement & Control
