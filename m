From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <446AC77C.4010407@yandex.ru>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
	<20060510133510.GD31935@wohnheim.fh-wedel.de>
	<1147269251.16853.50.camel@sauron.oktetlabs.ru>
	<20060510135814.GG31935@wohnheim.fh-wedel.de>
	<1147635584.2551.20.camel@shinybook.infradead.org>
	<1147702746.20604.10.camel@sauron.oktetlabs.ru>
	<1147822221.30771.6.camel@shinybook.infradead.org>
	<446AC77C.4010407@yandex.ru>
Content-Type: text/plain
Date: Wed, 17 May 2006 10:19:24 +0100
Message-Id: <1147857565.8013.6.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] reserved pool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-17 at 10:49 +0400, Artem B. Bityutskiy wrote:
> Note: you have trickily decided to kill two birds with one stone, 
> exploiting me to add a superblock node facility to JFFS2.

Yes. That's how it works. You're trying to add a feature which really
ought to use such a 'superblock node', so you get to add that
functionality.

-- 
dwmw2
