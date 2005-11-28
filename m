Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgaPu-0003C1-E6
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2005 23:15:08 -0500
Message-ID: <438A83F2.2080605@ak.jp.nec.com>
Date: Mon, 28 Nov 2005 13:13:38 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>	<43255FF5.4020903@ak.jp.nec.com>	<433A57D8.9030501@ak.jp.nec.com>	<20050929074500.GA16687@wohnheim.fh-wedel.de>	<435647A8.6090103@ak.jp.nec.com>	<20051019142438.GA32362@wohnheim.fh-wedel.de>	<43895906.3040705@ak.jp.nec.com>
	<43897FDB.50405@ak.jp.nec.com> <4389D4B2.2050001@yandex.ru>
In-Reply-To: <4389D4B2.2050001@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: James Morris <jmorris@redhat.com>, Stephen Smalley <sds@tycho.nsa.gov>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, lorenzohgh@gmail.com,
	Andreas Gruenbacher <agruen@suse.de>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

> to ease JFFS2 debugging I split debugging messages by subsystems and one 
> may enable/disable debugging messages from each subsystem separately. I 
> wonder, if it is possible to add DBG_XATTR() or the like instead of 
> using D1()? It really makes bugs hunting easier. Please, glance at debug.h.

I agree what you say.
There is especially no reason why such a stub macro is not used.

In the next patch, I'll use some stub macros as are defined in debug.h.
The following definition will be added in debug.h, and I'll use JFFS2_NOTICE()
and so on instead of raw-printk().

/* Watch the XATTR subsystem */
#ifdef JFFS2_DBG_XATTR_MESSAGES
#define dbg_xattr(fmt, ...)  JFFS2_DEBUG(fmt, ##__VA_ARGS__)
#else
#define dbg_xattr(fmt, ...)
#endif

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
