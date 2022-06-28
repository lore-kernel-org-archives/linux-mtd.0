Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B64EC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQpB0qrYcdF8vZUG4z9CYZptLwJZ8yeeKDXYO9nMPV8=; b=sNd1ebpIooEKOr
	UJZZ7KD7BLkIbAyo8DnWV7ybdWYbhKO9418HeW20KCbcKBrADggOWkNeCMlA1+G8BMagPVS/BgwSm
	zAWqreZJVTYTGX73N+FPvPaWov3PALE298OdS1JR1whzXLums6Tti9FGkn/U+ZwTXlxShlFNcudo2
	DBIIwMrGxr8zTkLoVKTzyRt/zsGXN6PgYGwF63eIsk1b+LRM26k9/iru8wcKtkpqEL/e+Gm522iuT
	0PBBFblr9ibwgLpOwgL6Xy7QhSEPLH2vqWpkW9DM539saJTD22ksLnUP0xEmBYZbrGuAUczTi8W67
	oSPh/ZUjyqvTM8XrJbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65dP-004xKz-6K; Tue, 28 Jun 2022 07:27:43 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65dL-004xHn-TH; Tue, 28 Jun 2022 07:27:41 +0000
Received: by mail-qv1-f45.google.com with SMTP id y14so18782140qvs.10;
        Tue, 28 Jun 2022 00:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hwgLtruPC06mcRCnQAsf+kJqHCP1mf00hTNnpiQ34M0=;
        b=hTXuaIJUG7/E8gtJtdL+2UZmvSDGYn2oL6hOOBthNyuMEpVT/dGnLGheWZK0qD4cUt
         iCvG82gQsDSDrZadiR+AYBsWrIKdbDxuRjg9MrjMauTospfIOd7O8NiR1n33WvydRfEi
         CZJOcs05g9AB+Iht/A7grlbd+AORJF/c+QaWKD/rDmN0j+OChTI5vgdzoQ+hDVAOlkwG
         46/RuknzE6kEnFEVBD/Nq28W7YTIZQwy+g1n7G6cRhEtHIndHGj7o51y69AceDRpirfi
         9Mwz2HyXmq4NhHrx1Aq8GfVV139qensA3D5Ttf1Sn2e5gcsRocAM9SPKX3kHuIPY31jx
         j7Rg==
X-Gm-Message-State: AJIora8E/70+kMKTMUNaOwhOju2Cg5lASmXgbpQD93LjuoXHey1YQE0I
	YHMFlMtVhoSv/JkzERW8tEEU3QTHenxq7FJP
X-Google-Smtp-Source: AGRyM1valIU/iaeQxN+PlEF1nKXbvtpbZm+lYNW8XoLIwD7lukmB3X3AklukK83I6j2kfvcP4V5FHw==
X-Received: by 2002:a05:622a:1444:b0:317:c4aa:5cc5 with SMTP id v4-20020a05622a144400b00317c4aa5cc5mr12215515qtx.328.1656401256081;
        Tue, 28 Jun 2022 00:27:36 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id p14-20020a05620a056e00b006ab91fd03fasm9712225qkp.19.2022.06.28.00.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 00:27:34 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-317741c86fdso107652667b3.2;
        Tue, 28 Jun 2022 00:27:33 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr20762801ywg.383.1656401253054; Tue, 28
 Jun 2022 00:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220627180432.GA136081@embeddedor>
In-Reply-To: <20220627180432.GA136081@embeddedor>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 09:27:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
Message-ID: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>, dm-devel@redhat.com, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	KVM list <kvm@vger.kernel.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, netdev <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	linux-can@vger.kernel.org, Linux FS Devel <linux-fsdevel@vger.kernel.org>, 
	linux1394-devel@lists.sourceforge.net, io-uring@vger.kernel.org, 
	lvs-devel@vger.kernel.org, MTD Maling List <linux-mtd@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	nvdimm@lists.linux.dev, NetFilter <netfilter-devel@vger.kernel.org>, 
	coreteam@netfilter.org, linux-perf-users@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, scsi <linux-scsi@vger.kernel.org>, 
	target-devel <target-devel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
	virtualization@lists.linux-foundation.org, 
	V9FS Developers <v9fs-developer@lists.sourceforge.net>, 
	linux-rdma <linux-rdma@vger.kernel.org>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_002739_975765_91D22944 
X-CRM114-Status: GOOD (  19.16  )
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

SGkgR3VzdGF2bywKClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIE1vbiwgSnVuIDI3LCAyMDIy
IGF0IDg6MDQgUE0gR3VzdGF2byBBLiBSLiBTaWx2YQo8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPiB3
cm90ZToKPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUg
YSB3YXkgdG8gZGVjbGFyZQo+IGhhdmluZyBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBvZiB0cmFp
bGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4KPiBLZXJuZWwgY29kZSBzaG91bGQgYWx3YXlz
IHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+IGNhc2VzLiBU
aGUgb2xkZXIgc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3Vs
ZAo+IG5vIGxvbmdlciBiZSB1c2VkWzJdLgoKVGhlc2UgcnVsZXMgYXBwbHkgdG8gdGhlIGtlcm5l
bCwgYnV0IHVhcGkgaXMgbm90IGNvbnNpZGVyZWQgcGFydCBvZiB0aGUKa2VybmVsLCBzbyBkaWZm
ZXJlbnQgcnVsZXMgYXBwbHkuICBVYXBpIGhlYWRlciBmaWxlcyBzaG91bGQgd29yayB3aXRoCndo
YXRldmVyIGNvbXBpbGVyIHRoYXQgY2FuIGJlIHVzZWQgZm9yIGNvbXBpbGluZyB1c2Vyc3BhY2Uu
CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
