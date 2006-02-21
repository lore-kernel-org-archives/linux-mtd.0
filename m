Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBV1i-0001K4-Qj
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 05:45:54 -0500
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1FBV1c-0006cV-Hw
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 11:45:44 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.9.35) with SMTP id
	M2006022111454427750
	for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2006 11:45:44 +0100
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1FBV1c-0006cg-DI
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 11:45:44 +0100
Received: from [160.114.36.214] (kpax.inf.u-szeged.hu [160.114.36.214])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 559FA23969
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Feb 2006 11:45:44 +0100 (CET)
Message-ID: <43FAEFD6.1090308@inf.u-szeged.hu>
Date: Tue, 21 Feb 2006 11:47:50 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Subject: A simple JFFS3 GC algorithm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

We have been thinking about JFFS3 and its remaining parts (such us 
garbage collection), and described a simple idea for it. I don't think 
it is the best one, but relatively simple, may implemented in the 
first/prototype version of JFFS3. The document can be downloaded from here:

http://www.inf.u-szeged.hu/jffs2/documentation.php

Ferenc
