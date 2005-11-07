Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZ6PH-0001UH-4j
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 07:47:33 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.114.160])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 7 Nov 2005 12:47:21 -0000
Message-ID: <436F4CD5.6030909@gmail.com>
Date: Mon, 07 Nov 2005 13:47:17 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <436A3949.1000001@gmail.com> <436A3BBD.5040405@yandex.ru>
In-Reply-To: <436A3BBD.5040405@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: GC operation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

 > Brr, didn't get it.. GC may be ugly if what?
If someone wants to understand how it works in detail :-)

 >> When and how is GC called?
 > From the GC thread and when there is no (or few) free space to write.
 > In the latter case the writing process is blocked and waits until GC
 > has freed some space.
E.g. if it is considered as neccessary either by jffs2_reserve_space()
or jffs2_thread_should_wake().
Something about the blocking topic... If there is almost no free space
and a write command issued, can it be blocked until the whole partition
is GC'd (worst case)?? What a latency time... Are there mechanisms to
avoid/control this? What about the "erase suspend" thing?

 >> Ah, another one: Are blocks on the erase_pending_list erased beside
 >> the GC cycles?
 > They are erased later, yes.
jffs2_erase_pending_blocks(), am I right? When is it called? I can only
find it in jffs2_write_super() with count=0 and jffs2_find_nextblock()
with count=1.

Many thanks,
Bernhard
