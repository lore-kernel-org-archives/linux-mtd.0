Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CQCw7-0005hH-FA
	for linux-mtd@lists.infradead.org; Fri, 05 Nov 2004 17:52:04 -0500
Received: from [192.168.2.59] (mail.smartlink.ee [213.180.16.242])
	(authenticated bits=0)
	by kiire.colleduc.ee (8.12.11/8.12.10) with ESMTP id iA5MnuXh015429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sat, 6 Nov 2004 00:49:56 +0200
Message-ID: <418C0409.7020706@colleduc.ee>
Date: Sat, 06 Nov 2004 00:51:53 +0200
From: Kalev Lember <kalev@colleduc.ee>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: INFTL and NFTL oopses
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have just committed changes to the MTD CVS repository that fix kernel 
NULL pointer dereference at mtd_erase_callback+6 when trying to insmod 
INFTL or NFTL modules.
Anyone suffering from these problems should check if the latest CVS 
fixes them.

-- 
Best regards,
Kalev Lember
