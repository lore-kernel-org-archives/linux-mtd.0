Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELbNc-0007W3-JP
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2005 03:02:05 -0400
Message-ID: <433E343E.8090905@yandex.ru>
Date: Sat, 01 Oct 2005 11:01:18 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Grayson <pgrayson@realmsys.com>
References: <433A640D.6030200@cetrtapot.si>	
	<433BA402.3040703@inf.u-szeged.hu>	
	<20050929093433.GB18741@wohnheim.fh-wedel.de>	
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>	
	<1128010237.6926.10.camel@localhost.localdomain>	
	<loom.20050929T193349-733@post.gmane.org>	
	<1128053984.6926.59.camel@localhost.localdomain>	
	<1128070714.4267.8.camel@sauron.oktetlabs.ru>
	<1128111916.6926.92.camel@localhost.localdomain>
In-Reply-To: <1128111916.6926.92.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Grayson wrote:
> # time dd if=/dev/zero of=/mnt/mtdb2/dedekind bs=1M count=300
Hmm, not bad with zero files, and now with if=/dev/urandom ?

> So, there seems to be a linear relationship between the time-to-stat and
> the file size.
Neh, that's known fact and this is why we call it unscalable.

> I do not have the time to do this test right now.
That's not compulsory :-) That's for you, it may be interesting for you.

> I'll try to make some time to do these tests next week.
Yhank you!

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
