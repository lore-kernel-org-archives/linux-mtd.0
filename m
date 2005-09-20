Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHfhR-0002lZ-St
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 06:50:18 -0400
Message-ID: <432FE1EF.9000807@yandex.ru>
Date: Tue, 20 Sep 2005 14:18:23 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>
	<432817FF.10307@yandex.ru>	<4329251C.7050102@mw-itcon.de>
	<4329288B.8050909@yandex.ru> <43292AC6.40809@mw-itcon.de>
	<43292E16.70401@yandex.ru> <43292F91.9010302@mw-itcon.de>
In-Reply-To: <43292F91.9010302@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Menzebach wrote:
> short note: The sector size is 1056 bytes, but I report 8*1056 or 
> 16*1056 byte to the mtd layer. As far as I see, this seems to be better 
> for jffs2, and otherwise I had to patch the mkfs.jffs2 every time I use 
> it ;)

Hello Peter,

I've returned to explore your problem. Do you have any success?
I have a vague idea what happens, need to think a little. Unfortunately, 
I have no DataFlash to just debug this.

Please, write me your flash name - I want to glance at its data sheet.

Thanks,

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
