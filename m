Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DKCWQ-00040Q-CT
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2005 05:44:59 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <42534BCC.3080106@setabox.com>
References: <424BFC76.8020101@setabox.com> <4252BB42.6010907@yandex.ru>
	<42534BCC.3080106@setabox.com>
Content-Type: text/plain
Date: Sat, 09 Apr 2005 13:44:28 +0400
Message-Id: <1113039868.18825.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]  NAND I/O instruction support
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-06 at 10:39 +0800, William J Beksi wrote:
> Because I want to use the *same* I/O port range as that used by the IDE 
> interface on a PC. I think a look at my driver below will make things 
> clearer ;)
Then this is rather hack then a standard thing. Hacks should stay in
drivers IMO.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
