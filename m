Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192n4F-0000Bp-FL
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 07:58:51 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])h386wjLT022336
	for <linux-mtd@lists.infradead.org>; Tue, 8 Apr 2003 08:58:45 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id IAA20980
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Apr 2003 08:58:53 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3E92732C.90000@imc-berlin.de>
Date: Tue, 08 Apr 2003 08:58:52 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: unknown conversion type character `z'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I pulled the CVS yesterday, patched my linuxppc-2.4.20 and noticed 
loads of warnings like

nodemgmt.c: In function `jffs2_mark_node_obsolete':
nodemgmt.c:533: warning: unknown conversion type character `z' in format
nodemgmt.c:533: warning: too many arguments for format
nodemgmt.c:552: warning: unknown conversion type character `z' in format
nodemgmt.c:552: warning: too many arguments for format

when compiling it.

What does that mean????

I am using ppc_8xx-gcc version 2.95.4. (Could that be the problem?)

Thanks!

Steven
