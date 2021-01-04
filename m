Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A78EC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:50:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241E621D93
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241E621D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mp/dDm1XAfaegSzpNZ6tZ1zh75kMj4N5+Je0dAkY8+E=; b=rZVdgnkdo3laNwemrXZebAfH3
	UOMXN5TWMQ4aHL6WubUwL+G0lttBWisvsQOSmYmERtVGveamBH//2OMUPEQOK/SVPfOHHY+6zPlxm
	pbqMIN/VlNOFXhvKokAH5yyAk/RTOgZRjQF5cVC0cp2G3/cE6dekfrlwRw52IvirvbVfwn9WV3Fs2
	0aMN5oNd85L11xyr1RJRs/CrV5RdrQeReqvr0a8UuS/yU5qt2jPdHK2J0aJg5Z+L2qIe/nDAvKp4f
	i6/tBtP5bkUX17BcOuTqbiyavE3vBmFhSr+bQW17h37nzl0zR60B8ShVYVCXU+jSOnp/x9N1PPZwt
	ePjOgwc/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwNRK-00028e-6D; Mon, 04 Jan 2021 10:50:18 +0000
Received: from first.geanix.com ([116.203.34.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwNRG-000276-Mv
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 10:50:15 +0000
Received: from [IPv6:2a06:4004:10df:1:da27:a6d2:5305:fd0a] (_gateway
 [172.21.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id 824154E083C;
 Mon,  4 Jan 2021 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1609757410; bh=vzQBIiX2ZNmabReTeKi3DQ9XqK9ef5/p5TwmnrtLyjY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Oy0LrhR/kRG2/ccgCAqdunZl1RBGvyaB5W6RIiKu5yoZ+ayk+nVJDh5Olh4MC1meN
 9MoX3u+2Vggt4S1GCIwtsKkF2H0X7ZEkITxKGi4V+BPWDWS2BDING6/4uzQCIxReSm
 D6sIPWKtwZSbSuGvXlZn9DVmM62DYStkD95OPU0sXxM3GYfv1qa2y7DwnLxEiF9SMt
 XYbRx1Jtd4XL357/DmHGUUr/N/vLK0elnhcTYjPIHW482MP585FyPJqWPEhjcxUl0N
 +xbGFSsI/DZ6CqZE+Q5RA79Y7sUk4KnRSE3HzsFKBOdT7hS85I+eKTTDMCo6Picz5+
 0L0p6vys4OMMQ==
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix dst bit offset when extracting
 raw payload
To: Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20210104103558.9035-1-miquel.raynal@bootlin.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <7db4b36e-23a6-6075-132c-214d043e78bd@geanix.com>
Date: Mon, 4 Jan 2021 11:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104103558.9035-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_055015_126406_9674CEB4 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNC8wMS8yMDIxIDExLjM1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIE1vbiwgMjAy
MC0xMi0yMSBhdCAxMDowMDoxMyBVVEMsIFNlYW4gTnlla2phZXIgd3JvdGU6Cj4+IFJlLWFkZCB0
aGUgbXVsdGlwbHkgYnkgOCB0byAic3RlcCAqIGVjY3NpemUiIHRvIGNvcnJlY3QgdGhlIGRlc3Rp
bmF0aW9uIGJpdCBvZmZzZXQKPj4gd2hlbiBleHRyYWN0aW5nIHRoZSBkYXRhIHBheWxvYWQgaW4g
Z3BtaV9lY2NfcmVhZF9wYWdlX3JhdygpLgo+Pgo+PiBGaXhlczogZTVlNTYzMWNjODg5ICgibXRk
OiByYXduYW5kOiBncG1pOiBVc2UgbmFuZF9leHRyYWN0X2JpdHMoKSIpCj4+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4+IFJlcG9ydGVkLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGlu
QGdlYW5peC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4
LmNvbT4KPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCj4KPiBNaXF1ZWwKSGkg
TWlxdWVsCgpXaWxsIHlvdSBwbGVhc2UgcXVldWUgdGhpcyBmb3IgZml4ZXM/IEl0J3MgcXVpdGUg
cmVsZXZhbnQgZm9yIDUuMTAgTFRTIDopCgpCZXN0IHJlZ2FyZHMKU2VhbiBOeWVramFlcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
