Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EISAF-0008C5-OY
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 10:35:26 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Anders Grafstrom <grfstrm@users.sourceforge.net>
In-Reply-To: <433067BF.6080909@users.sourceforge.net>
References: <E1EHjUk-0001IT-Dn@phoenix.infradead.org>
	<43303409.5030406@users.sourceforge.net> <43303D59.1040805@yandex.ru>
	<433067BF.6080909@users.sourceforge.net>
Content-Type: text/plain
Date: Thu, 22 Sep 2005 18:34:34 +0400
Message-Id: <1127399674.28625.18.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 erase.c,1.84,1.85 roll back
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 21:49 +0200, Anders Grafstrom wrote:
> So if we return -EIO, then we go to jffs2_erase_failed(). For NAND, if 
> the MTD driver reported erase failure (bad_offset != 0xffffffff), a 
> retry is made before giving up on the block and marking it bad. Also the 
> read operation may have failed, erase may have failed and MTD missed it, 
> write of clean marker may have failed. As it is these cases will put the 
> block on the bad_list. In the case of NOR it will also be put on the 
> bad_list at once.
> But how about retrying for all of these cases?

Sorry, no more today. What does your patch do? Adds the second try? What
for?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
