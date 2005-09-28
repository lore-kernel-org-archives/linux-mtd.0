Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKZWU-00036w-SZ
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 06:50:57 -0400
Message-ID: <433A7568.2010000@yandex.ru>
Date: Wed, 28 Sep 2005 14:50:16 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Konstantin Kletschke <lists@ku-gbr.de>
References: <87achx7a0l.wl%kletschke@synertronixx.de>
In-Reply-To: <87achx7a0l.wl%kletschke@synertronixx.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Inode #274 was a directory with children - removing those too...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:
> What means "Inode #274 was a directory with children - removing those
> too..." ?
> 
This means JFFS2 has found a deleted directory which has children.
This should be harmless.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
