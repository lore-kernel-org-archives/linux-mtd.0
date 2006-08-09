Received: from mailreg.nctu.edu.tw ([211.76.241.6])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GAhKx-0001mc-93
	for linux-mtd@lists.infradead.org; Wed, 09 Aug 2006 02:14:43 -0400
Received: from ClareHuang (pc15163.cn.nctu.edu.tw [140.113.151.63])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by mailreg.nctu.edu.tw (Postfix) with ESMTP id 260D37E81E
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Aug 2006 14:26:27 +0800 (CST)
Message-ID: <031701c6bb7b$5a7d2400$c9010165@ClareHuang>
From: "Clare Huang" <sky.9367548@nctu.edu.tw>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 support LZO/LZMA compression ???
Date: Wed, 9 Aug 2006 14:16:27 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Reply-To: Clare Huang <sky.9367548@nctu.edu.tw>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I am a newbie of this community~
According to the http://www.inf.u-szeged.hu/jffs2/compression.php, I know 
BBC could let jffs2 support LZO compression.
But the kernel version I used is 2.6.14.....
How could I patch the kernel or update the mtd driver to support LZO or LZMA 
compression ?

I try to use CVS or git to get the latest mtd driver.....
But I still don't know where to enable the LZO/LZMA support of jffs2 ???

Could anyone help about this ?
or which website I could get more information about this question ?

Thanks and Best Regards,
Clare 
