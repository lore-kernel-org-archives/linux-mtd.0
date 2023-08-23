Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EC1C27C40
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0jeJuX4b+xKVdrkzRQWw9hQoJHOeB8k4S7SwzcZAag=; b=KOTWfuILuQau20
	any9GjEgOVB44Ga4b4XlYGUf7WQ5sSEW5osOzSOyGyjXY0O3PMxHu7TBgBTvdfcbS00MC+1l2bzKF
	yDWsvy4xTYVGK2uOTfSnD/sS5YWrHPdkwc7Y+muwZNwVYu7AmnKV8kO6JWdmvS9wHQHrAAOduhu1B
	j52T+Oj1y+uWZ4RK6t27T/9u63yoJg1MDiHr9y+trkfmT7HejkrcEyXUTnXK/wKDAKfEsclUnw0di
	OLu6WTGVoGKrSUsus5nPZ2jAs/EK8/k+ONVMW2iKDNBKBm3+Yxf7pehEJlFiuLVmFYHZh/XGc/Zse
	vWYj0pdj7Wcn+z/+nJNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYuqy-001WmH-0R;
	Wed, 23 Aug 2023 20:53:24 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYuqv-001Wli-0N
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 20:53:22 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a84c228f26so139445b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 23 Aug 2023 13:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692823999; x=1693428799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBzuOUokFnbIvdABYXgxVqx9GE8BaF/60yc9jGc5dow=;
        b=ifnYBZ/z06PEthqsBU8HiWYT10InB2ZeB1Y6vsDDSct7lsEMYnCyzojld08QczG4y2
         FUMvuJDrSG8gJxOkIJ1Xq8QOWi7EbXJY90L3J2ijoLRi7Oxne5kAutyRTZ8dhsKyJ8Tm
         GgOm4JhvObKDz/DHO9zQxSv+Tnh3HclqbXCwiMmcyJl4CLfPY0Jm6mp7SQi8lHADhWQz
         uWVAuTieWCuepOe/Wvdl3E5+v1MJN/4eKv134zQmdZsidL9G9nFqjtGGDyXeyTgAZTzK
         /vjog61vWigYGhl/XZsB6Y/CuiNJ4DR6mdHS53x4CWoFyJ63JheDZnuwad+ipe5YsIPL
         Voew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692823999; x=1693428799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBzuOUokFnbIvdABYXgxVqx9GE8BaF/60yc9jGc5dow=;
        b=HgB0PC4k/phYXfy3fsm53vYaky9xw69kiuhZM9lIBAYTV3SN3bDesMv/q94cDSom34
         YrIiNQwM2x+Ky9NZELRifLrguMbv53qZPaqlJoYg6b9tCqCFriUDeU8MYMXlUQe+di7p
         bKc9OrgF5XjZcuHQnySahlCqAgDO2M30yVSH+lM3tTmVC2E4A6ZeCDgAPen9xVyC3828
         BLn7MI5oU75S6adf7NrLVyaKYh3mggRaeRG1wQ44H2sGzktTxiJ0XFf/rvtD4sYgks/v
         dRwWd7ZY7jUPOpYw0y4ieylsMM/YKtATsj9EVxFbaqssW1pzHiRsx4ZIUjvDr8FWnulQ
         9fbA==
X-Gm-Message-State: AOJu0Yws0omHl7Vjt/2TUYV5BjvM9FCgWX7d1NiWapKNVeF845BfvvBv
	UXEjkFbPPUFLc+dT2PFSQiea2moM83QxKbkdzQs=
X-Google-Smtp-Source: AGHT+IFEwtEKi0ASYKlkdJHjS3VmWFQAWnMsjK8W4r5tNoeTEcjoneObafNLHnT2CCsQ51YZgYhlBs6BkOpakYJXZGU=
X-Received: by 2002:a05:6808:23c1:b0:3a7:7b7e:f309 with SMTP id
 bq1-20020a05680823c100b003a77b7ef309mr9358159oib.10.1692823999253; Wed, 23
 Aug 2023 13:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au> <E1qYl9w-006vEX-O3@formenos.hmeau.com>
In-Reply-To: <E1qYl9w-006vEX-O3@formenos.hmeau.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 23 Aug 2023 22:53:07 +0200
Message-ID: <CAOi1vP-n3tNgRWfOAYDaQvuC+781QGXxuT6wt+XEh7n2P4_3Ug@mail.gmail.com>
Subject: Re: [PATCH 4/12] ceph: Do not include crypto/algapi.h
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, 
	Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, 
	Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, 
	netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	linux-wireless@vger.kernel.org, 
	Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, 
	Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_135321_180316_0E7814FC 
X-CRM114-Status: GOOD (  15.37  )
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTI6MzLigK9QTSBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdv
bmRvci5hcGFuYS5vcmcuYXU+IHdyb3RlOgo+Cj4gVGhlIGhlYWRlciBmaWxlIGNyeXB0by9hbGdh
cGkuaCBpcyBmb3IgaW50ZXJuYWwgdXNlIG9ubHkuICBVc2UgdGhlCj4gaGVhZGVyIGZpbGUgY3J5
cHRvL3V0aWxzLmggaW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhlcmJlcnQgWHUgPGhlcmJl
cnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiAtLS0KPgo+ICBuZXQvY2VwaC9tZXNzZW5nZXJfdjIu
YyB8ICAgIDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvbmV0L2NlcGgvbWVzc2VuZ2VyX3YyLmMgYi9uZXQvY2VwaC9t
ZXNzZW5nZXJfdjIuYwo+IGluZGV4IDFhODg4Yjg2YTQ5NC4uNGFhYjMyMTQ0ODMzIDEwMDY0NAo+
IC0tLSBhL25ldC9jZXBoL21lc3Nlbmdlcl92Mi5jCj4gKysrIGIvbmV0L2NlcGgvbWVzc2VuZ2Vy
X3YyLmMKPiBAQCAtOCw5ICs4LDkgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2NlcGgvY2VwaF9kZWJ1
Zy5oPgo+Cj4gICNpbmNsdWRlIDxjcnlwdG8vYWVhZC5oPgo+IC0jaW5jbHVkZSA8Y3J5cHRvL2Fs
Z2FwaS5oPiAgLyogZm9yIGNyeXB0b19tZW1uZXEoKSAqLwo+ICAjaW5jbHVkZSA8Y3J5cHRvL2hh
c2guaD4KPiAgI2luY2x1ZGUgPGNyeXB0by9zaGEyLmg+Cj4gKyNpbmNsdWRlIDxjcnlwdG8vdXRp
bHMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2J2ZWMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2NyYzMy
Yy5oPgo+ICAjaW5jbHVkZSA8bGludXgvbmV0Lmg+CgpBcHBsaWVkLgoKVGhhbmtzLAoKICAgICAg
ICAgICAgICAgIElseWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
