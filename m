Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KkyDk-0000Oa-UD
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 09:42:13 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K82003820A52X@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 18:42:05 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K8200JF60A2GI@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 18:42:05 +0900 (KST)
Date: Wed, 01 Oct 2008 15:14:37 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support
To: dedekind@infradead.org
Message-id: <345B25C679EA4DFBB90BA8B29B1BCC14@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <30508484.52991221827822859.JavaMail.weblogic@epml16>
	<9c9fda240809212333n76fa6cc6jbf1025f4f272d3f4@mail.gmail.com>
	<001101c9222e$1914e6d0$3dd66c6b@sisodomain.com>
	<e8775dd00809300507l44ccb38dg1dff2fb6edc7641a@mail.gmail.com>
	<A51468EF349E43489C7D33B47B8A3A24@sisodomain.com>
	<1222840332.8051.26.camel@sauron>
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

no we have started working for UBIFS , very soon we will 
start working for UBIFS , let u know results.
----- Original Message ----- 
From: "Artem Bityutskiy" <dedekind@infradead.org>
To: "Amit Kumar Sharma" <amitsharma.9@samsung.com>
Cc: "Jason Liu" <liu.h.jason@gmail.com>; "apgmoorthy" 
<moorthy.apg@samsung.com>; "Kyungmin Park" 
<kmpark@infradead.org>; <David.Woodhouse@intel.com>; 
<linux-mtd@lists.infradead.org>
Sent: Wednesday, October 01, 2008 11:22 AM
Subject: Re: [PATCH 1/2] [MTD] [JFFS2] MLC NAND support


> Hi,
>
> On Wed, 2008-10-01 at 09:07 +0530, Amit Kumar Sharma 
> wrote:
>> We are also facing many difficulty in robustness and
>> reliability test with Jffs2 not only this we have tested 
>> our
>> MLC patches on kernel 2.6.22 their Jffs2 stability was
>> little bit higher as compare to  2.6.27 , not only this 
>> LTP
>> file tests and rw test fails with Jffs2 and same driver
>> works fine with yaffs2 but yaffs2 also has issue with
>> Symlink operation  we are working for that.
>
> Have you tries UBIFS?
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
