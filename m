Received: from mail.euroweb.hu ([193.226.220.4])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E9Jk8-00083V-Rr
	for linux-mtd@lists.infradead.org; Sun, 28 Aug 2005 05:46:30 -0400
Message-ID: <431187E8.8010805@inf.u-szeged.hu>
Date: Sun, 28 Aug 2005 11:46:16 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
In-Reply-To: <20050826102512.GA23886@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jörn,

>Trivial patch.  Anyone complaining about this is free to write a
>better one.  Can I commit?
>  
>
>+	if (!(c->mtd->flags & MTD_NO_VIRTBLOCKS) && (blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024)) {
>+		printk(KERN_ERR "jffs2: Support for virtual blocks was removed\n"
>+				"	Please contact JFFS2 maintainers about this.\n");
>+		BUG();
>+		return -EIO;
>
Maybe we should use (temporary) vmalloc here instead of simply throwing 
a BUG(). It's slower I know, but slow working is still better than not 
working.

Ferenc
