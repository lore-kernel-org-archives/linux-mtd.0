Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Duqrc-000783-Rf
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 08:06:34 -0400
Message-ID: <42DCEC94.8050505@yandex.ru>
Date: Tue, 19 Jul 2005 16:05:40 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
References: <42DCD1D3.8070303@cetrtapot.si>	<42DCD6C1.6010509@yandex.ru>	<42DCDCDA.2090909@cetrtapot.si>	<42DCDE8C.702@yandex.ru>
	<42DCE7E4.2050303@cetrtapot.si>
In-Reply-To: <42DCE7E4.2050303@cetrtapot.si>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hinko Kocevar wrote:
> There you go. This is with JFFS2 debug set to 2 and MTD debug set to 3.
> ...
> NET: Registered protocol family 17
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 
> 0x234a instead

Even though you enabled JFFS2 debugging,
the debugging messages are not seen on your console.

Could you please dump the first N (say, 128) bytes at the offset 
0x00000000 of the JFFS2 partition (/dev/mtd2)? Does it contain 0x234a 
(LE) as the first 16-bit word?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
