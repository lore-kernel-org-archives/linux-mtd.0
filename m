Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EbfkO-00012Q-8k
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 09:55:55 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Keijiro Yano <keijiro_yano@yahoo.co.jp>
In-Reply-To: <002001c5e91a$a7c87180$0b01a8c0@YANO>
References: <000c01c5e6d6$abf22490$0b01a8c0@YANO>
	<4375EA0D.2060704@yandex.ru>  <002001c5e91a$a7c87180$0b01a8c0@YANO>
Content-Type: text/plain
Date: Mon, 14 Nov 2005 17:55:18 +0300
Message-Id: <1131980118.3479.34.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 mutex problem
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-11-14 at 21:55 +0900, Keijiro Yano wrote:
> Hi,
> 
> > Well, the patch is not against the latest MTD CVS snapshot which is bad.
> 
> Thanks for your information.
> I modify my patch to fix this problem.
> 
Is this against the latest CVS?
Can you confirm that you tested the patch?
What about to fix ecos as well?

$ grep -r jffs2_init_inode_info *
ecos/src/fs-ecos.c:     jffs2_init_inode_info(f);
ecos/src/fs-ecos.c:     jffs2_init_inode_info(f);

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
