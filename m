Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kldfd-0007lu-RX
	for linux-mtd@lists.infradead.org; Fri, 03 Oct 2008 05:57:46 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K8500I6WF7IP3@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 03 Oct 2008 14:57:18 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K8500FLYF7EDG@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 03 Oct 2008 14:57:18 +0900 (KST)
Date: Fri, 03 Oct 2008 11:29:50 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support
To: dedekind@infradead.org
Message-id: <8EAF1412C1984E1A88045AF7EE721D5E@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <30508484.52991221827822859.JavaMail.weblogic@epml16>
	<9c9fda240809212333n76fa6cc6jbf1025f4f272d3f4@mail.gmail.com>
	<001101c9222e$1914e6d0$3dd66c6b@sisodomain.com>
	<e8775dd00809300507l44ccb38dg1dff2fb6edc7641a@mail.gmail.com>
	<A51468EF349E43489C7D33B47B8A3A24@sisodomain.com>
	<1222840332.8051.26.camel@sauron>
	<345B25C679EA4DFBB90BA8B29B1BCC14@sisodomain.com>
	<1222854728.8051.35.camel@sauron>
Cc: Jason Liu <liu.h.jason@gmail.com>, apgmoorthy <moorthy.apg@samsung.com>,
	Kyungmin Park <kmpark@infradead.org>, David.Woodhouse@intel.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Artem for pre information , your information I hope 
will be useful for us and we will consider your points 
during UBIFS with OneNAND-FlexOneNAND.
----- Original Message ----- 
From: "Artem Bityutskiy" <dedekind@infradead.org>
To: "Amit Kumar Sharma" <amitsharma.9@samsung.com>
Cc: "Jason Liu" <liu.h.jason@gmail.com>; "apgmoorthy" 
<moorthy.apg@samsung.com>; "Kyungmin Park" 
<kmpark@infradead.org>; <David.Woodhouse@intel.com>; 
<linux-mtd@lists.infradead.org>
Sent: Wednesday, October 01, 2008 3:22 PM
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support


>
> On Wed, 2008-10-01 at 15:14 +0530, Amit Kumar Sharma 
> wrote:
>> no we have started working for UBIFS , very soon we will
>> start working for UBIFS , let u know results.
>
> Note, JFFS2 is not really suitable for MLC because it has
> random wear-leveling algorithm, and it may erase one 
> eraseblock
> thousands of times, while erasing the other eraseblock 
> only hundreds of
> times.
>
> In UBI you may set the WL threshold to control this. Also, 
> JFFS2
> does not really help with read-disturb problem, but this 
> is fixable.
>
> UBI refreshes data when it meets a bit-flip.
>
> However, UBIFS is not really ready to handle this paired 
> page problem.
> I mean, in MLC, if you interrupt power during write 
> operation, this
> may result in corruptions in one of the previous NAND 
> page. The only
> simple way to fix this is to make UBIFS assume that min. 
> I/O unit size
> is not one NAND page, but several pages, so that both 
> paired NAND pages
> were in one min. I/O unit.
>
> -- 
> Best regards,
> Artem Bityutskiy (???????? ?????)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
