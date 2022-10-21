Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B718C38A2D
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 21:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wnqBjs/7TRmI+zfAOcGq71wZFPfhv3SeLMfrqE+XMM=; b=U95rnsnEkqIekK
	H6ZP6Uf+mLBhYGgD4L1l44CI2UJZvvnpvrzI58oX4AFIjysFQcoZenOi21ts/NftptBsYteUgqRzB
	scWJqoFu9U26m/Cz4cEpPWp9nUDDzESpocm+3Lwo6MOC9QqvuzEi9aDgMU9oxGbXZidHiEHyFny1f
	vyX//Hl/rxQIVDY2zNwMIABOC3NZviVsVf6DPMCaFLitU9f0J0uMEX0pnH8MihLeHgHZBSmY/WRkN
	TN/WTdct6c0xz/sxMuQB6xa34SifURPsvs2viKAkN62RT3XdX8BNlA41HE8Hy4W0uYug8tpyUmEfu
	r0X/5Lx4+fCDxFu0czWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olzzY-00A4Ys-Hq; Fri, 21 Oct 2022 21:55:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olzzK-00A4UW-3X
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 21:55:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id l4so3524295plb.8
        for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2022 14:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT6ZKO8bMRr2n8aUWPzJ3HA/WiCoNo2nqfyT8qO6Y9I=;
        b=5L281OO8ws7T0y7/SJua3VBEA5/VgBaLIpo6N5UaQqaqzrxV1ugrvkM6uUtGc2zYFO
         EF3MxUT7UBRWrZ+Qrwl3QeyfUxyP1QvzcFFc84hhUHnH4sI55QDjVYgI0OrDA3CDxafH
         DJu/PqIjXj72xCSdn2becOw5+Vue32bTueGoE2F/DelOOU/viEmAAmQRkKFxNULvfm4H
         V09R3MuuK62hk1G86mbDqIS9+yZ75yS7/pj2W7vUGfn+Z9qmLp4pYPgFeRCgBlkojj9H
         6qgYoR3NF+AS+FTyVbAjjYyx9qW3Kkl9z43jUHU/dQKXZk/k0lsKaiYqqD02JDN0CCJ5
         N2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dT6ZKO8bMRr2n8aUWPzJ3HA/WiCoNo2nqfyT8qO6Y9I=;
        b=epuURzWjGSgKocOe8fuFWtCU/SbikcPBaGe9M38yUa1TGrwa5Q5HzGbS7fPT1u7fPT
         M5JG4vhsQalaUot270uYo/7TIoxKgFmEO1PODW4SNPmRGIhK7tM7TSn4oVeRMOqpCe7D
         FGxASF4vJS/4bY39k2pTNqaDRdiQy0UUYBbT0Yi8YgKxYhdg+NLdNgqMwCqTx7rLgO9y
         KMfB/PG//zDOM8TgWUIexZanv+2yGbN/LiMwjgI2qII4bV+eu+ZzrsSj5vxVcTkRL1az
         QtWnFDEA8S3aXgiLvFHdf2o1inby4eYPVjyrCLEIYPZJzmoxxQ2fP9Q/l5xWFhNw5Aw9
         Dbtg==
X-Gm-Message-State: ACrzQf2Fzfv8nYhOErXnTYYkxuJMk9uJYWpBZgnXSSTkcz6ao4DTE46J
	XiLvL1kMAUbW25r0cHMoemfEJBJA35Zm+x+qDr43tA==
X-Google-Smtp-Source: AMsMyM4aEKNZfPgfMIi0f1nZAyJu5CZ1gxkgE5zlnZPgIYE+aBrkHQRJGYZhrw770e1IHhTLYx3sR6MjnccOOvh/Ixo=
X-Received: by 2002:a17:90b:224d:b0:20d:8828:3051 with SMTP id
 hk13-20020a17090b224d00b0020d88283051mr23885685pjb.89.1666389327258; Fri, 21
 Oct 2022 14:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
 <YtD/9KJZwlVj+6hS@kroah.com> <20220715074631.GA7333@pengutronix.de>
 <YtEdIujszEKSprbF@kroah.com> <770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
 <20220902090252.75285234@xps-13>
In-Reply-To: <20220902090252.75285234@xps-13>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 21 Oct 2022 14:55:15 -0700
Message-ID: <CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
To: Sascha Hauer <s.hauer@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@camlingroup.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>, 
	Sasha Levin <sashal@kernel.org>, torvalds <torvalds@linux-foundation.org>, 
	Han Xu <han.xu@nxp.com>, kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, 
	k drobinski <k.drobinski@camlintechnologies.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_145534_425034_F3ADD191 
X-CRM114-Status: GOOD (  16.52  )
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

T24gRnJpLCBTZXAgMiwgMjAyMiBhdCAxMjowMyBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhleSBmb2xrcywKPgo+IHJpY2hhcmRAbm9kLmF0
IHdyb3RlIG9uIEZyaSwgMTUgSnVsIDIwMjIgMDk6NTk6MTAgKzAyMDAgKENFU1QpOgo+Cj4gPiAt
LS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiA+PiBNeSBJUkMgaGlzdG9yeSBkb2Vz
bid0IGdvIGJhY2sgZmFyIGVub3VnaCwgYnV0IGlmIEkgcmVjYWxsIGNvcnJlY3RseQo+ID4gPj4g
TWlxdWVsIGlzIG9uIHZhY2F0aW9uLCBoZSB3b3VsZCBoYXZlIHBpY2tlZCB1cCB0aGlzIHBhdGNo
IGZvciBsaW51eC1uZXh0Cj4gPiA+PiBvdGhlcndpc2UuCj4gPgo+ID4gRXhhY3RseS4KPgo+IElu
ZGVlZCwgSSB3YXMgb2ZmIGZvciBhbiBleHRlbmRlZCBwZXJpb2Qgb2YgdGltZSwgSSdtICh2ZXJ5
KSBzbG93bHkKPiBjYXRjaGluZyB1cCBub3cuCj4KPiA+Cj4gPiA+IE9rLCBsZXQgbWUgZG8gYSBy
b3VuZCBvZiBzdGFibGUgcmVsZWFzZXMgc28gdGhhdCBwZW9wbGUgZG9uJ3QgZ2V0IGhpdCBieQo+
ID4gPiB0aGlzIG5vdy4uLgo+ID4KPiA+IFRoYW5rcyBhIGxvdCBmb3IgZG9pbmcgc28uCj4gPgo+
ID4gPiBIb3BlZnVsbHkgdGhpcyBnZXRzIGZpeGVkIHVwIGJ5IDUuMTktZmluYWwuCj4gPgo+ID4g
U3VyZSwgSSdsbCBwaWNrdXAgdGhpcyBwYXRjaC4KPgo+IFRoYW5rcyBHcmVnICYgUmljaGFyZCBm
b3IgdGhlIGhhbmRsaW5nIG9mIHRoaXMgaXNzdWUuCj4KPiBDaGVlcnMsCj4gTWlxdcOobAo+CgpI
ZWxsbyBBbGwsCgpBcyBUb21hc3ogc3RhdGVkIHByZXZpb3VzbHkgMDY3ODFhNTAyNjM1MCB3YXMg
bWVyZ2VkIGluIHY1LjE5LXJjNCBhbmQKdGhlbiB3YXMgcGlja2VkIHVwIGJ5IHNldmVyYWwgc3Rh
YmxlIGtlcm5lbHMuIFdoaWxlIHRoaXMgbWFkZSBpdCBpbnRvCnRoZSA1LjE1IGFuZCA1LjE4IHN0
YWJsZSBicmFuY2hlcyBpdCBkaWQgbm90IG1ha2UgaXQgaW50byB0aGUKZm9sbG93aW5nIHdoaWNo
IGFyZSB0aHVzIHRoZSBhcmUgY3VycmVudGx5IGJyb2tlbjoKNS4xMC55CjUuMTcueQoKSG93IGRv
IHdlIGdldCB0aGlzIHBhdGNoIGFwcGxpZWQgdG8gdGhvc2Ugc3RhYmxlIGJyYW5jaGVzIGFzIHdl
bGwgdG8KcmVzb2x2ZSB0aGlzPwoKQmVzdCByZWdhcmRzLAoKVGltCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
