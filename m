Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF1DC7EE25
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIkjrOO0l+9UfLu1E6wQbf0Ryqn3aWT01pN2seEdh84=; b=bUB1j4ikhfQ3R2
	l1NRGrpfPWpgA9/kEw9HH96/InVh63JTFZ/Vc+KoIOO7JXpmctf9o3MYjY38CDx8UlifIroXS3gIG
	sJvOOQb60Q98fCXLSB21hP13tGgzd+tz2kISXgl481f2QaXlYJo4E9NhVLz9rttkfVIqhghpJIpiG
	bjisL26mx+FtM2334AtD4Pbe5VcH75gkcEulJzafdjI7a5q5o2IyeP5RPxTghLTGkI8kocqRKRviE
	kp0aCCZhIFlOx1Yoly0nvur3b4j2B+vWexRAkVC+nBruPbkbEzS6y/u/r7PgV8aVMnLHHr16BjxM3
	MTrzynQErIS0I7Ie41jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IXW-009tQ6-1f;
	Thu, 08 Jun 2023 16:31:10 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IXT-009tMW-2C;
	Thu, 08 Jun 2023 16:31:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9788faaca2dso144111966b.0;
        Thu, 08 Jun 2023 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241865; x=1688833865;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FuC7NSHnCjOPABSYc7BMbW74QWv84w5gPSWpqKs1P3g=;
        b=aNNyAbTqj3IEtixMqMg+vLI37ql4/0Acm5DTZwIVLAsTl75k6dQ1SmDigYhQyWMe+4
         kv8STcPKEhQ/eKeljkyP5gMJqrpUNcA1ZV22qv/pKVdWNepsQP0b4YIgOCJ9/nFEI3v3
         yJp2X3xDiG/Qfh/9y30lpl8xi0SV8LzrKgtKS8FZbDPZkDRQ7kfpqqm1TtgYXHIyPOij
         45TSLPZ2nYlpojs18oErPwQg/iP8zPc+jII1NcC1iZO4zVuPpFkRc+zitkkk8VBg7uvQ
         7p50g0b7aH0eyKMck+wRxrTxMci9kY47b1U73PqqP6BxdHnib0UIX/J1YcboiFYYj6Pg
         Apsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241865; x=1688833865;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FuC7NSHnCjOPABSYc7BMbW74QWv84w5gPSWpqKs1P3g=;
        b=kJuWIa8sokSiaQAjTdppkIyYYPA88IEFeS2I7SIZ8g2DJpqvsPCXWeZ7OsXqVioXRI
         wIw7V9ILidx+ZyJQhNIPi7MWW5gymsRc7FOCDkjeAzrrY+unN8t6z3XQ90HeGFRO1TgR
         yA+VQ01GQhpMekav8gcTKAX+iVCLON2OyXnoiVKi7DUj4uHV5SmwjkPboxUlebLsMlb4
         8RQmbZZa0U/aSSMtccJXOdU6U/U1pWFJB2MbIpMK2u9lFIqnB1to0DUz+cwe/Uh9IoVx
         DwLNyj25k8zLwR7Wb6K10PPQIABbt15l87D4z10eLZ4qctjLgo/IEhqG0h98r4xk9qsI
         nnlw==
X-Gm-Message-State: AC+VfDwx4563km735J5YN/a9KkFlzIQ69iVI6sGA8QKpu0hV/+Xg776g
	vtTNRRamSVMbQ6xO03mqfxU=
X-Google-Smtp-Source: ACHHUZ7DyU8f3R8jgsuvsuJAD1m2ESx11xvhon/3qlB8Ls1/utZvujvvZ18ia9yuMt56eXMMwEU18g==
X-Received: by 2002:a17:907:9445:b0:974:5c2f:65cc with SMTP id dl5-20020a170907944500b009745c2f65ccmr209318ejc.67.1686241865494;
        Thu, 08 Jun 2023 09:31:05 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm29029ejb.180.2023.06.08.09.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:31:05 -0700 (PDT)
Message-ID: <c21a0de8-f8f6-a8f9-417b-eca99dc8b55b@gmail.com>
Date: Thu, 8 Jun 2023 18:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 5/5] mtd: nand: add support for the Sandisk SDTNQGAMA chip
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
Content-Language: en-US
In-Reply-To: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_093107_718256_89826243 
X-CRM114-Status: UNSURE (   8.76  )
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

U2FuZGlzayBTRFROUUdBTUEgaXMgYSA4R0Igc2l6ZSwgMy4zViA4IGJpdCBjaGlwIHdpdGggMTZL
QiBwYWdlIHNpemUsCjFLQiB3cml0ZSBzaXplIGFuZCA0MCBiaXQgZWNjIHN1cHBvcnQKClNpZ25l
ZC1vZmYtYnk6IFBhd2XFgiBKYXJvc3ogPHBhd2VsamFyb3N6MzY5MUBnbWFpbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvaGFuIEpvbmtlciA8amJ4NjI0NEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9pZHMuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKaW5kZXggZGFjYzU1MjliLi41M2M0MTE4ZGUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYwpAQCAtNDQsNiArNDQsOSBAQCBzdHJ1Y3QgbmFuZF9m
bGFzaF9kZXYgbmFuZF9mbGFzaF9pZHNbXSA9IHsKIAl7IlRDNThOVkc2RDIgNjRHIDMuM1YgOC1i
aXQiLAogCQl7IC5pZCA9IHsweDk4LCAweGRlLCAweDk0LCAweDgyLCAweDc2LCAweDU2LCAweDA0
LCAweDIwfSB9LAogCQkgIFNaXzhLLCBTWl84SywgU1pfMk0sIDAsIDgsIDY0MCwgTkFORF9FQ0Nf
SU5GTyg0MCwgU1pfMUspIH0sCisJeyJTRFROUUdBTUEgNjRHIDMuM1YgOC1iaXQiLAorCQl7IC5p
ZCA9IHsweDQ1LCAweGRlLCAweDk0LCAweDkzLCAweDc2LCAweDU3fSB9LAorCQkgIFNaXzE2Sywg
U1pfOEssIFNaXzRNLCAwLCA2LCAxMjgwLCBOQU5EX0VDQ19JTkZPKDQwLCBTWl8xSykgfSwKIAl7
IlNEVE5SR0FNQSA2NEcgMy4zViA4LWJpdCIsCiAJCXsgLmlkID0gezB4NDUsIDB4ZGUsIDB4OTQs
IDB4OTMsIDB4NzYsIDB4NTB9IH0sCiAJCSAgU1pfMTZLLCBTWl84SywgU1pfNE0sIDAsIDYsIDEy
ODAsIE5BTkRfRUNDX0lORk8oNDAsIFNaXzFLKSB9LAotLQoyLjMwLjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
