Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF92C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 06:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F4B21929
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 06:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bTEswWAf";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="LWbuB4hK";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="TiwtO0/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F4B21929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ILWZ1usijSKRwl080IiP47EGTcOktztH9FcNdlTbFA=; b=bTEswWAfXxk4V58ebxs48haUM
	F3a73ftPvaEhLsde0NQqI0237CHeo5wzjS5HwjrQ4TmGAVeD/IsBDiCYuN+IaRmLQNy07kx2y2ayy
	KuoSJif2Zm9r84+Kebl7o72fbRXaFN8vZKaOUhoir4kj/R1nYoxlQEwjrM6zDDk8rmpwgos8ONDRj
	k/iAihfesq9prwmoceyF4meT4J3kU1BJbSAb7YNavp97W8s4/7UrK053pRqzRwQMmwsj0SxLq/yLl
	6u+LSs0KcmJD+ECnCrGHQLJ3Hr5OYNJH4Gs0na5WxkbuRbKk1QJTDJ1eJGecgXMaTfVH+AtCSgX51
	kJ5qgFtmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7E97-0003ih-9i; Fri, 22 Mar 2019 06:59:17 +0000
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7E95-0003iJ-Am
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2019 06:59:16 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 5386C60DB6; Fri, 22 Mar 2019 06:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553237954;
 bh=FoBHhrNXYB6j+zeUfiMkH+oYYZXMkOloZkj8DR7f6mY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LWbuB4hKka0KTp5qs8O2Xm3YKqUwKYNnsqCdAC1187dgvdiUOXSUhm3ZEqpJpk5Tn
 VqQguOL42hhJFj3RtHj0OrSwHwKc7+MdyJMxTVpYibwChH5AH655WLw3PcPwgWBY8N
 kfcSsmvU6KXjgtbObcS1qVYo8JaqFPRs5F+EmOh0=
Received: from [10.204.79.83]
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8043960744;
 Fri, 22 Mar 2019 06:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553237953;
 bh=FoBHhrNXYB6j+zeUfiMkH+oYYZXMkOloZkj8DR7f6mY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TiwtO0/GcbzqY0Ir0luBWI0TToIk71qKaRlVgAm/ZUu+lJzkou/KPLWfvjqi7ZgZ2
 tU3rKxXPGa4VgSsm8C5rSLa5v0k+CztNgMihcY01w3oYZz+uHrFW7Xn65dR64Z6ylq
 PIzWYLserpsM6TB8j7l/qg0fSJDk4ECzjnqr1DaY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8043960744
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH -next] ubifs: remove unused function __ubifs_shash_final
To: Richard Weinberger <richard@nod.at>
References: <20190320140955.11576-1-yuehaibing@huawei.com>
 <2691086.gDEv9kBeKS@blindfold>
 <289f9994-0980-081e-f913-5729b16d16f4@codeaurora.org>
 <24657306.kQxLvZqZK3@blindfold>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <9c91e8fd-ba11-1cbd-c8d6-87b86f74d8b3@codeaurora.org>
Date: Fri, 22 Mar 2019 12:29:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <24657306.kQxLvZqZK3@blindfold>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_235915_394365_C009EE1E 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Yue Haibing <yuehaibing@huawei.com>,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDMvMjEvMjAxOSAxOjM5IFBNLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gQW0gRG9u
bmVyc3RhZywgMjEuIE3DpHJ6IDIwMTksIDA4OjU0OjU1IENFVCBzY2hyaWViIE11a2VzaCBPamhh
Ogo+Pj4+IEFja2VkLWJ5OiBNdWtlc2ggT2poYSA8bW9qaGFAY29kZWF1cm9yYS5vcmc+Cj4+PiBJ
IGd1ZXNzIHlvdSBtZWFuIFJldmlld2VkLWJ5Pwo+PiBBcyBpIGFtIHVuc3VyZSBhYm91dCBmdXR1
cmUgc2NvcGUgb2YgdGhpcyBmdW5jLiBpLmUgd2h5IEFja2VkLgo+IEFja2VkLWJ5IGlzIHVzdWFs
bHkgc29tZXRoaW5nIEkgZXhwZWN0IGZyb20gdGhlIGNvZGUgYXV0aG9yCj4gb3IgdGhlIHBlcnNv
biB0aGF0IG93bnMgdGhlIGNvZGUuCgpUYWtlIGl0IGFzIFJldmlld2VkLWJ5IHRoZW4uCgpUaGFu
a3MuCk11a2VzaAoKPgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
