Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AoZp3-00012R-0v
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2004 03:04:57 +0000
Received: from il06exr06.mot.com (il06exr06.mot.com [129.188.137.136])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i1534rAH005554
	for <linux-mtd@lists.infradead.org>;
	Wed, 4 Feb 2004 20:04:53 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr06.mot.com (Motorola/il06exr06) with ESMTP id i1534nSC011525
	for <linux-mtd@lists.infradead.org>; Wed, 4 Feb 2004 21:04:50 -0600
From: Li Yang <leoli@motorola.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1074583969.14499.100.camel@imladris.demon.co.uk>
References: 
	 <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
	 <1074503876.14499.40.camel@imladris.demon.co.uk>
	 <1074509881.14564.3.camel@Gundam>
	 <1074510244.14499.49.camel@imladris.demon.co.uk>
	 <1074572447.14559.23.camel@Gundam>
	 <1074583969.14499.100.camel@imladris.demon.co.uk>
Content-Type: text/plain
Message-Id: <1075950453.12044.7.camel@Gundam>
Mime-Version: 1.0
Date: 05 Feb 2004 11:07:33 +0800
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2+mtd+big endian problem
Reply-To: leoli@motorola.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you.  I got it.

In drivers/mtd/chips/sharp.c line 362
There is a hard coded cpu_to_le32 swap, which caused the swap issue.

I have tried to use Jedec_probe instead of sharp driver, but it always
recognizes my sharp flash as Intel flash, they have the same vendor id
and product id. Ugly.  And then something goes wrong.  So I have to
stick to the obsoleted sharp driver.  Thank you for the continued help.

-- 

Li Yang <leoli@motorola.com>

Metrowerks
