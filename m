Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G8IYa-0000GC-Ui
	for linux-mtd@lists.infradead.org; Wed, 02 Aug 2006 11:22:51 -0400
Subject: Re: How to generate a patch limited to MTD subsystem
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: llandre <r&d2@dave-tech.it>
In-Reply-To: <44D0C250.2030601@dave-tech.it>
References: <44D0B33A.2080702@dave-tech.it> <44D0B8FF.6090601@yandex.ru>
	<44D0C250.2030601@dave-tech.it>
Content-Type: text/plain
Date: Wed, 02 Aug 2006 19:22:10 +0400
Message-Id: <1154532130.11061.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-08-02 at 17:18 +0200, llandre wrote:
> Hmm ... if I recall correctly MTD provides more stuff (JFFS2 for 
> example), doesn't it?

If you need JFFS2 as well, do similar for fs/jffs2,
include/linux/jffs2*.

I don't know another way ...

In JFFS2 you'll probably meet more merging problems. There was an
RB-tree rework (special macros were introduced), and you may have
troubles compiling JFFS2 because of this. But this is solvable.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
