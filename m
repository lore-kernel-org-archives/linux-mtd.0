Return-Path: <SRS0=/qel=ZA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64138FA372C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 04:34:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361AE214DB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 04:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HqFXP7iA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 361AE214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E+Z+YPSvXcp+DWHZHrSbQlip0psKNWsLKhvTC5sY1pg=; b=HqFXP7iAUc70MKoacu6mQBse+
	hMjmcxIGdD6wNB9uoLfvr4NGPX2DsixXusS9bub0NxEQ12ACJSoCQCTrDWYw21rq/np9WG//6ITxH
	1B+Dd1UiIZgd0e2+8isjaRI6+k723Oy2/l1lvqc5ljyA00af8Dz3ILSXn6hl/GCMLntR9kJIB5vjr
	iavq2z5RES0o3QhmUXKLEuLASK+wBTjNwHzCsY5HLCINSTTKwcV9K3ofOz8dyU5MWw6ei33AXk3yB
	D3W+GP+y/EtNI8ndDE8uhq87lKTLMfhXOUE1+z9GSZ7YhWPLa/lxIiDauDrrfu3N+oX6Dgyk4pwJu
	T3D5bmggw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSvyj-0001kF-7Q; Fri, 08 Nov 2019 04:34:33 +0000
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.153])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSvyf-0001jL-KQ; Fri, 08 Nov 2019 04:34:32 +0000
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AWAADi78Rd/zXSMGcNWBkBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAREBAQEBAQEBAQEBAYF+gwyBMYQpj2oBAQeBNn+Ca4V6kUM?=
 =?us-ascii?q?JAQEBAQEBAQEBLwgBAYRAAoQyOBMCDgEBAQQBAQEBAQUDAYVYTIVdAQEBAQI?=
 =?us-ascii?q?BIxVBEAsNCAMCAiYCAlcGDQYCAQGDHgGCUgUvsVp1gTIahB8BgRSDNYFCBoE?=
 =?us-ascii?q?OKIFlikd4gQeBESeCNjU+gQSBOSUChHGCXgSWSpc9gi6HF44kBhuOPwOLMpZ?=
 =?us-ascii?q?6k0qBejMaCCgIgydQkHODW4plYgGQdQEB?=
X-IPAS-Result: =?us-ascii?q?A2AWAADi78Rd/zXSMGcNWBkBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?REBAQEBAQEBAQEBAYF+gwyBMYQpj2oBAQeBNn+Ca4V6kUMJAQEBAQEBAQEBL?=
 =?us-ascii?q?wgBAYRAAoQyOBMCDgEBAQQBAQEBAQUDAYVYTIVdAQEBAQIBIxVBEAsNCAMCA?=
 =?us-ascii?q?iYCAlcGDQYCAQGDHgGCUgUvsVp1gTIahB8BgRSDNYFCBoEOKIFlikd4gQeBE?=
 =?us-ascii?q?SeCNjU+gQSBOSUChHGCXgSWSpc9gi6HF44kBhuOPwOLMpZ6k0qBejMaCCgIg?=
 =?us-ascii?q?ydQkHODW4plYgGQdQEB?=
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="224499746"
Received: from unknown (HELO [10.44.0.22]) ([103.48.210.53])
 by icp-osb-irony-out3.iinet.net.au with ESMTP; 08 Nov 2019 12:34:16 +0800
Subject: Re: [PATCH] mtd: rawnand: driver for Mediatek MT7621 SoC NAND flash
 controller
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191107073521.11413-1-gerg@kernel.org>
 <20191107084007.GA1203521@kroah.com>
From: Greg Ungerer <gerg@kernel.org>
Message-ID: <eb68fc5f-0a50-3faf-be61-23af5550ef39@kernel.org>
Date: Fri, 8 Nov 2019 14:34:15 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107084007.GA1203521@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_203429_884942_6ECA8FC3 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, neil@brown.name,
 linux-mediatek@lists.infradead.org, blogic@openwrt.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 7/11/19 6:40 pm, Greg KH wrote:
> On Thu, Nov 07, 2019 at 05:35:21PM +1000, gerg@kernel.org wrote:
>> From: Greg Ungerer <gerg@kernel.org>
>>
>> Add a driver to support the NAND flash controller of the MediaTek MT7621
>> System-on-Chip device. (This one is the MIPS based parts from Mediatek).
>>
>> This code is a re-working of the earlier patches for this hardware that
>> have been floating around the internet for years:
>>
>> https://github.com/ReclaimYourPrivacy/cloak/blob/master/target/linux/ramips/patches-3.18/0045-mtd-add-mt7621-nand-support.patch
>>
>> This is a much cleaned up version, put in staging to start with.
>> It does still have some problems, mainly that it still uses a lot of the
>> mtd raw nand legacy support.
> 
> Is that an issue?  Why not just put it in the "real" part of the kernel
> then, if those apis are still in use?

Agreed. If the MTD folks have no problem with it.


>> The driver not only compiles, but it works well on the small range of
>> hardware platforms that it has been used on so far. I have been using
>> for quite a while now, cleaning up as I get time.
>>
>> So... I am looking for comments on the best approach forward with this.
>> At least in staging it can get some more eyeballs going over it.
> 
> staging will just nit-pick it to death for coding style issues, it's not
> going to be get any major api changes/cleanups there usually.  I'd
> recommend just merging this to the "real" part of the kernel now if it's
> working for you.

I'll spin a v2 based on Dan's feedback, and move it into drivers/mtd.

Thanks
Greg


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
