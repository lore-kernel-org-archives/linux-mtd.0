Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4IvA-0006Xw-E7
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 08:20:48 -0500
Date: Thu, 24 Feb 2005 13:20:42 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Narinder Kumar <narinder@kritikalsolutions.com>
In-Reply-To: <421D8C23.2000200@kritikalsolutions.com>
Message-ID: <Pine.LNX.4.58.0502241318300.5525@phoenix.infradead.org>
References: <4219E20F.80908@kritikalsolutions.com>
	<1108994310.13420.50.camel@sauron.oktetlabs.ru>
	<4219EDC3.1060506@kritikalsolutions.com>
	<1108999278.16852.46.camel@fuzzie.sanpeople.com>
	<421D8C23.2000200@kritikalsolutions.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please, erase your flash then mount *empty* flash. Then type 'dmesg'. You 
should find the information about the block size implied by JFFS2 there.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
