Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B88C4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 18:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTqYghbLUutozacrIzWLg7WjiaqtEdz8r9KlqSaWro0=; b=UsEK+Wntm7ZWUv
	zUiTNSPL2kbnr4GGdIpOlE8093BRwbLrVd7qU6nl9A5m3jyCOQH3G8cdvVzZKLH4OmkloNBL0/78n
	J2Q7cf1sHev/yCtAq7d/v9MGKejcNm1Mta75skvu1QCPt7PNLI+Hjf+2AYb/Cz1gkQHhd4lR/EBgf
	d4wIehdM63a8YFUJ2KN3mqagoFFfHw9z03+v38gvg+ijUNAST3/bLh32driMwyOUXcS125xy6UzOx
	i7GH0M0Di+81rbz9ITTDbI/q9n5fsYVQ/M8T8VISCjLQ5VOqHFM1GeMxQhePCn5TIJjmvqe0T3MYC
	AU4x8yHOWm04xRXxtGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8lSY-00BaM1-0T;
	Thu, 30 Nov 2023 18:08:22 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8lSV-00BaKD-12
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 18:08:20 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d84d9e55c7so810607a34.1
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701367682; x=1701972482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RqXrTtRpLY0xEwP46IWeCwGF6Cga1FD0321b6TGHFA=;
        b=ZRLKcEzqSeLPSrLBgyiOtg2d69u13Kz7GrvS1J8zxEC6sog6v2u2waiRg+gAKkJTi4
         BoPZXvQJPrnCnJOh3QqHwRLyIHTRK1OrvYmJPkWnOvJ8ZG+x7mLaAkdyQ21lwo/NzEaS
         naJUsdLnV63VksMs/GGz6+7Q1iXU9oKPf4zI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701367682; x=1701972482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RqXrTtRpLY0xEwP46IWeCwGF6Cga1FD0321b6TGHFA=;
        b=YKda269BsXWyERor58aY1cvfY15RxRmvLhDndPOY+0IgpHwT3jOp+agGmOnnOJI2e1
         E+Gn8ubI+Y2019TAi/oCOFJuENloarc0QkNeZFXW2DA49OA+MGbLVLmJvuexLg5Eudit
         12tJIXlh6CY+S7Pp3Vdq/mSdtP1ZbbfMlo1NFo7ycjP/fsyMekcBmDmdWBep+kXjuqTo
         RQNv4yMGR8iPBEtY1E/Etzm90yRh8msThaG5zzVqWZu8js2BqNTbH3pi1IMZFZhond6Q
         rNHKR4tM0sBiwx03lM7yAWHjRvsZhFNMTSp/upRILRw+K0PigjIrw/xxf9jCu52Cgikd
         vChA==
X-Gm-Message-State: AOJu0Yx8yksqgpD9h+91Ki6jvrXvFgQBsqI0JG11tLAu8bl2wIpLJmKQ
	VOZb7VMQsAY/mRicTqQUeBnqaeBtMYPp2I5toRzuyQ==
X-Google-Smtp-Source: AGHT+IG4aBr/tAwmP6nCezecVsZDHDlKUWxFTxpSHXwjWQor/sq5NSYpbvinssBA0j0F0Db5XDswfZ2QIuGFaXEx6xA=
X-Received: by 2002:a9d:68cd:0:b0:6d6:4972:b7ae with SMTP id
 i13-20020a9d68cd000000b006d64972b7aemr448347oto.13.1701367682342; Thu, 30 Nov
 2023 10:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20231125012438.15191-4-dregan@broadcom.com> <20231130103624.715263-1-miquel.raynal@bootlin.com>
 <20231130113840.10500927@xps-13>
In-Reply-To: <20231130113840.10500927@xps-13>
From: David Regan <dregan@broadcom.com>
Date: Thu, 30 Nov 2023 10:07:51 -0800
Message-ID: <CAA_RMS4Z6TuEL_DFjpX9bXk_rz=1vqOYT95ccQf5+COsGVcq=g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] mtd: rawnand: brcmnand: exec_op implementation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: dregan@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-mtd@lists.infradead.org, f.fainelli@gmail.com, rafal@milecki.pl, 
	joel.peshkin@broadcom.com, computersforpeace@gmail.com, 
	dan.beygelman@broadcom.com, william.zhang@broadcom.com, 
	frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com, 
	richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_100819_383389_F25B66DE 
X-CRM114-Status: GOOD (  13.74  )
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

SGkgTWlxdcOobCwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIGFsbCB5b3VyIGdvb2Qgd29yayEK
Ci1EYXZlCgoKT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMjozOOKAr0FNIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFRodSwgMzAgTm92IDIwMjMgMTE6MzY6MjQgKzAx
MDA6Cj4KPiA+IE9uIFNhdCwgMjAyMy0xMS0yNSBhdCAwMToyNDozOCBVVEMsIGRyZWdhbkBicm9h
ZGNvbS5jb20gd3JvdGU6Cj4gPiA+IEZyb206IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20u
Y29tPgo+ID4gPgo+ID4gPiBleGVjX29wIGltcGxlbWVudGF0aW9uIGZvciBCcm9hZGNvbSBTVEIs
IEJyb2FkYmFuZCBhbmQgaVByb2MgU29DCj4gPiA+IFRoaXMgYWRkcyBleGVjX29wIGFuZCByZW1v
dmVzIHRoZSBsZWdhY3kgaW50ZXJmYWNlLiBCYXNlZCBvbiBjaGFuZ2VzCj4gPiA+IHByb3Bvc2Vk
IGJ5IEJvcmlzIEJyZXppbGxvbi4KPiA+ID4KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2JicmV6
aWxsb24vbGludXgvY29tbWl0LzRlYzZmOGQ4ZDgzZjVhYWNhNWQxODc3ZjAyZDQ4ZGE5NmQ0MWZj
YmEKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGludXgvY29tbWl0LzExYjRh
Y2ZmZDc2MWM0OTI4NjUyZDcwMjhkMTlmY2Q2ZjQ1ZTQ2OTYKPiA+ID4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBicm9hZGNvbS5jb20+Cj4gPgo+ID4gQXBwbGllZCB0
byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGlu
dXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgo+Cj4gRllJLCBJJ3ZlIGFwcGxpZWQgbWlzYyBzdHls
ZSBmaXhlcyBvbiB0b3Agb2YgdGhpcyBwYXRjaC4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
