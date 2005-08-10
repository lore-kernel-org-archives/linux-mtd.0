Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E2mTw-0000JI-5H
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 05:02:42 -0400
Message-ID: <42F9C28D.4070206@yandex.ru>
Date: Wed, 10 Aug 2005 13:02:05 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Bernhard Priewasser <bernhard@prie.de>
References: <42F9BA34.6090008@prie.de>	<20050810083828.GA16583@wohnheim.fh-wedel.de>
	<42F9BF5F.7060603@prie.de>
In-Reply-To: <42F9BF5F.7060603@prie.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bernhard Priewasser wrote:
> Oh... seems I'm not up to date about the JFFS2/3/... ongoing, sorry.
> I thought JFFS3 was intended basically containing Artem's improvements.
> So what about "future" issues like scaling on large flashes and the 
> other nice JFFS3 stuff?
> 
That's the old attempt to create a new flash FS with a JFFS2-like 
design. I've given up doing this and working on another JFFS3 design 
(see doc on MTD site). I did not implement my mew ideas. Thus, the old 
jffs3 must be removed.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
