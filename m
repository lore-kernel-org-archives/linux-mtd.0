Received: from smtp22.mail.bbt.yahoo.co.jp ([202.93.85.137])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ec18r-0004mX-Nu
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 08:46:43 -0500
Message-ID: <004d01c5e9ea$f9fccac0$0b01a8c0@YANO>
From: "Keijiro Yano" <keijiro_yano@yahoo.co.jp>
To: <dedekind@infradead.org>
References: <000c01c5e6d6$abf22490$0b01a8c0@YANO> <4375EA0D.2060704@yandex.ru>
	<002001c5e91a$a7c87180$0b01a8c0@YANO>
	<1131980118.3479.34.camel@sauron.oktetlabs.ru>
Date: Tue, 15 Nov 2005 22:46:27 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-2022-jp";
	reply-type=original
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 mutex problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Is this against the latest CVS?

It is for Linux 2.6.10.
But, based on my source level investigation, it can 
be applied for the latest CVS.

> Can you confirm that you tested the patch?

I have tested it only on Linux 2.6.10.

> What about to fix ecos as well?

I think that ecos doesn't have this problem, because 
ecos initializes the locked mutex in jffs2_init_inode_info().

Best Regards,
Keijiro Yano


--------------------------------------
Know more about Breast Cancer
http://pr.mail.yahoo.co.jp/pinkribbon/
