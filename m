Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EfJxu-0005mo-Pn
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 11:29:00 -0500
Message-ID: <4385EA24.7070709@yandex.ru>
Date: Thu, 24 Nov 2005 19:28:20 +0300
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

I've committed your patch to CVS, thanks.

Note: the patch wasn't applicable to the CVS code and I tweaked it manually.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
