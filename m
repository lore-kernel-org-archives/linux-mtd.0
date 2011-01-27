Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PiU8f-0003Q2-Po
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 15:52:03 +0000
Received: from [192.168.1.100]
	(173-11.172.145-houston.txt.hfc.comcastbusiness.net [173.11.172.145])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: dlambert)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id B21CC148A25
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Jan 2011 09:51:57 -0600 (CST)
Message-ID: <4D41949D.2030505@lambsys.com>
Date: Thu, 27 Jan 2011 09:51:57 -0600
From: David Lambert <dave@lambsys.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Verify-after-write on sub-pages
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working on a project that requires high reliability of logged data 
which is written to a UBI file system on NAND. I have observed one 
hardware failure mode at elevated temperatures where some chips report 
that a write was successful even though a subsequent read indicates that 
this was not true. To mitigate this I enabled 
CONFIG_MTD_NAND_VERIFY_WRITE. Unfortunately I found this does not work 
on sub-pages which are used by UBI. As a workaround I have forced UBI 
not to use sub-pages, but I was curious if either there were plans to 
add this feature, or if anyone was working on implementing it?

Regards,

Dave.
