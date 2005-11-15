Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Ec1Jg-0005Ho-SD
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 08:57:53 -0500
Message-ID: <4379E936.6040309@yandex.ru>
Date: Tue, 15 Nov 2005 16:57:10 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Keijiro Yano <keijiro_yano@yahoo.co.jp>
References: <000c01c5e6d6$abf22490$0b01a8c0@YANO> <4375EA0D.2060704@yandex.ru>
	<002001c5e91a$a7c87180$0b01a8c0@YANO>
	<1131980118.3479.34.camel@sauron.oktetlabs.ru>
	<004d01c5e9ea$f9fccac0$0b01a8c0@YANO>
In-Reply-To: <004d01c5e9ea$f9fccac0$0b01a8c0@YANO>
Content-Type: text/plain; charset=us-ascii
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

Keijiro Yano wrote:
> It is for Linux 2.6.10.
> But, based on my source level investigation, it can be applied for the 
> latest CVS.
Ok.

> I have tested it only on Linux 2.6.10.
Ok.

> I think that ecos doesn't have this problem, because ecos initializes 
> the locked mutex in jffs2_init_inode_info().
Hmm, I do you mean that Ecos's jffs2_init_inode_info() is not a slab
cache constructor so the bug does not exist there? Probably you're right.

Thanks. I think I'll commit this patch if people are OK.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
