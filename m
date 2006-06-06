Received: from ctb-mesg5.saix.net ([196.25.240.75])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FnXyr-0007Tf-Uh
	for linux-mtd@lists.infradead.org; Tue, 06 Jun 2006 05:36:18 -0400
Received: from kreon-mail.kreon.co.za (dsl-145-133-06.telkomadsl.co.za
	[165.145.133.6])
	by ctb-mesg5.saix.net (Postfix) with ESMTP id BC40B70E0
	for <linux-mtd@lists.infradead.org>;
	Tue,  6 Jun 2006 11:36:10 +0200 (SAST)
Received: from [192.168.0.102] ([192.168.0.102])
	by kreon-mail.kreon.co.za (8.13.4/8.13.4/SuSE Linux 0.7) with ESMTP id
	k569dNhU005708
	for <linux-mtd@lists.infradead.org>; Tue, 6 Jun 2006 11:39:25 +0200
From: Kobus Wolvaardt <kobus@kreon.co.za>
To: linux-mtd@lists.infradead.org
Subject: Newbie question
Date: Tue, 6 Jun 2006 11:41:22 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606061141.23003.kobus@kreon.co.za>
Reply-To: kobus@kreon.co.za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to build grub for an embedded system. I'm working in gentoo and I 
have most of my stuff up and running. I use kernel 2.6.11, i've compiled mtd 
support and after lots of headaces (and then changing to a workind doc) I got 
the doc to recognize.

Not for the question.... I have Karim Yaghmour's book and I tried to follow 
the instructions to the letter. Problem is it doesnt compile: error below. (I 
can only think that it has something to do with a too new gcc version, any 
other idees) And more importantly how do I fix it or what newer version of 
the grub patch can I download (where, cvs?) and what version of grub can be 
patched with it?

Thanks a million,
Kobus




////////////////command and compile error
as  -DHAVE_CONFIG_H -I. -I. -I.. -I../stage1 -Wall -Wmissing-prototypes 
-Wunused -Wshadow -Wpointer-arith -malign-jumps=1 -malign-loops=1 
-malign-functions=1 -Wundef -g -c `test -f asm.S || echo './'`asm.S
as: unrecognized option `-HAVE_CONFIG_H'
/////////////////

-- 
This message was scanned for viruses by MailScanner and Sophos.
