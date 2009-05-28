Received: from gw-yyz1.somanetworks.com ([216.126.67.39]
	helo=zimbra.somanetworks.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9lXF-0007UU-FR
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 19:45:14 +0000
Received: from localhost (localhost [127.0.0.1])
	by zimbra.somanetworks.com (Postfix) with ESMTP id 566806B0004
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 May 2009 15:44:58 -0400 (EDT)
Received: from zimbra.somanetworks.com ([127.0.0.1])
	by localhost (zimbra.somanetworks.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Y2jWWLVKKJzq for <linux-mtd@lists.infradead.org>;
	Thu, 28 May 2009 15:44:58 -0400 (EDT)
Received: from [10.11.11.50] (odo.yyz.somanetworks.com [10.11.11.50])
	by zimbra.somanetworks.com (Postfix) with ESMTP id 406F16B0001
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 May 2009 15:44:58 -0400 (EDT)
Message-ID: <4A1EE9B9.1060508@somanetworks.com>
Date: Thu, 28 May 2009 15:44:57 -0400
From: Ben Gamsa <ben@somanetworks.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: synchronizing accesses with nand_base
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've inherited some code that implements the chip interface for our 
board, and also implements *user_prot* interfaces for OTP access.  We 
ran into some problems that seem to be due to the fact that the OTP 
accesses can collide with regular filesystem accesses.  I noticed that 
the nand_base.c code uses a nand_get_device/nand_release_device for 
synchronization, but those routines appear to be private to that file. 
What is the proper way to add device-specific routines for OTP access 
while following proper synchronization procedures.

Thanks for any help.

	ben

-- 
Ben Gamsa       ben@somanetworks.com
SOMA Networks   312 Adelaide St. W. Suite 600 Toronto, Ontario, M5V1R2
