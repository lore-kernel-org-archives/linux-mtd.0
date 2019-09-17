Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054B6C4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 04:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB03621670
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 04:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFOUjUB9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bSMCJXrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB03621670
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QQ3BNT3+pPrHIM80xnSDJPblVqbsKY+PVN/1GhFmLM4=; b=RFOUjUB9XSBLJB3mNs8ccRkoKE
	VIA1KCmXDBsU8APDUc04w5HUlh3+dPjL1nqyBmKKeQbWF6TeiAS+CSFcgadZCYhu6O7i7R559UaZT
	q+U+Q1DqkowmUm3WGSBTfrw8H+stXor7yKQ64dftswzGC9ZTwTUd1bdJ/fwoSRpKjvg3s87+v1I9J
	HuGgUA1LHG0XNxtx5z1JmXBr82SE2oEHetjtD67FdreVdhkvcstPEV4mqLWFHe9OVjlEErLckiBo6
	tTpi452k6awy0Ag3Wh4PxF5AHRoNtm+fjg0Orse7U2o4flhmKt0y2fFCj4hk2jTJG8eRGk/nCH2yv
	UmFrzRLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iA51l-0002EN-3V; Tue, 17 Sep 2019 04:23:45 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA51i-0002Dx-7w
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 04:23:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8H4NQPS000941;
 Mon, 16 Sep 2019 23:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568694206;
 bh=iMINKBJy7DMf/H6NfcMaDPvcgrCm4/QoVJXgFVSbzdY=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=bSMCJXrrqc7VQgt1SrvmEOfbC+Ur9nfs8g25hNN0aLot34PygFqY24KGQ8PREds9P
 OoW+/F/107GlWiPpF9NSWhthYjo653x+xnOJMvj6+k+oFBji+W/vf5iBe/EW1U4PFN
 ZDkxtkkSV2v6UlIl2TRGfW7JU+E8i1AB3NZWayK4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8H4NQCo105570
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Sep 2019 23:23:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 23:23:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 23:23:23 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8H4NN5b101751;
 Mon, 16 Sep 2019 23:23:23 -0500
Subject: Re: [PATCH] mtd: chips: gen_probe: kill useless initializer in
 mtd_do_chip_probe()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <e17f9477-19b4-0572-9df6-86a06695111a@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <f6a46843-fc65-74bf-0559-2267025f9fff@ti.com>
Date: Tue, 17 Sep 2019 09:54:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e17f9477-19b4-0572-9df6-86a06695111a@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_212342_368703_7209EAB4 
X-CRM114-Status: GOOD (  16.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04/07/19 1:56 AM, Sergei Shtylyov wrote:
> The 'mtd' local variable is initialized but this value is never used,
> thus kill that initializer.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Thi patch is atop of the 'mtd/next' branch of the MTD 'linux.git' repo.

Merged into git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next

Thanks!

> 
>  drivers/mtd/chips/gen_probe.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux/drivers/mtd/chips/gen_probe.c
> ===================================================================
> --- linux.orig/drivers/mtd/chips/gen_probe.c
> +++ linux/drivers/mtd/chips/gen_probe.c
> @@ -20,7 +20,7 @@ static int genprobe_new_chip(struct map_
>  
>  struct mtd_info *mtd_do_chip_probe(struct map_info *map, struct chip_probe *cp)
>  {
> -	struct mtd_info *mtd = NULL;
> +	struct mtd_info *mtd;
>  	struct cfi_private *cfi;
>  
>  	/* First probe the map to see if we have CFI stuff there. */
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
