Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B9C61CE7
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jun 2025 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/70AsV7Opj11wxFOFQkVxil7t+ghCe1oglzXSVvtr0=; b=ddKTC6PW9cnNiD
	mRS04kinTJbBA+J7m5/cZTS+zl5FsSeSHdc4FN3ESyWK4IdlGYam3MCBWh1B+fF/PQj7GraJnsPRa
	JnmvRIZFXjnIoai02i01FpKPVAN3biIhSZDj8xjYdBNeroPIxIDMeYBDA/tGrN6vOfymfKUMJI14d
	y+XwuaYAJRMfQIKtq1ilsW6f/5Jo9+Gh3lKzPDtXRYpwA6gdnYsa3dmxuPHu6Wc0OM3DulTSzsj8y
	0nZUShogQfnJ7GOLd76WpTuqzPJM9tHMFM4EBon9ZfH11b9jsvdZbgme6HCTVT/YDm1arLBFWN6sX
	YPDNmBJMlpruGbdQaILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuiE-00000001lut-2gpO;
	Sat, 07 Jun 2025 14:39:58 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuiB-00000001luX-1enx
	for linux-mtd@lists.infradead.org;
	Sat, 07 Jun 2025 14:39:56 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-70a57a8ffc3so30727617b3.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Jun 2025 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749307194; x=1749911994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHqv39PDsJJNauBVvC0f9jO64Wr+HDbnLVQoK8iIq1E=;
        b=hPBX411Pt+LTYO6bhZM2plqxtoDcg5pudMyoyneEBKAy8mRi2D7uzuwEOIQgw1qxd+
         Nnr/XVqYinnsika6U0qfLo2oayBf2LrwrXJJS4I4NZn+qdhzVm9XllVLl8yKivbG16Ru
         zneWRlzZ2P+ZtTr6y+uuxeSj9UrOJVRHPYLxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307194; x=1749911994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHqv39PDsJJNauBVvC0f9jO64Wr+HDbnLVQoK8iIq1E=;
        b=MY/KgcneWccNgafRaKXCUvXWqdaa87z0A72GjMSACzK1YC81Th+0/tlccAgAcO7pXT
         m9CHj8BMOCDq2lU1sjuDdjZuhbvkG4984VPLkyYD6L8WZCx3OOo62QbfuZjCDYVSB6EO
         xtLDqXypM4aLxrQnLn459BIeSxCplSOkF4tQO3rHimCpnqzjOZ1mGZnbs5d3xkpOl4Ik
         MZVxfNWpBARyz+UXo1W/njMsACUxzHWxihiRPktLckW8Sur4HiUo1cDmCe471IMSj9DU
         5jkTRw1dfLMxDimfUfcpKL3uL4EY+2h2kt7PdWxOYEg2ahYCF1GnmUCwjT+aFx62CQz1
         0n6w==
X-Forwarded-Encrypted: i=1; AJvYcCVgq81cGTDt1Noed8GQ7l511fgmn9zcFbkclnGziNX6EifqXJC4f+JILh8KzySnuqfmVyjx2Qb+76I=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywep8IiDEbqVgQuejY9Lko5N7KTbuhb55s75drRTURtlXNNdOER
	aw0d5v2naoJLCKSjUyXb+qrobQ//cQrWX31nwCOUg1qRInynOFZIFhIxaBxYJsLLC2bSpfMz7rh
	t4GxuzLxtof1LauYAViGXWXSpYPTpw5FziWbJOScWgA==
X-Gm-Gg: ASbGnctPiNZxfj4ABdKenaofxbc1Nl87nBi1nGp6eboKAUE78FLMETsOWDEe03lQ30Y
	KrCPprvz4JPr+wCl31VGj8Hz0LR3aGTzCdGddKaTDFAcpUcHM4iJxUw91jwldKV26JW90Rg1gLA
	Nr534i3RInsUBY2m5hSu3EexSff9q2Dt4mUV5a17E24QeEUTbmTbDKPSNUiGIb8SrXk8Ak8tQOi
	smd0yln2Jfoh6c=
X-Google-Smtp-Source: AGHT+IGXnLbdTQ7WY5qyr2MwKl55pntZEcHn/Q+8WNYqfpbKBhNFpRmGll0I/fU9W4buHfMSUs8ba72UGYvlnZAAI6Q=
X-Received: by 2002:a05:690c:4982:b0:70a:192d:122 with SMTP id
 00721157ae682-710f771089fmr102515197b3.30.1749307193885; Sat, 07 Jun 2025
 07:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
In-Reply-To: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Jun 2025 07:39:43 -0700
X-Gm-Features: AX0GCFsJZiLqhp1HZhoxRCSdZw1tdEdtzPFkAQHiKsxEvo8cWqyF1tEmjiU5N-8
Message-ID: <CAADWXX-=CvpwaMJLiWMLXbxzN2Y62VrJ7mhwxUmQBVshdzViaw@mail.gmail.com>
Subject: Re: [GIT PULL] JFFS2 and UBIFS fixes for v6.16-rc1
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_073955_454669_C4F288A6 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gNiwgMjAyNSBhdCAxMDo1OeKAr1BNIFJpY2hhcmQgV2VpbmJlcmdlciA8cmlj
aGFyZEBub2QuYXQ+IHdyb3RlOgo+Cj4gVGhpcyBwdWxsIHJlcXVlc3QgY29udGFpbnMgdGhlIGZv
bGxvd2luZyBmaXhlcyBmb3IgSkZGUzIgYW5kIFVCSUZTOgoKZ21haWwgaGF0ZXMgeW91IGFuZCB0
aGlzIHdhcyBpbiBteSBzcGFtIGZvbGRlci4KCkkgb2J2aW91c2x5IGRvIGNoZWNrIG15IHNwYW0g
Zm9sZGVyIHJlbGlnaW91c2x5IGFuZCBub3RpY2VkCmltbWVkaWF0ZWx5IC0gYnV0IHdoaWxlIGNo
ZWNraW5nIHNwYW0gaXMgYWJvdXQgYXMgcmVsaWdpb3VzIGFzIEkgZXZlcgpnZXQsIHRoYXQncyBz
dGlsbCBub3QgdmVyeSByZWxpZ2lvdXMgYXQgYWxsLgoKU28gd2hpbGUgSSBkbyB0ZW5kIHRvIG5v
dGljZSBlbWFpbCB0aGF0IGdldHMgY2F1Z2h0IGFzIHNwYW0gYXMgcGFydCBvZgpteSBtb3JuaW5n
IGNlcmVtb25pZXMsIEkgcmVhbGx5IGNhbid0IGd1YXJhbnRlZSBpdC4KCkluIGZhY3QsIG9mdGVu
IG15IHNwYW0gb2JzZXJ2YW5jZSBpcyB2ZXJ5IGN1cnNvcnkgaW5kZWVkLgoKSXQncyBub3QgZW50
aXJlbHkgb2J2aW91cyBfd2h5XyBnbWFpbCBoYXRlcyB5b3UuIFRoZXJlJ3Mgbm90aGluZwpvdmVy
dGx5IHdyb25nIHdpdGggdGhlIGVtYWlsLCBhbmQgeW91IGhhdmUgcHJvcGVyIHNwZiByZWNvcmRz
LiBCdXQgaWYKcG9zc2libGUsIHlvdSBtaWdodCB3YW50IHRvIGxvb2sgaW50byBhbHNvIGFkZGlu
ZyBETUFSQyBmb3IgdGhlIG5vZC5hdApkb21haW4uCgpJdCBkb2VzIGxvb2sgbGlrZSBsaXRob3Bz
LnNpZ21hLXN0YXIuYXQgKHdoaWNoIGlzIHdoYXQgeW91IHNlZW0gdG8gZ28KdGhyb3VnaCkgaXMg
YmxhY2tsaXN0ZWQgYXQgczVoLm5ldCwgYnV0IEkgaGF2ZSBubyBpZGVhIGlmIGdtYWlsIGNhcmVz
LgoKICAgICAgICAgICAgICBMaW51cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
