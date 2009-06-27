Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MKQIC-0003i4-Dq
	for linux-mtd@lists.infradead.org; Sat, 27 Jun 2009 05:17:53 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLV00L8RTCSIH@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 27 Jun 2009 14:17:16 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLV00D2ETCQZ0@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 27 Jun 2009 14:17:16 +0900 (KST)
Date: Sat, 27 Jun 2009 10:47:45 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: query: nand read/write method for 2048 + 64 byte page
To: vimal singh <vimal.newwork@gmail.com>
Message-id: <D824A1DB59234D8A832B13B803B0B954@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <200906252128.08460.david-b@pacbell.net>
	<200906252256.16902.david-b@pacbell.net>
	<ce9ab5790906260422q136ed6e1p41593ece4b5fe319@mail.gmail.com>
	<200906261010.42073.david-b@pacbell.net>
Cc: David Brownell <david-b@pacbell.net>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vimal,

> On Friday 26 June 2009, vimal singh wrote:
>> The problem is that HW ECC engine in BCH mode dose not 
>> provide any
>> possible configuration where we can keep ECC bytes in 
>> main area
>> itself. OOB + ECC data has to be in only spare area.
>
> Healthy.  I disike that "infix OOB" myself.  It is however
> a standard ECC mode in the NAND framework.  :(
>
> So you're asking about how to map hardware-specific 
> details
> to the NAND framework?  That wasn't clear.

I think better you use some of the bytes of OOB area , In 
almoost al NAND you can read 2K page size or 4K page size 
additinal you have to read OOB or spare area of NAND.
>
>
>> Would it not be the good idea to perform read/write for 
>> full (2112 bytes) page?
>
> I'm not sure I can answer that without reading up on that
> particular NAND ECC engine.
>
> Recall however that the NAND framework will think in terms
> of 2KB reads, with OOB data on the side.  There will be
> separate reads for 2K and then 64 bytes.
>
>
>> And enable HW_ECC before read/write and then call for 
>> ecc.calculate or
>> ecc.correct accordingly. Rest all things can be taken 
>> care by
>> underlying controller driver.
I donot think when Hw_ecc is enable some software ECC 
calculation is required.
>
> Those sentences seem to elide critical parts of the 
> process.
> Like the details of OOB and ECC handling, which seem to be
> what you're not sure of...
>
>

Thanks
Amit
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
