Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bpi83-0001BX-Ee
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2004 02:41:35 -0400
Received: from yandex.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 749F4229D1
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jul 2004 10:41:00 +0400 (MSD)
Message-ID: <41074A7C.9020808@yandex.ru>
Date: Wed, 28 Jul 2004 10:41:00 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <410653C0.3070609@yandex.ru>	
	<1090934568.20889.162.camel@thomas.tec.linutronix.de>	
	<41066966.8070107@yandex.ru>
	<1090949508.20889.169.camel@thomas.tec.linutronix.de>
In-Reply-To: <1090949508.20889.169.camel@thomas.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: bugreport
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Tue, 2004-07-27 at 16:40, Artem B. Bityuckiy wrote:
> proc support was removed in meantime (current CVS).
Oh, sorry, my snapshot was deprecated.

Note, the same thing should also be fixed in super-v24.c.

Just interesting, why the proc interface was removed? Have you added 
ioctl interface? My JFFS2 CVS snapshot of 15 Jul 2004 has no ioctl 
interface.

> But anyway thanks for pointing this out
Not at all.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
