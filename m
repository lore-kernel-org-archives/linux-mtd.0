Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ftj8y-0004Ea-NV
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 06:44:16 -0400
Subject: Re: DataFlash & writesize
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1151058432.27505.60.camel@fuzzie.sanpeople.com>
References: <4497A89F.4010202@yandex.ru>
	<1151058432.27505.60.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Fri, 23 Jun 2006 14:43:35 +0400
Message-Id: <1151059415.16043.45.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, david-b@pacbell.net,
	Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-06-23 at 12:27 +0200, Andrew Victor wrote:
> Since the writesize change is now in mainline git, here is a trivial
> patch to set mtd->writesize for DataFlash.
> [writesize = erasesize = pagesize]
> 

Andrew,

I made the same yesterday and it is in GIT, but thank you anyway!

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
