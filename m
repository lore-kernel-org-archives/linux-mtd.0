Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CodHY-0005hw-L2
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 02:51:09 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 35BB12F016
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 08:51:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 2825B11675
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 08:51:04 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 7C6E57A1E
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 08:51:03 +0100 (CET)
Message-ID: <41E4D6E5.1090407@imc-berlin.de>
Date: Wed, 12 Jan 2005 08:51:01 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

IIUC than mounting a JFFS2 root fs takes so long (6 seconds on my embedded ARM9) 
cause the CRCs of all blocks/sectors are checked.

But then it looks to me that - shortly after boot - the GC thread doing the same 
again (in background.c), which takes another 6 scondes and slows down the 
application startup...

Or am I missing something?

-- 
Steven Scholz

imc Measurement & Control
