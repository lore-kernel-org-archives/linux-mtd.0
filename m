Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpVtr-0007Yq-VS
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 13:38:05 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41066966.8070107@yandex.ru>
References: <410653C0.3070609@yandex.ru>
	<1090934568.20889.162.camel@thomas.tec.linutronix.de>
	<41066966.8070107@yandex.ru>
Content-Type: text/plain
Message-Id: <1090949508.20889.169.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Tue, 27 Jul 2004 19:31:48 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: bugreport
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-27 at 16:40, Artem B. Bityuckiy wrote:
> Not only. The "go out" in case of jffs2_compressors_init() failure 
> doesn't free /proc resources...

proc support was removed in meantime (current CVS).
But anyway thanks for pointing this out

tglx
