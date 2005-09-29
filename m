Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKwhc-0003ce-GK
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 12:35:53 +0100
Message-ID: <433BD0C5.6080904@yandex.ru>
Date: Thu, 29 Sep 2005 15:32:21 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <433A640D.6030200@cetrtapot.si>
	<433BA402.3040703@inf.u-szeged.hu>	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<433BC08C.2030302@inf.u-szeged.hu> <433BC5CD.6080300@yandex.ru>
	<433BD009.8070201@inf.u-szeged.hu>
In-Reply-To: <433BD009.8070201@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Using this (second way) when the user umounts the fs, CS stores the
> centralized summary with the same function as JFFS2 stores nodes (using
> nextblock, etc) The starting location of it can be read from sysfs after
> umount. The user has to store it somewhere else, and specify it as a
> mount option at next mount. So nothing is stored in fixed place, so I
> think it does not spoil wear-leveling.
> 

Well, are you effectively talking about the situation where there is an 
additional persistent storage available, and the CS position is kept 
there. Fair enough, providing it is available. But it is often not :-(

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
