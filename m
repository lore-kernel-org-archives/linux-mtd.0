Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14fJkt-0004gm-00
	for mtd-list@infradead.org; Tue, 20 Mar 2001 10:52:47 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14fJkq-0004gg-00
	for mtd@infradead.org; Tue, 20 Mar 2001 10:52:45 +0000
Message-ID: <01C0B134.4E617740@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: JEDEC emulated by CFI code
Date: Tue, 20 Mar 2001 11:52:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have moved support of jedec flash into cfi_probe.c and cfi_cmdset0002.c.
cfi_probe() now probes for CFI flash first, and then for JEDEC. The table
with JEDEC information is available in cfi_jedec.c. It can easily be expanded
by adding new devices together with the erase region information. This table
is used to fill out the cfiq structure. cfi_cmdset0002.c has been modified to
support CFI as well as JEDEC flash (unlock adress, flag for fast program support).
The table has been taken from Jonas Holmberg's amd flash support, I have
only appended two new entries for the rather exotic AT49BV16X4  chips, with
three erase regions. Thanks a lot to Jonas for testing the code with 16MB CFI
and non-CFI flash. The code should work with 2.0 kernels (uClinux).
This implementation doesn't completely replace the AMD support from Jonas,
because his code is able to use chips of multiple manufacturers in the same bank.
Timing information should be added to the table in cfi_jedec.c too.

-Erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
