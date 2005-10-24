Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EU55R-0003qU-MV
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 12:22:20 -0400
Message-ID: <435D0A05.5090508@yandex.ru>
Date: Mon, 24 Oct 2005 20:21:25 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <435CB911.4060005@gmail.com>
In-Reply-To: <435CB911.4060005@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: malloc.c:100: error: dereferencing pointer to incomplete type
 /	dbg_memalloc()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bernhard Priewasser wrote:
> Hello,
> 
> when trying to compile latest CVS MTD with JFFS2_FS_DEBUG=2 I get the 
> following compiling errors on dbg_memalloc():
> 
Fixed in CVS, thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
