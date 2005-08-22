Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E788y-0005DB-WC
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 04:59:05 -0400
Message-ID: <430993B1.5010502@yandex.ru>
Date: Mon, 22 Aug 2005 12:58:25 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <43098213.1020807@prie.de> <43099109.3050609@inf.u-szeged.hu>
In-Reply-To: <43099109.3050609@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Bernhard Priewasser <bernhard@prie.de>, linux-mtd@lists.infradead.org
Subject: Re: Testing JFFS2 using mtdram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:

> mtdram emulates NOR flash (both read and write operations), but does not
> emulate delays. You can test stability with it, but for performance I
> suggest Artem's nand simulator. It's included in the official MTD. It
> can emulate delays and ceratinly you can test the NAND functionalities
> of JFFS2, too.
Albeit you cannot emulate > 128 MB flashes (just because 128 MB is the 
vmalloc()'s limit). This may be fixed, I just did not bother. And I 
never used that delays, just added them to make nandsim look cooler 
(kidding) :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
