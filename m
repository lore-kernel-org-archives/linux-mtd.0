Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42014C5AE59
	for <linux-mtd@archiver.kernel.org>; Wed, 28 May 2025 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZZqzLoujWnmCWE9q+tU/FJlpRwWQZfi61OAwvKrqPs=; b=M74XkToLyQf3nJ
	7QqEtSDdS+GErt70fU1m9fXuv5tCw+sFxLrcb8Awo2bmQ2YDD7s9RYRRt/lDyMeXYUlGtLWNUKiew
	Pv3Udbpnki7A14whgwUpIFk0CpajH2D/GYQ6PL0FD4LwVVOYkH9IYRih+kAamsRURTJKtKC3SmUl2
	r1URh59cH/ckDTfr0yVT7GdpDQ/IYcOq4wTR1DabhQhMfDafUc8Bkf+sNZkAdzydiniej6Z317PGX
	2NFH3Yvo9C68cFS6Xgu1PdmXM0swI0waTj4vnas6lGEq1dphUI0ZJzX++T4Jyvnd7jkoqDE/FZuJn
	YQh4lMc0p2RzEZhpP3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA0f-0000000CGsC-28z3;
	Wed, 28 May 2025 06:11:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA0c-0000000CGrI-3PUu
	for linux-mtd@lists.infradead.org;
	Wed, 28 May 2025 06:11:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKFpu9016904;
	Wed, 28 May 2025 06:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2fOF6/NsrkitikutpZi4P4ogLVHf096azvULrGKkXY=; b=Ffo52/UJ7/yuZnSU
	7paK4qN5ohPBNPCjSai9R+mjjR2bLgFHbWJYlbIAQnmRcwT03F6UtEx+BN8CFZFQ
	v44U6B/ojJukNoxlLub2AB6SSZVUrH6JelhsANRTnYxDRa/5lY3vqYgm5rLAoOK2
	IFOPlgwEGfJJRX21Btn1iuJLPntBf/2eERhtdf7XDDWCbPndVKW7fJaAynNKviq/
	EG6emiweMNA/PwNIbn7zj8HTURwsj45WaGo412/F0x1bId7vs/+LGlF2KNlTbvXe
	w9DsuMg56KB4Bc5cltdICrwVNwUSFABEdx+j90QDPU8eNefd4lySIm28I48j/8fj
	Kf214A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcwpyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 06:11:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S6BIYh014820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 06:11:18 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 May 2025 23:11:17 -0700
Received: from nalasex01c.na.qualcomm.com ([fe80::88c3:e10b:adc4:a38f]) by
 nalasex01c.na.qualcomm.com ([fe80::88c3:e10b:adc4:a38f%11]) with mapi id
 15.02.1544.009; Tue, 27 May 2025 23:11:17 -0700
From: "Lakshmi Sowjanya D (QUIC)" <quic_laksd@quicinc.com>
To: Gabor Juhos <j4g8y7@gmail.com>,
        "Md Sadre Alam (QUIC)"
	<quic_mdalam@quicinc.com>,
        Mark Brown <broonie@kernel.org>,
        "Varadarajan
 Narayanan (QUIC)" <quic_varada@quicinc.com>,
        "Sricharan Ramabadhran (QUIC)"
	<quic_srichara@quicinc.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] mtd: nand: qpic_common: prevent out of bounds access
 of BAM arrays
Thread-Topic: [PATCH 2/2] mtd: nand: qpic_common: prevent out of bounds access
 of BAM arrays
Thread-Index: AQHbzZdYfct6aVWiz0mO9tgTnO5SQLPk7/SAgADcJoCAAcYsIA==
Date: Wed, 28 May 2025 06:11:17 +0000
Message-ID: <f467dcc6e92149b8b46ca8a879d36d6c@quicinc.com>
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
 <20250525-qpic-snand-avoid-mem-corruption-v1-2-5fe528def7fb@gmail.com>
 <8ab1e48a-f698-9859-3992-6a26f63d62f1@quicinc.com>
 <b9134a1d-3dbc-4cd9-b22a-90b1c8934ce9@gmail.com>
In-Reply-To: <b9134a1d-3dbc-4cd9-b22a-90b1c8934ce9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.56.236]
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xal3xMLZHkDh3alf69vUZ6Iak3lMKEGi
X-Proofpoint-GUID: Xal3xMLZHkDh3alf69vUZ6Iak3lMKEGi
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6836a907 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=xqWC_Br6kY4A:10 a=8ewgkwWz-JgA:10 a=8nJEP1OIZ-IA:10 a=dt9VzEwgFbYA:10
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=sozttTNsAAAA:8 a=JfrnYn6hAAAA:8 a=r6KVuAiU_dlV6dZd_TEA:9 a=wPNLvfGTeEIA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA1MiBTYWx0ZWRfX9eOJAwKHTo3/
 KvqLuZBRwdza862lK9i7cnE3d4uzW4Jepic5Y+zvutM0IStucDxou+rWlODhMFCxGWwkWToxsEF
 KB2RBtHZoQXuy9t9nY61U7Kj241QKGY7euhVCkLLTXOg3aHeveMs9zH5pGdqbmZXr4wylmVBcEv
 kIZOF8EI+yNIapxMJYkJUInygrj2r7qqg2xrVXtU2vuxxiIEehnZJjpLqfxk+b6CR9CmBQTNiyI
 SDi/KFJ/SmpUawW8q2x4x+oEi9uxgzCQHmd76+jmFegj5VcX7o/ZdiDNQaYzM3wd/YPg3mAJkiR
 r+tvd08NV6h1x0NPL1nr3fJJbfjkJBmzOj/0YNtrABOXcwGBZ0uuqfKxeHFRwmJahPTPu1mMS9y
 j+gTQGM4PW61Y6LwxPYv0v+4GqQz1UHKS620Yp3bmI/xnCQtzuhKUdMbekjBJhIG1T4Yb890
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_231126_983490_EB58C5B7 
X-CRM114-Status: GOOD (  32.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Gabor Juhos <j4g8y7@gmail.com>
> Sent: Tuesday, May 27, 2025 1:31 AM
> To: Md Sadre Alam (QUIC) <quic_mdalam@quicinc.com>; Mark Brown
> <broonie@kernel.org>; Varadarajan Narayanan (QUIC)
> <quic_varada@quicinc.com>; Sricharan Ramabadhran (QUIC)
> <quic_srichara@quicinc.com>; Miquel Raynal <miquel.raynal@bootlin.com>;
> Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>
> Cc: linux-spi@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> msm@vger.kernel.org; linux-kernel@vger.kernel.org; Lakshmi Sowjanya D
> (QUIC) <quic_laksd@quicinc.com>
> Subject: Re: [PATCH 2/2] mtd: nand: qpic_common: prevent out of bounds
> access of BAM arrays
> =

> 2025. 05. 26. 8:53 keltez=E9ssel, Md Sadre Alam =EDrta:
> > Hi,
> >
> > On 5/25/2025 10:35 PM, Gabor Juhos wrote:
> >> The common QPIC code does not do any boundary checking when it
> >> handles the command elements and scatter gater list arrays of a BAM
> >> transaction, thus it allows to access out of bounds elements in those.
> >>
> >> Although it is the responsibility of the given driver to allocate
> >> enough space for all possible BAM transaction variations, however
> >> there can be mistakes in the driver code which can lead to hidden
> >> memory corruption issues which are hard to debug.
> >>
> >> This kind of problem has been observed during testing the 'spi-qpic-sn=
and'
> >> driver. Although the driver has been fixed with a preceding patch,
> >> but it still makes sense to reduce the chance of having such errors ag=
ain
> later.
> >>
> >> In order to prevent such errors, change the
> >> qcom_alloc_bam_transaction() function to store the number of elements
> >> of the arrays in the 'bam_transaction' strucutre during allocation.
> >> Also, add sanity checks to the qcom_prep_bam_dma_desc_{cmd,data}()
> >> functions to avoid using out of bounds indices for the arrays.
> >>
> >> Tested with the 'spi-qpic-snand' driver only.
> > I recommend testing this patch on both the IPQ and SDX platforms, as
> > the QPIC raw NAND driver are utilized across both.
> >
> > If you have access to IPQ and SDX devices with raw NAND, please
> > proceed with testing on both.
> =

> Sorry, I have no SDX devices at all, and unfortunately I can't access my =
older
> IPQ boards before next week.
> =

> >
> > Otherwise, I can handle testing on the IPQ raw NAND device and
> > coordinate with Lakshmi Sowjanya D (quic_laksd@quicinc.com) for
> > testing on the SDX platform.
> =

> If you could do some testing in the meantime, that would be superb.
> Thanks for that in advance!
> =

> Regards,
> Gabor

Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>     # on SDX75

--
Regards
Lakshmi Sowjanya

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
