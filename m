Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E09EC3DA45
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 23:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PcuEfVatrjhhrZ/MrxLpY6lVuS399Bv2v4il3v66A6g=; b=TGndUzxIeCH8eu
	4l/wfjkJVIDf1XHQZYdxsGz236KQcxQHKaJjs3ZC5+DC209tnv1RJ3ISaF4+wJxhl0lMbxoGxm3Zs
	+IQFdMvN9yRebHdjeohfqJ37kFrm/eFbYWiAaH0iu5Hru0CdyoGvLqmdrfhlGwmQo25t46mplnt8E
	yykHZxkC+tYg2cMAiknYOc3zLD/POq1Inkk2syWbtvvaRLsdY/6H0+7vHdHGUkQq7kA7VOiRn+6S9
	pXpQtjwNeA2z6iEpyYVEVJk3lNRYsH3254UA3orLcL0JIglq3tyH1B8qVPzohEterZ116jhOZJDLz
	dZvXk8kJhJCMPRR5wrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2sm-0000000FmCl-1Qzm;
	Thu, 11 Jul 2024 23:07:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2sj-0000000FmC7-1r3N
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 23:07:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso1814676a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2024 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720739238; x=1721344038; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byKCeNwRs0T1R6plp9OuqfAkOz/elWWT8jqkCBg7kkg=;
        b=EXHCqI5lLgWWDUOlfMxnTNC1yGgpLGgnEAIHpllx7Zq1S7q257t2zlmd478ixMzXnX
         N/Olbq/nw2Bsamp5hN6jJU65KBAVrSXDRP7FkGGAAzTC+xHGJRCodpnwqwCMPgTQ8CBi
         vOk5uKDFgDO1S7Br6bJi1rkBFjNlHrY68dEY+m1J+IXg13NnQl75Ep4G8HYCPePXyfYY
         /dV/2iEHpJh7n6lRJ9rOR190TWEiJyRP+THKMPrfYEyvlT8XCXaCey1s+1q5rqdUqZng
         5GKgp9V506uTMxrqWbjlPiA/VynFY0JDUV81OgN3wayLm5GehmV5PJcqGstpjlwGMxzL
         Txxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720739238; x=1721344038;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byKCeNwRs0T1R6plp9OuqfAkOz/elWWT8jqkCBg7kkg=;
        b=wHhesAzz8IE4EIcz3bLKnlZPfgGh4VQpprqcEwXfC4FVESr5i9y/TAKNxM2mZb/ycn
         lpZ0KP2YuKvOkSDQrD1RoF4cjkvmOzm9Xe35AlelEWd81f1ZDb85HxqqA2XVOv9NofMp
         SJ38cL8dze5HdSdnzMPfyv72jcNfqWqtGrLZeWnLClqIpX6aOWc8E1iCIomYcB1HHvc6
         QJkej4HAncGP/Xd3xKxP9P0xi/368EVkjP71okGCiPWnPN1ozyf5NCRwSLzoPL4lEtRt
         4eX2oGtmx26TzRSDgg/Li7+Zai6OJiIIU9fapdGbwa0YhX3GeV8Kqef+rGowL4ETHYJm
         IleA==
X-Gm-Message-State: AOJu0YzAECEOx8f7fyQuMO6YlDReQb5Yw3T3+ftgHCQsjJMlcRXp0Rh8
	TcChyPkztHv2+9WYUlz5WMAunXcuIwXicllHVoklZ4yjzPl2VNVFMi4UTA==
X-Google-Smtp-Source: AGHT+IHTbjG/RYmwHcT/Q3lMtncGYloiLd+y4K3oAC67A0D4AU6O7kPZeN9IfTq1U1PJ5DxsO9o1cg==
X-Received: by 2002:a17:907:3d87:b0:a77:d52d:5c61 with SMTP id a640c23a62f3a-a780b89ea27mr804898966b.69.1720739237926;
        Thu, 11 Jul 2024 16:07:17 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-148.xnet.hr. [88.207.43.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bcc52sm287890266b.4.2024.07.11.16.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 16:07:17 -0700 (PDT)
Message-ID: <4aa9b897-4596-4e2c-8dda-f24ab51e9b7c@gmail.com>
Date: Fri, 12 Jul 2024 01:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: [PATCH v1 1/1] mtd: slram: insert break after errors in parsing the
 map
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_160721_503967_2A225B15 
X-CRM114-Status: GOOD (  10.32  )
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

VGhlIEdDQyAxMi4zLjAgY29tcGlsZXIgb24gbGludXgtbmV4dCBuZXh0LTIwMjQwNzA5IHRyZWUg
Zm91bmQgdGhlIGV4ZWN1dGlvbgpwYXRoIGluIHdoaWNoLCBkdWUgdG8gbGF6eSBldmFsdWF0aW9u
LCBkZXZsZW5ndGggaXNuJ3QgaW5pdGlhbGlzZWQgd2l0aCB0aGUKcGFyc2VkIHN0cmluZzoKCiAg
IDI4OSAgICAgICAgICB3aGlsZSAobWFwKSB7CiAgIDI5MCAgICAgICAgICAgICAgICAgIGRldm5h
bWUgPSBkZXZzdGFydCA9IGRldmxlbmd0aCA9IE5VTEw7CiAgIDI5MQogICAyOTIgICAgICAgICAg
ICAgICAgICBpZiAoIShkZXZuYW1lID0gc3Ryc2VwKCZtYXAsICIsIikpKSB7CiAgIDI5MyAgICAg
ICAgICAgICAgICAgICAgICAgICAgRSgic2xyYW06IE5vIGRldmljZW5hbWUgc3BlY2lmaWVkLlxu
Iik7CiAgIDI5NCAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgIDI5NSAgICAgICAg
ICAgICAgICAgIH0KICAgMjk2ICAgICAgICAgICAgICAgICAgVCgic2xyYW06IGRldm5hbWUgPSAl
c1xuIiwgZGV2bmFtZSk7CiAgIDI5NyAgICAgICAgICAgICAgICAgIGlmICgoIW1hcCkgfHwgKCEo
ZGV2c3RhcnQgPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAgIDI5OCAgICAgICAgICAgICAgICAg
ICAgICAgICAgRSgic2xyYW06IE5vIGRldmljZXN0YXJ0IHNwZWNpZmllZC5cbiIpOwogICAyOTkg
ICAgICAgICAgICAgICAgICB9CiAgIDMwMCAgICAgICAgICAgICAgICAgIFQoInNscmFtOiBkZXZz
dGFydCA9ICVzXG4iLCBkZXZzdGFydCk7CiDihpIgMzAxICAgICAgICAgICAgICAgICAgaWYgKCgh
bWFwKSB8fCAoIShkZXZsZW5ndGggPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAgIDMwMiAgICAg
ICAgICAgICAgICAgICAgICAgICAgRSgic2xyYW06IE5vIGRldmljZWxlbmd0aCAvIC1lbmQgc3Bl
Y2lmaWVkLlxuIik7CiAgIDMwMyAgICAgICAgICAgICAgICAgIH0KIOKGkiAzMDQgICAgICAgICAg
ICAgICAgICBUKCJzbHJhbTogZGV2bGVuZ3RoID0gJXNcbiIsIGRldmxlbmd0aCk7CiAgIDMwNSAg
ICAgICAgICAgICAgICAgIGlmIChwYXJzZV9jbWRsaW5lKGRldm5hbWUsIGRldnN0YXJ0LCBkZXZs
ZW5ndGgpICE9IDApIHsKICAgMzA2ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4oLUVJ
TlZBTCk7CiAgIDMwNyAgICAgICAgICAgICAgICAgIH0KClBhcnNpbmcgc2hvdWxkIGJlIGZpbmlz
aGVkIGFmdGVyIG1hcCA9PSBOVUxMLCBzbyBhIGJyZWFrIGlzIGJlc3QgaW5zZXJ0ZWQgYWZ0ZXIK
ZWFjaCBFKCJzbHJhbTogLi4uIFxuIikgZXJyb3IgbWVzc2FnZS4KCkZpeGVzOiAxZGExNzdlNGMz
ZjQgKCJMaW51eC0yLjYuMTItcmMyIikKQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+CkNjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgpDYzog
VmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgpDYzogbGludXgtbXRkQGxpc3Rz
LmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogTWlyc2FkIFRvZG9yb3ZhYyA8bXRvZG9yb3Zh
YzY5QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL3NscmFtLmMgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
ZGV2aWNlcy9zbHJhbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zbHJhbS5jCmluZGV4IDI4MTMx
YTEyN2QwNi4uODI5N2IzNjZhMDY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL3Ns
cmFtLmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zbHJhbS5jCkBAIC0yOTYsMTAgKzI5Niwx
MiBAQCBzdGF0aWMgaW50IF9faW5pdCBpbml0X3NscmFtKHZvaWQpCiAgICAgICAgICAgICAgICBU
KCJzbHJhbTogZGV2bmFtZSA9ICVzXG4iLCBkZXZuYW1lKTsKICAgICAgICAgICAgICAgIGlmICgo
IW1hcCkgfHwgKCEoZGV2c3RhcnQgPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAgICAgICAgICAg
ICAgICAgICAgICAgIEUoInNscmFtOiBObyBkZXZpY2VzdGFydCBzcGVjaWZpZWQuXG4iKTsKKyAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAg
ICAgICBUKCJzbHJhbTogZGV2c3RhcnQgPSAlc1xuIiwgZGV2c3RhcnQpOwogICAgICAgICAgICAg
ICAgaWYgKCghbWFwKSB8fCAoIShkZXZsZW5ndGggPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAg
ICAgICAgICAgICAgICAgICAgICAgIEUoInNscmFtOiBObyBkZXZpY2VsZW5ndGggLyAtZW5kIHNw
ZWNpZmllZC5cbiIpOworICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAg
ICAgIH0KICAgICAgICAgICAgICAgIFQoInNscmFtOiBkZXZsZW5ndGggPSAlc1xuIiwgZGV2bGVu
Z3RoKTsKICAgICAgICAgICAgICAgIGlmIChwYXJzZV9jbWRsaW5lKGRldm5hbWUsIGRldnN0YXJ0
LCBkZXZsZW5ndGgpICE9IDApIHsKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
