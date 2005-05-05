Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTcWK-0000DU-8I
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 05:19:49 -0400
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.34) id 1DTcWO-0004GI-GN
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 11:19:52 +0200
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SAVSMTP 3.1.0.29) with SMTP id
	M2005050511195223043
	for <linux-mtd@lists.infradead.org>; Thu, 05 May 2005 11:19:52 +0200
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.34) id 1DTcWO-0004Jt-Db
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 11:19:52 +0200
Received: from [160.114.36.214] (kpax.inf.u-szeged.hu [160.114.36.214])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 5413A2396C
	for <linux-mtd@lists.infradead.org>;
	Thu,  5 May 2005 11:19:52 +0200 (CEST)
Message-ID: <4279E5A9.5050306@inf.u-szeged.hu>
Date: Thu, 05 May 2005 11:21:45 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Subject: summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

Some news about our summary (mount time speed up) works:

A new version of erase block summary has been released. 
JFFS3 will be updated soon, too. Changes:
- there is a fixed "may sleep" bug (thanks for Artem and Jarkko)
- NO_CRC option removed (it may caused incorrect behavoiur)

A new kind of summary has been introduced. It is called centralized 
summary (CS). It stores every important memory data structures (relevant 
patrs of inode cache, raw node references, jeb info ans lists) onto the 
flash at umount time. If there was clean umount at the next mount this 
stored information will be read directly into the memory and additional 
scanning will not be neccesarry which makes the mounting process so 
fast. There is no user space tool for CS. The first mount will use the 
original scanning process, and from the second mount will be fast (if 
there was clean umount before). It is very new, should be tested. It 
works on NAND chips only, yet. You can download it from our web-site 
(http://www.inf.u-szeged.hu/jffs2/) Any feedbacks are welcome.

Bye,
Ferenc
