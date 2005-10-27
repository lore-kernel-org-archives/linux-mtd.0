Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EV2kP-0005Ew-J0
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2005 04:04:34 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.97.128])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 27 Oct 2005 08:04:06 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 7FFAB6700
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Oct 2005 10:03:06 +0200 (CEST)
Message-ID: <436089F3.806@gmail.com>
Date: Thu, 27 Oct 2005 10:04:03 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: NOR "bad blocks"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

just a thought...
Same as NAND, NOR flashes mostly have an endurance of guaranted 100K 
program/erase cycles.
If a block reaches this (theoretical) value, it should be recognized as 
bad block if erase fails; e.g. not conaining only 0xFF after erase on 
NAND. (I don't know if the "100K" erase cycle boundary is mostly 
responsible for this)
But obviously a block can wear out on NOR too after the max. number of 
erase cycles. (How) can this be recognized, handled?

-- 
Bernhard
