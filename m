Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1031C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:30:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723E3611AD
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 08:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723E3611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q1f/2KlMAxDzFtYgce099Hrcpg1uU0/H1+cnmCyI4Xs=; b=T1f1nTXrqVz2tiJjS7utdNBQ4
	WPFig1bhe+ARXPWflGFeoKPwPLt1J+k//LaqhrJIVmFL2zXs4vfTF7xEGKEsxgG/lsrIlEN5Va7WL
	Q6YJP2GKsFyQSPJ3eTM6TsTbj7yBmyPDrTjgaCYdKWivte1Gr0P6yzEcQFLAfXqNACDaY2JXnSOov
	bCVDqiTA5EIREu/+1FjLW1dWVV3XIDt6RGRUhBNHDDRaA+ZVR3nK2jrr62sOwJd6ucpFRFVQN1I3W
	kmRXwVMCxfCaoBnwOixIYnXFlLousOMerOxQHe2q+6aqVB34Z23LzGCiStYeCc+zZ1ePg+26tKqyM
	7jRk7XBaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrx8-0066fV-VT; Mon, 12 Apr 2021 08:29:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrx5-0066eg-BS
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 08:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ny7TW+sicYPzORLLQCEQRGY1Cdt07F0FfJ8pCH51IBk=; b=stYrXJOA9InmWQSjsLp6/vp2Qo
 /09HoyRb4AMD/p6GYPWMQjKpTzzeVy5lJYRBocYu/fJEdCuMRLsrbxC2KhNZpMUVbm1lKV3NUWP3K
 SO0cmiffm0ROScO6YceADlo3IPg3wHr5Ge0ta0cdPPc3WNMq4Gol+M9zSKIvpbeeahlvaAzrMKPVZ
 iLhroEMZdp149sSkoqPXr4D7oM1UIBsJYLj8TIBTaOn/BDGHPKnH2dT2EwqJmn1eRp4onXOwGMvM4
 H/2XhhioDPA05SI6a3QKwv5vGbciSuFQ/r2mbjZkcpV3LaC463axNlVYHBwggyB01BI2hQd1OSNhh
 VS3gqJMA==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrx2-005yaP-7O
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 08:29:46 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FJhfb6XhpznYv9;
 Mon, 12 Apr 2021 16:26:47 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Apr 2021
 16:29:32 +0800
Subject: Re: [PATCH] mtd: core: Convert sysfs sprintf/snprintf family to
 sysfs_emit
To: Richard Weinberger <richard@nod.at>
CC: Tian Tao <tiantao6@hisilicon.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
References: <1618209872-20034-1-git-send-email-tiantao6@hisilicon.com>
 <614928182.172774.1618210140227.JavaMail.zimbra@nod.at>
 <049f8110-5777-db77-d374-275d1ceee81d@huawei.com>
 <754065655.172978.1618214872038.JavaMail.zimbra@nod.at>
 <009e80a0-8aaa-4824-10c4-a5a82b2c6528@huawei.com>
 <1392900373.173016.1618215952396.JavaMail.zimbra@nod.at>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <a9df166b-13e8-950e-88dd-747f4b663953@huawei.com>
Date: Mon, 12 Apr 2021 16:29:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1392900373.173016.1618215952396.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_012944_462373_B329330A 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDIxLzQvMTIgMTY6MjUsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gLS0tLS0g
VXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiB1bmRlcnN0YW5kLgo+Pgo+PiBXaGF0IGRvIHlv
dSB0aGluayBvZiB0aGUgZm9sbG93aW5nIGNvbW1pdCBtZXNzYWdlCj4+Cj4+IFVzZSBzeXNmc19l
bWl0IGluc3RlYWQgb2Ygc25wcmludGYgdG8gYXZvaWQgYnVmIG92ZXJydW4sYmVjYXVzZSBpbgo+
PiBzeXNmc19lbWl0IGl0IHN0cmljdGx5IGNoZWNrcwo+Pgo+PiB3aGV0aGVyIGJ1ZiBpcyBudWxs
IG9yIGJ1ZiB3aGV0aGVyIHBhZ2VzaXplIGFsaWduZWQsIG90aGVyd2lzZSBpdAo+PiByZXR1cm5z
IGFuIGVycm9yLgo+IFRoaXMgbWFrZXMgcGVyZmVjdGx5IHNlbnNlISA6LSkKPiBBZGRpdGlvbmFs
IHlvdSBjYW4gYWxzbyBub3QgdGhhdCB0aGlzIGlzc3VlIHdhcyBmb3VuZCBieSBjb2NjaWNoZWNr
Lgp0aGFuayB5b3UgYWdhaW4uCj4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCj4gLgo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
