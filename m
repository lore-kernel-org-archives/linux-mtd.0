Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BdApa-0005kc-EH
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2004 12:42:38 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <40D9B37B.2070605@inf.u-szeged.hu>
References: <E1Bd9E6-0002UD-O9@phoenix.infradead.org>
	<1088003135.18627.2676.camel@hades.cambridge.redhat.com>
	<40D9B37B.2070605@inf.u-szeged.hu>
Content-Type: text/plain
Message-Id: <1088008952.18627.2691.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 23 Jun 2004 17:42:32 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 compr.c, 1.38, 1.39 compr.h, 1.3,
	1.4	compr_lzari.c, 1.1, 1.2 compr_lzo.c, 1.1, 1.2 compr_rtime.c, 1.12,
	1.13	compr_rubin.c, 1.18, 1.19 compr_zlib.c, 1.26, 1.27
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-06-23 at 18:44 +0200, Ferenc Havasi wrote:
> >Please don't do this. #define printk in userspace instead. Likewise for
> >alloc/free.
> >  

Thanks. Also please #define spin_lock() /* */ in userspace and remove
COMPRESSOR_LIST_{UN,}LOCK, and use KERN_xxx printk prefixes which can
also be #defined to nothing in userspace.


-- 
dwmw2
