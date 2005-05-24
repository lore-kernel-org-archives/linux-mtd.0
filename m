Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DaaAR-0001x9-B1
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 10:14:00 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "\"David" =?ISO-8859-1?Q?M=FCller?= "(ELSOFT AG)\"" <d.mueller@elsoft.ch>
In-Reply-To: <429320D1.2060003@elsoft.ch>
References: <429320D1.2060003@elsoft.ch>
Content-Type: text/plain
Date: Tue, 24 May 2005 18:13:25 +0400
Message-Id: <1116944005.16577.23.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 access delay
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hello
> Everything seems to be fine. But if i unmount and remount the JFFS2
> partition, the first "ls" to the JFFS2 takes quite some time:
...
> 
> During this delay, "jffs2_gcd_mtd1" is consuming a large amount of CPU
> time but the rest of the system seems to be well.
This is normal JFFS2 behaviour (unfortunately). Just after mount JFFS2
starts checking process which consumes resources.

> Does this ring a bell? Any idea how to cure this behaviour?
No. This isn't a bug, this is feature
(http://www.cbttape.org/funny/bug3.jpg).

What is the size of your flash?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
