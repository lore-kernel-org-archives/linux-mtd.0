Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EN204-0004Mc-C5
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 01:39:45 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 0488BBB5E
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 07:39:28 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20723-08 for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 07:39:19 +0200 (CEST)
Received: from [192.1.1.75] (unknown [192.168.66.2])
	by n1.cetrtapot.si (Postfix) with ESMTP id 75F84BB5D
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 07:39:19 +0200 (CEST)
Message-ID: <4343670A.1040003@cetrtapot.si>
Date: Wed, 05 Oct 2005 07:39:22 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Removable serial flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We have SPI dataflash (www.datakey.com) connected to CPU GPIO pins. 
Device can hold up to 32Mbit serial flash and can be added/removed at 
any time. How is MTD coping with 'hotpluging' of MTD devices? Are there 
any available designs or device drivers that implement similar? Can we 
add/remove (mtd register/unregister) device as it is detected or are 
there any other limitations to this procedure?

Right now we are presenting datakey device as character device and use 
stream I/O operations. In this case we can quickly detect and add/remove 
device from the system. In case of MTD we are worried about mtdxx dev 
entry that could remain registered if datakey is removed during data access.

With the stunning EBS mount performance we would like to put jffs2 on 
datakey device in contrast to raw flash access we are using now.

Regards,
hinko
