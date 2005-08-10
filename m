Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E2obt-00054C-Q3
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 07:19:04 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id B8443228D1
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Aug 2005 15:18:24 +0400 (MSD)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Wed, 10 Aug 2005 15:18:24 +0400
Message-Id: <1123672704.16052.46.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: recent JFFS2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I recently changed some core JFFS2 stuff (fragtree is being formed from
the highest version to the lowest). This reduces the time of the JFFS2
file system checking (on 40% in my tests).

So, if you are going to try the recent JFFS2, please try it earlier. If
there are some bugs - I'll try to fix them. I gonna have my vacation
soon, so won't be able to fix bugs which may have been introduced by
me...

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
