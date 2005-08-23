Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7Zk6-00023V-JB
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 10:27:15 -0400
Date: Tue, 23 Aug 2005 16:27:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050823142706.GA1445@wohnheim.fh-wedel.de>
References: <430B2F84.30307@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430B2F84.30307@inf.u-szeged.hu>
Cc: dedekind@yandex.ru, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 August 2005 16:15:32 +0200, Ferenc Havasi wrote:
> 
> Here is the latest version of summary patch:
> http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050823.patch
> Some additional comment has been added, and if we are right all of the
> mentioned thing have been fixed. There is only one exception: we still
> use own lists rather than the kernel's ones. Now they are o(1), too.
> (will be changed in the next round)

Good.  Will take a look...

> Does any official decision about the new virtual erase block handling
> (or 1:1 mapping) of JFFS2?

Not before a patch is merged.  But I haven't seen any opposition
against the 1:1 mapping yet.

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown
