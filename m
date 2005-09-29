Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKt8f-0002hK-5e
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 08:47:33 +0100
Date: Thu, 29 Sep 2005 09:45:00 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kaigai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20050929074500.GA16687@wohnheim.fh-wedel.de>
References: <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
	<43210C7A.60109@ak.jp.nec.com>
	<20050909072416.GA19251@wohnheim.fh-wedel.de>
	<43225DEB.4070809@ak.jp.nec.com>
	<20050911114642.GA11788@wohnheim.fh-wedel.de>
	<4324E525.60805@ak.jp.nec.com>
	<20050912064038.GA21304@wohnheim.fh-wedel.de>
	<43255FF5.4020903@ak.jp.nec.com> <433A57D8.9030501@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433A57D8.9030501@ak.jp.nec.com>
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Ma Yun <sx_yunma@hotmail.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 September 2005 17:44:08 +0900, Kaigai Kohei wrote:
> 
> I revised the previous xattr patch in jffs2 based on some suggestions.
> 
> [1] scanning xattr related node for cleaned-up scan.c.
>     (jffs2_xattr_scan.c-cleanup.patch)
> [2] enables xattr support in jffs2.
>     (jffs2_xattr_take-3.patch)
> (*) We can apply jffs2_xattr_take-3.patch for current CVS independently.

Looks quite interesting.  I'll take a closer look over the weekend.

Thanks!

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
