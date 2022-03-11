Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEFEC43217
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XGTIyJmz2X8WpEjh6yvoUAVP3wUMWP+dp3oATso0rso=; b=Mm27e6i6kmg55U
	RXuCPVJhfHyX8nEtdAPBkqUgNXqSgVLWWNj2848A9QGgdV869XkrrVW3dUndjVD3ZYPNOBo5ELpgP
	3OIV+ndF9GMfCIhjMpdN/3j7f/+D6ZmaS/NizcPpe6rqiP6fB6mqkenis3usDyfOy1EUAdfez055N
	rls0bFHv/o9NlKc26xhmJ0yKfYnx+zEVsVfH1Yx6hSJpm7j2nFSaVZTM/HWlU05KthBLS9r5VbRHp
	SnDoZKr6/t+azwacTPC6ppVbqbFpQpfYqq2n5rwwxUqWFQj3M56AqIA/qx9AGuipx5Il37K+GKn22
	xMsoFzEqyqNeAqGZ7qbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSe0h-00GJxj-Ut; Fri, 11 Mar 2022 12:04:44 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSe0e-00GJxD-KB
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 12:04:42 +0000
Received: by mail-lj1-x230.google.com with SMTP id 17so9638960lji.1
 for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2022 04:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:from:subject
 :content-transfer-encoding;
 bh=rwC5zz6O6CdGqZZlY54+eOQ/iUgRKof7kxgVJZOQbFg=;
 b=GiAo9iBtGMGhDLtVV1E0Ivjw9QX/PPPjGp8JRI3KCTEKF93AUx+7oKtvsiILQoK5vd
 RPW10Hgju6xJcUnarG2hMMRdPNXGF6+e4rdUYTccZT9hVJnchNtz6tmOKYwEuIA4Fy4E
 FlYja27gTh2aagr9Mih19B/bGY7vbJbkjjrJv3QKshWouq1G7LmmdQlFmFbW/0Y2D8Ae
 F2IAzPHZISL3noH3UUM6eTYOgkJQ4734qOiLUJkXO7xDeQt2YBTaf2aIy3nvECrhF7CC
 TVIUrWcC1s96OZeQ4RqOy7Hx03nsaSNez6iffFCHtCnnNtAvHl/PBiZY1VEmCcgm/sBq
 C+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:from
 :subject:content-transfer-encoding;
 bh=rwC5zz6O6CdGqZZlY54+eOQ/iUgRKof7kxgVJZOQbFg=;
 b=btLXKFRuN23uMhM3GoUyUaFt0K2uLOt8f3Kqiu+nR4kCLVT7lbZ+mFcqMjK0p8nNcd
 Y0nlchTijSkEt6ZdNiHwRMezQ05SERuS+Ou8/sl+d4z1rpmvtXmCK0+9ufuOI8r5LCvN
 Sm48a8iou65WL/ern/PYXDdNwxiJr0uD6IbSrj2kFgIAmB7ZpWO3/E2g492QTPLqbkQk
 f588EG+kmIF+ydyubP441VDYUAgpVXUQBwo7Q2d3F7874nRXVzmw/lirE4iuxJrfiysq
 PgsvSBk1EOR/WGkFOfZ0bmoPemVbDu1/XZv5Dv6sPEkmDAxPmQC+WaPnxqIT2UTr/g1/
 DaZg==
X-Gm-Message-State: AOAM530/podJiiCqv/wLKoLrnreGXiIOdVu1CvJtuTY+P/3JD5I+6C8u
 CNP5baeCzf3USDBOZJSQ+R9oieB9E/s=
X-Google-Smtp-Source: ABdhPJwC5aL8knEyJ5rVPhQiYITW15NZLL/zybA5HM1OFY4IorqRG6l1VfgQuB92v75MY6EIevkyWg==
X-Received: by 2002:a05:651c:b07:b0:247:e06d:8943 with SMTP id
 b7-20020a05651c0b0700b00247e06d8943mr5618238ljr.426.1647000277971; 
 Fri, 11 Mar 2022 04:04:37 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 q26-20020ac24a7a000000b004437f641a32sm1578551lfp.15.2022.03.11.04.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 04:04:37 -0800 (PST)
Message-ID: <bb8bccf4-b5ca-c0a7-22c9-39f9263e2c56@gmail.com>
Date: Fri, 11 Mar 2022 13:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Handling ubinized image flashed on not erased flash space
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_040440_742647_8A5CDBF5 
X-CRM114-Status: GOOD (  10.38  )
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

RMOpasOgIHZ1PyBZZXMhIENoZWNrOgpbUEFUQ0ggUkZDIDIvMl0gdWJpOiBhZGQgc3VwcG9ydCBm
b3IgVUJJX0VDX0ZMQUdfRVJBU0VfRlJPTV9IRVJFCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAxNjEyMzAxNzExNTEuMTM0NDgtMi16YWplYzVA
Z21haWwuY29tLwoKCk15IHByb2JsZW0gaXMgdGhhdCBzb21lIGJvb3Rsb2FkZXJzIGRvbid0IGVy
YXNlIGZsYXNoIHBhcnRpdGlvbiBiZWZvcmUKd3JpdGluZyBhIG5ldyBmaXJtd2FyZSBpbWFnZS4g
VUJJIHdvbid0IGxpa2Ugc3VjaCBmbGFzaCBnYXJiYWdlOgoKdWJpMDogYXR0YWNoaW5nIG10ZDIK
dWJpMCBlcnJvcjogdWJpX2F0dGFjaDogYmFkIGltYWdlIHNlcXVlbmNlIG51bWJlciAxNjQ2MTYx
OTk4IGluIFBFQiAxMTksIGV4cGVjdGVkIDUyNDUwMzk4MwpFcmFzZSBjb3VudGVyIGhlYWRlciBk
dW1wOgogICAgICAgICBtYWdpYyAgICAgICAgICAweDU1NDI0OTIzCiAgICAgICAgIHZlcnNpb24g
ICAgICAgIDEKICAgICAgICAgZWMgICAgICAgICAgICAgMQogICAgICAgICB2aWRfaGRyX29mZnNl
dCAyMDQ4CiAgICAgICAgIGRhdGFfb2Zmc2V0ICAgIDQwOTYKICAgICAgICAgaW1hZ2Vfc2VxICAg
ICAgMTY0NjE2MTk5OAogICAgICAgICBoZHJfY3JjICAgICAgICAweDFlYjI4OTk0CmVyYXNlIGNv
dW50ZXIgaGVhZGVyIGhleGR1bXA6CnViaTAgZXJyb3I6IHViaV9hdHRhY2hfbXRkX2RldjogZmFp
bGVkIHRvIGF0dGFjaCBtdGQyLCBlcnJvciAtMjIKVUJJIGVycm9yOiBjYW5ub3QgYXR0YWNoIG10
ZDIKCgpUaGlzIHByb2JsZW0gYWZmZWN0cyBlLmcuIEJyb2FkY29tJ3MgQ0ZFIGJvb3Rsb2FkZXIu
IFRoZXJlIGlzIG5vIGFsd2F5cwphIHdheSB0byB3b3JrYXJvdW5kIHRoYXQgb3IgaXQgbWF5IHJl
cXVpcmUgc29tZSB1c2VyLXVuYXZhaWxhYmxlIHRyaWNrcwoobm90IGV2ZXJ5IHVzZXIgaGFzIGEg
c2VyaWFsIGNvbnNvbGUgdG8gc3RhcnQgd2l0aCkuCgoKT3BlbldydCBoYW5kbGVzIHRoYXQgYnk6
CjEuIEFwcGVuZGluZyBFT0YgbWFya2VyIHRvIHRoZSB1YmluaXplZCBpbWFnZQoyLiBNb2RpZnlp
bmcgVUJJIGtlcm5lbCBjb2RlIHRvIGVyYXNlIGV2ZXJ5dGhpbmcgcGFzdCBFT0YgbWFya2VyCgoK
SSdtIGxvb2tpbmcgZm9yIGEgQnVpbGRyb290IHNvbHV0aW9uIG5vdy4gTGFzdCB0aW1lIEkgd2Fz
IHRvbGQgdGhhdAp1cHN0cmVhbSBrZXJuZWwgaXMgbm8gcGxhY2UgZm9yIHN1Y2ggaGFja3MuIEl0
IHdhcyBzdWdnZXN0ZWQgdG8gdXNlCmluaXRyYW1mcyB3aXRoIHVzZXItc3BhY2UgdG9vbCB0byBk
ZWFsIHdpdGggaXQgaW5zdGVhZC4KCk15IHF1ZXN0aW9uIGlzOiBob3cgdG8gZG8gdGhhdD8gSSBu
ZWVkIHRvIGVyYXNlIGZsYXNoIHBhcnRpdGlvbiBzdGFydGluZwp3aXRoIHNvbWUgbWlkZGxlIGJs
b2NrICh0aGUgZmlyc3QgYWZ0ZXIgdWJpbml6ZWQgaW1hZ2UpLiBJIG5lZWQgdG8gZ2V0CnRoYXQg
b2Zmc2V0IHNvbWVob3cuCgpJICpjYW4ndCogc2NhbiBibG9jayBhZnRlciBibG9jayBsb29raW5n
IGZvciB0aGUgZmlyc3Qgb25lIHdpdGhvdXQgYQptYXRjaGluZyBFQyBtYWdpYy4gVGhhdCB3b3Vs
ZG4ndCB3b3JrIHdpdGggdGhlIHNhbWUgdWJpbml6ZWQgaW1hZ2UKZmxhc2hlZCB0d2ljZS4KClJl
YWRpbmcgdm9sdW1lcyB0YWJsZSwgZWFjaCB2b2x1bWUgc2l6ZSwgdHJ5aW5nIHRvIGNhbGN1bGF0
ZSB1YmluaXplZAppbWFnZSBzaXplIG9uIHRoYXQgZGF0YSAtIHNvdW5kcyBsaWtlIG92ZXJraWxs
IGZvciB1c2VyLXNwYWNlIGFwcC4KCkFueSBzdWdnZXN0aW9ucywgcGxlYXNlPwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
