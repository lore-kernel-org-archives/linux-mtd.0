Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OD85w-0005t6-8I
	for linux-mtd@lists.infradead.org; Sat, 15 May 2010 03:31:21 +0000
Received: from [192.168.1.100]
	(173-11.172.145-houston.txt.hfc.comcastbusiness.net [173.11.172.145])
	by mail.breakawaysystems.com (Postfix) with ESMTP id 6FCCA1488B3
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 May 2010 22:31:14 -0500 (CDT)
Message-ID: <4BEE1582.40706@lambsys.com>
Date: Fri, 14 May 2010 22:31:14 -0500
From: David Lambert <dave@lambsys.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: 2GB file size limit?
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there any way to increase the file size limit on UBIFS beyond 
2Gbytes? I have tried enabling the kernel ‘Support for large block 
devices and files’ under ‘Enable the block layer’, but the 2G limit 
persists.

Regards,

Dave.
