Received: from smtp.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWHfi-00086U-EC
	for linux-mtd@lists.infradead.org; Wed, 29 Jul 2009 22:30:59 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: what cause :**>> yaffs chunk 38598 was not erased
Date: Thu, 30 Jul 2009 10:30:43 +1200
References: <OF66F0CAAE.606F758E-ON48257602.0033C66C-48257602.00347335@zte.com.cn>
In-Reply-To: <OF66F0CAAE.606F758E-ON48257602.0033C66C-48257602.00347335@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907301030.43323.manningc2@actrix.gen.nz>
Cc: liu.yaojin@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 29 July 2009 21:30:50 liu.yaojin@zte.com.cn wrote:
> hi guys:
>
> i use lastest yaffs filesystem,kernel is 2.6.24.
> my nand flash controller is a little slow.and when i copy(or ls)
> files(more than 1MB?),the console appears:
>
> **>> yaffs chunk 38598 was not erased
> **>> yaffs write required 2 attempts
> page 38598 in gc has no object: 0 0 0
>
> and etc...
> so why this happens continually ?
>

You're probably better off asking yaffs questions on the yaffs list: 
http://stoneboat.aleph1.co.uk/cgi-bin/mailman/listinfo/yaffs

This is happening because your spare area management is not correct and the 
tags are being messed up. Thiis causes yaffs to think that a page of flash is 
empty, but it is not.

-- Charles
