Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A9C5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 12:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9kjrsSrnG9X7bGq1Tpe8YlOMSzShUtanzsXuY5ZDa4=; b=f62Gw7Of1tj40g
	LQplmrvuD2hq0SQQ5peSIAQ8ukVDM1MD7TZrPpE8h33YVIQhO5v9RwsG6oUh5YC0j1qE+frusPvau
	UakPArpl+TB1/8PIePgHpBHQOUxos4tbfKdJCnmz8w0SaDR9V3B1UdhxDVvm25xIRFdR48VHwM0l/
	i3p8b1e0P4jvoBZ4nvGR3tNZDpglfvuybg6VhYXp+OesJXpOrnoPsUwWvymI4/b/3TRW01Y3m07jM
	tVKa8cNHtM7wyopnGrOXQGkJsyuRDx1VJnO6oQ1RBhthy6/zv1pJOirUrU8kZ8hp1xv0ySJNDJ2gr
	AChpXmLx/w7mp7AdJJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtluc-0000000E33c-0410;
	Tue, 11 Aug 2026 12:48:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtluX-0000000E31s-2aSD
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 12:48:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRF7L939612
	for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 12:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFUElQSF/+cLBrb/jNB4ej8rEJOMy7YJ0vT4gBn3MwA=; b=i4Fc75ukXJyoIhJH
	9Cm3fGOEdmjbQdnReQo7kRz8dGbQC7pM5oz+NEMR6CQQt2JcZmgAVdOxVyArJOUa
	/PFZ2IWY5Kxhb7m9Do4ybn83uHN7rIiN9H0n4V0hb9dIl7VEhCNFKIvHCBcgIJpy
	BhMsZHoZEmqPTztohk0zdtpZpuYBrZi5oPKJi9Vc5D6k0b0KW+coy3tXrOoetUKe
	Oq6tDGVkDQ1aTvxPtX59EN/TFy/JiU0YhzZ0hyFX8rgJFqjgjVdr5JKLgbDh9nAc
	c0N6Ipj5Y3hvBmtR/gFIkfk0UxvW0ZVIBxGLhEIPWp7SaRuJWZUYuOcuMOcKVK4x
	4hVNjQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfv1a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 12:48:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84fa3b14ed2so873207b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 05:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786452515; x=1787057315; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFUElQSF/+cLBrb/jNB4ej8rEJOMy7YJ0vT4gBn3MwA=;
        b=JyaW8nVj3KlhRPKrtXt5iFqAoaysUxbQ9zkQu4LL/YskTB/wtj0qMCUt3D4OQrAFob
         pUE0LcSCLzSYeTjDnBkYkz7egHLq6hEAmflRQcy4TkeC5fQDX7YaaJ2LaAd36aYx5v3z
         1NMxlVWossvpfEW9lD4uKDGpR8UZmWrzkPsaNKc+uGdDCKYm0TCXHQdLspQhfHh7KtuU
         ieOkBg4vlLsTFq3zcWFbgoDVFXUs31icUsD8911HVCybXVUhb3rtM3XdaOgerHFEnlaC
         J9r1G/aSSqg8OPiaZs53Gx05LhPCn+r7aIb8hs1Cz+SI+wR1yL8jYwgT0tg2KjBeDmJx
         WSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452515; x=1787057315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MFUElQSF/+cLBrb/jNB4ej8rEJOMy7YJ0vT4gBn3MwA=;
        b=brOVoNCYALt19sw/pjiCj0MNwXcV2raktZuQ9L/VGTQXglNjWZUyZqXmArbyL+Jf0L
         X2Tin4Vi97W2KR4rJmrGqsbG0+Te8pCn4xt7GW/LJ3XuM0OKtWYd1GwMx75WgUW+qnKM
         ojdivwdqJSwYsKGMe9nDfMN0Gkd5x5kmcwkB1idhir7wsnJRPsiaK6KMH5jw4h34TMoi
         bMgaX5zY14qj9BilHTygmv7obsZ0HR0rDIom/4FhNsv6QhF6zwvVQIUiwyUF+9W/t2cg
         ryyDOMwkc9uXpogiSFLrvgsA+aSSdjG1oL1tWaMh3O8KtQY+FUCKDenNF/EaY7mY1l8w
         Op2g==
X-Forwarded-Encrypted: i=1; AHgh+Ro0wuRruUSRNPackys/WN+UZ/0xFXVPWWNY58sSRIf3Dwns286ZvO8Or6KEtx/Q6/V6zv8U7edo71Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo3BvGJCd7FLppKqkXDZN2mgzlFzq4bmFVsnlRL7okhVWHyuzt
	UXHAfmYGgn4JKVal8vrOfBpLvMx+N0hxgxmta+2TW75NmaqWwa4Q1DwxBJrMKvnM8Kk2T3YuRIj
	4QGfytEpLbedb/cD8e0WkgxrrVBkgDpo3yd7lWxPeqI4LV+rRHT50XS2CgUB8h2YAHpht
X-Gm-Gg: AR+sD10o4HdmNSwkfKG9bGrgqAouOeSRg0KCUXQFJlOT4B8zieUsUybvYap88e1YOig
	Xkv7C0JW6zwmbS9Zg+qZ6lNAgcnjBtKNhwBNTWlrTQvHKLry0jjnIZQBq2a2v1X0ZW0nHjDaV6s
	cf3tKhScjmGjgubYNuuNAGfpL0mW2Rbz7USJuxw8TC695DkpvDdehOlBAhG71n4iqLMQWM55xc4
	1BSfO2xMCtrop5BbyjFjWGpMNCSzfDdxgSGfMomCFpl1o3KuzORZRbe5otMAXuOgi2NVRVqw0rN
	cb1rG7wFvG56HBbgDBhGN2fmy7T2dyjPu/vdph5QRFig1kQg9I9CSVZ302uZyScJsIb+2FYTAoH
	g9NTNUcjzAz83mZmUBbUAk5RLhchUuv9jbMUCu2fB2zWgupFZ/hXyjU4tbA7ugJUiqH4mtrJ/vd
	iR3KbGtUe6E/Y=
X-Received: by 2002:a05:6a21:3995:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3cc2b7cce46mr4205470637.10.1786452515197;
        Tue, 11 Aug 2026 05:48:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3995:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3cc2b7cce46mr4205370637.10.1786452514594;
        Tue, 11 Aug 2026 05:48:34 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412035f9d8sm6696555c88.2.2026.08.11.05.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:48:34 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:18:27 +0530
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Dominique MARTINET <dominique.martinet@atmark-techno.com>, richard@nod.at,
        vigneshr@ti.com, tudor.ambarus@linaro.org, s-k6@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 1/2] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <ansaG+Z6kMWBW+kK@hu-mdalam-blr.qualcomm.com>
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
 <20260807064339.1632249-2-md.alam@oss.qualcomm.com>
 <anmLsPcXRk0VAQSW@atmark-techno.com>
 <87mruuqh6f.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mruuqh6f.fsf@bootlin.com>
X-Proofpoint-ORIG-GUID: 3DO-VTEpCP3xdikGtn1ogNi88o6PPjxp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfX4rXGC3PZZ7BG
 yF1ftc3N5ez33WY20iGSpSGzkHJJTHMuodCfL37Emr08AISgP1qtJJQJ0P9fSFG49vaVZzxIFzx
 2OVQBjbgkoy1n7D9UCyyLg9eCIl/k1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfXxp0FVwqYIJGp
 y5oFtJ7QMbFuydgu2KL+jqVfArFB73nithdIxQqLoFATLbfhGKNlXBlXOQrfgSP23kWQ+48nSn7
 uM1ibRS7n05F7iw1YHEiy0MeaDkVPguo3jaihNVvtRqaigiaCQQJ/gE5xV5OK5AOEL7u6C/ie8O
 xhFUiWL70Olou5cB91kZGYQs5K7aHXbsjXOZewv1TR9urZZqgT3BcF6NuOmAHvT5emNm3yHWjk7
 iGIQioq2z101UrHoCR9h2pii8CRVMplriE6XFAsqHnK+29SHkZG7iX4l5JBJ1nLhrFM5ROetpxB
 huCC81EaiRpToHkk8JieE7dzxY6U712LEh4Drm5wyELciA1UA1kFlzPPdZUK1RqBa/XvcCUK1ah
 KrpGbUw5FX8DEuKL9r74x4DEFK1qd/JnEq8d8quvqdzDpJhasGOvK8UQlyyrzh96KLFsLM8/kNT
 bAWb/bZuMSkYh/zdtlA==
X-Proofpoint-GUID: 3DO-VTEpCP3xdikGtn1ogNi88o6PPjxp
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7b1a24 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=lLZmtIKjAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=ar1VmM8jAAAA:8
 a=Q3Hh8UE4-bdW3S4IBIkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoOABgeZipijB_acs4fv:22 a=q5Nj8NTjyn2D8kUwajRn:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=rFd2LkbIa9bXzCDub527:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_054853_797619_E89B2211 
X-CRM114-Status: GOOD (  31.75  )
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

On Mon, Aug 10, 2026 at 02:43:52PM +0200, Miquel Raynal wrote:
> Hi Dominique,
> =

> On 10/08/2026 at 17:28:32 +09, Dominique MARTINET <dominique.martinet@atm=
ark-techno.com> wrote:
> =

> > Md Sadre Alam wrote on Fri, Aug 07, 2026 at 12:13:38PM +0530:
> >> Add support for Winbond W25N04LW 4Gbit SPI-NAND.
> >> It has 8-bit on-die ECC and a 4096+256 byte page
> >> (4096 byte main area, 128 byte usable OOB once
> >> on-chip ECC hides the 128 byte parity area),
> >> organized as 2048 blocks of 64 pages each, unlike
> >> the existing 2048 byte page W25N04KV/W25N04KW parts.
> >
> > This is pretty good timing, I was just looking at sending a patch for
> > W25N04LW myself!
> >
> > I agree with Miqu=E8l that your patch looks odd, you wrote
> >> +		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
> > but the erase blocks are 256K long so it should be
> > +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> >
> > did you actually test this device?
> >
> > If it helps, the datasheet for W25N04LWZExx / W25N04LWTBxx is freely
> > available from digikey here[1]
> > [1] https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/7182/W=
25N04LWZExx_W25N04LWTBxx_RevD_2025-08-05.pdf
> =

> Thanks for all the feedback, Sadre, can you please propose an udpate
> with these details and changes?
I do not currently have access to this device, so I cannot properly
validate an updated version on hardware.

Given that the current patch needs the OOB size fixed to 256, and likely
the OOB layout adjusted accordingly, I think it is better if Dominique sends
his tested version. I am fine with him taking over this patch.

> =

> > (And it also supports continuous read, so I'm curious to see if it'd
> > work with the recent continous read support from Miqu=E8l[2] merged in
> > 7.2... I'm not familiar with the subsystem so will need a bit of time to
> > plug all the hooks in properly)
> > [2]
> > https://lore.kernel.org/linux-mtd/20260429-winbond-v6-18-rc1-cont-read-=
v3-0-0f38b3c229ad@bootlin.com/
> =

> If it has continuous read, it requires the flag and a hook to
> enable/disable the feature. The existing Winbond helper may already be
> enough for it. You can test it with a recent version of mtd-utils, I
> added options to nanddump, nandbiterrs and flash_speed for that.
> =

> If Sadre dooesn't do it, you can propose a follow-up patch.

I currently do not have access to this device to test continuous read,
so please go ahead with the follow-up patch if you have hardware to
validate it.

Thanks,
Alam.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
