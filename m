Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2774606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PaQg4gQh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQ4ZH9eN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iIeu2Qrn21+gjnWr0EeDE8Pxpsz6mUHpVd0IR782v7M=; b=PaQg4gQhUVTJgd+oHTnZvo5uxS
	Ku9o645PzOmiQgy7E0ZB6Z0rh879lz3+8L7ZH/eqSBUI8GAh9WfHsLrebQznUl72pDU0zYoPxaPSn
	vWDiS8DXPhp0x9VK4ftmE5PTSJUJ/OQQ+gvOy8TfirFBRgj2AvEHGB73CyI8iYX4wi0ms77V/W9uh
	XtYbTIo0wprmz9QcFxDMQKSkpyKGoNJn2bNB1TU2pbfELADXBl5T8aQ5rD9JbpZYsthd3MvyKVKkw
	MF8rbmoO1IOgtuuDLSEw6yMFFMUXvuFbvb8CK/VSvhelyM8ZyYUcq+2HlvgHWTMGGvli35+2aiyeD
	DGLWnVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwfN-0000000B5FD-2xnB;
	Thu, 19 Nov 2026 07:34:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwfK-0000000B5Em-2OnM
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 07:34:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7344475e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 23:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073679; x=1795678479; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dzY65Mn7sGu+M2q54e119fF4Se6lQQQL75QJGZYrpw=;
        b=PQ4ZH9eNkEJ0vkuZ5aRkxKLoPOzemQJ/rLjMi5ZJ75JpzV1vnEVqtD7N4duCwbAwlw
         wxi/M/wsCD4Y0NMMyLT/dOdfghElkIxQdiy8LQLnwQS6VlQYyY8jIk35DI6z7Jz+swPc
         du6Lwev/gJwnIGscTMQmgcsMO0npFl8UKW1FMAuiYbWyrSfyl21PW+c9aPXayAqNCkgQ
         7Pw7PYCcbcx8qEkeKCcSl/cVx4/t3ue+XrpEzvGoXWKIuVKpeMWU+LRhqZQRH+/EgGH0
         9Y2eg6zYhzETEemZUyTwPY1hk+60ZXMYMhPdLksz4Q5W8du5jrB4ifL1TKMfius755PE
         9kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073679; x=1795678479;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dzY65Mn7sGu+M2q54e119fF4Se6lQQQL75QJGZYrpw=;
        b=D/OYDIWirUMOKszyG0eKRLvkHP8m/jfmsPAZhKTMDoyqNPq/7vhO3FZcPo/52LzCfa
         n4EsRJ9g4Sme6odGsvLyOGMFPUEk4X6mf6PbstKE6jE2NO9BqWfKBW8EIpiZOeqsfrZR
         rQTDO3xmkuHJWKCpDKOR1zLKRx82197aMV55Khuc4el00qn7aOtJkVg1/tw3/hcbLLLt
         NuUs0HBoIFMPCRkCM54/TK9/x4O/lVI/tupnxUgU3G232CyJ7qr2MoY2ew6UZi5NXzsY
         EimnU3CfWXTFTyrk2uzpNUugO51KlZR2XeMsALyHqxqzJHSeJqArwtTgpDGUPSPeq9xK
         +BcA==
X-Forwarded-Encrypted: i=1; AL+hErE/vbt2Gf3x6LzECfSEAeYM/RxGrkvqXP7tmKQjvF1JNLm4kHLYvbXFzEzzLBBRjT3u2TnZHF10vvg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9SjD5nIpZe2FsrIPJhLL0Kmg/XKDmGVfM6VvbIYqD/9puSV+6B
	PH/zGPlVj8w/a95VtsauuG/9++E7UpB1sBPhNIBsd7YxlNmpcxo+YClOonBbZg==
X-Gm-Gg: AYBFou2s9G5cn/FuO17pxGqVbzohmkgvnRzdN4wtTJhROGOvnk58Z1w3cZW1v6lnP+i
	adWIrVhJZ63U4TidEPpVVmQQo4AWWVtCe/uqDmZiUeIoLVn4LlSrKLkgOYRgp1I8rRhXFN2it/+
	yUZkT/LFzJdzltXSVBadw14T6a5s9QJKM5xqcCz6LAsys2CQTeuFaa9zStGqz1jXIEY6a9NbPSp
	h/txn6rV+uJy1n0/XDxWaPaB04zKl7hpQMKtugXe7ykREXvF/2PpPPuOai4NB2SS4DV0DpWhEef
	qTmfUZFTlMOoshY5nD5F3AlZ7tiLuhuNtpcPdXTTS+oIfE0jkri9WWrZ2QWFBLaSBLIEXa7vPEK
	I8+RWhaJPTXTgNO/bS/2FzOSZ9oTpsOe2y/2SDz03rfzD+O+ZtgKgeT0jaTJBrRtS5nOt13k4q6
	f1RUYtPYaaiSZM9800Bw0+svrCEJuawXmKRMjYfgm32C+YHxL1THTpUYRbwuQY9XRdF92Z3jEcB
	Wx+/c+UxDQeKcoJd3VhKeF4vDd4NHL3KZzPwzqubH3FIutPjxLpGUvfbiXqA9myW/DoooSpMMa0
	lW2r+ymoIMBtE25j6jpnNg2rjYzkq2qhDrAzm3BrgkPAqjynCGLLwScWXTcV3sRKomKI
X-Received: by 2002:a05:600c:8707:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb860f6239mr6955965e9.3.1795073678900;
        Wed, 18 Nov 2026 23:34:38 -0800 (PST)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526541fsm26479515e9.0.2026.11.18.23.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:34:38 -0800 (PST)
Message-ID: <9f7e4f67-6147-4ffa-b5b1-3628b6e8bc23@gmail.com>
Date: Thu, 19 Nov 2026 08:34:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 sashiko-reviews@lists.linux.dev, linux-mtd@lists.infradead.org
References: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
 <sashiko-outbox-219169@kernel.org> <87wlqajzo3.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87wlqajzo3.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_233442_665600_19582FA0 
X-CRM114-Status: GOOD (  13.31  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWlxdcOobCwKCjIwMjYuIDExLiAxOC4gOTo0NSBrZWx0ZXrDqXNzZWwsIE1pcXVlbCBSYXlu
YWwgw61ydGE6Cj4gSGkgR2Fib3IsCj4gCj4gT24gMTcvMTEvMjAyNiBhdCAxNjoyNzoxMSBHTVQs
IHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6Cj4gCgo8Li4uPgoKPj4gW1NldmVyaXR5OiBD
cml0aWNhbF0KPj4gVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gs
IGJ1dCBjYW4gdGhlIDItYnl0ZSBtYXJrZXJbXQo+PiByZWFkIGluIHNwaW5hbmRfaXNiYWQoKSBb
MV0gY29sbGlkZSB3aXRoIGZyZWUgT09CIHNwYWNlIG9uIGNoaXBzIHRoYXQKPj4gcmVzZXJ2ZSBv
bmx5IDEgYnl0ZSBmb3IgdGhlIGJhZCBibG9jayBtYXJrZXI/Cj4+Cj4+IHNwaW5hbmRfaXNiYWQo
KSB0cmVhdHMgYSBibG9jayBhcyBiYWQgd2hlbmV2ZXIgbWFya2VyWzBdICE9IDB4ZmYgfHwKPj4g
bWFya2VyWzFdICE9IDB4ZmYsIHJlYWRpbmcgT09CIG9mZnNldHMgMCBhbmQgMS4gIEhvd2V2ZXIs
IHNldmVyYWwgdmVuZG9yCj4+IG9vYmxheW91dF9mcmVlKCkgY2FsbGJhY2tzIGV4cG9zZSBPT0Ig
b2Zmc2V0IDEgYXMgZnJlZSBzcGFjZToKPj4KPj4gZHJpdmVycy9tdGQvbmFuZC9zcGkvZ2lnYWRl
dmljZS5jOmdkNWZ4Z3E0eGFfb29ibGF5b3V0X2ZyZWUoKSB7Cj4gCj4gVGhlIGJ1ZyBpcyBpbiB0
aGUgZ2lnYWRldmljZSBkcml2ZXIuIEl0IHdhcyBhcmJ0cmFyaWx5IGRlY2lkZWQgdG8ga2VlcAo+
IHVzaW5nIDIgYnl0ZXMgQkJNIGxpa2UgaW4gdGhlIHJhdyBOQU5EIHdvcmxkLgo+IAo+IFlvdSBt
YXkgZml4IHRoaXMgZHJpdmVyIGluIGEgc2VwYXJhdGUgcGF0Y2gsIGJ1dCB0aGF0IGlzIG5vdCBh
Cj4gcHJlcmVxdWlzaXRlIGZvciBtZS4KCk9rLgoKPiBIb3dldmVyLCB3aHkgaXMgdGhpcyBub3Qg
c3RhYmxlIG1hdGVyaWFsPwoKU29ycnksIEkgZm9yZ290IHRvIGFkZCB0aGUgc3RhYmxlIHRhZy4g
V2lsbCBzZW5kIGEgdjIgd2l0aCB0aGUgdGFnIGFkZGVkLgoKUmVnYXJkcywKR2Fib3IKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
