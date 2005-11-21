Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeDtZ-0005Y4-3W
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 10:48:02 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.73.210])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 21 Nov 2005 15:47:47 -0000
Message-ID: <4381EC1F.6050007@gmail.com>
Date: Mon, 21 Nov 2005 16:47:43 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <435CB911.4060005@gmail.com> <435D0A05.5090508@yandex.ru>
	<4381E625.1060402@gmail.com> <4381EAE2.2010207@yandex.ru>
In-Reply-To: <4381EAE2.2010207@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: malloc.c:100: error: dereferencing pointer to incomplete type
 /	dbg_memalloc()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Could you please double-check this? I've just compiled JFFS2 with 
> DBGLVL=2 and saw only one warning, no errors.

OK we'll check this. Our kernel is partially a bit weird... Seems it's 
our fault then.

Thanks,
Bernhard
