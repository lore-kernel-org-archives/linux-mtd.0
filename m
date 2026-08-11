Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F919C5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 12:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcS4s16b84wglzaVJyhKGTYIlzXWsrlDmbU4Kz73/h8=; b=yxgNvAy38HO6jA
	C5K6EmmlAXyIjoXNsLiWAt5HEh57oXDza32s/VQuByUMqqm4ci5jupZ06vQX3vMSE8K29PTBtKgIK
	Ug5a7b87NN0YKy0h0p/vmVASMrbE/cYP/MWOj8jfSA7rqYDGT7nHdjeEeH0jPbMYeqL/pjC2y/VUO
	97khuZVMfYvRrIH+KzxBFUUySLwB7mwbzZhV4RvYMFbZO1m2+dVG99IBjEWWyTP1jgcfqyj2y/UTU
	vVZJPsEJCFHRSehNLDl2Gn9X3qMbZXozEyMknmgDIuv7oLVTgNLeCiNbKoHyvvdQGV2vIZSKMO0eK
	3uOTE6osuuNaeTQwm7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtln2-0000000E2Ve-0g1O;
	Tue, 11 Aug 2026 12:41:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlmw-0000000E2VD-1CMS
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 12:41:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCR0LR618230
	for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 12:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJnYSvYfU7LxnA/XyzAaPB5ddQEKobczktNxC+wMcRc=; b=J+2VLHJdNcIWe9UX
	eXRgif1GHpuRXrxq262yzgNM4COtvGoOPYpxShXElnKJpd2LoManSOkmhpTSW4Wb
	vrDQOLDmnwNjDM0NO8VM8jtY1gUH5iJpuGPK5uTehcbKU24lWx9wfusgCAAHXzJA
	whC0/YO4VMNOoud5EkOdPpsxnik77SOc4I35F6pvIX24QsP8LDOD6C0atF/B50ZF
	n5BHlE3YLKC+8YsVw5sZb+IHPNHrThXcwq4VPlU5O64ppv3RPxpNh7I0GTxGI0RO
	Bk2vIP/XTRPa11i4yNnerdbTcF98uvrUDWq9aaSVwRCp/0rKlfRsZVUCrY5GBlX3
	7K4c9Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q10fqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 12:40:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3761287a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786452059; x=1787056859; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJnYSvYfU7LxnA/XyzAaPB5ddQEKobczktNxC+wMcRc=;
        b=eK8jTwipF1VsypTbu4PmFo7/qRg61EYLiPbwM+D9EXQE2xdH1Ed6cnOw9UiOzO4DFh
         KTtgw2TaPzcm0uZje03fLjGOje5S3WwohABZ3ejlHAzVhWk1ZtJG5rK89fzKFbgFGaTw
         NdzNI3ylqIUk1ZqAFDdBc+72GSowr9K2KFgwyN5bHcjhEHYOgXNGcGi5wRhQfVKtMg0o
         W/u51lDFKU2kxrl8tqfRiRqRKI8EtM7aaHOcQ4apZi2fK/xm2AJcyIdmQeXiKvWmyPWn
         Y+CYJKGvl54L43MamojStuXEizzmfnE2M/WEPNm1SDMpoDx/2ujgYgbYU1JnZq9upW+K
         T5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452059; x=1787056859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tJnYSvYfU7LxnA/XyzAaPB5ddQEKobczktNxC+wMcRc=;
        b=jnchQjiE/63no7B+rHmHRK64qVw5bJqiqelsU/gD9l+PXKDYtCfgKr3p3tVPXx966c
         wz2AsFfT0aJPw/uX80HXZT01hZPz4/McO2rUiYFVNJmSOFgKqOAkRrqqZjVjFyjuMG+T
         xnvZo4vt1kNQ0HqD/gkBx0Yb3CpFlDpsjaYhJ+Wym/f78zPZiNv0+cxigzlCfyaePlpG
         Z93V4zHDlZBc12wDhGe3cHp7EvAE3yjGMgImWRl7JHkmpMEVNzBaf+L6ivN5bf95OfeJ
         UnIokcFs8Qow4pVnlYjziQ3u7ndP+TEN4UHmeKZDkFa0YKVLJ7YvgHhoKM1tFYUembmi
         FWEg==
X-Forwarded-Encrypted: i=1; AHgh+RofWau+QVxO04lgb73odyBDMYEfCsbPS9YgudsXdPkFxgWV1GBSSwlhSXCGl3SE2xybYsRwF8nz168=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEjHAtDWEkuKdRDMOqP0ur5VSX9Ma67UXu2Tm6QZjEHfT+GvFD
	k7peEbBec/09MJHBi0Po9LtdaIwBojysPqtvUT2NVkpeCKmx6Wf55u54Ip0fF30xDGCAca8aVD4
	GCBlDwNOmbnv7ADSEADLkVRnmHVLrX62IzTef2TNenuSq6/TJRYsmxqKahgDsSC6x7mjJ
X-Gm-Gg: AR+sD13krJogogb9LwG+GDpFLUB48GY/U9zGe+/+8XQHwJeEp3u8ietsLZa739s4V4S
	JQZ3IO23MNfsKHYz5S3ekP6rR7ZZfMxDpYddcbh5PpQ19VQanXw1TSMyg+OGHAgX7B44MxK33XM
	OH3VjBh8nX0/kDNZVyDckas2XO2T6uwcDkRRG6whET5kM4a4QC2pYxptaVGr++SzSSDDu7+NhBs
	K0rEYSLPXBhm4kepowlI71Od2+0b4Om+j+PtJ35PFQq1ypBpaSpBXr0MvL6WU5zdAX0ZqE0ZbCr
	tDNSJ58IJuJjSVKDUugj3GuEUeckXvlMpr9ZbRj89tdPlC/0sM9UKTXvhU1tYPnM3TP1Mjbk8Qy
	uN8ThZN623y9P7JssF9XJansVQtcmLtiLHltaLHzoWO0XrHg+sv//gngDqi1jVfdvLrIjBkjtnx
	nZpiwugZxu1SQ=
X-Received: by 2002:a05:6a21:1b81:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3cc2b853809mr4120372637.14.1786452058609;
        Tue, 11 Aug 2026 05:40:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3cc2b853809mr4120293637.14.1786452057976;
        Tue, 11 Aug 2026 05:40:57 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c61cd491csm5392299eec.7.2026.08.11.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:40:57 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:10:50 +0530
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        tudor.ambarus@linaro.org, s-k6@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 1/2] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <ansYUoNKJyDQ+6f2@hu-mdalam-blr.qualcomm.com>
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
 <20260807064339.1632249-2-md.alam@oss.qualcomm.com>
 <anmLsPcXRk0VAQSW@atmark-techno.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <anmLsPcXRk0VAQSW@atmark-techno.com>
X-Proofpoint-GUID: C0Ny2_FdVNfok9QjgSQa7_OTPKCzIbvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNSBTYWx0ZWRfX7RGDIrbd7gu5
 2Q6weJs3NLnLi3Pk3SdlgqzTv+AdavadN6wTXVNmkY++hA/BuHUg4WaX0qQz5SEd/WVHm/DpPo+
 0eTLjWTzjAu434I3rjn6vuczgD8oPMtxYwE6oF3lK/HAaBkV2omg8uI90lDMbQcibWzeN6DwKqM
 hhJSz8ISNVw1bA+oVnWMnN4PyBXmeIsjRBH6Y62h7AWsql1U4VNjcFszb6LCQFSGoyyTIktuhLA
 btHyw8oVijE+s732h34zniEe6j1sx8Lz4yGsHYDGeBWUwxX42WlcoFVXAMRlN53ID8YxRf2iwhp
 nKOqOxqYH6AcHG1gpgYEgdw4RqS1xSHa9leBM6jG1Nejevj318s7xLK9afvcz9B4y67Tz7dFMbu
 Mc/2nnv89VpZN6pWow8qz/g4E06DR+i33CgplF1s8fNEWTSnYtYq20lPAOvB4NKFgxqpbEFsb6X
 WfBvPTDwU7X5lLfLGJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNSBTYWx0ZWRfX/N1eKZ/nNpTW
 z1MGaOkzMXn9f2qQSSrRid9ay7UeYZvO4DXeChk5tzhZN5tlqQhsLy5EkHF2Or18ispNRI4hfkB
 PIEvXzuxpLo8UpHuaVxAQfnBXwcgduo=
X-Proofpoint-ORIG-GUID: C0Ny2_FdVNfok9QjgSQa7_OTPKCzIbvA
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b185b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=lLZmtIKjAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=RZJGasmsuR9KREMzlRsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=q5Nj8NTjyn2D8kUwajRn:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_054102_442192_A4649E31 
X-CRM114-Status: GOOD (  26.67  )
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

On Mon, Aug 10, 2026 at 05:28:32PM +0900, Dominique MARTINET wrote:
> Md Sadre Alam wrote on Fri, Aug 07, 2026 at 12:13:38PM +0530:
> > Add support for Winbond W25N04LW 4Gbit SPI-NAND.
> > It has 8-bit on-die ECC and a 4096+256 byte page
> > (4096 byte main area, 128 byte usable OOB once
> > on-chip ECC hides the 128 byte parity area),
> > organized as 2048 blocks of 64 pages each, unlike
> > the existing 2048 byte page W25N04KV/W25N04KW parts.
> =

> This is pretty good timing, I was just looking at sending a patch for
> W25N04LW myself!
> =

> I agree with Miqu=E8l that your patch looks odd, you wrote
> > +		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
> but the erase blocks are 256K long so it should be
> +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> =

> did you actually test this device?
> =

> If it helps, the datasheet for W25N04LWZExx / W25N04LWTBxx is freely
> available from digikey here[1]
> [1] https://mm.digikey.com/Volume0/opasdata/d220001/medias/docus/7182/W25=
N04LWZExx_W25N04LWTBxx_RevD_2025-08-05.pdf
> =

> (And it also supports continuous read, so I'm curious to see if it'd
> work with the recent continous read support from Miqu=E8l[2] merged in
> 7.2... I'm not familiar with the subsystem so will need a bit of time to
> plug all the hooks in properly)
> [2] https://lore.kernel.org/linux-mtd/20260429-winbond-v6-18-rc1-cont-rea=
d-v3-0-0f38b3c229ad@bootlin.com/
> =

> =

> FWIW, I've confirmed it works with the following diff (at least up to
> the point of creating an ubi volume and booting from it); happy to send
> this as a patch if this has indeed not been tested
This device was supported in our downstream tree and was tested there. I
picked that patch and posted it upstream assuming the configuration was
already correct.
The `128` in:
NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1)
was my mistake. It should indeed be `256`, matching the 4096 + 256 page
layout in the W25N04LW datasheet.
Please go ahead and post your tested patch. I do not currently have this
device available to retest the upstream version.

Thanks,
Alam.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
