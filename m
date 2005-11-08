Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZTgO-000232-GZ
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 08:38:43 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.115.173])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 8 Nov 2005 13:38:34 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 157386A26
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Nov 2005 14:37:30 +0100 (CET)
Message-ID: <4370AA55.6060703@gmail.com>
Date: Tue, 08 Nov 2005 14:38:29 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: How to produce dirty space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I want to generate some dirty space in a mounted JFFS2 for test 
purposes. I tried to get the FS dirty for hours now... but I couldn't 
compete against the erase_pending list. (BTW: how is kupdated set up?)
Maybe... I'm not the first one who wants to do some tests on a dirty FS, 
perhaps there is some existing code... :-)

Thanks,

-- 
Bernhard
