Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BdR35-0007JY-1f
	for linux-mtd@lists.infradead.org; Thu, 24 Jun 2004 06:01:41 -0400
Message-ID: <40DAA793.8050005@inf.u-szeged.hu>
Date: Thu, 24 Jun 2004 12:06:11 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <E1Bd9E6-0002UD-O9@phoenix.infradead.org>	
	<1088003135.18627.2676.camel@hades.cambridge.redhat.com>	
	<40D9B37B.2070605@inf.u-szeged.hu>
	<1088008952.18627.2691.camel@hades.cambridge.redhat.com>
In-Reply-To: <1088008952.18627.2691.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 compr.c, 1.38, 1.39 compr.h, 1.3, 1.4	compr_lzari.c,
 1.1, 1.2 compr_lzo.c, 1.1, 1.2 compr_rtime.c, 1.12, 1.13	compr_rubin.c, 1.18,
 1.19 compr_zlib.c, 1.26, 1.27
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>Thanks. Also please #define spin_lock() /* */ in userspace and remove
>COMPRESSOR_LIST_{UN,}LOCK, and use KERN_xxx printk prefixes which can
>also be #defined to nothing in userspace.
>  
>
OK, it's ready. (#define spin_lock was not neccasary because it is not 
used by userspace compr.c)

Did you read my model-file related letter? (3th jun) Will that be OK?

Regards,
Ferenc
