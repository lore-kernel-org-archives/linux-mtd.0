Received: from fmr18.intel.com ([134.134.136.17] helo=orsfmr003.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ebb4W-0006nT-IT
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 09:56:21 +0000
From: "zhao, forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 14 Nov 2005 17:51:15 +0800
Message-Id: <1131961875.3417.35.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Some thoughts about JFFS3 design doc
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem

I read through your JFFS3 design doc and had some thoughts

1 in Section 4.1->4, there's a typo:
direntries contain {xattr name =>xattr ID}......

2 in section 3.6, I think it's better if you could
give a description or an example of how to replay
the journal to build the journal tree in RAM and
recover the inconsistent meta data on flash.

3 In section 4, I think it's better if you could
give a description or an example of what happens
for an update operation. Such as what happens when
a write operation update offset from 100 to 200 for
a file of length 400 bytes. I guess maybe you are
working on this now :)

4 I think your design doc is well-organized and give
reader a very clear picture and illustration of the
JFFS3 design.

Thanks,
Forrest
