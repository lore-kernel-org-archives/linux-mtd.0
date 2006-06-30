Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=inaccessnetworks.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwI9s-0002Bt-6R
	for linux-mtd@lists.infradead.org; Fri, 30 Jun 2006 08:31:51 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by inaccessnetworks.com (8.13.6/8.13.5) with ESMTP id k5UCVbvp009103
	for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2006 15:31:37 +0300
Received: from inaccessnetworks.com ([127.0.0.1])
	by localhost (host11.inaccessnetworks.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 08576-12 for <linux-mtd@lists.infradead.org>;
	Fri, 30 Jun 2006 15:31:37 +0300 (EEST)
Received: from priv.inaccessnetworks.com (orion.priv.inaccessnetworks.com
	[192.168.1.2])
	by inaccessnetworks.com (8.13.6/8.13.5) with ESMTP id k5UCVbLD009098
	for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2006 15:31:37 +0300
Received: from [192.168.1.3] (draco.priv.inaccessnetworks.com [192.168.1.3])
	by priv.inaccessnetworks.com (8.12.1/8.12.1) with ESMTP id
	k5UCVaBJ002760
	for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2006 15:31:36 +0300
Message-ID: <44A519A8.4030800@inaccessnetworks.com>
Date: Fri, 30 Jun 2006 15:31:36 +0300
From: Angelos Manousarides <amanous@inaccessnetworks.com>
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: MTD device with multiple regions & JFFS2
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a system with intel P30 flash chips, which have 2 erase regions. 
The system can have either 2 flash chips in one bank or 4 flash chips in 
2 banks. I am using mtdconcat to join the two devices and have unified 
access. I have a problem with the multiple erase sizes. The chips are of 
"top" type which means that the last sectors have a smaller block size 
than the others.

The code in mtdconcat does transfer the region info to the resulting 
device, I see a mtd device with 2 (or 4 regions). The partitioning code 
however does not. "numeraseregions" is 0 and "erasesize" is only used.

While I was trying to fix the code in mtdpart.c, I discovered that this 
is futile. The JFFS2 code does not seem to support this as well. Only 
the "erasesize" is used there also. Does that mean that I cannot have a 
JFFS2 filesystem that spans across multiple block size flash space?

--
Angelos Manousaridis
