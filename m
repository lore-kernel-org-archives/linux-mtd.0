Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF06C5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxGwcAyfaepBnGF7icwO6m7hvCuxicNDTsFGan4bTxg=; b=mSfF4/1/BIdiLn
	F/fjN5o7yYG+vezTMt0w0m77LdpnnPYHK+gkVwnNkFd64sPHbfjjgv7vHNovl5VYnQNDYY2fgh0RH
	yXlQx1mTzwDxriLVZP8f7gtd4CcDKZKDy3TzZ2blXa4zH83IOu3S/WRwrtT2T9zRhVxVwX7T2qoFx
	rI8KeZSFR+uYBNt9TwOb3bAmW0emEX2uLkJ6QughvSsFGGCCXDul/+Xc+nGjxVRLxVRg7XYHnlO0E
	VHjvf39fdHJmzKCpN6N5yjiiyiX7DwYEza60vx5qIxPuaqnsfmBpZgK36sNaZ7pxFxpsXGxKE09nH
	BEzEb5SaDedzX5uSI+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtm3P-0000000E3hC-0GeZ;
	Tue, 11 Aug 2026 12:58:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtm3M-0000000E3gd-3FKv
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 12:58:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRB5s306845
	for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 12:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+yugsZ8lcjcvcceHMsI3X0lp
	lDOHIfYQP33LqDevTgM=; b=FfMES/WmOnX/D4IvsZMG9QtLaQOkY25HCL3Ey0sn
	PyVeAC8evNm3gpFjToCB9xpwcQennFadFri3sUCEg0fJ/oo1VR1Rz0p6Y58kYia2
	/hmTDE8Mdbsjg43DZHlilETusF0diUPsNxQnzOC6m9Vx4SJnS5KFb3o3KtQfAU2X
	KGd6d5GjXn4X7IX93f+YwmZvAy0pl5Xfk3BUqZ34OBMfkaLSOIgDRpB3lbaUsWLt
	Jw+oQLitm6TTtUaWtv7AhPlxDYZ83f283l9d33v5PDeSow/Mc51c68VLNZWJkez9
	MTAjutu/kazUhZw3+PW/2HfWCz7VvFXDtNeYWUNcMX8GQg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjsm6vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 12:57:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4708512a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786453074; x=1787057874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yugsZ8lcjcvcceHMsI3X0lplDOHIfYQP33LqDevTgM=;
        b=IT+7YCnP2q3OWIkJcmMgkoSzlTxXOsqp6yxd7V4wTaSa+ggH0Rh6T9P5APaKdAHk7F
         3fE1i2q3z/iHPjFJibfXS/qDFtjEpGxLdkG3YL+ZdNTdYzrr8Mc+MYik3/P6S/Z1+z8I
         BNpO9CKXxhUOXXXkKN6v3tGmn6FSSOC2yHcqRSDL+PwgjUHsMsFGbIM0PnQnduJ8gCmC
         f1kAN6PV7CNnV/XWNMuot7HEbA/Ce0hMEet776lZxlRCA9TM6t7KkC2roUmBc37SW+vw
         vXMU31VG5Z54tsyM1vtnEc4h3eF9zDMEiezrXQg+rONXbwy4kbMISshqOsnXkbAovDed
         bXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453074; x=1787057874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yugsZ8lcjcvcceHMsI3X0lplDOHIfYQP33LqDevTgM=;
        b=NWN7BmKzzv8/EB6Xk5687MuZibWRmdSah0A7cORB/jhA+WlGQVQIVSMNmvhQklmr2v
         5oE25f6J91LT103TBbAeW2GDCn/YPBghbDvdhOx4EEBQB/IWoDKQcQKgkEXjLBZ2WuKS
         Wvo7WFvbIJJDKyBFPScTHcBFLt5/wW6HpedGKJH39NuwsegkOxxL8+pGQTz8t1VOsgOb
         vZg81pA9VtdUKq+Ms/e/FwGNgl0yWaM1lS5TYjnjVwUpGUhg73UgLQC1gV3nZsRaM7fW
         iBs25tJWgLw+WFGTbzeA4Ln0l36VVZf68iQmy4SVejYZ8P+0zVd2xxCcB4o7FaKrdyS2
         fS+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr/OBoBJNHAxHXZmihZLd+UlQEx6DnTs3oR54Bn/6d37GpBlm0NRH7glTehpLMazyMA59ZbRg30CgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwghvidZfHO5REXtQBD3Vh/9ik+q6AI2VPOkSDknaL46G5COt1p
	wRN55qMH0gC8MqyJFdYJG8ff/yKxetL3npFhyH+JgH3PYoqoVtolz+s29KGYS+uhT6TN4e/U/GA
	ga1KHBZdIbSRuyR/4qpGXUcMWLvsfiN/V6tkseOjjhZNEv4WPQJbhaJqfTjSvjiIv5DBe
X-Gm-Gg: AR+sD132zsz7387985mjkoLN+A7e0DavfceHz2GPa6f9It2Mit6wL6fJ9W92mynBRZE
	5pnAyrACVjUlfgGPmyP1hfeachX6AM0CepFb8poC3FoVf8hGqm31Py+tuVC8cn0vtOtu25QBnJ1
	9pj1hMzYK5yBOZ8gRqkIOzHS4f84o/t5H6toa6a4Ko3g6oBpcFvSQUTx0IX1hdDQsmRUiwKxMtV
	ZCe4qYpvN4H2ecXir/RYllybdnO1WCWdaj85vvnZnEh0RCE15L1OfEQiAvzr4Lzpa8vdKTkXt2B
	dIaIOVuJRXqqxvSHPWGbrevzlRJpIPP1BOztsuzVSOY7M9dekhZmasK4oryptHHaFHrhP6gVZen
	o3iPgJJUpIy7/Kscp+FN0H2XG6/fHjPjWyXiC2stadq29IP0de64VzEX+SP6R1sPVbUEklVnCOf
	Sl7IApdoDJmnQ=
X-Received: by 2002:a05:6a21:9d83:b0:3cb:b741:2924 with SMTP id adf61e73a8af0-3cc2babefc7mr4539760637.29.1786453073899;
        Tue, 11 Aug 2026 05:57:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d83:b0:3cb:b741:2924 with SMTP id adf61e73a8af0-3cc2babefc7mr4539688637.29.1786453073437;
        Tue, 11 Aug 2026 05:57:53 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619d0209sm4828541eec.5.2026.08.11.05.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:57:53 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:27:46 +0530
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, s-k6@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 2/2] mtd: spinand: winbond: add support for W25N01KW and
 W25N02LW
Message-ID: <anscSq0A9hPL8uXT@hu-mdalam-blr.qualcomm.com>
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
 <20260807064339.1632249-3-md.alam@oss.qualcomm.com>
 <875x1mca4t.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875x1mca4t.fsf@bootlin.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfX4KQ61AT1/5AS
 RwkXxwNCc7Pl1U6fokCCm17mRDWYDXESJmlr1C+jk5SR3ZFC54YAXa1coVYslq+idN2dVmZJZJS
 uSvXhKEbtH3OkruBDv3W4OFC/AMpDlQ=
X-Proofpoint-GUID: Y7xjlSUhpMDDPnETpDLkKc0df7z9sxoD
X-Proofpoint-ORIG-GUID: Y7xjlSUhpMDDPnETpDLkKc0df7z9sxoD
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7b1c53 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NY2gu-2banxcgUrw1IUA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfX3JKbsvXbpHvB
 BH6JHT/Mhf+A78bR6zwrbg3dnJPniN2Ncrb8oZ+QXvgohGgcFo/CBqInXhg65q3zThiEEGRxBUa
 ZvENc93/0MNHGsTwsTZe/f7hXVEIflYbhjZI3tEr1/9AAKCYDurQtBywP1HB3IZd84dblOU0cRT
 z0P5yzayNi1F95Zadq61HeI4aUmfFZPDhCA0OwBlTob8PVg+YNGQT1QOii0wooViAm59s+DLhSA
 Leyzu89WrX9C4TVEWPGH0CiUZdrlpHJiiQKFqfHa4M6GR1QPLkp5TO5ZktjJ3Drj165FxQAPoqg
 KMp2MLAXK4lcQCnzMuJnhuiz5wuT3wJOxNmlDBCuDBkVrKGAu3sm/kcqqqZ2AndmqUi4t8Tzaly
 uVZ7Jd/IryudLx05gyLMbWuhK10jkXQK2EkOxo0kz4K6rJY9p06aOxyr+zIZBx2yrvug9/OI+3A
 GElyqVQi+y0rBxTtFfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_055800_838321_015BB8C2 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 07, 2026 at 03:50:42PM +0200, Miquel Raynal wrote:
> Hi Sadre,
> 
> On 07/08/2026 at 12:13:39 +0530, Md Sadre Alam <md.alam@oss.qualcomm.com> wrote:
> 
> > Add support for the Winbond W25N01KW and W25N02LW SPI-NAND
> > devices.
> >
> > The W25N01KW shares the same geometry, OOB layout, and ECC
> > status handling as the existing W25N01KV, while the W25N02LW
> > matches the existing W25N02KV/W25N02KW devices and reuses
> > their OOB layout and ECC status callback.
> >
> > Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> > ---
> 
> Sashiko raises a point:
> 
> - [Medium] The device ID `0x12, 0x22` for W25N02LW breaks the
> established pattern for Winbond 1.8V SPI NAND devices and is highly
> likely a typo for `0xb2, 0x22`.
> 
> Can you please check?

I checked the W25N02LW datasheet, section 8.1.1 "Manufacturer and Device
Identification". It lists the W25N02LW Device ID as 1222h.

Thanks,
Alam.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
