Received: from smtprelay01.ispgateway.de ([80.67.18.13])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E76xq-0003e4-CU
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 03:43:28 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.110.185])
	(envelope-sender <bernhard@prie.de>)
	by smtprelay01.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 22 Aug 2005 07:43:20 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 08BBCF4F
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2005 09:42:42 +0200 (CEST)
Message-ID: <43098213.1020807@prie.de>
Date: Mon, 22 Aug 2005 09:43:15 +0200
From: Bernhard Priewasser <bernhard@prie.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Testing JFFS2 using mtdram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good morning,

I'm going to run some performance and stability testing on JFFS2. Using 
mtdram makes basic testing issues very comfortable. My question is how 
far mtdram can substitute a "real" flash (not for absolute measurement 
of course, only comparisons)?
Am I right with my first approach:
  read operations - yes
  write operations - no?

Regards,
Bernhard Priewasser
