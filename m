Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13o987-00012U-00
	for mtd-list@infradead.org; Tue, 24 Oct 2000 19:48:59 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13o986-00012O-00
	for mtd@infradead.org; Tue, 24 Oct 2000 19:48:58 +0100
Message-ID: <39F5DBF8.48F91EDE@cotw.com>
Date: Tue, 24 Oct 2000 13:59:04 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: "Bradley D. LaRonde" <brad@ltc.com>
CC: mtd@infradead.org
Subject: Re: Proper way of setting MTD_DEBUG
References: <E13nksk-0002RR-00@infradead.org> <18079.972375290@redhat.com> <39F5767A.48E1A44C@cotw.com> <00c101c03dd7$1775e840$0701010a@ltc.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

"Bradley D. LaRonde" wrote:
> 
> What is the proper way of setting MTD_DEBUG?
> 
I re-wrote the debugging such that it is now a configuration
option in the MTD sub-system menu where you choose the level
of verbosity. There a four levels which are defined in the
'include/linux/mtd/mtd.h' that you can use to define the
severity/verbosity of a debug statement.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
