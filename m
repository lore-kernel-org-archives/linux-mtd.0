Return-Path: <SRS0=WaUJ=JL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B10C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 13:14:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A1E611AD
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 13:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98A1E611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=poD+DZKkx3AHNDT02FuScOrb7JDFG6uqd8fgjzC+tgU=; b=R1upHpLz25/p8q
	LbrDIzu5LS8M3/0ht5Cqw4am0+TRgTmC/3ReSVWsCFNp3bcraWHNVypoEtRCQ/sKplSKWAwftWqST
	FeIudnTc2hVRTYkLayGuNHAYINuDetTnbT3N7HCXekXA0acbvncV8RyM0qZmdrwRHb/t8GdOSIonr
	BG4ket1AihVe4ZyMqQTLU7lv3Or9OQVrecl41BYOXajOs6PPQqoixdnFHRPUkotzSAlULS3oGPp+Y
	1xjvMXsrft+tN1tqXx4O//IdanbdGM3wIIivh8H2hiae82n75VAUmFU8kl9mOe3gZhwTciNOebcya
	7QarCleKyGUSKR7Sg9qA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWfL6-00Ch7w-MV; Wed, 14 Apr 2021 13:13:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfL3-00Ch7i-3Q
 for linux-mtd@desiato.infradead.org; Wed, 14 Apr 2021 13:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=G1DDNPUwrZGwyIBzOFY9A5AcnmFGrmqtYdldtztEMbY=; b=OMZe72MD+pZ1QXihc7PkQsMmMG
 maX6bsl1gxiIdQrGtBfNvPhl5Bn1dWaybv5JGGx/VGpWzx9QxMAo1CkqSwvA0FgtIL82UL9QSnfRq
 34obaVtn9VjX1sUCqA03PHn4SgT2JSF6oIjcAvT3/imjfsZ88n5Hmn8/+qu+6IG9EM8pk2kXmiLcB
 zc2iL5GIU7SzbVB9PIHy9vUMOv/g0Dq16yFaPMc7SH68X7kwJoWpL55b0ltmhK9SZrtBlpZDv9CQy
 PSy+FMrR13BDf6ymRUNAI6/YkGDgZ4nFRcVb/DEmCVmkbSrmIxnVDhDwgqphGyADXC6b3SuMEtubA
 tdLivYTA==;
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfKz-007miU-R6
 for linux-mtd@lists.infradead.org; Wed, 14 Apr 2021 13:13:47 +0000
Received: from [192.168.64.199] (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 9F103463072;
 Wed, 14 Apr 2021 13:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1618406019; bh=29MVndKIYmI7I1O4jfL6Eh5U13sEbawP2Fr/4jJG7WM=;
 h=To:From:Subject:Date;
 b=Ae8T9A7SRQcMhT2xEGNlEYfdMN5eF+pkgY/IYW7h/X+14/nZSgTRNHDi0Bl7A29uK
 v1JV5IOr85MCkSNPCeeTTXheATtSW6440PzZkYZ49tIhkF1T3LBeuT+pf+ux/wnlgm
 QDMqh35HZ11AHIN30cJwkRH7bYVCil4wFGwufWREYZyPQ4UMy7MjDyaSoAobA+AhTa
 6jZ4ftxUW9YgPtNN9udmGi9+L9Sl/9p1Pcg+Bw5IMloh5DAL394ZU0YxYHiAzUt6CD
 vBZyhzlH8I4gK29+Ws7K8uxEyQUrwfS2Pz/2Qzsb3T13vEBJuYFSGH2i2clcKGZOMT
 FR8jLlqrj8r9Q==
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
From: Sean Nyekjaer <sean@geanix.com>
Subject: gpmi-nand ecc
Message-ID: <a066668f-852e-b3fe-0e91-23f0187d6c20@geanix.com>
Date: Wed, 14 Apr 2021 15:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_061346_582576_6AA00B45 
X-CRM114-Status: GOOD (  10.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I have two boards with a iMX6ULL SoC one attached to a Micron NAND flash 
(MT29F4G08ABAFAWP) and one a Toshiba (TC58BVG2S0HTAI0).

After updating the boards from u-boot 2018.07 -> 2020.01, the Micron 
fitted boards is having ECC problems(in u-boot).
U-boot 2018.07 selects ecc_strength to 18.
U-boot 2020.01 selects ecc_strength to 8, but if I hardcode u-boot to 
run the mxs_nand_legacy_calc_ecc_layout() it selects 18 bits.

The Toshiba boards always selects 8 bit ecc_strength so they have no issues.

The kernel driver (gpmi-nand.c) seems to also use the legacy method 
(Resulting 18 bits in ecc strength for the Micron NAND).
In common_nfc_set_geometry(): Both chip->ecc.strength and chip->ecc.size 
are 0.

I would expect ecc.strength to be set to 8, earlier but cannot find the 
spot where it should be set.
Is the gpmi-nand driver missing a call to nand_ecc_choose_conf()?
Maybe we need a legacy option for the kernel like u-boot.

We have +10K boards deployed so it's not so easy to switch from 18 -> 8 
bits.
I can explicit fix this in U-boot by forcing the legacy mode via a dt 
flag, but the gut feeling says this will come back to haunt us :)

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
