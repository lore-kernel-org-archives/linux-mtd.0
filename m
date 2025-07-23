Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD6EC83F25
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 06:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pu3/haW3+sh2hPK0g1l7YvtC7vlrhQUuLk7HNJ6rLfk=; b=TrbPSABz39D9rw
	Qu5HdlYBklqP0m3VwGiZrQLReMjvw/NAzY0UB46poRMKc6Uw9LR+ngVDdGFOYGOFjtQFrk7+Mk6MU
	+rwtTgOX1r+/EHPx82aNCxXjigEdEff0hr7yecp0RVC5XqeG7hCTN+SADsw6yvp1sc80ziKMv3cH1
	Jgi6zsKxt6R8jTJbo4Kb9lrgMIWoqoRqWfDIVPgNukykbDeQ5UlXsNf8twsSJ6nMLSTGlI3I11xpG
	fWcvGT7axiEMZ6i5g9CJKvyndOdIOjiM0B0vfXStArzRP8caIdfVliF6jx7MtxYvXLbCssHyJTbkK
	eVVpLuF7RET2D0QLxNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTPP-00000004AoF-39Xw;
	Wed, 23 Jul 2025 06:56:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTPO-00000004Ans-0T9w
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 06:56:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so1135465a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2025 23:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753253816; x=1753858616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzGs50sMtqAdEdsyGgv1T8F/fASfIs0YpLyjWXfuibc=;
        b=mnETy+GYmiU+WcrWqz/W4B/OE6s5VOucqrzV5rdMgnFS+OIdLB66cImz/3JWftrykI
         CopWNUk+UMAlp84+DlbUrGF/XJVHc1N4dkRsNBViDbqTLQFpHqma8LO0DoKAXrl8Z7nx
         /bdZY8HDidcxLIN5gCQEEHCwrVKlGWklN05c4uR4fone5Lgakbs1P2XLNhA2xgOdWifP
         K+EYyKwU52/KdNrdJ3u+h84wGJS6z/k+RmxqcVZBunyawpnS0gR3Y8IcG2Q44oLruVNC
         ytZ1bNqpBRn9jJV1CRELlZfAwb0SQYY0qVg261UvWUJrG/lXQwijKNaq1PQbKAijcMKG
         q9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753253816; x=1753858616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzGs50sMtqAdEdsyGgv1T8F/fASfIs0YpLyjWXfuibc=;
        b=JTwispZtoCf+MHARTEiYUymCz02HllBy4phUdO7reuZ7QaNPJr/BPuzHg8+jG6OxQ8
         R9mjOp0NHDrwEG89jO5IZrF+8markFNuzSm9v4C776qcA+2JqVn6rIDEVaARP97MoNgr
         FY4kGkIfdAtRHJ2nZnZUptosULZaEWrqpfwCCu7CkzyezaTfvHHjWDnQ0mkzNmmSwkvu
         aX9K0JJvR8dODnd6f2pUukq2e1MmcChGCXfekNia4WBbuG3Nx9TgDRjMcbcRDOOoYszj
         YxNC2GUrybBuksZc8mJ8jx+YP6Nxk/uRK8xpTvDhtB3e6Oc581eqs13pYanzY3xuRDCh
         Q5mg==
X-Forwarded-Encrypted: i=1; AJvYcCUj2TMewtwflxFYsAeGqV34mtvPlF0hspbHZ96FEcUA/eu9rd5UJUHHGhZTiA4I57WfLfDLV9b/++M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDdvhtnB/qyu7VqkevSY6Dbvb1XaZZywU3ObvEFUuLjbzrVnL
	Y905yW9TETRsDZ0q575cDdj/WTR5BmUYvnsqqeba4tEUAjr+IBKhjkRtPBQY3/vAIrHYRwMD9rU
	/oTDbDbTab+mIWvzZTOzJUYjG80LcoV0=
X-Gm-Gg: ASbGncsoG1SBox91y8rD/Z+XkKtGTKZBNbKtsX8uEHXGL8rk/C1hB/bzgJ9zvDZOC1G
	DxTYk10HG03XCAZ8uiIc3Ap0TjevUU3OG0s8vnFkgvXdVTjtUWdwi4aHKbDWxHVq+odifLk1f7d
	utbzuCryaN+0yqeoU4foxw9W9mhGz7jEd+yZUmpkzsZYP4+M6MZgRHkiEuBj6oPeGkZxI+t7s3Y
	4L0LFC6
X-Google-Smtp-Source: AGHT+IHtfZqjBEsPm3jiweUvUgdfmqxEA1/NrYjUcBbEteu7UTNuOkN8so+Y9soZLgns8FwUWGBF/PDOw0pVHGFgS2Q=
X-Received: by 2002:a17:907:9704:b0:acb:37ae:619c with SMTP id
 a640c23a62f3a-af2f48b0b3fmr184201766b.15.1753253815516; Tue, 22 Jul 2025
 23:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753166096.git.zhoubinbin@loongson.cn> <ed625518c752738cb7e24f6d4b7fb9b62a609880.1753166096.git.zhoubinbin@loongson.cn>
 <20250723045322.GA1226341-robh@kernel.org>
In-Reply-To: <20250723045322.GA1226341-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 23 Jul 2025 14:56:43 +0800
X-Gm-Features: Ac12FXwj_V_rXm0G-f1xcp_U8ADbgodmKUhlQGp8z4NF7NnsLXFcURgUjYOstVM
Message-ID: <CAMpQs4K2saB_Cyn03btZdc4ePa-U6G2ots3AtiNoy8UHrBY7OA@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K1000 NAND controller
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_235658_155336_5B68494F 
X-CRM114-Status: GOOD (  17.11  )
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

SGkgUm9iOgoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIFdlZCwgSnVsIDIzLCAyMDI1IGF0
IDEyOjUz4oCvUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBU
dWUsIEp1bCAyMiwgMjAyNSBhdCAwNToxMTowNlBNICswODAwLCBCaW5iaW4gWmhvdSB3cm90ZToK
PiA+IEFkZCBuZXcgY29tcGF0aWJsZSBmb3IgdGhlIExvb25nc29uLTJLIE5BTkQgY29udHJvbGxl
ciB1c2VkIGZvcgo+ID4gTG9vbmdzb24tMksxMDAwIFNvQy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaW5iaW4gWmhvdSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4KPiA+IC0tLQo+ID4gIC4uLi9t
dGQvbG9vbmdzb24sbHMxYi1uYW5kLWNvbnRyb2xsZXIueWFtbCAgICB8IDU4ICsrKysrKysrKysr
KysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9sb29uZ3NvbixsczFiLW5hbmQtY29udHJvbGxlci55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9sb29uZ3NvbixsczFiLW5hbmQtY29udHJvbGxlci55
YW1sCj4gPiBpbmRleCA0ZWMyYjVkMWU4OWQuLjA3YTBkOWI0MGZkZCAxMDA2NDQKPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbG9vbmdzb24sbHMxYi1uYW5k
LWNvbnRyb2xsZXIueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9sb29uZ3NvbixsczFiLW5hbmQtY29udHJvbGxlci55YW1sCj4gPiBAQCAtMjYsMTgg
KzI2LDE5IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgIC0gbG9vbmdzb24sbHMxYi1uYW5k
LWNvbnRyb2xsZXIKPiA+ICAgICAgICAgICAgLSBsb29uZ3NvbixsczFjLW5hbmQtY29udHJvbGxl
cgo+ID4gICAgICAgICAgICAtIGxvb25nc29uLGxzMmswNTAwLW5hbmQtY29udHJvbGxlcgo+ID4g
KyAgICAgICAgICAtIGxvb25nc29uLGxzMmsxMDAwLW5hbmQtY29udHJvbGxlcgo+ID4gICAgICAg
IC0gaXRlbXM6Cj4gPiAgICAgICAgICAgIC0gZW51bToKPiA+ICAgICAgICAgICAgICAgIC0gbG9v
bmdzb24sbHMxYS1uYW5kLWNvbnRyb2xsZXIKPiA+ICAgICAgICAgICAgLSBjb25zdDogbG9vbmdz
b24sbHMxYi1uYW5kLWNvbnRyb2xsZXIKPiA+Cj4gPiAgICByZWc6Cj4gPiAtICAgIG1heEl0ZW1z
OiAyCj4gPiArICAgIG1pbkl0ZW1zOiAyCj4gPiArICAgIG1heEl0ZW1zOiAzCj4gPgo+ID4gICAg
cmVnLW5hbWVzOgo+ID4gLSAgICBpdGVtczoKPiA+IC0gICAgICAtIGNvbnN0OiBuYW5kCj4gPiAt
ICAgICAgLSBjb25zdDogbmFuZC1kbWEKPgo+IEtlZXAgdGhlIGxpc3QgYW5kIGFkZCBkbWEtY29u
ZmlnIGhlcmUgYW5kICdtaW5JdGVtczogMicKCk9LLCBJdCB3aWxsIGJlIHJld3JpdHRlbiBhcyBm
b2xsb3dzOgoKICByZWctbmFtZXM6CiAgICBtaW5JdGVtczogMgogICAgaXRlbXM6CiAgICAgIC0g
Y29uc3Q6IG5hbmQKICAgICAgLSBjb25zdDogbmFuZC1kbWEKICAgICAgLSBjb25zdDogZG1hLWNv
bmZpZwoKPgo+ID4gKyAgICBtaW5JdGVtczogMgo+ID4gKyAgICBtYXhJdGVtczogMwo+ID4KPiA+
ICAgIGRtYXM6Cj4gPiAgICAgIG1heEl0ZW1zOiAxCj4gPiBAQCAtNTQsNiArNTUsMzIgQEAgcmVx
dWlyZWQ6Cj4gPgo+ID4gIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+Cj4gPiAraWY6
Cj4gPiArICBwcm9wZXJ0aWVzOgo+ID4gKyAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAgIGNvbnRh
aW5zOgo+ID4gKyAgICAgICAgZW51bToKPiA+ICsgICAgICAgICAgLSBsb29uZ3NvbixsczJrMTAw
MC1uYW5kLWNvbnRyb2xsZXIKPiA+ICsKPiA+ICt0aGVuOgo+ID4gKyAgcHJvcGVydGllczoKPiA+
ICsgICAgcmVnOgo+ID4gKyAgICAgIG1pbkl0ZW1zOiAzCj4gPiArICAgIHJlZy1uYW1lczoKPiA+
ICsgICAgICBpdGVtczoKPiA+ICsgICAgICAgIC0gY29uc3Q6IG5hbmQKPiA+ICsgICAgICAgIC0g
Y29uc3Q6IG5hbmQtZG1hCj4gPiArICAgICAgICAtIGNvbnN0OiBkbWEtY29uZmlnCj4KPiBBbmQg
anVzdCAnbWluSXRlbXM6IDMnIGhlcmUKCk9LLi4uCj4KPiA+ICsKPiA+ICtlbHNlOgo+ID4gKyAg
cHJvcGVydGllczoKPiA+ICsgICAgcmVnOgo+ID4gKyAgICAgIG1heEl0ZW1zOiAyCj4gPiArICAg
IHJlZy1uYW1lczoKPiA+ICsgICAgICBpdGVtczoKPiA+ICsgICAgICAgIC0gY29uc3Q6IG5hbmQK
PiA+ICsgICAgICAgIC0gY29uc3Q6IG5hbmQtZG1hCj4KPiBBbmQgJ21heEl0ZW1zOiAyJyBoZXJl
LgoKT0suLi4KPgo+ID4gKwo+ID4gIGV4YW1wbGVzOgo+ID4gICAgLSB8Cj4gPiAgICAgIG5hbmQt
Y29udHJvbGxlckAxZmU3ODAwMCB7Cj4gPiBAQCAtNzIsMyArOTksMjYgQEAgZXhhbXBsZXM6Cj4g
PiAgICAgICAgICAgICAgbmFuZC1lY2MtYWxnbyA9ICJoYW1taW5nIjsKPiA+ICAgICAgICAgIH07
Cj4gPiAgICAgIH07Cj4gPiArCj4gPiArICAtIHwKPiA+ICsgICAgbmFuZC1jb250cm9sbGVyQDFm
ZTI2MDAwIHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibG9vbmdzb24sbHMyazEwMDAtbmFu
ZC1jb250cm9sbGVyIjsKPiA+ICsgICAgICAgIHJlZyA9IDwweDFmZTI2MDAwIDB4MjQ+LAo+ID4g
KyAgICAgICAgICAgICAgPDB4MWZlMjYwNDAgMHg0PiwKPiA+ICsgICAgICAgICAgICAgIDwweDFm
ZTAwNDM4IDB4OD47Cj4gPiArICAgICAgICByZWctbmFtZXMgPSAibmFuZCIsICJuYW5kLWRtYSIs
ICJkbWEtY29uZmlnIjsKPiA+ICsgICAgICAgIGRtYXMgPSA8JmFwYmRtYTAgMD47Cj4gPiArICAg
ICAgICBkbWEtbmFtZXMgPSAicnh0eCI7Cj4gPiArCj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ID4gKwo+ID4gKyAgICAg
ICAgbmFuZEAwIHsKPiA+ICsgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiArICAgICAgICAgICAg
bGFiZWwgPSAibHMyazEwMDAtbmFuZCI7Cj4gPiArICAgICAgICAgICAgbmFuZC11c2Utc29mdC1l
Y2MtZW5naW5lOwo+ID4gKyAgICAgICAgICAgIG5hbmQtZWNjLWFsZ28gPSAiYmNoIjsKPiA+ICsg
ICAgICAgICAgICBuYW5kLWVjYy1zdHJlbmd0aCA9IDw4PjsKPiA+ICsgICAgICAgICAgICBuYW5k
LWVjYy1zdGVwLXNpemUgPSA8NTEyPjsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgIH07Cj4gPiAt
LQo+ID4gMi40Ny4zCj4gPgoKLS0KVGhhbmtzLgpCaW5iaW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
