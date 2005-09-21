Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI4F4-0005AT-Hk
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 09:02:42 -0400
Message-ID: <433159BC.1060603@yandex.ru>
Date: Wed, 21 Sep 2005 17:01:48 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Brian T <btuch@usa.net>
References: <012801c5be31$a90e5190$fd0ba8c0@briantpc>
In-Reply-To: <012801c5be31$a90e5190$fd0ba8c0@briantpc>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CRC failed on node  ....
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian T wrote:
> Running the 2.4.20 kernel, after a power outage 2 of my test units get boot 
> message mount errors:
> 
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x00b620c8: Read 
> 0x640c8ca3, calculated 0x795111fe
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x00eaf1e0: Read 
> 0x16f2116a, calculated 0x0622ba51

Brain, I've just added the corresponding entry to the JFFS2 FAQ, please, 
read it. If it is vague - ask.

http://www.linux-mtd.infradead.org/faq/jffs2.html

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
