Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6313C3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 15:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7844C22DA7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 15:41:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmY9Rezn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="U9NT4Z+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7844C22DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5orEDLaRZeOcB5zeS/XSVfGsSGiRuOOLvf1Nmb431fI=; b=rmY9ReznsupkS/6N9n5omZ8mo
	UFhc5AqYAmJpxYuXZSG+FeHV5CiJ3FTncpQwM6lreYSimiG67W1oFJRhlfbSttouXdfJoUBhlGic9
	SXqecr2NS2/SUNH+3bBvkzEJQeM4OXHMu7qqcNxWbs3KLdiWwHqoRSkxgDAxtM4pYEcpWsdGOSYms
	XPc3XWyPoJMIc5DDLWPX0UL0X+YRnkPfDvdl7VSzKy5eVw4tN2EL5ipNCuQSZ6bEcKTfogbVB4xq6
	nhV0BJ91tQ7XQZnT/+xNUj12vgjC0jGFT1O4AZaKb1ZYcQs1trdKOJECIEofsJ6GvYKmI3jkRotno
	iEbD2djjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Sjy-0003bF-7A; Wed, 21 Aug 2019 15:41:38 +0000
Received: from nh605-vm5.bullet.mail.ssk.yahoo.co.jp ([182.22.90.78])
 by bombadil.infradead.org with smtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Sju-0003aV-7W
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 15:41:36 +0000
Received: from [182.22.66.105] by nh605.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 21 Aug 2019 15:41:28 -0000
Received: from [182.22.91.129] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 21 Aug 2019 15:41:28 -0000
Received: from [127.0.0.1] by omp602.mail.ssk.yahoo.co.jp with NNFMP;
 21 Aug 2019 15:41:28 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 385418.72746.bm@omp602.mail.ssk.yahoo.co.jp
Received: (qmail 31682 invoked by alias); 21 Aug 2019 15:41:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1566402088; bh=4C255KewAlFUg1pY8zJFEUp+seYFgHDGxnzX4BbDuag=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Content-Language;
 b=U9NT4Z+BTZHvhl6YEZipPftPZixTu7ceuUhM1UNYKhqdWCGEF2AIg7IGvvnPjUK61nbZ+iLkkE7gE8aQw6EDtslplP5wEgJIB8h+VF2gfho0pm7ly9NfvwIMnPFwpeZLgySv0uil3Na7m9ZFWS2fyp/JYk5n1lTa2KgAGORMaV8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Content-Language;
 b=ZrT96m5p47S2JFqXO+WO4MMmhvXCSa22yge3FdVCJpDlYyitmv3T+dfGq60Pr6jS5KQJRsGp1QQ4aQLlI9S6qPACTspg+46R9ob59g7uM4bA8c+ksRFSFIVHg0pz/7FScf3GrgLuClpPRaHHhpYNvyi64m9cUXa4fZ2Zy0b4mgM=
 ; 
Received: from unknown (HELO ?192.168.11.4?) (106.72.39.32 with )
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP; 21 Aug 2019 15:41:28 -0000
X-YMail-JAS: WAjyU.8VM1nqysDkFm8lBmZff.p1GkxxN2YNpYEjCx8Kedpf8qJGWv0QQqa21czPEDUNAvAD1ha9dZXj6GzpJ2Sovm833YoxQbA2LVMFO9MehSUj6GWue9OYPACnlhboUDXjBzDFNA--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: MtUkobIVM1nT_VTfjwOUhxofoiaD3OzfSlGPb_d8r.nsaNK
 21bwms8JsoecprwGBNORSefiJdA_IQusl4EIxbR6OUAYDTNjPQ12b1ClrkLt
 2o1RmjozHpPYZwzEAtY.bkdnW.ooPp8d5wB5DTfhfVjnfk7pKa1rEFQe3_g2
 2B.LMVYQF7OwIIjUl9D3pKRirrYnPRk777wUkjwRlL8S48gva787430oJGEO
 HduXBnpXqrYKmQYhZiPLVW51MXXFi54NoBSBFf.B.fHmBFG5xB6zHgyxZR2e
 sABXq0UNK4w87wVRtLXG3PZwveQcXP71d6vUmQZACEhOLQDY5QOYmIPeyNVr
 ltdacTV2MfVpCObo53y4q8BBmiJxiO7DSamQ7JhwKVpAAXxKsFwbEYGA9lvW
 927pwJwV0LjwH5ke_MAXadTWfBSk4fRoCyqgdi.VEwcfowzhDN3Lb04qp.V4
 BdBX8slswNzhKeKcAdDqAe0V5teuj35tZuh6aTvmzkRk1r0H6G2ZnTSf08EO
 qwUz2lmGXSADDYa2s2MgIwYAwz7FgyAakAWZuhLkvn1Bo7dCEa92Z6BVX.4A
 ka1OuhurqoYWz_jHEmYquYG.b296pA.6kA1rmOGge2W7TcMLYxu7CqUwT3KV
 fD0ydbZxhmfO9hHoovfUMWyuiKvMwxvMLV28bx81Vy_OZ2Et0K6EjQMmSiUe
 hzL5zQ84-
Subject: Re: [PATCH v7 0/9] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "ikegami.t@gmail.com" <ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
 <7f092ec3300c2c982b85ecd58d45f39e3dbae98e.camel@infinera.com>
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Message-ID: <c22554d5-0d1d-ee03-dfb4-b0ab2a009b4f@yahoo.co.jp>
Date: Thu, 22 Aug 2019 00:41:27 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f092ec3300c2c982b85ecd58d45f39e3dbae98e.camel@infinera.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_084134_581713_B55551C4 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: "chris.packham@alliedtelesis.co.nz" <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2019/08/21 17:03, Joakim Tjernlund wrote:
> On Thu, 2019-06-20 at 01:49 +0900, Tokunori Ikegami wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> The change is based on the fix for flash erase to use chip_good() done in
>> the past. And it is fixed as same way in the OpenWrt Project as below.
>>   <https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.openwrt.org%2F%3Fp%3Dopenwrt%2Fopenwrt.git%3Ba%3Dcommitdiff%3Bh%3Dddc11c3932&amp;data=02%7C01%7CJoakim.Tjernlund%40infinera.com%7Cc576b3ddad2d4f3c09f008d6f4d635b2%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C636965598194534713&amp;sdata=1XV5w3jD6tbfP%2B2Q2eBqfeHp07kHLDxpiJhW4ZA5Ea8%3D&amp;reserved=0>
>> Also includes some refactoring changes.
>>
> Did this go anywhere?

Sorry I missed to reply by the previous mail so let me reply again.
The patch series are still waiting to be reviewed and applied into the 
linux mtd repository so did not go anywhere.

Regards,
Ikegami

>
>   Jocke
>
>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>> Cc: Fabio Bettoni <fbettoni@gmail.com>
>> Co: Hauke Mehrtens <hauke@hauke-m.de>
>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>> Cc: linux-mtd@lists.infradead.org
>>
>> Tokunori Ikegami (9):
>>    mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
>>    mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
>>    mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
>>    mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
>>    mtd: cfi_cmdset_0002: Remove op_done goto statement from
>>      do_write_oneword()
>>    mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
>>    mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
>>    mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths
>>    mtd: cfi_cmdset_0002: Disable write buffer functions if
>>      FORCE_WORD_WRITE is 1
>>
>>   drivers/mtd/chips/cfi_cmdset_0002.c | 290 ++++++++++++++++++++++--------------
>>   1 file changed, 182 insertions(+), 108 deletions(-)
>>
>> --
>> 2.11.0
>>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
