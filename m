Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CoL9r-0008WN-Og
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 07:30:01 -0500
Message-ID: <41E3C6A3.6070207@yandex.ru>
Date: Tue, 11 Jan 2005 15:29:23 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <20050108211842.GA17176@wohnheim.fh-wedel.de>	
	<Pine.LNX.4.58.0501091202440.19297@phoenix.infradead.org>	
	<20050110145154.GC12520@wohnheim.fh-wedel.de>
	<1105369990.5698.95.camel@hades.cambridge.redhat.com>
In-Reply-To: <1105369990.5698.95.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 simplifications
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I prefer to optimise for the common case -- which is the _user_ not the
> developer. The level of verbosity if you enable CONFIG_JFFS2_FS_DEBUG is
> high, but it means that I can take a log from a clueless end-user and
> see precisely what's going on. I can look at a log from someone who's
> having problems, see precisely what's happening, and provide a patch in
> reply. While there are certainly some printks which can go, and even
> more could be demoted to level 2 from level 1 (which is all that's ever
> really useful), I wouldn't want to see it completely stripped of
> debugging output. Not unless you want to take over the task of
> supporting users ;)
>
I have seen once how David have fixed bug after guy just provided the 
debugging output. From this point of view debugging printks are really good.

When developing, the debugging printks are extremely helpful, at least 
for me.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
