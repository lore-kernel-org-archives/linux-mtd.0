Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4835C25B48
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aIr67qCQ/Vq2rIMipyN/uysMCLs7sMgCl7da1GUYgY=; b=hWYqgaAuHK9S6P
	0c5D3SvMHF3u3sFktyv4pyQDbera5Wp3gLZNhtQsqGpuCqMbWu+EwTVK1Rd4Kv+h24+6eybsjwj3i
	V5sKyzokg40OX58xhxrHP5+abYJVedl5ixBYKTUbftPa7oSe7KBx7//GM33rFAB8/TcJ4GRszP1gL
	TVNweI81pN5dxAFY15GsGo3EqNBIqf0Hit/LHScJzQ6NzMYcn6l5oqSeu9v264kMWoGyaA78Crmhl
	PUCiEHR3w1gLmsK+hhLkUTUS+X3nPOPTN/SqcvShOuXfOSycJATZuS1J36ZHNswTenSU8uNtKUJ90
	i3vPQNToqpdG9WgJG42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyUf-00EMUE-0Q;
	Thu, 26 Oct 2023 11:25:41 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyUc-00EMTX-24
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 11:25:39 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6bcdfcde944so177623b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698319535; x=1698924335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtU9YhP6uqwcHQPP1XXSpEF9fe7+uF5FiQZ9BITZ1Ls=;
        b=cs4M45FA5ve8GKFb4BuArkVIR7EP5UZGH+TlCErunGVqVf7ay1Xbnyfn7b2KwkmlOC
         HpF8QVSNSFhWuhGSJXrzGBZCx04p8WCZ6ufLln72tw3GP/iW8Ltcqp6zHRBAvXiwrim/
         xu47ST+cQ1AS5s2YNmT8gpJWlOf8IMiO1d/+aE7XZkjHPCPnV2byxrW7BFtLSgJlN7e/
         jZm3Mlc/90RQM/cJUybPKyV164K26ld0KTjNpo3S5v+XzMYd4UJ7oiR0LpNUDW9zChtC
         Z+jGcWLWZEQVbryxcJZL2BB+PlMKboyvrLdr2JSM9GR7uquMtJOxegpAnYfiaOnDC9eD
         PqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319535; x=1698924335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtU9YhP6uqwcHQPP1XXSpEF9fe7+uF5FiQZ9BITZ1Ls=;
        b=JSfAKodRPG2G+IrhGCBvWCxkSPk5VE6wyk7L+IQ6/3SvV9Zk5opgehL0Ig7/bw8as0
         W77ZQ1aBJyPGek/FJV/v3CN15WwYKTPgiuYBgEBSia6HjMnsMbWKxY/aYLQzSsIKNuL9
         7EgUZSVm83jixZekL8k3TG3dD1Ud7QJ3LLHrUTr2KDLmZPLFUly5uo7tPDEUgK7WfLZM
         IrQWoVok9ex4WNRUtccKQ5kfn/SihpcRJawXH35OrHFLU+LVBnWxQAtWol1zn7N+i/CH
         FChNS+dyPiOT7ll3tEl9Ruk0invgW/1RnH6ucQ6mFo6QqbG0Fd977aK3BEdUe/uKOQni
         F1cw==
X-Gm-Message-State: AOJu0YxLqUFDOYJNIWOmN2C5j76GszjWZNOAIrxoYCfXZ5BgQcE2XntU
	JxlsiEFvAcOu3tJN+2/RtZ7kSkZxjTBQmkx1Gj8=
X-Google-Smtp-Source: AGHT+IFD6SVxj+cPkk/u1sXbb+seILQ41oWm8RG3+tJ2Y7r7cGmAsuPH30xmtzuX8KnH7fndeDcWt1webJMU4H89WCg=
X-Received: by 2002:a17:90b:1d0e:b0:27d:1593:2b08 with SMTP id
 on14-20020a17090b1d0e00b0027d15932b08mr20620800pjb.0.1698319535680; Thu, 26
 Oct 2023 04:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc> <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
 <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org> <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
 <4e2de38da5a3e492eac522b9a68141c7@walle.cc> <CAOMZO5A98YSykYr+ddJ=v93isw=4jK_KhBLadSDTuBmn_WbqOQ@mail.gmail.com>
 <47aec8ad-3a30-4d97-9e3a-870df02f5ad7@linaro.org> <CAOMZO5A0Oi1L20o_D9oT-mRXp-n8pAHkC1-AzhwvQ6jVB+UzxQ@mail.gmail.com>
 <CAOMZO5Ba8bo1zAt1-cSieWOKDWYpvSuOqp2RT5ZOGYLE8DHS0w@mail.gmail.com> <935957F7-0B54-4EA1-9505-3790B5AFF4FC@walle.cc>
In-Reply-To: <935957F7-0B54-4EA1-9505-3790B5AFF4FC@walle.cc>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Oct 2023 08:25:23 -0300
Message-ID: <CAOMZO5BEfUOLdgVuNB3Mcx18V1bheFPj6_D_5zadNJiH3VJa9A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_042538_682616_EE72EA65 
X-CRM114-Status: GOOD (  10.44  )
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

SGkgTWljaGFlbCwKCk9uIFRodSwgT2N0IDI2LCAyMDIzIGF0IDM6MzPigK9BTSBNaWNoYWVsIFdh
bGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3cm90ZToKCj4gVHdvIHBhdGNoZXMuIG5vPyBvbmUgZm9y
IHRoZSBubyBjaGlwIGVyYXNlIGZsYWcgYW5kIG9uZSBmb3IgYWRkaW5nIHRoZSBmbGFzaC4KCllv
dSBhcmUgcmlnaHQuIEkganVzdCBzZW50IGEgdjMgd2l0aCB0aGUgdHdvIHBhdGNoZXMuCgo+IEFu
ZCBJJ2QgcHJlZmVyIHRoaXMgdmVyc2lvbi4KCj4gb3V0IG9mIGN1cmlvc2l0eS4gZG9lcyBpdCBh
bHNvIHdvcmsgd2l0aG91dCBVU0VfRlNSPyBJJ20gbm90IGltcGx5aW5nIHRvIHJlbW92ZSBpdCwg
anVzdCB3YW50IHRvIGdldCBhIGZlZWxpbmcgaWYgdGhpcwo+IG5lZWRlZCBhdCBhbGwuCgpZZXMs
IGl0IHdvcmtlZCB3aXRob3V0IFVTRV9GU1IgYW5kIHN1Ym1pdHRlZCB2MyB3aXRob3V0IGl0LgoK
VGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
