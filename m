Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B76C4741F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 16:05:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A52020786
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 16:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gl+5cBX8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f1HweYtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A52020786
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Y6zyBYy5G6YshMjXuTtOXLoGDNQ61xN2OSp6tREo6U=; b=Gl+5cBX8DaA7B/19Qn8CEry0P
	dSDzDUqbYHsAB1kQMozrHEQ/haSo7UqCtLp5Bd+nzkomQCsdAg8ecdU605B9bQdm4b6fxa+AQoxVX
	zXHIZCmLqi69rAraaJnPF7mQpa4n216WIxy/Wf0g9sVHQuZYgcY8MKVTGVv45QPeGC2jq3kw0n+we
	H4av9YfKJc41uIr/oHdhxE1YkUw0BAc1vrOjrsb+EKjDRtcCNrJmW3/58LKdfWNm8Z2Ig/yUX7CGV
	tndhEKiYUMB9ar7b8O1WRmL5VL0OLVoqQj1LCH8uJtkwiwARZdIqC+0jjCLWTtNtRoMVWaewsXqPL
	Xt3vIFcwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kahki-0001op-A7; Thu, 05 Nov 2020 16:04:44 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kahkf-0001nV-6p
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 16:04:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5G4Z32034127;
 Thu, 5 Nov 2020 10:04:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604592275;
 bh=Tkak3lHBbbhAsRhTyoXbxbfPQtNqMPrBhg42KssZeVQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=f1HweYtXYwYEGlCH23bYEZOfjMxEwZDUKMbbp9yvBM4p/eqPHurheYtC991kfcWwD
 EwZJKACrccsFGVXihaCO/vUTY6Yzhqo6t7fOkisJuAjhGrfnIBTPQTjnJQV41wG3Ks
 mRKWu70lVnt1JojgsyqnqmH1AlmpHKuFneRDkQdY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5G4ZoL013724
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 10:04:35 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 10:04:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 10:04:35 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5G4Xla099908;
 Thu, 5 Nov 2020 10:04:34 -0600
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
References: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
 <20201030184736.4ec434f5@xps13>
 <aefef0187e5ebbe315e57e834ff1ba756ba88817.camel@infinera.com>
 <20201030195251.687809f7@xps13>
 <931f422255204f0420e6f1b79657f9770ce0cf6e.camel@infinera.com>
 <31ce9a84-d949-c1d1-a8c6-44ead119ca1b@ti.com>
 <2198bd20e69be374f7533f45118c98750eb5362a.camel@infinera.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1af99b7d-e388-3c41-a8d8-9f82067ae857@ti.com>
Date: Thu, 5 Nov 2020 21:34:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2198bd20e69be374f7533f45118c98750eb5362a.camel@infinera.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_110441_346439_7EBD7A46 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/4/20 3:23 PM, Joakim Tjernlund wrote:
> On Wed, 2020-11-04 at 11:12 +0530, Vignesh Raghavendra wrote:
>> Hi Joakim
>>
>> On 10/31/20 4:56 PM, Joakim Tjernlund wrote:
>>> On Fri, 2020-10-30 at 19:52 +0100, Miquel Raynal wrote:
>>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>>
>>>>
[...]
>> commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling
>> status register") was added in 5.3 and therefore is part of 5.4. But
>> note that this is a "new feature" and therefore won't be backported to
>> kernels older than 5.3.
> 
> Oh, my memory is off then, sorry.
> 
>> Similarly, this patch (when accepted) is not a candidate for stable
>> kernel backports because the intention of enabling polling status
>> register for Write Completion is to enable flashes that "don't" support
>> DQ polling at all (mainly HyperFlash).
>> Enabling this for all flashes that support the feature is not a bug fix
>> IMO. Also, there isn't enough testing to prove that feature works for
>> all CFI NOR flashes on all platforms and therefore would be risky to be
>> backported to stable kernels.
> 
> This is 2 things,
>  1. making it possible to use Hyper flash (HW enablement)
>  2. improving the flash driver to function more precise(getting an accurate error rather than a TMO) for most AMD flashes.
> 
> 1. happens on a regular basis in stable.
> 2. can be discussed for stable but should at least go into master now that status has been in there for a while
> 

Yes, but my objection is that there has not been enough testing to prove
that its safe to backport to stable kernels and there is nothing that's
broken in older kernels which this patch fixes.


Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
