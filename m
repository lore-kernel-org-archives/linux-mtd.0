Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19585d-00064i-Pl
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 18:49:57 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])h3EHnqLT028310
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 19:49:53 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id TAA16295
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Apr 2003 19:50:02 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3E9AF4CA.9040807@imc-berlin.de>
Date: Mon, 14 Apr 2003 19:50:02 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mkfs.jffs2 and hard links
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

are you guys working on full hard link support for mkfs.jffs2?

The man page states

"mkfs.jffs2 does not properly  handle  hard  links  in  the input 
directory  structure.  Currently, hard linked files will be expanded 
to multiple identical files in the output image."

Is that going to change?


Thanks,

Steven
