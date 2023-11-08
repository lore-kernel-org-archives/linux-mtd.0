Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8895AC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bgh/L8Vz88Su4RJCXw8Sy5Lz4+vFpjeM6qLTtPJQCKo=; b=YX9HShU2D3C70K
	Ieu5ta9P3TMtE3dsMr71ThpjsReFx07kbOao11GYkVeVYu1CJ8o/G0Ha3ciDlVAVZPw0KRBSkoa+Q
	JqU6RQgNKKJ3ihRuc8ldUtHO6L5ybsdSHnpKOg10QX4CMqhgEnubPhqOL4bsXMDXaoZP7LS70SeyM
	rLkwlo9DLdWwJzg6HOWH+IVEP+qG9WkutEy8Ia4rrDFxdq7ac/eGZY3KxDftCNcXn1rpOYCGYPbZb
	iiD5P5EKRQqooEoidsJS8d2TzlLjHpN5Q9bS6sPpmqVZ197kwqhGGtbLU6VSgDKVtBBAI1RE+zN4Z
	TRdElyBc59mH/szxWCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0qMd-004nga-3D;
	Wed, 08 Nov 2023 21:45:32 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0qMb-004nf9-1C
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 21:45:30 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59b5484fbe6so2335367b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 13:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699479924; x=1700084724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNZCsb+J0tCXIr/CtNET2AcsXu2SaYf1CY84TShlm6Q=;
        b=wD+sGZx3fsmcAo5sQcCfmpRpOCuevyxx3UlZju53guCtSY/L7eQXEeChzCjUHJwGvM
         q72UHc+9wQ2M4uFOekxV1Y/bjhbEHSPtfFuz+ep8fILMzRkqfAdhZ90Ob6zOJ9nplXLx
         2IxURva4v1NscQ3y0zpCDX7anlIT1VQftL2NVRqZMKgrgqZTEy0yulfvmvNh2inu0Xof
         oQA2Uch35XJWOTBalHgZ2hNVKOyRy2ROrNaWvrPvNVKoYCkOMG/oxbgopefuy4GYvGrd
         pZBr1HxCJzacHCVn2Kzjcuu1bvsnlUPGDu1rbi4LnYv10L1s4/em3wxHjxHhcyj7y3N3
         Aw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699479924; x=1700084724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNZCsb+J0tCXIr/CtNET2AcsXu2SaYf1CY84TShlm6Q=;
        b=ZPxFUEQvpV7vuN+cn2jqYPIJI7JVN/bi3rygxdyj91umkMfRZYcs9etCKtlycoKlWF
         BESkOUCEto4UIwkHIsxMMoOl/dRS5EtubRoBK6xognqzKNWXJlEG9Gam4T7LlSKXe52j
         fOI+NAexKWVAl8+j0Pkk1y9B5EQ/VOYgZaJMFbRdOaJevdjKa2zghfWNAnYwoMzcCwm5
         CkDhquhE8cd5ArKImkNTuUmWF+XaPNJRqUCjmeBQn+tKuDeHm+5h04wBMsdcq7g3CdDJ
         PValBE0Q+vF6Ht4Fd712lBSrbzU7A22zx/QQnwekCrDuw8tTzOVf4rXACOhK7pz1VdCm
         t5vw==
X-Gm-Message-State: AOJu0Yy0zLRRijDEEI91HcyKkTS3RGnjksER7G9bBsbCqdevIki1KopO
	aWgKINCUsO8DdL3liud4Y0JNLuj/M2/P1ORAYUeBmA==
X-Google-Smtp-Source: AGHT+IFY9jFZdG7cvJAasqldeYVJV1lp20ykF6CM/T97HTYZUi8l1zfwxOIgQ7l5PF/miWNeoGVOLOXt0F0G6C0TYx8=
X-Received: by 2002:a81:6cd6:0:b0:5a7:f002:4fe4 with SMTP id
 h205-20020a816cd6000000b005a7f0024fe4mr3127115ywc.23.1699479924475; Wed, 08
 Nov 2023 13:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
 <20231108-fix-mips-nand-v1-2-5fc5586d04de@linaro.org> <20231108191125.GA2754195-robh@kernel.org>
In-Reply-To: <20231108191125.GA2754195-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Nov 2023 22:45:11 +0100
Message-ID: <CACRpkdZx9icF7s5HoS2r40Wuj4sPbEZPiaPsD9GZ94J4LKY5+g@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: mtd: Rewrite gpio-control-nand in schema
To: Rob Herring <robh@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	Howard Harte <hharte@magicandroidapps.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_134529_409288_94EB25CF 
X-CRM114-Status: GOOD (  15.31  )
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

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCA4OjEx4oCvUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBOb3YgMDgsIDIwMjMgYXQgMDM6MzM6NTBQTSArMDEwMCwg
TGludXMgV2FsbGVpaiB3cm90ZToKCj4gPiBUaGlzIGNyZWF0ZXMgYSBzY2hlbWEgZm9yIEdQSU8g
Y29udHJvbGxlZCBOQU5ELiBUaGUgdHh0Cj4gPiBzY2hlbWEgd2FzIG9sZCBhbmQgd3JvbmcuCj4g
Pgo+ID4gTWFyayB0aGUgb2xkIHdheSBvZiBwYXNzaW5nIEdQSU9zIGluIGEgbG9uZyBhcnJheSBh
cwo+ID4gZGVwcmVjYXRlZCBhbmQgZW5jb3VyYWdlIHBlci1waW4gR1BJTyBhc3NpZ25tZW50cyB3
aXRoCj4gPiB0aGUgbmFtZWQgbm5uLWdwaW9zIHBoYW5kbGVzLgo+Cj4gV2UgaGF2ZSAxIHVzZXIg
dXBzdHJlYW0gd2l0aCBvbmx5IGEgc2luZ2xlIGNvbW1pdCBhZGRpbmcgaXQgaW4gMjAxNy4KPiBU
aGlzIGRvZXNuJ3Qgc2VlbSBsaWtlIHNvbWV0aGluZyB0aGF0J3MgZ29pbmcgdG8gZ2FpbiBuZXcg
dXNlcnMgZWl0aGVyLgo+IElzIGl0IHJlYWxseSB3b3J0aCBtb2Rlcm5pemluZyB0aGlzIGJpbmRp
bmc/CgpUaGUgd2hvbGUgb3JkZWFsIHdhcyBhY3R1YWxseSBwcm9tcHRlZCBieSB0aGUgZW1lcmdl
bmNlIG9mIGEKbmV3IHVzZXIgd2hvIHdhbnRzIHRvIGFkZCBhIGRldmljZSB0cmVlIGZvciBhIG5l
dyBkZXZpY2UuClNvIEkgZG9uJ3Qgd2FudCB0byBhZGQgbmV3IHVzZXJzIGZvciB0aGUgb2xkIGJp
bmRpbmdzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
