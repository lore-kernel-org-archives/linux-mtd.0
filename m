Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE54CC6B08
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxYL2lfUNoxiZNXjQ/3t1AHGapYGu/3x0/ckYsYh0/s=; b=kPLcYTyMbLFJqx
	7qvp1kZp14G//IjrjSax4dHzcNWQAgehncVXFmTJd4D9pdIqFxrkZWrVKvmR7/X7WZWKhWmuY/L54
	Q8KibAUcDo1p9hmYfpIChnEQgcjiHicsMSJy1gjwCj+q7fE5sgrXQbugBjC/2A8XR+WHR1X7JftOq
	nGNA7Lh21grmTC0p9ag2VVroccFYzZ99Nvm+pidObryQ6zyCu3gNikl3LJGSJqDIBmV9Ms8SY1YfM
	cW8+mFZGxlpyBav//PsixfG0qlZrvuCQvHDth3tBOtIVuJa5OsjNjEup65Cs72oFcki6HRnc1VgbZ
	2eIjNMQqL1tLZAaIRUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4d-0000000CSPY-3jGU;
	Tue, 13 Oct 2026 09:45:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4b-0000000CSOn-1nvG
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so24936595e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791884726; x=1792489526; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8v0JkLJFzbjbUzSunhsNyUV3+4oWGxJqnDHXmr6loY=;
        b=s4zKlHN15hgCuvgQtRozv9HiZPm8YP9ZvTv/YieJj3gZvCmnTCuaEcV0Bfk6Sj8vyE
         mk1172hAD/k1rKgJYjmgCI7KNFq0GRFq+fuHW/ky28f4bJwq2rwy2mZDHY6I19kVoNpM
         mqqxWhMV/8yNj6sAdpWfHN/qIgou/FNTpZV4ddDpIm4w06n9/SUQM/TtWFSxxtgzDEHA
         DfYW3YeBaDW6dQZpLIpzhi7j0f6UsG7onPA+HJi9/7P22h6zXtsrih5lcMHbJYrJlpVE
         MMe+dR05ldok2fQJqPqbYUuVD/fCKuoI33os/9W/W3yIvMBPwZnOFQ/H08aao3grm+61
         lMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884726; x=1792489526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8v0JkLJFzbjbUzSunhsNyUV3+4oWGxJqnDHXmr6loY=;
        b=1sNCqpzUPzluJLyJs8/TsjJ6cGFhocltw9jJscoiXVbU105602ioAe40VKwPKjBMMv
         CIiQFecbLcVSQPXflO3w5GrwHHOf0zErfJQEJ3kxvbrNpQZ8VNHn9je4csuC2wT2mnj3
         JksdgyG3YpCNFJ/hGATcXuShRBZ7iE7iJHYMiPOK4c9kk17m/kaW7V2PIAAhFiG1/kRd
         t1l5BmrkAMJbAvke4fSBLddvFg4CG0lamW4hVgWWTlXe2sJGU37XeHkCArq9J5BaKuNL
         /4Vde9SmLgML/ze2e7rueAH5uBypQ08XVaZeNKisapiGtRQcMOg7jUcVmVqukydTw9IR
         Aymw==
X-Forwarded-Encrypted: i=1; AKwUvBxRZTyt3KKSwB3077uyqVNww+B/NgdOdl+UGkl8rIUzxnOCpteue8R16PURVDeQoc9xsiOL6bzW5Aw=@lists.infradead.org
X-Gm-Message-State: AFq9FYJa89B/DHJsv3ZScMc1RO4DKKV8xutobPCWAL/bK2O+OaHhTlYS
	7Z44LtMSTZ0STsb1bYPmpqy3ZTRDtUM9AyMbwE7WlRhiGfaTeoOkSzEN
X-Gm-Gg: AYBFou3Vfc3rTdVFQiDLyMLbYwzmazXp7U0OQH8Rwr3UBdlzPL58eoaO34Cz4ZF7XFh
	xMRJRpJ3Z+8rzc5418tP3zne+OqdyWL6PAGUJPEv6DgGopPM+ZoSmNzFCCUIU8igBBCa3VvaPNC
	meiHdzVZvT2UldBXm1B90YsZlNhxgIfq1JbuMZB39PShjrwlDb3ymOPV3akiAp//GvyT+FpWjxj
	YD48XHSifnygxmQtlNC/sJWyJKDaA9ICu5WsQZlmT7h6Hv4rl5u0z3ZGDhRlUs2/OsVkorN0WL1
	6AsVOvU28QngSOYiRGB5YMzZknzA3CH9etRKNqhEA9R4ILAApgb43DQgsG1jTUfcEGwYEWaVAMy
	G3MZlg5tmuyMzlGlu/jE0uCAMIeGIr2ZAhjKDjGNr6eI2R+TAG7cUVLKfMdbQN1jHpS801sdev0
	E3z354GDhJSY2MBeeY+TOaLDSIwqA7jgmAMl49Z6eW84N0CBET6JOryw6hwlHkPv6tadcNwmUgN
	kGrJyZhLeOhYT7Jzu4bzLslRyeIoUie1KXsWg==
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr252151255e9.16.1791884726303;
        Tue, 13 Oct 2026 02:45:26 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dd15659sm233154305e9.4.2026.10.13.02.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:45:25 -0700 (PDT)
Message-ID: <9c311e76-66e4-4ac4-a59b-f0d7cfeade6e@gmail.com>
Date: Tue, 13 Oct 2026 11:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: parsers: qcom: drop setting of partition's
 mask_flags
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
 <87qzhuzsea.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87qzhuzsea.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_024529_482247_99761DCB 
X-CRM114-Status: GOOD (  13.07  )
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

SGkgTWlxdcOobCwKCjIwMjYuIDEwLiAxMi4gMjA6Mjcga2VsdGV6w6lzc2VsLCBNaXF1ZWwgUmF5
bmFsIMOtcnRhOgo+IEhpIEdhYm9yLAo+IAo+IE9uIDA2LzEwLzIwMjYgYXQgMjI6MDA6NDEgKzAy
LCBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IFRoZSAnYXR0cicg
bWVtYmVyIG9mIHN0cnVjdCAnc21lbV9mbGFzaF9wZW50cnknIGlzIDggYml0cyB3aWRlLAo+PiBz
byBpdCBpcyBvbmx5IHVzYWJsZSB0byBtYXNrIHRoZSBsb3dlciA4IGJpdHMgaW4gdGhlIE1URCBm
bGFncy4KPj4gSG93ZXZlciB0aGUgTVREIGxheWVyIGRvZXMgbm90IGRlZmluZSBhbnkgbWFza2Fi
bGUgZmxhZ3MgaW4KPj4gdGhlc2UgYml0cyBhdCBhbGwuIEFkZGl0aW9uYWxseSwgdGhlIG1lYW5p
bmcgb2YgdGhlIGJpdHMgaW4gdGhlCj4+ICdhdHRyJyBmaWVsZCBpcyBub3QgZG9jdW1lbnRlZCwg
c28gaXQgaXMgbm90IGV2ZW4gcG9zc2libGUgdG8gbWFwCj4+IHRob3NlIHRvIHRoZSBkZWZpbmVk
IE1URCBmbGFncy4KPj4KPj4gRHVlIHRvIHRoZSByZWFzb25zIGFib3ZlLCByZW1vdmUgdGhlICdt
YXNrX2ZsYWdzJyBhc3NpZ25tZW50IGNvZGUKPj4gc2luY2UgaXQgaGFzIG5vIGVmZmVjdCBhbnl3
YXkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgo+
IAo+IFNvcnJ5IGJ1dCBpdCBubyBsb25nZXIgYXBwbGllcyBhZnRlciBXZWlnYW5nIEhlJ3M6Cj4g
W1BBVENIXSBtdGQ6IHBhcnNlcnM6IHFjb206IGZpeCBvZmZzZXQvc2l6ZSBvdmVyZmxvdyBvbiBs
YXJnZSBwYXJ0aXRpb25zCgpTb3JyeSwgbXkgZmF1bHQuIFRoZSBwYXRjaCB3YXMgYmFzZWQgb24g
bmFuZC9uZXh0LgpJIHdpbGwgc2VuZCBhIHYyIGJhc2VkIG9uIHRpcCBvZiBtdGQvbmV4dC4KClJl
Z2FyZHMsCkdhYm9yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
