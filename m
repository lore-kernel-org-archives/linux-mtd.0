Received: from mail.gdatech.co.in ([202.144.30.226] helo=gdatech.co.in)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkiH8-0002oV-FK
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 09:31:42 -0500
Received: from [192.168.0.2] (localhost.localdomain [127.0.0.1])
	by predator.gdatech.co.in (Postfix-out) with ESMTP id 58C81878115
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Nov 2006 06:31:11 -0800 (PST)
Received: from gdatech.co.in ([192.168.0.3])
	by [127.0.0.1] ([127.0.0.1]) (port 7027) (Abaca EPG outproxy filter
	1.3.4.5154-maint13 $Rev: 5154 $) id r6bg063111-00-2
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 06:31:11 -0800
Received: from mail.gdatech.co.in (unknown [192.168.0.1])
	by predator.gdatech.co.in (Postfix-out) with ESMTP id 26E68878113
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Nov 2006 06:31:11 -0800 (PST)
Message-ID: <455C7650.2000705@gdatech.co.in>
Date: Thu, 16 Nov 2006 20:01:44 +0530
From: "s.balamurugan" <s.balamurugan@gdatech.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problem with copying more than 2kb file into the flash
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

Hello all,

I am using Samsung 256mb nand flash.
page size : 2kb
block size:128kb

I have the following prolbem:

I have a situation here where I mount JFFS2 on top of my NAND device and
certain files will fail to copy over.  Small text files are fine.  The
problem is with large binary files.  I copy to my mounted dir and ls -l
shows the file is entirely there.  

Upon remounting, the file is lost or showing a size of 0.  Upon scanning the
flash at mount I will always get "jffs2_get_inode_nodes(): Data CRC failed
on node at ..."  

            I don't know where is the problem either in my nand driver or jffs2 code

Has anyone experienced this and have any ideas?  Any help would be much
appreciated.
