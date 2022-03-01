Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D03BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pACuh4Tq+zRGmCINI/IiuXXQSFww0R4XxMW7ptHky80=; b=aRWaQqXib4d2uk
	UxG5jaWhVAiaTAkEeBY2xz0iaqJVkP7/zlsyZboBo/aZsfFtyVUK1OZhLTmf88v/rH1eICfetys4E
	Oen0UqxsNgZXcT8WnxdvWLw8/osfNZqrv2aq7FdBRHr9lCqH6mcVeIADS5hzUqYd/34Mn96M5kFTP
	AN34q2yPx6NIvmgKLp72m78lOoj4H4AIvmt7jHk+tMNsmSnS1sier9Sd0jqwavceiHjz7vSx2kGju
	++XlyRo5tyhsjou2Gni9BM/264r5xjZAUO8Mwop9U3xFern+QhTSfWNdnOcFQunXMgljunUTxr+wZ
	YBJfM6Ajd1slOr3EnRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzlG-00G84Q-Vz; Tue, 01 Mar 2022 10:29:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzlD-00G83p-Iw; Tue, 01 Mar 2022 10:29:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id r10so19747827wrp.3;
 Tue, 01 Mar 2022 02:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zNUGxlTLTPDK9JcAeQ34GJY9j31PzFBYLLDaxTYJnJ0=;
 b=i3WRo/psDGC16bB6Eapya77F+ZkB/Cmetnc3zy+JS/izkKkaAXOIzhUncWt27jZ3Uh
 Udmzft6coTBTyuXXTTQ64IDeAUu4uPNeFrlewUfoRksdZsmj+ngYuyZakvsvJ8n6EtMi
 8Q/MCo3j4d0q6FOPSINo1jNmfl9xy56mUQsPwx2cm3jGwUKJ3DmyTOH28us63LZ9Vr9R
 KZQ1sash0Ml+rPCXqphhgBF0GYnz1Ojc/HVqHLnSscpDj1uJxkNOMdjWIwgPNnRafkW3
 Gc5frASpkucHfb4dslzg8sh/BX0fRf64Y43TmUA2LFEDOqPmXGdLLHrf24z5OvDrEOI7
 Oe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zNUGxlTLTPDK9JcAeQ34GJY9j31PzFBYLLDaxTYJnJ0=;
 b=dVje/T4nJDUj0L8ErTQdfFBaqZR2YBIyXpKec2KqXUvPdK5sNdvuZCycTkMcVxWt6u
 s/7LSFWvNTvp76DPd7ascjpUZWSZaIbNEs7hlj2dm0uMdiK5sSljU40eWXIiJIPem7OJ
 QCP5ghtHX3NDjRU2YloR3FVIRbj3H7+dfANWHgZfbUyBcm3SUmmCjCtvhmHBnm9JR+iz
 W+GgqDAf1Lu72+7FvdVG2w2wor3uBtXAotwnJfhPdsDcRii0+8l7xdinHrUGxtvyG3ER
 qCm9LSORo+6g1JtzdFqypr+LM5hrpw9ax8pBX1SvzyO3jupVRfNgUYivODelct3rxvwy
 G5yg==
X-Gm-Message-State: AOAM533EOmfe9pgqE1Jn+6sRtZddXHp6ta8yYH/RgjqiryoJBKSgqvBM
 rZck7yhCbrx47J3bbDizE7uGG0Ee6mZNxV7XJS8=
X-Google-Smtp-Source: ABdhPJww7HAy7HeNyHg06utKGeR25AIv3jfOwlFV6rJ+DFYKsXlX/oNM5QX4T/QawnoixQUKtEi2mpaU7g6YwUdaUAs=
X-Received: by 2002:a5d:64ac:0:b0:1e7:1415:2548 with SMTP id
 m12-20020a5d64ac000000b001e714152548mr19271307wrp.267.1646130577743; Tue, 01
 Mar 2022 02:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
In-Reply-To: <20220301095640.313852-1-tudor.ambarus@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Mar 2022 11:29:26 +0100
Message-ID: <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_022939_655601_E1E79FE8 
X-CRM114-Status: UNSURE (   7.76  )
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

SGkgVHVkb3IsCgpBbSBEaS4sIDEuIE3DpHJ6IDIwMjIgdW0gMTA6NTYgVWhyIHNjaHJpZWIgVHVk
b3IgQW1iYXJ1cwo8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPjoKPgo+IEhpLCBIZWlrbywK
Pgo+IFdvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCBzZXQgb24gdG9wIG9mOgo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIyMDIyODEzNDUwNS4yMDMyNzAtMS10
dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20vCgpXaGVuIGFwcGx5aW5nIHRoYXQgc2VyaWVzIHRo
ZSBmbGFzaCB3aWxsIGJlIHByb3Blcmx5IGRldGVjdGVkLgoKWyAgICAxLjMyMjY1NV0gc3BpLW5v
ciBzcGkwLjA6IG14MjVsMTI4MzVmICgxNjM4NCBLYnl0ZXMpCgpUaGFua3MKLS0tCkhlaWtvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
