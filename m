Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36BAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=020XyvlbqAH5niR7TBkX63+ftQFlSH/INdSMmYncuTY=; b=v0bBmJJUM3jQlK
	+u87j2I3BZ4xjr3HTBbW9VoBsoAzusVlwMUHUBPuWsfY9OdxBmf7EYyeue9deOLWkyHsz79V/xOBJ
	xlIPgraEV5p3oJnLzuSNfGD5cVlBerEEmZAD8L0DZstuo9kG2b6YLN6jzdzJKZm3YrilcibRgH/KY
	lYKq+/XMqU8yUAcmCLxDBAPU27v8DniHBJEwjVpmjTOGLTEgn8QL0Eldga/zryLDCAh1r8ponxKp3
	G5D55wQYOdMZAIeXvb9uJhiRIcrXnQO9QDa/IqiczV+RdHMSNvLwFETPtVN2WTBQgol4lNEW+ifvD
	8QJHL+rZyv44XPh/Q+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNbXW-005OOz-P9; Fri, 25 Feb 2022 14:25:46 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNbXT-005ONu-16
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 14:25:44 +0000
Received: by mail-lj1-x22b.google.com with SMTP id f11so7605716ljq.11
 for <linux-mtd@lists.infradead.org>; Fri, 25 Feb 2022 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:from:to:cc
 :references:in-reply-to:content-transfer-encoding;
 bh=R1A2OSQSeW4oMLIYgzlGVxkdwG6vwFpDTzyraNQNfpo=;
 b=MXHKF8kC54w6ziv75OaMK1Y7uZkdjnd7A24+L0XlNRId/ENywDFGMUUnf+9dbJv/3Q
 HGOdfVr8U6202+IjcnUYR2g74f1KeRcyelgmn463dShp5/FEhpaijxErrWQRj8BoJT7B
 mh7ocPDtm/Vwk+EQLTmZ/tJ1yYoSrkx2beXZvknp7WDJVR8zZXzKu3HO4fz8aDmz9Hum
 7/es1F/+71iUHTt+YBRKHjukFVisxO5N49X1Z1SBj2N6BUwn4MzwRaIy19Qp/OL/mSmw
 pqh9AK77HGkzQQEYd0FEo6CPfFVZ7YwkWBdXVRqpEuVxFLuEoS76GE7mNf+/VpdbYKY0
 +qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=R1A2OSQSeW4oMLIYgzlGVxkdwG6vwFpDTzyraNQNfpo=;
 b=Ofbs2L5C/l6Yhmnba6wVj+dpcwBpgvkD4GIMQjN0hFpLzEKHYlnUoHWzt5FQqFJaRe
 RM0vimBeFtAbmR0DIznmKJxZd3HEc2e3140m0EFFxdcD7rKz5GpLcmbDAOKM1C7Q4t6+
 vvUUw3ceAgdjWgQFQBBg9DSqy+6xiWVDiBUFsR5VJmuxrjuKNp8XhpxaqI7uKZ/FAsBm
 eZu/PDfFvNZCEKvAYM0+Bxuu4ET5BE19lLtvBxdnyFji5BSE5PCBxinLR9p/AyQX293+
 mL2VYIlNst9aodSo52qBTCVqIUsVyAK1sSQ4krJstmZbC8mWZhY5d7JSmYPnwuYXiDOq
 UwNQ==
X-Gm-Message-State: AOAM533p/g+HnxaYT/lNjvCGci1yAZ5eL37s7JIReNR64FmlykjbTtYW
 dY3tt4WtxVbCpebJK9OQWDk=
X-Google-Smtp-Source: ABdhPJzkCNG7MC/n5cnHDaMTjKAlplA0LroUgUFfScY9ZA8qaOLrOlV2szVCReFgHnfaLRryI8Brvw==
X-Received: by 2002:a05:651c:329:b0:23d:30aa:1670 with SMTP id
 b9-20020a05651c032900b0023d30aa1670mr5489985ljp.370.1645799141444; 
 Fri, 25 Feb 2022 06:25:41 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 x33-20020a0565123fa100b00443d3cffd89sm216225lfa.210.2022.02.25.06.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 06:25:41 -0800 (PST)
Message-ID: <a03b8735-685f-d488-a3fb-81d017358808@gmail.com>
Date: Fri, 25 Feb 2022 15:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: ubifs: handling dirty data (writing back) + power cuts
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Cc: "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>
References: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
In-Reply-To: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_062543_122394_5CFA3081 
X-CRM114-Status: UNSURE (   9.88  )
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

T24gMjUuMDIuMjAyMiAxNToxNywgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE15IGFjdHVhbCBw
cm9ibGVtIGlzIHJlbGF0ZWQgdG8gdWJpZnMgYmVoYXZpb3VyIGZvciBwb3dlciBjdXRzIGhhcHBl
bmluZwo+IGJldHdlZW4gNSBhbmQgMzUgc2Vjb25kcyBhZnRlciBzYXZpbmcgYSBmaWxlOgo+IGRh
dGUgPiAvbW91bnQvdWJpZnMvdGVzdC50eHQgJiYgc2xlZXAgMTUgJiYgZWNobyBDVVQgUE9XRVIg
Kk5PVyoKPiAKPiBPbiB0aGUgbmV4dCBib290IHRlc3QudHh0IGV4aXN0cyBidXQgaXQncyBFTVBU
WSAoZmlsZSBzaXplIDApLgoKRldJVyBJIGdldCBhY2NlcHRhYmxlIHViaWZzIGJlaGF2aW91ciBp
ZiBwb3dlciBjdXQgaGFwcGVucyBpbiBsZXNzIHRoYW4KNSBzZWNvbmRzIGFmdGVyIHNhdmluZyBh
IGZpbGUuIEZvciBleGFtcGxlOgpkYXRlID4gL21vdW50L3ViaWZzL2Zvby50eHQgJiYgc2xlZXAg
NCAmJiBlY2hvIENVVCBQT1dFUiAqTk9XKgoKT24gdGhlIG5leHQgYm9vdCBmb28udHh0IHNpbXBs
eSBkb2Vzbid0IGV4aXN0LgoKCkV2ZXJ5dGhpbmcgd29ya3MgZmluZSBmb3IgcG93ZXIgY3V0cyBo
YXBwZW5pbmcgYWZ0ZXIgMzAgKyA1IHNlY29uZHM6CmRhdGUgPiAvbW91bnQvdWJpZnMvYmFyLnR4
dCAmJiBzbGVlcCAzNSAmJiBlY2hvIENVVCBQT1dFUiAqTk9XKgoKT24gdGhlIG5leHQgYm9vdCBi
YXIudHh0IGV4aXN0cyBhbmQgaXQgY29udGFpbnMgYSBkYXRlLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
