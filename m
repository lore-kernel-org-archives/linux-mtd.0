Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02A9CDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDModyof52Ouu6AOM8xfvGI5zHmf6JJPV4olZ0pniLc=; b=TpRbDb1g6V9WSM
	VLX7IJIHwg9bDRhjZdvWxNERovjFbSZAjGrfkSR6ocmW51EhdHDR5IsKu6z7mXFx36iCAOb1lBZL+
	yssiBnunCsByL161G+amraiii1upfMpN8zb8tT3IDpN2bEmbDdKtyeUfiMhNM4AU7mf0mTy6TAS2f
	9CTveaNHcdg5U9a5UOLFhxCcMztdz5VUhbHOteSinHNbksK3/rcCyAgMGmMu8XuQoTQQ0D2Lpytdp
	8hzsVNfUdjv22QpVXdlw3oI1wqm2XH0L3R9KTMflZ/9o9VayiNyKdrDk8Pkzd+kI7ZAlhpz/2FLeY
	NXCgw0fm5GumxxjeiosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtJCZ-00GAhy-25;
	Thu, 19 Oct 2023 02:55:59 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtJCV-00GAgs-1I
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 02:55:58 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-57bc2c2f13dso4224816eaf.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2023 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1697684146; x=1698288946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjvl1fV//Z3DAmMVM5mc7jqsIEKxC7jjiLUBClRZgVQ=;
        b=A4zTmF0cWJ31W3sl4NoUN+SagymRf4dYZfyVGiZ+I92EN1zo0wldYRwg2GQq+Fx74a
         647fDDtxetSmZRlGBdgNPJxUoKfJyfpW3v67QLIGLH2ES11ZPhMXtXA8tGm7cQ9HYoVL
         7jM9c4//rxKZYOlAK3Fqw1IAAz3dWnnEo8nhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697684146; x=1698288946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjvl1fV//Z3DAmMVM5mc7jqsIEKxC7jjiLUBClRZgVQ=;
        b=ZDgOirQwcasvcwTVIRkfdOCXhiEOihefJETBBHO6UKloaKTCX1CdNYCGVXG+cDYNI6
         nF3s3tBur9uYc/XjQr1tEoow4RKcbkFzjISsVIKspHJnvwcjQxecw1Or7j8ZKpEU4tY9
         wsieAo76WmLHUJW/dHEGS4mgDTlkNF0P0GYZZBBZgAQicxuBxN9ffVKTrqWzXjp4OLsf
         Si/21YCl1isPHN4KkwwCRywjDz7SF6QQEeWxUUXVlfWlIfdlQVJ3tB1Yft8Er/eEn/ft
         vsloZm8d9VPSNDs2aM7ARuSRBsXpGk/4YChafA8JJNjw0C0dzHfQO+U1QVFbamIbNXBE
         T5pQ==
X-Gm-Message-State: AOJu0YwakpdcLJ4hI4PZA8Y37iGK3OM3+S1ALyV8VnzqiZtB+x2NNU1q
	t9LqpgH3eMIcGKd5f7OjkktLMwQdwlarKnUO+o8JDA==
X-Google-Smtp-Source: AGHT+IFSkiTIzKucqYACIEkT1mbAUXytYZj44oycOpJPUGvjGXMmZVMQgQTHi/yOZZAqD34ul6HEhfGp9OoQYF0aJOo=
X-Received: by 2002:a4a:bb83:0:b0:581:eef8:131f with SMTP id
 h3-20020a4abb83000000b00581eef8131fmr1111415oop.1.1697684146435; Wed, 18 Oct
 2023 19:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231017201417.129872-4-dregan@broadcom.com> <202310180553.Zfa2ryoa-lkp@intel.com>
In-Reply-To: <202310180553.Zfa2ryoa-lkp@intel.com>
From: David Regan <dregan@broadcom.com>
Date: Wed, 18 Oct 2023 19:55:35 -0700
Message-ID: <CAA_RMS4PGTA3nr_AXxZ8+dT+DQpW-_siQTxCeKaZvFe5FzP9qA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mtd: rawnand: brcmnand: exec_op implementation
To: kernel test robot <lkp@intel.com>
Cc: David Regan <dregan@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-mtd@lists.infradead.org, f.fainelli@gmail.com, rafal@milecki.pl, 
	Joel Peshkin <joel.peshkin@broadcom.com>, computersforpeace@gmail.com, 
	Dan Beygelman <dan.beygelman@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com, 
	richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
	Adam Borowski <kilobyte@angband.pl>, oe-kbuild-all@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_195555_444762_82DEED0F 
X-CRM114-Status: UNSURE (   7.82  )
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

V2lsbCBtYWtlIGhlbHBlciBmdW5jdGlvbnMgc3RhdGljCgpPbiBUdWUsIE9jdCAxNywgMjAyMyBh
dCAyOjUw4oCvUE0ga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+IHdyb3RlOgo+Cj4g
SGksCj4KPiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgd2Fy
bmluZ3M6Cj4KLi4uCj4KPiA+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jOjIzOTM6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnYnJjbW5hbmRf
ZXhlY19vcF9pc19zdGF0dXMnIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgICAgMjM5MyB8IGlu
dCBicmNtbmFuZF9leGVjX29wX2lzX3N0YXR1cyhjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24g
Km9wKQo+ICAgICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPj4gZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYzoyNDA0OjU6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ2JyY21uYW5kX2V4ZWNfb3BfaXNfcmVzZXQnIFstV21p
c3NpbmctcHJvdG90eXBlc10KPiAgICAgMjQwNCB8IGludCBicmNtbmFuZF9leGVjX29wX2lzX3Jl
c2V0KGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlvbiAqb3ApCj4gICAgICAgICAgfCAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKCi4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
