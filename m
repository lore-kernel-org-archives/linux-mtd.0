Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFEDC4363A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 14:53:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67385206D4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 14:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x8nYl8Hy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=adva.com header.i=@adva.com header.b="aottR6Bl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67385206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=adva.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p6toJwAA1k1kt4W2eRHUVjmTT3s1dFAwvon+QoEI6ZU=; b=x8nYl8Hy4nJyOccr32ipX96AQ
	98SrwcIZiUX7djvxVezzagveTAImdbiA7i/i/jkTR3A2U+uMfzGuvIjaTTQ7GuWOzA1di1AuWJk2l
	OFOgOZWAUyJ5RhDSx5HehbJKCIo7xUQ8iZu98E2lRYkg6UVJiR/+aXExhyfn/ZgRzU9DEWfQYnwwT
	KLamj0lixcT+44ikc1jFAoVNILDl8aZN5TpDH+OXv1lA18emRAus/cEThw8/tNaqJlx51lVcvAMZ9
	6QcqDjCVJ/edIeTfomBqa+TQtCn0r2FHftPSVvEJdJqJ9fkEQraQDkJzfeOW+lR2BfLgalGMIBKlr
	wXaPNV3FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY9Hm-0002hl-SG; Thu, 29 Oct 2020 14:52:18 +0000
Received: from mail01.advaoptical.com ([91.217.199.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY9He-0002eF-OU
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 14:52:15 +0000
Received: from pps.filterd (muc-vs-mailppa1.advaoptical.com [127.0.0.1])
 by muc-vs-mailppa1.advaoptical.com (8.16.0.42/8.16.0.42) with SMTP id
 09TEpYXS027414; Thu, 29 Oct 2020 15:52:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adva.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkad20200122;
 bh=WyrR/lHBZlW3N4UWviwFaQYsG3iZuHSHerpkPgitb5I=;
 b=aottR6BlD5O8urZHZVjX1ovvx6johsarwXlZdrPma7XatN3CzuZKL05inBnB6SYkjyPh
 8dl7K+SD35jtyYgGT7LCFhtfQOZdLbhO6OW2q+4ZcbS8G8GAzyUAI3MitK/pVtTj2yos
 inP7FllVJOrsPhqIJa1IxduxpNkOPZtsxSqZqwxHZMU7YCulN1L2drg7tchCz4s0K8M2
 u8vwIraAELhJnKyPnwZ4/FAutuThxlLmZiftv3BRytG7A2JjaqwwdFBoJVSuD6fbWMal
 VkBUXDTEnkV3DZWgBAs6kuRByGhhDcYAtMRT+J7Fft9wV7pD827yCjEXsB45Hv1XFTVf 6g== 
Received: from muc-s-ex16d.advaoptical.com ([172.20.1.28])
 by muc-vs-mailppa1.advaoptical.com with ESMTP id 34cabcywpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Thu, 29 Oct 2020 15:52:08 +0100
Received: from MGN-S-EX19B.advaoptical.com (172.25.1.194) by
 MUC-S-EX16D.advaoptical.com (172.20.1.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Oct 2020 15:52:07 +0100
Received: from MGN-S-EX19A.advaoptical.com (172.25.1.193) by
 MGN-S-EX19B.advaoptical.com (172.25.1.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.721.2; 
 Thu, 29 Oct 2020 15:52:07 +0100
Received: from MGN-S-EX19A.advaoptical.com ([fe80::303d:9391:e615:ea37]) by
 MGN-S-EX19A.advaoptical.com ([fe80::303d:9391:e615:ea37%7]) with mapi id
 15.02.0721.002; Thu, 29 Oct 2020 15:52:07 +0100
From: Barak Adam <BAdam@adva.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: RE: UBIFS corruption in empty space during mount
Thread-Topic: UBIFS corruption in empty space during mount
Thread-Index: AdatrnVGUyizTmJwTt+/2sPCJIuVRgAKHUMAAApdQvA=
Date: Thu, 29 Oct 2020 14:52:07 +0000
Message-ID: <1ffeedca15604810936ebb032b9af57c@adva.com>
References: <a60546366eb049698c7a0b5426361833@adva.com>
 <CAFLxGvyZUBgXyNkj0EO5pWntjfn7jObqU7XKZXxvjsQ=RN9WKw@mail.gmail.com>
In-Reply-To: <CAFLxGvyZUBgXyNkj0EO5pWntjfn7jObqU7XKZXxvjsQ=RN9WKw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.1.232]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_08:2020-10-29,
 2020-10-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_105211_180895_1F6CD8B9 
X-CRM114-Status: GOOD (  18.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

<Barak,

<<On Thu, Oct 29, 2020 at 5:54 AM Barak Adam <BAdam@adva.com> wrote:
<> ubi_leb_read calls lower layer nand driver functions but finally returns with -EBADMSG error code indicating that the MTD driver has detected a data integrity problem (unrecoverable ECC checksum mismatch in case of NAND).

<So, your driver is facing ECC errors while reading empty space?
<This is something UBIFS does not expect.

<If this is really the case, please double check, you can try to backport the patches you've listed.
<Or change the driver. In any case UBIFS does not want to see ECC errors when reading eased pages.

<--
<Thanks,
<//Richard


Thanks Richard.

I already applied those patches, but the issue is not yet covered / resolved.

What kind of a fix should I apply to the driver layer - raise ECC errors for the upper layers even when ready empty / erased area ?

Thanks,
Barak

-----Original Message-----
From: Richard Weinberger <richard.weinberger@gmail.com>
Sent: Thursday, October 29, 2020 12:36 PM
To: Barak Adam <BAdam@adva.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS corruption in empty space during mount

External email: [richard.weinberger@gmail.com]

......................................................................
Barak,

On Thu, Oct 29, 2020 at 5:54 AM Barak Adam <BAdam@adva.com> wrote:
> ubi_leb_read calls lower layer nand driver functions but finally returns with -EBADMSG error code indicating that the MTD driver has detected a data integrity problem (unrecoverable ECC checksum mismatch in case of NAND).

So, your driver is facing ECC errors while reading empty space?
This is something UBIFS does not expect.

If this is really the case, please double check, you can try to backport the patches you've listed.
Or change the driver. In any case UBIFS does not want to see ECC errors when reading eased pages.

--
Thanks,
//richard
Please see our privacy statement at https://www.adva.com/en/about-us/legal/privacy-statement for details of how ADVA processes personal information.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
