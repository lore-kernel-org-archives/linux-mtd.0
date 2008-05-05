Received: from [59.36.102.60] (helo=21cn.com)
	by pentafluge.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JsozX-0002US-2N
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 00:55:44 +0000
Received: from aisp5-smtp?dg (dgproxy5.inner-hermes.com [10.27.2.5])
	by 21cn.com (HERMES) with ESMTP id 7D77038005
	for <linux-mtd@lists.infradead.org>;
	Mon,  5 May 2008 08:55:05 +0800 (CST)
Received: from gzb4103([218.17.227.162])
	by aisp5-smtp@dg(Knowledge-based Antispam Gateway
	2.126n(2008-04-29),59.36.102.14) with ESMTP id
	local1002.1209948905 for <linux-mtd@lists.infradead.org>;
	Mon, 05 May 2008 08:55:05 +0800
Date: Mon, 5 May 2008 08:55:06 +0800
From: "marco.qu" <szlinux@21cn.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: nand flash's size overflow
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Message-Id: <20080505005505.7D77038005@21cn.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,all
  I'm using two 4G Bbyte nand flash chip (totally 8GB) under kernel 2.6.24.3, but the size and offset int the mtd and chip structures are int type(32 bit), so my flash's size if overflow. is there an official way to solve this problem?

Thanks!!

                                                                                                       marco
                                                                                                            2007-5-5
