Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5271ECC6B1C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dQ6vi6n8lsFa2KoUh4qmlOWVFTE7hI3gu94w8Qm+w/g=; b=H+uWUZfnMwdr0I
	TEUrVAnYdxFSv4RpUJpT6DC2uYwtYZCaqNPPNPke1nYFTxGmKFibEygAppabkfBysVhUz/iexDO7b
	0S0/jl/X2ZVy5Qz23VyXgCVPnyw8G+jrFaC144TQV5GDIxhdc0gb6fRZ2PBITMKuqwzXmeXahuMh9
	uaGzILsTeEuYt+iALSK7cy0J99lJkLVDyO9EiDjk3gvCYAbHjAWcPbquVa5agcOmFUfg0XmToL+wb
	PFUOnsoH2mFo2yF+Io2wmo8I8Sd0jGNoa3eRu11g7g7UqsXxykpQlAZ9cwCu2Rc9gGPY668v4ICzS
	sjqIktSIRSsxT28jHKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFS-0000000Gk4X-0qZ2;
	Thu, 15 Oct 2026 03:35:18 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCFP-0000000Gk3A-0Umq
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:35:17 +0000
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2Z8j8718131
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=f88LSk6Ne+o+/j4cy/0ocdwBNO
	BIL2DgvapGrRJzlgU=; b=iIu/Vv1yZp6ayMTYpb+LNeooVU+gYR3PROSpOtGd5R
	/b3Asl1J5S6KUuEq0gsNdpVQqAWI6zAmXgPkufERhvHcs9gMkYeYzetYKBZZ/8g6
	hZKOvFODsFkXZYjMgguHwaFLvHEwFStzwZkRuTu4n1r8P7Lw13jykFg/QNFtgv1W
	VDKz06FKFyAPgm/T6gviaIejTw+gQKu1Q6/dgplKiX9n+v2hDCnP1bcPILMZBbeI
	kvTDKNV3QtYTnqCcX61SMQHX/Cody+4c+iQHdOn3Lm1TNE16vX9V73Mv/kUQLl3P
	VQWNLjsiMYot2bbb8Km3tA9X6iaq5eBEXuQU3RgNvuSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hae15usae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 23:35:13 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106fce784dso121315306d6.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035313; x=1792640113; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f88LSk6Ne+o+/j4cy/0ocdwBNOBIL2DgvapGrRJzlgU=;
        b=wKmDqdF2UIxk1Ajny/XllrfyJY+Y2nUfE8RgWUi/WMzQat5PQ9n5tPSqyG553mT8jB
         g6ufk9b3OUxs3TN9LP2MV5gy31WX1FTkitsBZpyRTC7BI2Je6FOdJtW+ZqU/exmzfV+N
         Sx/Pu7n3cxsfbqOcwXqa0MWa6ewCX2im662PLXVe7FdtvBIj7Aj4SJplIohxgVvCWd0h
         IMgJr9BmGcPTAwWQhA9Zn4KVP9TciW5rZjqmtGrrmzGEnNO1br62cVF3I6hL9YXsV0Ht
         uA47D+UstZzm7WVKmMlvO6yCNVX6PB6GNEe+B/Tt+xHiGP7RVngGPZPhFJL7rYQoKA6R
         n8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035313; x=1792640113;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f88LSk6Ne+o+/j4cy/0ocdwBNOBIL2DgvapGrRJzlgU=;
        b=utPoPlUsHdLLEec/UcWU1PjDXf4I93gdwN0FWmChsi0M5yolgdgoYydc9kh5oY+7H8
         gjIzDrCcZgWvZg6WT+rDETjvvfriMD167oF+WlTmXIHL3+6NtqIJaM0De97gaKt3KWTK
         AjHMEy0OhzGAZGLrjZQCuxCVQPzvr7iSPTHPpP8RjrDZMhSurkzuDeYZy2tg83Bew7PL
         B0IReYrpvZJW0nFpDMUozMicpLvvqzuCHagErzGmtNMoQ0MzATiAg+Mx11uKrVIt/3b0
         bcgBnyrBHwj1mkblN6R/5pxlyghthELa4JXrQuoVp/oLPV8m1QXegObub6UtjIDtmOp4
         RGvA==
X-Forwarded-Encrypted: i=1; AKwUvBy/I/V1kWbi6aVVjX8p9PtnfRivAOPUBm/R0eensWmCmFEqjN2Ja1Iulbs+avZbvO4miWgs+4HRvRw=@lists.infradead.org
X-Gm-Message-State: AFq9FYIcRO+AxY9rwN+xyRNpMKNw7aojYZqTUXiBUe3Ky+EO3rMKaAdB
	2f5cSp33HXRD5JH8XVQO9vDNE/r3uP0mf8swCtdGl8zUdAGxNurVZWW05qjTB2M974kD2hAwZqU
	oHXTovhbotMxB/PuJK6ULE2ss58gmyEPMy59qjmlrC9vxlVA0eqTyrf/2zKI45hgE1BBYG9s=
X-Gm-Gg: AYBFou2yhjWuxrM3DygkBd2X9qmguj6WquRdTCkftrxwnyJ+HEx5goPpSUhnutj5eIj
	DpP/bd9DuMPXcI7y2ERXTGRBLOxvrAbC/aaiJKGcAgeJHUm9ej93WoR2Ah9E3lIpAqp8Ni1tX2C
	cuNIzwXZD7XKYGIQsKpwfzOtR3ohEIyrc0xsP2VfE6dub/i9Rz6PFETHfA2Hj8jOg4i8f7pkk6y
	3Sa8vh7b/X9zFmhtmCS1MKbrSSoCO3EOAbut7ocUrvr9JTa8UudqVdYW1i/Sl9GMxF+zHqgPwkl
	VRMw+NsymHkzY+S1IXAzh06KVw8aQfD5YC3ZT20Fk7ZKNl3HK8hdA3LTq1zBDN/OpxB2vP1D8h4
	YIo/uX9ZSf+Fv2oxqoOirD17Z7KcsYcOeS+IGlHtWjCMb
X-Received: by 2002:a05:6214:5712:b0:912:517b:84a with SMTP id 6a1803df08f44-91b55775e42mr292933926d6.46.1792035312839;
        Wed, 14 Oct 2026 20:35:12 -0700 (PDT)
X-Received: by 2002:a05:6214:5712:b0:912:517b:84a with SMTP id 6a1803df08f44-91b55775e42mr292933726d6.46.1792035312438;
        Wed, 14 Oct 2026 20:35:12 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:11 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/3] mtd: block2mtd: convert to folios
Date: Wed, 14 Oct 2026 23:34:53 -0400
Message-Id: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN1J0GoC/yXMQQ7CIBBA0auQWUsCmJLgVYyLMh10FMEANSYNd
 5fq8i3+36BSYapwEhsUenPlnAb0QQDe5nQlycswGGWsVtpIHzM+zLMtMuTIWTpEb+3RoZpmGNW
 rUODP73i+/F1Xfyds+wZ6/wI1l6s2cwAAAA==
X-Change-ID: 20261012-block2mtd-folio-9ccb6639c05a
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=3557;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hOCqmxgVk/qTa3lsW2aUFBSKne7SOjI/m0q3TykeKXg=;
 b=QgOlFYCVeis+h80kVC3YvfC9ICKVogqhiAwYEf500tCClHwQXEH/lkoQHs8PArRfMhrNajxlN
 kYla1X2eMuRCCMopzqMdrT3iASum04zmr5AQJ3ipHMgwi7R/oKzrTll
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfXwbUUJYwxMkNx
 WgSuxqLSHRZhHSifavCaraS18JVE/hke70KfoBnvynShsioibAsovOnSv0jRGGA7+riYDURUN5c
 DB2jS8LGBGUtfEv1xfUBj6qtU/YoBLsVmHkZ6Os3FG0ohbazxQov
X-Proofpoint-GUID: FBmiE00TOtrCMKAfKn4hYG6q0ZzXBD37
X-Proofpoint-ORIG-GUID: FBmiE00TOtrCMKAfKn4hYG6q0ZzXBD37
X-Authority-Analysis: v=2.4 cv=SZti5fRu c=1 sm=1 tr=0 ts=6ad049f1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=YYjpweBLZ1UDfrqZPjIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX99ZOUEYgghpu
 FgwBjDF2mW3tQBZLJLkINLCCiQM3yMRAA20LwNMqCWbHqSzpYkRkiVVDc1whG2+VXoanx/yVdm8
 idsgZPmWbtHTU1IKl5RPk1uz2oI6yx2HXWyMEiFJBUimEM1Y3+mDzS8NgnpVOm66qOqnqjErQYj
 1QD7rLdJW7rWbsCk9mRhjTDlthlvoZWKN6nAnWkJOB57z2EfFynyOZfYgOSTS8eepIh55ENZzBa
 V9ODv0HWHDJwm2bQ8CMFIluQy/KkSqEpcvAHFtxAw7QDd5mj4C/ATb5sRIRJWs01wsfMLF+8Plu
 c0Njl3BO2jmiDG5c49LYL812xzAwxk6J03JTwI3m+6PpOZjdltZ+IjxDZdZAw5Ul/4hink8kW+E
 7jPnbcNvpQ//vCaVmYT3p3ZMUo9dfLMGVMIQw88SQI057+jBWHBsbU0USwzZpM5B45HCRM/hVjc
 rwLCChS4D5RkMJrnNKQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=10 impostorscore=10 suspectscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_203515_284264_F909FD90 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

block2mtd still goes through the page wrappers around the folio page
cache API, each of which hides a compound_head() call. Convert the read,
write and erase paths to use folios directly. This removes a
compound_head() call per page in the read path and four per page in the
write and erase paths, and leaves the driver with no struct page usage.

Tested on KVM with the MTD test modules and fsx/fsstress on UBIFS with
no errors.

The numbers below are from mtd_speedtest, in MiB/s, by folio size,
except the last row, which is from the MEMERASE ioctl:

+------------------------------+-------+--------+---------+---------+
| Test                         | Folio |   Base | Patched |  Change |
+------------------------------+-------+--------+---------+---------+
| Eraseblock read (128 KiB)    |   4K  |  12545 |   12863 |   +2.5% |
|                              |  16K  |  12998 |   17229 |  +32.6% |
|                              |  64K  |  13009 |   19135 |  +47.1% |
+------------------------------+-------+--------+---------+---------+
| Eraseblock write (128 KiB)   |   4K  |   8773 |    8063 |  noisy* |
|                              |  16K  |   9529 |   13448 |  +41.1% |
|                              |  64K  |   9636 |   15934 |  +65.4% |
+------------------------------+-------+--------+---------+---------+
| Page read (512 B)            |   4K  |   3332 |    3501 |   +5.1% |
|                              |  16K  |   3332 |    3462 |   +3.9% |
|                              |  64K  |   3330 |    3479 |   +4.5% |
+------------------------------+-------+--------+---------+---------+
| Page write (512 B)           |   4K  |   2001 |    2054 |   +2.6% |
|                              |  16K  |   2000 |    2059 |   +3.0% |
|                              |  64K  |   2001 |    2064 |   +3.1% |
+------------------------------+-------+--------+---------+---------+
| 2-page read (1 KiB)          |   4K  |   5262 |    5436 |   +3.3% |
|                              |  16K  |   5292 |    5327 |   +0.7% |
|                              |  64K  |   5312 |    5385 |   +1.4% |
+------------------------------+-------+--------+---------+---------+
| 2-page write (1 KiB)         |   4K  |   3635 |    3712 |   +2.1% |
|                              |  16K  |   3650 |    3725 |   +2.1% |
|                              |  64K  |   3665 |    3768 |   +2.8% |
+------------------------------+-------+--------+---------+---------+
| Erase, blocks hold data      |   4K  |  15013 |  ~15900 |   ~+6%* |
| (mtd_speedtest)              |  16K  |  15222 |   22849 |  +50.1% |
|                              |  64K  |  15280 |   24233 |  +58.6% |
+------------------------------+-------+--------+---------+---------+
| Erase, already erased        |   4K  |   9558 |   13727 |  +43.6% |
| (MEMERASE ioctl)             |  16K  |   9558 |   16580 |  +73.5% |
|                              |  64K  |   9626 |   17754 |  +84.4% |
+------------------------------+-------+--------+---------+---------+

---
Tal Zussman (3):
      mtd: block2mtd: convert block2mtd_read() to folios
      mtd: block2mtd: convert _block2mtd_write() to folios
      mtd: block2mtd: convert _block2mtd_erase() to folios

 drivers/mtd/devices/block2mtd.c | 120 +++++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 69 deletions(-)
---
base-commit: 2f7fa8d90694d21dce68ceabd8383252b111cfea
change-id: 20261012-block2mtd-folio-9ccb6639c05a

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
