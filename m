Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJnbn-00021F-Of
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 03:41:16 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id B6044BB1D
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Sep 2005 09:40:48 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34974-07 for <linux-mtd@lists.infradead.org>;
	Mon, 26 Sep 2005 09:40:39 +0200 (CEST)
Received: from [192.1.1.75] (unknown [192.168.66.2])
	by n1.cetrtapot.si (Postfix) with ESMTP id 42F6CBB5C
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Sep 2005 09:40:39 +0200 (CEST)
Message-ID: <4337A604.6050204@cetrtapot.si>
Date: Mon, 26 Sep 2005 09:40:52 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: fragtree method?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

We are using JFFS2 fs on toshiba NAND flash. There are several 
partitions defined, but scan time at boot time gets longer every day of 
usage. Eg.  when flash is empty it takes ~10 s to mount 20Mb of flash in 
3 partitions later when there are some files present it takes > 30s and 
increasing.

We have April MTD branch and are currently going for newer version. We 
would also like to know if fragtree method posted by Artem in July [1] 
would be wise to add. If anyone has some experience with it, please, 
post it.

[1] [PATCH] (preliminary) new fragtree build method 24.07.2005

regards,
hinko k
