Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9023CC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODpLNIEXBB30+4UWQjcvet7vIb9x0NdS1Mh5Tm9Q29g=; b=CMxHsgcbrk00D7
	l7/hSqePyJhfYRHj7sm3C3N72IxYsl/JxR/jd+XhBly2wuEZnxc0qcSwpIQKoEPySZlloUlpXzMBS
	4ezmNulqAchFq80YR/Xa08KncRaRuZZHV49DD16uU8ok1mkxJj4J5Q86XfaDESwgiSq01jHEB75Bl
	m2hhueA0c9ZjAI4N887AqTaSoJRI3fW7Qc7KdZ2XDHn0ADdpKPMiey8xxfKkRjMTdo6s+c81JMjOX
	XvtmtqBV8d4mImwgjmCZI7hKlLyGMzVTjKSfDorAoUwY1rW7RTOVI5fc6fYJPUIVTVJ5CC1BKkyrZ
	FkeDs8ufAAq0wBikCqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNEx-00000000XzO-0Osn;
	Thu, 15 Oct 2026 15:19:31 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNEu-00000000Xyg-01fG
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 15:19:29 +0000
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYB111419298
	for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 11:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QhSf
	4ZJfy8rNmGXFxMJd1R/8liOB33/pGtpd9UpP1zY=; b=pYz5Qw/Jw4V0YZEHpRS8
	tYGKcwrb9gZWz3zBlKkFyWpjmv0iY1vvE+PblJM8psToj9jFHMS82TZybG9K9o4p
	NG4ns1JYr+nU73qnT0Y0FTWJfK4OCw9s4iRpc+lnQkmKNjbQSRQNikd4crWGcE2U
	QeVHgBIUl3P9YjHiENOXCArfCX3plg3AOglhWSJ0IWuNoFfX4FNS1aPeBq0SeZq7
	hbe2NeHh/CqN5LY1VVQITtPFMlW6FB71QRuM240A7CmvWqZcM2agVKjzrU7xN4n4
	oXhca1yYXtQtYN2MndKQHbqUhZUu9mxNXCarVcbyztUavXlAG6GFVTKk2Hyl0ONl
	zA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hagkhnmwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 11:19:26 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46b4b700so283075885a.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792077566; x=1792682366; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhSf4ZJfy8rNmGXFxMJd1R/8liOB33/pGtpd9UpP1zY=;
        b=TNVy9Nuhs5iZWIn6vqKcNhmwc9sJUTJ6Ud4jGyOtS85CPB7MgbNoWhZo8GomzY6FFl
         KfKc23Xu96zI5XU5DBbtDvtDhSvYAp/Fp50RgHULX8A/TbE9c8c5jgUpfoJrTuAOKmPn
         /KB1xRb581FUFkSSXXJCLcHRU+CyxNQkv9cVAdhetRKojIFZqzyvKrzAxukxVbfnINpj
         /bnh+oLOWxU4Qv2ajmiENUKmw+IWizEwj6amWVhCvysNX3m+fd3x5vMnZ9XGHor9SE0g
         nUaAefTN0YCJR88xblW4DOx4WxKM3kW8ASIQHsqytKGpGijP05f/phEV5p7Uz3ycqOcs
         3McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077566; x=1792682366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhSf4ZJfy8rNmGXFxMJd1R/8liOB33/pGtpd9UpP1zY=;
        b=cVW0VtNX8MBAdh1+3Zp/7rlug5irxJN7zYnOX7F+v5a+5BPnMDv3NeMHZsgYtQ5b5t
         +puw964/orezBAkbAgLxNF7KOap8MVXD0S6E26zblF5HSyChW+hEuHEyONWEh3JqcNcQ
         EkpAB+ZCL4QVQ+vbXXkIbdVeJlnl1hewDP7PVjzzu1VHHQvrfzM1qSUTBkYpesM+KSEt
         A71IncZOX1A8ZxEfsJNDGliy6Gwv7RMKGqo4OpT7YpYa3WuKZQKDBDKl61W4lv7fblKQ
         Tps5pwLux2VRwJbmbF/6g5O+FUyGluinWBLLAr/308KieW5bz0+VfSFkBc3nloEfMv6j
         Tt2A==
X-Forwarded-Encrypted: i=1; AKwUvBzr7YoaEauFgFOf2liry9F4JZYBkaJ/Le9Cni1z9XRDDyJ6ezueKEsqQs6iipCpMrj+NQKLTu/VMpw=@lists.infradead.org
X-Gm-Message-State: AFq9FYJl/G5YhhFJpdfLn4PQ4j2Iq9zqLNe4S7K5ETfDLyGHwu71fbuw
	JI/9HShl+QGeYXKhdYoHSGR6XiAxuNxUxaopiLJ861PW+G3n6hiIX+5W2ksblZN4MN0+4d5BYVf
	Y3DHa3US8Nd/Rgyj6NF0stTc0cpJGLcnYTH77HvMPxOue4JcoBDdzGhZS+cOxzwI=
X-Gm-Gg: AYBFou0VvZtGkV6o7EXAtvGiE69eWYmQscmhd3jzHyiWR83BjG3I9XytZYQReJIhd+p
	3oqairnKODsWIbsFEA5D/Ys1glwcdvrszC4XtOFlBhdnNY8fFBW7UQiMfohg8yoQBCp4qGtgUXo
	Jvi335XpxBgd6jGB12vmBG2vlX5gE+HnojwUD1dyZjkXa8FS9XBGcVr3M2vVAxO9y/F5pzlAqCX
	qFziaTxQfsEF7Tz99OGOvVbDAqA7CDBYoBZKhnH6pplJN4EYG2R9nmY10+iru4Q2deee9eRQi5b
	WiyYVHlHn0Afb5Cqkb+b+F5bjJUHxmmyDBEaKPJ5hIR+u2eYGTmDyVEYN0kxtOceXYh3loG/qkB
	lTs98YGCv+cx/+m2/MHtZRMIiC6dYiIyHg5KAxpMiBGH6iw==
X-Received: by 2002:a05:620a:270d:b0:93c:2c15:e508 with SMTP id af79cd13be357-93ebd20e626mr3244184485a.45.1792077566244;
        Thu, 15 Oct 2026 08:19:26 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93c:2c15:e508 with SMTP id af79cd13be357-93ebd20e626mr3244178885a.45.1792077565752;
        Thu, 15 Oct 2026 08:19:25 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4f4986dsm798204985a.2.2026.10.15.08.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:19:25 -0700 (PDT)
Message-ID: <5ec61284-3ae9-4875-bba3-932cbede14b4@columbia.edu>
Date: Thu, 15 Oct 2026 11:19:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: Joern Engel <joern@lazybastard.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, sashiko-reviews@lists.linux.dev,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
 <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
 <sashiko-outbox-172225@kernel.org> <87mrsfwck3.fsf@bootlin.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <87mrsfwck3.fsf@bootlin.com>
X-Authority-Analysis: v=2.4 cv=Upr2pOwB c=1 sm=1 tr=0 ts=6ad0eefe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=VwQbUJbxAAAA:8 a=XB4ytFqntYz9O7eB9cgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8pN0hE1j-06-7jX4nNwwVcCECFOTFdAK
X-Proofpoint-GUID: 8pN0hE1j-06-7jX4nNwwVcCECFOTFdAK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfX6SjUhzyIWJks
 vqb7M3B+s+/q8RQ+ZV64nTRTNYc3Fkpi0l2ygas7pz/IPew/o05tUbCnNP/GS+Uo9VFSjgZq+BH
 hTzu2ATD4EKGAu6ViJZTPvNi8q6Vyw8gMYEBq6kAYDTOnihiO+fz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfX+ANcsKuWqIdy
 YCXcCL6u0EzLUi1lYBkiwR1fV6+7G7Lv5s5FVu+Njj3tKZD7exPXg1HCna63V9M9uFlr9D/VdK1
 gwl5MKVjJSjvdKAr1dPv+sOuEhlYC/vsmZXEQ/3ArCN36jeQqtCrgqgXYfsIy976D4f11d5dUnb
 fRmky0zSZhZVxqL0Rm6SNs9sBHmvoF8LtJSKiTj3nlOjR/lbYO6x5Wqhqrb/O4qJr+56DTTgbq2
 F+c9xEsQHO9Fe2gB4BZFNyNW7rHY7d19YbezzAU03EkRrCdbyzmZgOD2F1f+cyhKhqI+gxYz1iW
 SIF4AX7d/274akxsiQLfXlpf5oS33XrA8dx0mu/i+5TVg5DEDXQQ4zfR9ZJ5WMNsvqiP7zejf58
 7VepMM9E+TxKhW2/ugK29+W1rrJlDBKLKLVAJZ3QWF9HUTgjVkllkeTLHc9kFsfp75ZqbuMGaI0
 vC+urt8ctNbONWtw8uw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=10
 impostorscore=10 clxscore=1015 malwarescore=0 lowpriorityscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_081928_159324_980A74A1 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTAvMTUvMjYgNToxNCBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBUYWwsCj4gCj4g
T24gMTUvMTAvMjAyNiBhdCAwMzo0NTo1NiBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cj4gCj4+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2
aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+PiAtIFtNZWRpdW1d
IG1tOiBtaXNzaW5nIGZvbGlvLT5tYXBwaW5nIHJlLXZhbGlkYXRpb24gYWZ0ZXIgZm9saW9fbG9j
aygpCj4gCj4gVEJILCBJIGRvbid0IGtub3cgdGhlIGZvbGlvIEFQSSBzbyBJJ2xsIGxldCB5b3Ug
ZGV0ZXJtaW5lIHdoZXRoZXIgdGhpcwo+IGlzIGEgcmVhbCBpc3N1ZSBvciBub3QuCj4gCj4gTWlx
dcOobAo+IAoKSXQgc2VlbXMgbGlrZSBpdCdzIGEgcmVhbCBidXQgdmVyeSByYXJlIHByZS1leGlz
dGluZyBpc3N1ZS4gSXQgd291bGQgcmVxdWlyZQppbnZhbGlkYXRlX21hcHBpbmdfcGFnZXMoKSB0
byBiZSBjYWxsZWQgYmV0d2VlbiB0aGUgcmVhZF9tYXBwaW5nX2ZvbGlvKCkgYW5kCmZvbGlvX2xv
Y2soKSwgd2hpY2ggaXNuJ3Qgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGhhcHBlbiBoZXJlIG9uIGFu
eSBub3JtYWwKd29ya2xvYWQuIEluIGFueSBjYXNlLCB0aGUgZml4IGlzIHRvIGNoZWNrIHRoZSBt
YXBwaW5nIGFuZCByZXRyeSBpZiB0aGUKY2hlY2sgZmFpbHMuIEknbGwgYWRkIGEgcGF0Y2ggYXQg
dGhlIHN0YXJ0IG9mIHRoZSBzZXJpZXMgZml4aW5nIHRoaXMgZm9yCmVyYXNlIGFuZCB3cml0ZS4K
ClRoYW5rcywKVGFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
