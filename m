From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41074A7C.9020808@yandex.ru>
References: <410653C0.3070609@yandex.ru>
	<1090934568.20889.162.camel@thomas.tec.linutronix.de>
	<41066966.8070107@yandex.ru>
	<1090949508.20889.169.camel@thomas.tec.linutronix.de>
	<41074A7C.9020808@yandex.ru>
Content-Type: text/plain
Date: Thu, 29 Jul 2004 15:56:10 -0400
Message-Id: <1091130970.4133.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: bugreport
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-28 at 10:41 +0400, Artem B. Bityuckiy wrote:
> Just interesting, why the proc interface was removed? Have you added 
> ioctl interface? My JFFS2 CVS snapshot of 15 Jul 2004 has no ioctl 
> interface.

Al Viro took a brief look at it and used lots of nasty works. So I
removed it.

-- 
dwmw2
