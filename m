Received: from mail1.asianet.co.th ([203.144.222.229] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxHFF-0004Nn-6k
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2004 23:36:17 -0400
Received: from virscan1.asianet.co.th (HELO mail.asianet.co.th)
	([203.144.222.197]) (envelope-sender <jay4mail@yahoo.com>)
	by mail1.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 18 Aug 2004 10:36:05 +0700
Received: from ppp-210.86.146.194.revip.asianet.co.th (HELO [10.1.1.33])
	([210.86.146.194]) (envelope-sender <jay4mail@yahoo.com>)
	by mx3.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 18 Aug 2004 10:36:04 +0700
Message-ID: <4122D157.7070702@yahoo.com>
Date: Wed, 18 Aug 2004 10:47:35 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: amd_flash.c not compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I tried to use mtd 20040816 snapshot with linux 2.6.8.1 but there was a 
compile errors in amd_flash.c. The latest version I can get it working 
is 20040707. I read the cvs archive and saw that there was changes in 
map.h that broke all the devices. Is there anybody already working on 
this same file or get it working with the latest snapshot? Anyway, I'll 
try to fix it.

Best regards,
Jay
