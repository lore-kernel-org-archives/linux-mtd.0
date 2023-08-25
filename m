Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0465DEE49AB
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 21:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGZ/neE89RUyuaF9fIiuArvWsBLdYUV0SdYkcP7xQDc=; b=sQLBGaQjm+drdm
	PcrUP8wFAq4TmMtjr/sMY79PlVPZEQj0dzAseyBEqgzSePQk5dnVV5+78NFxq11vat4FbmyGNIMtj
	CLV4v/MASTb6es3SnwwSXaHMDgFvr8VLXElL/vHBDtRLB08YFtVSLQMBlMwL4mc4Nm/MURq1zjf/I
	Dp85zZ+LA5F2ZEvIwFxFLkF4vr75gbOm8GT+Cn22uZ/H6kB8fOW1NQH652fmA/hQwclX7dxnb+ctJ
	Y5+RtbsqvIZ31emK+XM7fzcLdQSSDkkoGu4NZhcVtHa30YvHwEAzeGR/Df83cwVM17CxIk69IyyqH
	SmFbrWPft4XcVBBQlfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZeI7-0062j5-0k;
	Fri, 25 Aug 2023 21:24:27 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZeI4-0062iY-05
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 21:24:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-500760b296aso1675219e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2023 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692998658; x=1693603458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAvdxGRJNm0KAatLMLcV87iYXC997rK/9oVNl8An31I=;
        b=EdMzk7VFFK7sU2Y8cOGJylYOBJtZc6DglyLy7WW2MlfE7KVNX9+kVA627Mjg2S1nuv
         /++QYreB9pzooxNgrPmLz0D4qTr4xfyetYa8o7FCBLpxku1BVIcc3G2f56qVKM5eX6vM
         OkVV40XTUyIuUNc71aE1XrLbt/Sm/1aXm/RN9AOW4ErRuPrioYpCwPfrDdmiYf9Ho15s
         DrhF8dNYjVUBZljEv4qDjIspMdNS4ZkeuV2SAd+hnzBVQ9lisOmwCHZPmNuq+xsM0ES9
         DEVQr9aSC3pkPkhcP/nrEweep1kIndWvUkb8BSX8vIewgHwIroDsnlNkugvCz9lx2WmJ
         vMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692998658; x=1693603458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAvdxGRJNm0KAatLMLcV87iYXC997rK/9oVNl8An31I=;
        b=C+edu/QXEtExULD7ysfKRtEjUiZtvUkM3VC3O5kcX6E/CZYh6luQLUEZxoNruwux3T
         OAxfX950WDlqbSpo3LqYHkltNR9IPU3wwQb5ysafEx2T0TrmgeODnq3YczUZeXyr9HqA
         Je2C/xmEo3HNC41ElZfONxaRPX6KEOCdzEkJUrmXlteArwCTec+2WL+1Pt4SkV07jwsu
         f9tJAh1SOfZVYiymvhxXEPjQGs0qVU+VwAZXbKYejXGHMISHErXDUglvZb2q3rPri/Ad
         rPFsSfbvZgoMSxvtjTvqarS+1zGKh/5015XdDgBV18pUCvHSQfUHt8VPPWh5n+HC9yv8
         Nijg==
X-Gm-Message-State: AOJu0YxatsJ0Qy8yjRNoEvey/4fYlY8lIdGsTdQF6hexmUYc7nldrkub
	jpGVYe0+o/U5dt9ZxmAckUbNhbzRaW0yPqbD8Kk=
X-Google-Smtp-Source: AGHT+IHEqh8MOurQUl5UbtkJsmWLglp5EXFvNEKnNoXqGh9kjzmi4K5f8CCnMUOsiOKpYf8vQe8dZwJgtyakodQk8aE=
X-Received: by 2002:a05:6512:ba7:b0:500:8676:aa7f with SMTP id
 b39-20020a0565120ba700b005008676aa7fmr5726857lfv.23.1692998657716; Fri, 25
 Aug 2023 14:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au> <E1qYl9u-006vE6-L2@formenos.hmeau.com>
In-Reply-To: <E1qYl9u-006vE6-L2@formenos.hmeau.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 25 Aug 2023 14:23:00 -0700
Message-ID: <CABBYNZKM+pHzU7_6x4_25mZ5nb-hAJWahVZh6oac+G8=9Q07Hg@mail.gmail.com>
Subject: Re: [PATCH 3/12] Bluetooth: Do not include crypto/algapi.h
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, 
	Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, 
	Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, 
	netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	linux-wireless@vger.kernel.org, 
	Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, 
	Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_142424_090925_240BC2A0 
X-CRM114-Status: GOOD (  13.47  )
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

SGkgSGVyYmVydCwKCk9uIFdlZCwgQXVnIDIzLCAyMDIzIGF0IDM6MzLigK9BTSBIZXJiZXJ0IFh1
IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+IHdyb3RlOgo+Cj4gVGhlIGhlYWRlciBmaWxl
IGNyeXB0by9hbGdhcGkuaCBpcyBmb3IgaW50ZXJuYWwgdXNlIG9ubHkuICBVc2UgdGhlCj4gaGVh
ZGVyIGZpbGUgY3J5cHRvL3V0aWxzLmggaW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhlcmJl
cnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiAtLS0KPgo+ICBuZXQvYmx1ZXRv
b3RoL3NtcC5jIHwgICAgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL25ldC9ibHVldG9vdGgvc21wLmMgYi9uZXQv
Ymx1ZXRvb3RoL3NtcC5jCj4gaW5kZXggZjFhOWZjMDAxMmYwLi41ZjJmOTdkZTI5NWUgMTAwNjQ0
Cj4gLS0tIGEvbmV0L2JsdWV0b290aC9zbXAuYwo+ICsrKyBiL25ldC9ibHVldG9vdGgvc21wLmMK
PiBAQCAtMjIsMTEgKzIyLDEwIEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9jcnlwdG8u
aD4KPiAgI2luY2x1ZGUgPGNyeXB0by9hZXMuaD4KPiAtI2luY2x1ZGUgPGNyeXB0by9hbGdhcGku
aD4KPiAgI2luY2x1ZGUgPGNyeXB0by9oYXNoLmg+Cj4gICNpbmNsdWRlIDxjcnlwdG8va3BwLmg+
Cj4gKyNpbmNsdWRlIDxjcnlwdG8vdXRpbHMuaD4KPgo+ICAjaW5jbHVkZSA8bmV0L2JsdWV0b290
aC9ibHVldG9vdGguaD4KPiAgI2luY2x1ZGUgPG5ldC9ibHVldG9vdGgvaGNpX2NvcmUuaD4KCkFj
a2VkLWJ5OiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LnZvbi5kZW50ekBpbnRlbC5jb20+
CgotLSAKTHVpeiBBdWd1c3RvIHZvbiBEZW50egoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
