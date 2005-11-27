Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EgOjV-00020m-9p
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2005 10:46:34 -0500
Message-ID: <4389D4B2.2050001@yandex.ru>
Date: Sun, 27 Nov 2005 18:45:54 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
References: <43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>	<43255FF5.4020903@ak.jp.nec.com>	<433A57D8.9030501@ak.jp.nec.com>	<20050929074500.GA16687@wohnheim.fh-wedel.de>	<435647A8.6090103@ak.jp.nec.com>	<20051019142438.GA32362@wohnheim.fh-wedel.de>	<43895906.3040705@ak.jp.nec.com>
	<43897FDB.50405@ak.jp.nec.com>
In-Reply-To: <43897FDB.50405@ak.jp.nec.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello KaiGai,

to ease JFFS2 debugging I split debugging messages by subsystems and one 
may enable/disable debugging messages from each subsystem separately. I 
wonder, if it is possible to add DBG_XATTR() or the like instead of 
using D1()? It really makes bugs hunting easier. Please, glance at debug.h.

Thanks.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
