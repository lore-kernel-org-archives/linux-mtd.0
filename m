Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTFRS-0000zd-FN
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 04:41:15 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
In-Reply-To: <20050504001538.77696.qmail@web51001.mail.yahoo.com>
References: <20050504001538.77696.qmail@web51001.mail.yahoo.com>
Content-Type: text/plain
Date: Wed, 04 May 2005 12:39:54 +0400
Message-Id: <1115195994.8559.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: two questions about jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-03 at 17:15 -0700, Vahid Fereydunkolahi wrote:
> Hi,
>  How does jffs2 handle the bad blocks on the NAND
> flash? ( I noticed that at initialization jffs2 scans
> the devivce and creates a bad block list, but it never
> uses the bad block list. It seems that if the block is
> bad it is not put into the block list).
JFFS2 handles bad blocks just fine. Some info may be found at the MTD
web site. Visit it please.

> Does current jffs2 and mtd support the NAND devices
> with Page size more than 528 bytes?
Yes, it does.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
