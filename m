Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14O0Yd-0000xo-00
	for mtd-list@infradead.org; Wed, 31 Jan 2001 16:56:35 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14O0YQ-0000xi-00
	for mtd@infradead.org; Wed, 31 Jan 2001 16:56:27 +0000
Message-ID: <01C08BAD.E72468E0@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: modified patch script
Date: Wed, 31 Jan 2001 17:47:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have just commited the modified patch script, together with a patchfile for 2.2.17

Assuming your kernel is in ~/kernel, the script can be invoked from the patch directory:

	sh patchin.sh ~/kernel mtd-2.2.17.patch

This will create the symlinks, and apply the patch. The links can be recreated anytime
with

	sh patchin.sh ~/kernel 

I'll create the patches for uClinux (2.0.38 kernel) in the next days.

-Erwin




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
