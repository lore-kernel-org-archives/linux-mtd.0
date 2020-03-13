Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA186C10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 13:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D7F7206BE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 13:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0wKtF8y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bRc00JKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D7F7206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M49a5csX2wyC0jcbT+CCvcgKsas/JR3s62C2/CTcxTA=; b=Y0wKtF8yUSITam
	jOO+XAWDgA9fHu22gXi/GwVv3enM8r9++FMFMvmFFtbo7SzYqfR3pjM1KcyYfAb59YGgmYk5ms55e
	rEuRVrzdjNg/1tcu87ZbrwtgBl6Yye/sItM4k5Iwd9A8Qbo/kFs5j6gSQWiG5mLgi1pRVz6ZzbhG3
	kViHd5wOe0N4Q1fHovZB62gubwxsqUz7WNby2oZ5mO10rasNl3rYzORs2hlkpSb3Vifq9hE5maWwb
	2KquAQr/91Icb3aBfmQErI08RZctOS07DD1yezQNTC/CZRhwOuB5rbSvy6T3QmOnaKItAYltkLvi9
	KO1NFqtcsGcsvppHk/ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCkLf-00007g-L2; Fri, 13 Mar 2020 13:27:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCkLd-00006I-A7
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2020 13:27:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DDRL33017198;
 Fri, 13 Mar 2020 08:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584106041;
 bh=brkNGQx8tfpbHO06Viue08T2ZElcEUomv1KYQ0nkiUk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=bRc00JKih5ugAoPI8ix4/qJVIcdIhIhz7RZwl42QVGFxmnHqplCZmOAvYlr1+A8OI
 EQ1e7j2BKX2fxfp+KFFL43jDgx9iVn8r1lIu16oNxYySLVrw99MwjQ9zDbZB8MGn2u
 odVshVjOhFOOJJ8qUMTTNYE1dKR/meLcbEMlAtJI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DDRLGB006448
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Mar 2020 08:27:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 08:27:20 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 08:27:21 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02DDRIl6106858;
 Fri, 13 Mar 2020 08:27:19 -0500
Subject: Re: [PATCH v2] MAINTAINERS: Add staging branch for HyperBus
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20200227051212.15496-1-vigneshr@ti.com>
 <ec8123f1-b855-6c03-8110-0e22eb42152a@ti.com>
 <20200313075030.713501a2@canb.auug.org.au>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <4228d955-165b-1fe0-bab9-5afaa0956c2e@ti.com>
Date: Fri, 13 Mar 2020 18:57:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200313075030.713501a2@canb.auug.org.au>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_062733_476824_AEA69625 
X-CRM114-Status: GOOD (  16.34  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Stephen,

On 13/03/20 2:20 am, Stephen Rothwell wrote:
> Hi Vignesh,
> 
[...]

>> Could you add CFI branch of mtd.git to linux-next:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
>>
>> branch: cfi/next
>>
>> I am planning to use this branch to stage patches for CFI flashes and
>> for newly added HyperBus framework.
>>
>> Miquel has already applied this patch to mtd/next
> 
> Added from today.
> 

Thanks!

> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 

Understood.

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
