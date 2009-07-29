Received: from mx7.zte.com.cn ([202.103.147.169])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MW8hA-0004kN-0B
	for linux-mtd@lists.infradead.org; Wed, 29 Jul 2009 12:55:53 +0000
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse2.zte.com.cn with ESMTP id n6T9WagN026036
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jul 2009 17:32:46 +0800 (CST)
	(envelope-from liu.yaojin@zte.com.cn)
To: linux-mtd@lists.infradead.org
Subject: what cause :**>> yaffs chunk 38598 was not erased
MIME-Version: 1.0
Message-ID: <OF66F0CAAE.606F758E-ON48257602.0033C66C-48257602.00347335@zte.com.cn>
From: liu.yaojin@zte.com.cn
Date: Wed, 29 Jul 2009 17:30:50 +0800
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi guys:
 
i use lastest yaffs filesystem,kernel is 2.6.24.
my nand flash controller is a little slow.and when i copy(or ls) 
files(more than 1MB?),the console appears:

**>> yaffs chunk 38598 was not erased
**>> yaffs write required 2 attempts
page 38598 in gc has no object: 0 0 0

and etc...
so why this happens continually ?



--------------------------------------------------------
ZTE Information Security Notice: The information contained in this mail is solely property of the sender's organization. This mail communication is confidential. Recipients named above are obligated to maintain secrecy and are not permitted to disclose the contents of this communication to others.
This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the originator of the message. Any views expressed in this message are those of the individual sender.
This message has been scanned for viruses and Spam by ZTE Anti-Spam system.
