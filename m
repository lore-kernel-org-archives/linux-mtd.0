Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FfdvA-0002Zj-6l
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 10:19:45 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1147635584.2551.20.camel@shinybook.infradead.org>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
	<20060510133510.GD31935@wohnheim.fh-wedel.de>
	<1147269251.16853.50.camel@sauron.oktetlabs.ru>
	<20060510135814.GG31935@wohnheim.fh-wedel.de>
	<1147635584.2551.20.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Mon, 15 May 2006 18:19:06 +0400
Message-Id: <1147702746.20604.10.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH/RFC] reserved pool
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-05-14 at 20:39 +0100, David Woodhouse wrote:
> > Then go and bug dwmw2 about merging it. ;) 
> 
> We talked about changing the way the reserved size is actually handled
> in the allocation routine.... did a new version ever show up?
> 
Please,

look/pull the '[JFFS2] add reserved pool feature' patch from
http://git.infradead.org/?p=users/dedekind/dedekind-mtd-2.6.git;a=summary

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
