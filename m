Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPzh3-0004zC-SK
	for linux-mtd@lists.infradead.org; Sun, 12 Jul 2009 14:06:24 +0000
Subject: RE: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren Sokolowsky <Oren_S3@VERIFONE.com>
In-Reply-To: <ED252DAAC10AF74791BDFAD3BF09B5DB030DA29F@tlvntmail1.verifone.com>
References: <ED252DAAC10AF74791BDFAD3BF09B5DB030DA29F@tlvntmail1.verifone.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 12 Jul 2009 17:06:06 +0300
Message-Id: <1247407566.20721.632.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-07-12 at 10:19 +0300, Oren Sokolowsky wrote:
> Thanks you very much... Artem,
> After fixing the NAND driver ,I finally succeed format,
> attach and mount ubifs as a rootfs.

Cool!

> As I already mention I am using kernel 2_6_27_18 ...is
> there a list of known UBI/UBFS issues for this kernel version?

We do not maintain any list of known problems. Instead, we maintain
a set of back-port trees which contain up-to-date UBI and UBIFS.
Please, refer:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

IOW, you should take all patches from the ubifs-v2.6.27.git tree and
apply them to your tree.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
