Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZtr6-0000Z5-P6
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 12:35:38 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.73.11])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 9 Nov 2005 17:35:26 -0000
Message-ID: <4372335B.8010709@gmail.com>
Date: Wed, 09 Nov 2005 18:35:23 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <436A3949.1000001@gmail.com> <436A3BBD.5040405@yandex.ru>
	<436F4CD5.6030909@gmail.com> <4370B6DC.4070203@yandex.ru>
	<4371F867.6060301@gmail.com> <43720C0C.2040905@yandex.ru>
In-Reply-To: <43720C0C.2040905@yandex.ru>
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

> Not almost full partition. Here are some statements:
> 
> 1. GC starts if there are no *free eraseblocks*.
> 2. GC makes free space in units of an eraseblock.
> 3. No GC is needed on mount.
> 
> JFFS2 does *checking* on mount, i.e., checks all CRCs. It is done in the 
> context of the GC thread, but does not actually relate to the Garbage 
> Collection. This is just how it is implemented.
Blocking time is rather important for us, e.g. the GC and erase_pending 
stuff is too. Thank you for bringing some light into it, perhaps it 
wouldn't be bad if there was some documentation. I'm doing my Master's 
Thesis right now on JFFS2, that might be a good documention.

> jffs2_write_super() is called when the JFFS2 superblock is dirty 
> (JFFS2's sb->s_dirt is set). JFFS2 marks its "struct superblock" 
> structure as dirty when something is added to the erase_pending_list or 
> written to the wbuf.
> 
> When sb->s_dirt, kupdated will call jffs2_write_super() in some 
> configurable time and JFFS2 will erase pending eraseblocks and flush the 
> wbuf.
If anybody else is intersted: See 
http://lists.infradead.org/pipermail/linux-mtd/2005-November/014271.html
and follow-up.

-- 
Bernhard
