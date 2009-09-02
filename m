Received: from mail-iw0-f199.google.com ([209.85.223.199])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MimFz-0007TK-O7
	for linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 09:36:05 +0000
Received: by iwn37 with SMTP id 37so284963iwn.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Sep 2009 02:35:57 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 2 Sep 2009 17:35:56 +0800
Message-ID: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>
Subject: UBIFS power cut issues
From: JiSheng Zhang <jszhang3@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

If we cut power when copy file into ubifs, then remount ubifs and try
to read the file, we found that the data at some offset of the file
began different from the data of the original file at the same offset.
Is this a bug of ubifs?

PS:how do you test data integrity of ubifs under power loss?

Thanks in advance,
Jisheng
