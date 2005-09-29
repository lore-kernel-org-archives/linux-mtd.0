Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvvd-0005Fq-2m
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:46:24 -0400
Message-ID: <433BC5CD.6080300@yandex.ru>
Date: Thu, 29 Sep 2005 14:45:33 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <433A640D.6030200@cetrtapot.si>
	<433BA402.3040703@inf.u-szeged.hu>	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<433BC08C.2030302@inf.u-szeged.hu>
In-Reply-To: <433BC08C.2030302@inf.u-szeged.hu>
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

Ferenc Havasi wrote:
> It think it is the method which is really does not spoil the
> wear-leveling. The selection of the storing place uses exactly the same
> function what JFFS2 uses to store any other data.

Then I just don't undesstand how it works. A user selects a bolck X 
where CS ought to be kept. JFFS2 crereates CS in X. Then, on each mount 
user specifies X in mount options. And if there are too frequent mounts, 
A becomes worn-out earlier. To avoid this, user should specify 2 options 
- where to find CS and where to store it next time? And evenly rotate 
the CS eraseblock?

Or you mean JFFS2 is itself picking the needed EB? How to find it on 
next mount then?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
