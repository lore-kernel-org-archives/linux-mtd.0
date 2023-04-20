Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10257C77B73
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Apr 2023 18:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUr3R0xxmKRXGeoNAm8smJYwTn+cekx6DepR7Ld44Gk=; b=JmAz39P3iL+b0E
	BZUUJ2fkj1IizDuGLrs5XzN0EHauBsVQvvRhrdfxD+MYJ4TF27sBDRb2jlzhvaksVl6f3kvD6VMbw
	A/4+IWTBe2wXVav3EHqQc5szh4lmBUfeYbf/jbG37fHs/f0FPVy46aHRXQ7n6Tdnj//Enl3ssXHTs
	hUjJb1gV/p4V/5VzTJux8Z1Xm5c14MJoYzV3U6Y1onPqWBxdqWlVuT7uSvZqi++nh1MPRFvc2Myeu
	VOAGTDCiRGB38bti52zf9P3oFF3kMalwX1ZDA15DM9n7jzSgJh7eEraTuVgPHWCMmpaTfO3VxtgId
	TKdxcoHe9e4dlSn6CWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYnX-008iCS-04;
	Thu, 20 Apr 2023 18:14:23 +0000
Received: from mx6.ucr.edu ([138.23.62.71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYnT-008iBm-37
	for linux-mtd@lists.infradead.org;
	Thu, 20 Apr 2023 18:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1682014460; x=1713550460;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc:content-transfer-encoding;
  bh=79JZ1qAUMj74S4vtYkiWAHFaJpvNq+/BvXOjD8KVs9Q=;
  b=LhwMfYbxjNfkzkv6vrR4tZseKOoYcTsNzgZ4iZRHJlkaNOJ/d77L3DQN
   wutxSrgjGMA8Sw3RcE15iLznaWQOYLp9NwU3/o3XwqgULolyUsVfE0G6H
   wuSLp0Ci8MpyVjnx2b9pzZTC6gpiXo1QpI3OjVINBoTX5mcMOkJDlqFUn
   3MpblJ6pyXScUenPnryqGTGXPFERn75J8eNw+MSi1+Zac/c89NOATscUq
   scC2RlhuywBJwc6f7nX0eEgv44mzKG9TZABuGtLDdiLeZLdFA5rPxUd4X
   9JiNSCUvp8tBT97C8KLltEnuQQIBFwkYPwwU8IDOiojpSGFdOlyT60Nx/
   A==;
Received: from mail-wm1-f72.google.com ([209.85.128.72])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Apr 2023 11:14:17 -0700
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f16f50aeb5so3530255e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2023 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1682014455; x=1684606455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zoh9pDOCC4j4Hix+3gCXWVwjTru62KcX/tiREVIZHqM=;
        b=ap/xHYoQHs5URJuEagPQs3GrVM1cojbDATba7591kOmeHpwB/ZomsYg/3s/2BRMmAx
         FTtOFTR/i3H/cC32FgLVHZSMwiJ5rJDfEhGJ+gjo5FGj0dOIATJpftrWIzppT7eRDL2s
         BEtboSEQQb40mc6yAbt3/Ow2wDyo24cZJYTuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682014455; x=1684606455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zoh9pDOCC4j4Hix+3gCXWVwjTru62KcX/tiREVIZHqM=;
        b=SQ3umNT1RDc/zEjg5SHefzBzt8KJxUdzTdXnDl2riBLihhvwesVH8xBHAYAA3lrD3B
         ucn2MrGtA1hbiqTaI3D/a+DxOUg+E0xGTkECu5XMBVbtEb6gjFvT3/X+Yw2E3n/WxgLG
         QmFwEb5TlubSCvDW9bfJATgdD9YmJnQV292/dzibnsypsrqjW/McAteE9GQAG94cJ0EO
         wWCvnFr3iuDXZ/wziOwyUCzB8UMlzEJlyUBcGhIixybiJzFvLUaOB3AbwqVhKU8YqeNN
         sS93hUCPTVqYpZHHLyBoTAtvZuqNrqDHZ/umW36KHKSyHaqCL54X1TrHqLGyyzGNAZMk
         pFwg==
X-Gm-Message-State: AAQBX9fYliFN0Abj6vy/6zo5Ai1fis/ndaz2cLEVjc3QruwbdXgFYlZI
	K2gSJQ5Jo44rnDGjWf+3Db5fDXtHBQVWE/sLSD0ODut2eCRutEzOvM8RDnStUoTwHFjd4IVwEVJ
	3j4SOCWBEkUgU+sXoF8IU4pf6cmFk/BosUyTOBisXsUU=
X-Received: by 2002:a5d:4d06:0:b0:2e5:d4f4:c43b with SMTP id z6-20020a5d4d06000000b002e5d4f4c43bmr2135448wrt.55.1682014455357;
        Thu, 20 Apr 2023 11:14:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjMEn8mTBrM4XBI0Hr4pmayMt8MRCBDNv/WV/6weTMr0N6o8ABfndJycYj2gF1L50oyOih62bdISX69ZmrlTk=
X-Received: by 2002:a5d:4d06:0:b0:2e5:d4f4:c43b with SMTP id
 z6-20020a5d4d06000000b002e5d4f4c43bmr2135437wrt.55.1682014455063; Thu, 20 Apr
 2023 11:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com>
 <687864524.118195.1681799447034.JavaMail.zimbra@nod.at> <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com>
 <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com> <977347543.226888.1682011999468.JavaMail.zimbra@nod.at>
In-Reply-To: <977347543.226888.1682011999468.JavaMail.zimbra@nod.at>
From: Yu Hao <yhao016@ucr.edu>
Date: Thu, 20 Apr 2023 11:14:04 -0700
Message-ID: <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_111420_040610_81CD5107 
X-CRM114-Status: GOOD (  12.03  )
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

T24gVGh1LCBBcHIgMjAsIDIwMjMgYXQgMTA6MzPigK9BTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJp
Y2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0K
PiA+IFRoZSBrZXJuZWwgaXMgaW4gcWVtdS4gV2UgZmluZCB0aGF0IHRoZSBgbXRkYCBpcyBmcm9t
Cj4gPiBgbXRkID0gZ2V0X210ZF9kZXZpY2UoTlVMTCwgcmVxLm10ZF9udW0pO2AgaW4gZnVuY3Rp
b24gYGN0cmxfY2Rldl9pb2N0bGAuCj4gPiBBbmQgd2UgYXJlIHN0aWxsIHRyeWluZyB0byBmaWd1
cmUgb3V0IHdoYXQgTVREIGlzLgo+Cj4gQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgdGhlIHFlbXUgY29t
bWFuZCBsaW5lPwo+CgpxZW11LXN5c3RlbS14ODZfNjQgLW0gMkcgLXNtcCAyIC1rZXJuZWwKL2hv
bWUvdGVzdC9Xb3Jrc3BhY2UvU3l6R2VuL2xpbnV4LWRpc3Ryby9saW51eC02LjItZGVidWcvYXJj
aC94ODYvYm9vdC9iekltYWdlCi1hcHBlbmQg4oCcY29uc29sZT10dHlTMCByb290PS9kZXYvc2Rh
IG5ldC5pZm5hbWVzPTDigJ0gLWhkYQovaG9tZS90ZXN0L1dvcmtzcGFjZS9TeXpHZW4vbGludXgt
ZGlzdHJvL2ltYWdlL3N0cmV0Y2guaW1nIC1jaGFyZGV2CnNvY2tldCxpZD1TT0NLU1laLHNlcnZl
cj1vbixub3dhaXQsaG9zdD1sb2NhbGhvc3QscG9ydD01NDY0MCAtbW9uCmNoYXJkZXY9U09DS1NZ
Wixtb2RlPWNvbnRyb2wgLWRldmljZSB2aXJ0aW8tcm5nLXBjaSAtZGV2aWNlCmUxMDAwLG5ldGRl
dj1uZXQwIC1uZXRkZXYKdXNlcixpZD1uZXQwLHJlc3RyaWN0PW9uLGhvc3Rmd2Q9dGNwOjEyNy4w
LjAuMToxMTc2MC06MjIgLWRpc3BsYXkgbm9uZQotc2VyaWFsIHN0ZGlvIC1jcHUgaG9zdCxtaWdy
YXRhYmxlPW9mZiAtbm8tcmVib290IC1uYW1lIFZNIC1zbmFwc2hvdAotZW5hYmxlLWt2bQoKPiBX
aXRoaW4gTGludXggeW91IGNhbiBxdWVyeSAvcHJvYy9tdGQgb3IgL3N5cy9jbGFzcy9tdGQvCj4g
dG8gZ2V0IGluZm9zIGFib3V0IHRoZSBNVEQgaW4gcXVlc3Rpb24uCj4KClRoYW5rcyBmb3IgdGhl
IGhpbnRzLiBXZSBmaW5kIHRoYXQgdGhpcyBpcyBhIOKAnG10ZHJhbSB0ZXN0IGRldmljZeKAnS4K
CnJvb3RAc3l6a2FsbGVyOn4jIGNhdCAvcHJvYy9tdGQKZGV2OiAgICBzaXplICAgZXJhc2VzaXpl
ICBuYW1lCm10ZDA6IDAwMDIwMDAwIDAwMDAxMDAwIOKAnG10ZHJhbSB0ZXN0IGRldmljZeKAnQoK
PiBUaGFua3MsCj4gLy9yaWNoYXJkCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
