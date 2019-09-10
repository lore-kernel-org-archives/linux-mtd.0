Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8360DC3A5A2
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 10:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563F82089F
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 10:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kPUy2as5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Ya7F6Yu3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 563F82089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FDjS+BWhfwGOhi7lDu0KZMVcjUIJzE0n9Qs1/8+EkFY=; b=kPUy2as5HM77zjEjkG8JLbCNE
	GtXQO48BHaMOTye9K2dLlHywNPGSeBxgqARDTyN2AwhEFj7jxeU3uRKx95RKDWBBoF86zAx1iEfeh
	1vMv2eBRKvh/977D84kSCNsQWQS/QcXYww+iktI8TDUiR9GuSRLOs+AyWi6lqes44H2iNuc9rwDUr
	eMcj5NWVoZ+ZxBrK73mdIlc0790j+s4UyGaKhyIKm+avYZt7h/7hMAM/t30a6ll2Hok32a3PY66o2
	wVnqOYHZ9sJ5vCp4TQzTo5IHTdlpKTt80Vend73DQiEmvvJwX+VTqydI4OMh/DjvOxa++6QEzC2cr
	xVHDHvung==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7dEa-0005Wo-Lk; Tue, 10 Sep 2019 10:18:52 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7dEY-0005Vz-7b
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 10:18:51 +0000
Received: from [192.168.100.95] (unknown [95.138.208.137])
 by first.geanix.com (Postfix) with ESMTPSA id 5A4A663807;
 Tue, 10 Sep 2019 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1568110696; bh=chmydf6OWB7+o5opXTma5l+219i3t8ObrfzfHU/qYzs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Ya7F6Yu3r2jmPzSSu0tTm0vKA2j3tLldQhsVPzWIuQv/n48oPIyKkS5QVI7+OSWDE
 6Fa/ltLGmv+G55OVhXuQYaZ9R5IHASNPd0SlVzQEyxIqYxy9B3iZlwurRu+0EwO57a
 RczmhOmMnJEzWV+LpQgYsoBE3Br4AzEWpjhwb1+nru21Wropzj1C+nJD/TTknumwQv
 CsXTOUEhHevtlRL5sHezdmPrNFAChyVrPhI30oTLsxAhISXdp/AY0OjN+vsjZsoCtM
 JwMlVFHpwXPBYv7UE1Iu/cydqgccJoj5L0jCLOLiB60l2N35qO7sklvo7AxPD0gpJ5
 r4R0JX7pWnL3w==
Subject: Re: [Bug] mtd: rawnand: gpmi
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
Date: Tue, 10 Sep 2019 12:18:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
Content-Language: en-US-large
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_031850_419196_E05B73F9 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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
Cc: mkl@pengutronix.de, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/09/2019 11.55, Sascha Hauer wrote:
>> [    2.434057] Bad block table written to 0x00001ffc0000, version 0x01
>> [    2.437254] Bad block table written to 0x00001ff80000, version 0x01
> What about this "Bad block table written" message? You should see this
> exactly once. Do you see this multiple times, especially when switching
> kernels between the good one and the bad one?
> 
> Sascha

Not exactly sure what you mean, but here is the dumps:

Before (mtd: rawnand: gpmi: Implement exec_op)
[    3.389352] Bad block table written to 0x00001ffc0000, version 0x01
[    3.399019] Bad block table written to 0x00001ff80000, version 0x01

After
[    3.301096] Bad block table written to 0x00001ffc0000, version 0x01
[    3.310599] Bad block table written to 0x00001ff80000, version 0x01

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
