Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EXhrO-0005rp-Rd
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2005 11:22:46 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.109.34])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 3 Nov 2005 16:22:36 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 997E0689F
	for <linux-mtd@lists.infradead.org>;
	Thu,  3 Nov 2005 17:21:34 +0100 (CET)
Message-ID: <436A3949.1000001@gmail.com>
Date: Thu, 03 Nov 2005 17:22:33 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: GC operation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

a question just for better understanding of JFFS2...

When and how is GC called?
jffs2_garbage_collect_pass() is called from GC thread AND after each 
writing to flash. But does a single call of jffs2_garbage_collect_pass() 
(or jffs2_garbage_collect_trigger() or SIGHUP) proceed only one node at 
a time?  For each node / for each block / ..... some loop?

Ah, another one: Are blocks on the erase_pending_list erased beside the 
GC cycles?

Hm, sorry for the annoying questions, but garbage collection can be an 
ugly and confusing thing if one is not used to it :-) Thanks for your 
assistance!

-- 
Bernhard
