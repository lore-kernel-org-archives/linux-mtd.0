Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Anuya-0003Oi-Ag
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2004 07:28:04 +0000
Received: from il06exr02.mot.com (il06exr02.mot.com [129.188.137.132])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i137S15w016422
	for <linux-mtd@lists.infradead.org>;
	Tue, 3 Feb 2004 00:28:01 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr02.mot.com (Motorola/il06exr02) with ESMTP id i137Qdup014981
	for <linux-mtd@lists.infradead.org>; Tue, 3 Feb 2004 01:26:41 -0600
From: Li Yang <leoli@motorola.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1075789858.19654.5.camel@imladris.demon.co.uk>
References: <1075788182.20041.38.camel@Gundam>
	 <1075789858.19654.5.camel@imladris.demon.co.uk>
Content-Type: text/plain
Message-Id: <1075793438.20041.51.camel@Gundam>
Mime-Version: 1.0
Date: 03 Feb 2004 15:30:39 +0800
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Mtd compile fails on ppc arch
Reply-To: leoli@motorola.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-03 at 14:30, David Woodhouse wrote:
> On Tue, 2004-02-03 at 14:03 +0800, Li Yang wrote:
> > Hi,
> > 
> > I updated the mtd driver in kernel through the latest snapshot.  I have
> > tested kernel 2.4.20 and 2.4.22.  The same parse error occurred for ppc
> > arch.  I have tried two cross toolchains, the results are the same.  So
> > it's unlikely to be cross compiler problem.  Btw: i386 compiles well.  I
> > looked into some code, the problem seems to be related to headers.  But
> > I can't figure it out.  Does anyone have a clue?
> 
> #include <linux/slab.h>
> 
> Evidently it gets included somehow on i386 via one of the other headers
> we _do_ include -- but not on ppc. But sharp.c is deprecated and you

Yes, sharp.c need linux/slab.h and linux/init.h to compile successfully
which are removed from headers in linux/mtd like linux/mtd/map.h.  After
adding these two includes, it can compile well.

> should be using jedec_probe and cfi_cmdset_0002 instead. 
-- 
Thank you,
Leo
