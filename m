Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BdAnA-0005bI-BP
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2004 12:40:12 -0400
Message-ID: <40D9B37B.2070605@inf.u-szeged.hu>
Date: Wed, 23 Jun 2004 18:44:43 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <E1Bd9E6-0002UD-O9@phoenix.infradead.org>
	<1088003135.18627.2676.camel@hades.cambridge.redhat.com>
In-Reply-To: <1088003135.18627.2676.camel@hades.cambridge.redhat.com>
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

>>- replace printk() with JFFS2_PRINT macro. It can be used by compressor modules, too.
>>    
>>
>
>Please don't do this. #define printk in userspace instead. Likewise for
>alloc/free.
>  
>
Done.

Regards,
Ferenc
