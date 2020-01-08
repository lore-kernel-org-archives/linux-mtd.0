Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C69C00523
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 10:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD8520692
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 10:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5HQlFtb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD8520692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJLL9zc3KFPzfWIaAaYQSwypFOm3bocOAo6YLLenHY4=; b=L5HQlFtb+VgPaW
	NGoTXIWS+KycmPCGODQoxIkeW6iWRpF0tYvMq2fAoOZG6PZVKCxYjzuHyLauCRyU1MZRzS+bK8vdO
	66hwqPYOIqstX9hncOEbmLbXeVjE4W/NJz9Myj6DoRplF0QxSUS/Zz5c7SU92GkaJy4TvqRSjcPhI
	AvQ4ho+zRQyXqSMf9bMxwTXFJpkYp5Xvluyi7I6/Fl/xZOMSYv0JwWREbQqkcbnYelZXvE7idp71N
	xQvzoWw0NYKHcsunRoitMBqCuxJe5F9nB870I43gtRc/tkTMn630vs9hGjWdxqCtGRoajPdrvAagv
	nieBKOvzI6JvdC+0eVhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip8Pk-0000Sh-7g; Wed, 08 Jan 2020 10:18:12 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip8Pg-0000OQ-19
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 10:18:09 +0000
Received: from [192.168.1.155] ([95.114.105.36]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MWAWq-1jDvbf2ieg-00XfCY; Wed, 08 Jan 2020 11:17:21 +0100
Subject: Re: [PATCH 6/6] (v3) drivers: hwmon: i5k_amb: simplify probing /
 device identification
To: Bjorn Helgaas <helgaas@kernel.org>, Guenter Roeck <linux@roeck-us.net>
References: <20191210232529.GA171629@google.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <07148b8e-5b87-66ad-e52b-be2b8b22e712@metux.net>
Date: Wed, 8 Jan 2020 11:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191210232529.GA171629@google.com>
Content-Language: tl
X-Provags-ID: V03:K1:TAwu3cp8xgdnoC+QVXxTZuo1d6L730Y/hIlnNlnChNeKzUKMs/t
 vNr9OrZqijZoHde4YF3t7ezNikPhOGlTm3R3WPK2sFjTW0Ghd5q8U73Bqf/Cf638mqBacxr
 rxW5gCPbhzuRN5HCty8OClMKTVVag/UlQVZYL0GJ2GBhW/C9h/k8rH8iNTxaRPLMZo+G2+T
 SFaY74zTgfT3qK8buR+QQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UX0qjWzvj1w=:MNJwBZoBg0zHdAbLIu7jZ1
 NQ6YqkA9o0GZJBWd8Ad4X7sj60ITE703Y9e7n05lpKaAE5k4kxh/DB85CtkI7X1e4k8xYOZju
 qK7RFrKDmrWjMa7E0xlTfWdlhUMF80E7Ft/CnN2WDqFZB82yOlvrFHdDEW3AVYU0FQVAVvOu+
 YmGlw72B3Pym8MYoAVDb71/m3UmCh3k9BDSmEAjNRLbRDCF2VVgSjzJ1oEeH9x+WoP421kWi5
 Yibzza7ZuNPPOXysDmnaFlJ+GxbCHrX7w8VWIbYFTw3vaN575729znMCT2FoTnPZhukzP1dh/
 fYYEgmMZtopETatbu1oflvhY/l55FbEBlrPy0u4Wzl91jtzfmJvgE5bmDrELARWK6dxISKLko
 rptrWYwfFHMjKBsQ9ruUZGnliXn1/wOeqNvtxFkQ5qxNSGilOnQxwnWpNCB729Y8lm1ofBN3U
 14o+bKqmdkWaauabumrjuFSSKvU7c/SUXKWHBtZOokt4B1jhLIu1Pr1xtT6BfE9DITZEKEvNL
 iObWk/IDco3bI5QmqGf7qRYlCBeLsoGR03KQRp4nuIgelCd7prjiVFVB0DJ8tRsfBa60fl9eV
 jT11ZBjzj/yBOIOnx5stFSioHSAQ1CvygDOgp+DpWJ79kX/VOOV4wXTUYts9aGe2YUTA6ypVT
 /6J1nf5LJtaUhKFBTCxakheBb4RQryHo9BA0eHR/n1345Ne0yrVogVyoksPgsmFAQhJpc45OK
 jfW41Y6in+LRLl0JH8xDJqmpy/HOOzN664Cm9yV7fKSDPnfiHAhRW50ZmtyT86rLVy8E3zfbZ
 WlLquMtpmnga8pIzXT7MyITSbdmrIdww1ALX9SRXPNcMu/QxOueQBuTGUOMb2+PsngyEZbdzs
 qBetrh5ZIRf5o9ia/XdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_021808_368888_CE633390 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, vigneshr@ti.com,
 richard@nod.at, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 rrichter@marvell.com, james.morse@arm.com, linux-crypto@vger.kernel.org,
 miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-edac@vger.kernel.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, tim@buttersideup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11.12.19 00:25, Bjorn Helgaas wrote:

Hi,

>   2) I despise the pci_get_device() interfaces because they're
>   inefficient, not hotplug-safe, they circumvent the device model
>   claim mechanism, and it's hard to do the reference counting
>   correctly.

Agreed, but for that we'd have to edac and hwmo driver together into
one (or maybe a MFD). That would be a major rewrite, and I don't have
the necessary HW to test it.

>   3) There are several things going on in this patch and it would be
>   easier to read if you could split them into separate patches:
> 
>     - Removing the redundancy between chipset_ids[] and i5k_amb_ids[].
>       This seems like a nice change.
> 
>     - The "chipset_ids[i].fbd0 + 1" thing was weird and the new
>       ".driver_data + 1" is still weird.  Those are PCI device IDs,
>       and addition is not a valid operation on those IDs.  IMHO both
>       PCI_DEVICE_ID_INTEL_5000_FBD0 and PCI_DEVICE_ID_INTEL_5000_FBD1
>       should be listed explicitly in the driver instead of trying to
>       compute PCI_DEVICE_ID_INTEL_5000_FBD1.

Ok, good point.

>     - Replacing the hard-coding of PCI_VENDOR_ID_INTEL with the vendor
>       ID from i5k_amb_ids[] seems worthwhile and should be its own
>       separate patch (if possible).
> 
>     - Changing to use pci_get_device_by_id().  This should be trivial
>       to verify, like the other patches.

Ok, I'll try to split it up more clearly, once I've got some more spare
time.


--mtx

---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
