Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mdcxo-0007SH-FM
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 04:40:01 +0000
Subject: about ubifs question
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
Content-Type: text/plain
Date: Wed, 19 Aug 2009 12:39:46 +0800
Message-Id: <1250656786.11476.2.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,sir!

about ubifs work under Kernel suspend and resume

When Kernel resume from suspend by apm -s ,

i touch file in nand flash and sync,but when Kernel restart ,my touched
file didn't occur!

After Kernel resume ,i guess my touched file isn't in nand flash but
memory !

My ubifs version is 2.6.24 ,does it is relation with Nand flash or
ubifs ?
