Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C37D3B7EA
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Dec 2025 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPjuXPuyDJ5Hn6M0hB1CUMC7yfYJAWkM3hQQ1+MQpF4=; b=D3i/pAK5zJy3rZ
	maX6bv8e8NMXp35+vX/mwAasuihoMM/PBNuW2ErpTP+vvVJQjjNluXX3g0JfJw+auoWVa1AkZPVOV
	75DEF9TOZgtIBOEulu7Q7mVsKg/oXe9NjOao0nTVrbqcyZZLragwBgTsprkp6tNtFKsC39Hf6ulaX
	wPoflq8oXfSOMJ9mc2zfqcvkkcnlIs2dm5ZeYurjodHeW8TYbcCRGYnENlmUjWLnCNiBxbdFDTn12
	xMoXXcAy3vF/OnHWMwixvvLwRW63vZ2eITVWdpE/uncpmEbt2H6TzeWY19u4zS/Qe9JGKTMp3uE3D
	tNu64QWj+9uVnv/A8jRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSroS-0000000DvkA-0y2O;
	Tue, 09 Dec 2025 07:07:08 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSroK-0000000DvjC-2jPv
	for linux-mtd@lists.infradead.org;
	Tue, 09 Dec 2025 07:07:07 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3437ea05540so4201103a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2025 23:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765264019; x=1765868819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YXcwxUnJQ+S362xxKdo7SZa6folpZloa3pNs+jWKg8=;
        b=Zy74NJsDrs3ooZ48wZNKHsqNAOqA7j1vN6N2jnMAidm6nZ3ajWg6v5aX1PntkxfYk5
         OXWS+FA+xJz/5owK543b6yrMNpL+x1O41zZQ1ssvz3MxdEQz0WZhVmceaWjYvs2Lfjr2
         DyLfcAFIYd4bz6NyYl5+mUc7lWXj3GYlJEIuNYbcF2Timnc5GXh9ANVhKgQtnMHBlbbR
         H7oUxI8kqAv834nYlT8/ZrJawmCXnxoLW1ji1tfX3sTwybRdwBa7iBqdoGbvbuLTEHXv
         kiqib8CfKPN+DKBilgAOXUrUocnx8rX/22OmxxiFQNyTYlky2G5HgkBOM/wv2gdYgF1Z
         4shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765264019; x=1765868819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YXcwxUnJQ+S362xxKdo7SZa6folpZloa3pNs+jWKg8=;
        b=XnCZk25102RAQsnJSww+smkotEws555btIzMGtGVA8ZNHXInhe7MziHi8/ROKYBC5o
         oqSMpI6EJtRc5NQ+YR7wVcV4jAURDpo1OnfOyzA1MAAAO+pEEr5XeZGRckQ0v1s7mr2h
         sun7ui4RV6tt4hcCiCWOP7x4eVY+Py/XSHNukgw7plWy77ijmpZVjUam3CzXjQt0E7P0
         4RCeK5FpMW/SGNPU2y3WSFLkOOayHFiR5WCOae0ZX4+v+njVgG1ftEcsQLKBrueJ72dQ
         uAuWC2BOftdC4GFOQjsLi4blIsTEpyNGwS0/SZzNoWh6/cDoduHLsqhL7ePKFAxnyAw+
         4ADg==
X-Forwarded-Encrypted: i=1; AJvYcCXlw+n+rjFOUjcnt2peHDq3hjuZmT06r9UtCcovmwYQohXJcWqbqaHJHR7XMjkUTx7o2WYhh2MQDig=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXOpRKbJ+7yjkHHBvwDeivJb8yLkzi/48D6NsAfxajRF7y2uLp
	oN5Q6YFqeem1sjwGw8S5ExcKT1ATiedbDMOfGWJWHcWk3nQf1oTmvfu/
X-Gm-Gg: ASbGnct7Xdvy1Ea6FJ0SPiyKYk8wfxlhonN4/pmgKg7dd/qEb2n8s5Z6eKl14qhjAA1
	leoXbce9kFNSgW1HroKysr529VwfCn4CfjUQKbNKx8rcSRhlXZ7hRU7DO8NDf9Ce8GlXIAhpCTp
	x0eU74UghhwGYIAFN4hyhw86/WefPZCWB58QRpwQ71BO4whO7+zUyMJvESDdnKS8ZFcUlZYM9bs
	EL9vDMAJedIvCyLK03xY/LUstUeUUnwXGz+WA7dpIrIyFD/28vqDSxdA1jFdxfVj8sGOroiBiha
	FGdy8+WHKusWBR1tt6IRw8315UNrnDzUEvufBGri7Z1zBLKGYWZpWxtbnE3Qb5GYiGMab61jXXS
	JdvnUzEzMxu/2jPaHaqPXPyitfAqFk27dG1WHi8JqMPPncn0j9+pbIx/n7rbP5peoBAV48jQ1B5
	Fx17JdILTi6O+YoMupqrWm
X-Google-Smtp-Source: AGHT+IEdKiH2/w1Zyzo0nPW4nC0c5CMhMt7JsBXIOmHOOPxq0ucTuPlf2Sa9gfnM3LABhhMUIuO2bQ==
X-Received: by 2002:a17:90b:5546:b0:343:eb40:8e01 with SMTP id 98e67ed59e1d1-349a26223e5mr7488178a91.27.1765264019303;
        Mon, 08 Dec 2025 23:06:59 -0800 (PST)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a47bc2056sm750894a91.1.2025.12.08.23.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:06:58 -0800 (PST)
From: Ahmed Naseef <naseefkm@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	naseefkm@gmail.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
Date: Tue,  9 Dec 2025 11:06:41 +0400
Message-Id: <20251209070641.34589-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87qzt573uo.fsf@bootlin.com>
References: <87qzt573uo.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_230700_713454_7C459620 
X-CRM114-Status: GOOD (  11.33  )
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

SGkgTWlxdcOobCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gWW91IHdlcmUgcmlnaHQgYWJv
dXQgdGhlIE9PQiBsYXlvdXQgLSBpdCB3YXMgCmluY29ycmVjdC4KCgo+IFRoZXNlIG1hY3JvcyBo
YXZlIGJlZW4gcmVuYW1lZCwgcGxlYXNlIHJlYmFzZSBhdCAtcmMxLgoKRG9uZSwgdXBkYXRlZCBp
biB2Mi4KCj4gVGhpcyBpcyBzdHJhbmdlLCB0aGVyZSBpcyB1c3VhbGx5IHNvbWUgc3BhcmUgYXJl
YSB1c2VkIGZvciBzdG9yaW5nIHRoZQo+IEVDQy4gQXJlIHlvdSBzdXJlIG5vbmUgb2YgdGhlIGJ5
dGVzIGluIHRoZSBzcGFyZSBhcmVhIGFyZSBiZWluZyBzbWFzaGVkCj4gd2hlbiB5b3Ugd3JpdGUg
dGhlbT8KCllvdSB3ZXJlIGNvcnJlY3QgLSB0aGUgb3JpZ2luYWwgT09CIGxheW91dCB3YXMgd3Jv
bmcuIEkgaW5pdGlhbGx5Cm1pc3JlYWQgdGhlIGRhdGFzaGVldCdzICJoaWRkZW4gc3BhcmUgYXJl
YSIgcGhyYXNlIGFuZCBhc3N1bWVkCkVDQyBwYXJpdHkgd2FzIHN0b3JlZCBpbnRlcm5hbGx5IGJ5
IHRoZSBjaGlwLiBJJ3ZlIG5vdyBkb25lIGhhcmR3YXJlCnRlc3Rpbmcgd2hpY2ggcHJvdmVzIG90
aGVyd2lzZS4KClRlc3QgcHJvY2VkdXJlIChvbiBHZW5leGlzIFBsYXRpbnVtIDQ0MTApCjEuIEVy
YXNlZCBhIGJsb2NrIGFuZCB3cm90ZSAweEFBIHRvIGFsbCA2MiBPT0IgYnl0ZXMgKDItNjMpCjIu
IFJlYWQgYmFjayB0aGUgcGFnZSB3aXRoIEVDQyBlbmFibGVkCgpSZXN1bHQ6CiAgMDAwMDA4MDAg
IGZmIGZmIGFhIGFhIGFhIGFhIGFhIGFhICBlNSA1OCA0ZSA4NiA3NyA3NSAwZSBmMAogIDAwMDAw
ODEwICBhYSBhYSBhYSBhYSBhYSBhYSBhYSBhYSAgZTUgNTggNGUgODYgNzcgNzUgMGUgZjAKICAu
Li4KClRoZSBSMSByZWdpb25zIChieXRlcyA4LTE1LCAyNC0zMSwgNDAtNDcsIDU2LTYzKSB3ZXJl
IG92ZXJ3cml0dGVuIHdpdGgKRUNDIHBhcml0eSBkYXRhLCB3aGlsZSBNMitNMSByZWdpb25zIHBy
ZXNlcnZlZCB0aGUgMHhBQSBwYXR0ZXJuLgoKQ29ycmVjdGVkIE9PQiBsYXlvdXQgKHBlciBkYXRh
c2hlZXQgVGFibGUgMy43KToKICAtIDY0IGJ5dGVzIHRvdGFsLCA0IHNlZ21lbnRzIG9mIDE2IGJ5
dGVzIGVhY2gKICAtIEVhY2ggc2VnbWVudDogYnl0ZXMgMC03IHVzZXIgZGF0YSAoTTIrTTEpLCBi
eXRlcyA4LTE1IEVDQyBwYXJpdHkgKFIxKQogIC0gRnJlZTogMzAgYnl0ZXMgdG90YWwgKDYrOCs4
KzgsIGFjY291bnRpbmcgZm9yIDItYnl0ZSBCQk0pCiAgLSBFQ0M6IDMyIGJ5dGVzIHRvdGFsICg4
IGJ5dGVzIMOXIDQgc2VnbWVudHMpCgp2MiBpbmNsdWRlcyB0aGUgY29ycmVjdGVkIE9PQiBsYXlv
dXQgd2l0aCBwcm9wZXIgRUNDIGFuZCBmcmVlIHJlZ2lvbgpjYWxsYmFja3MuCgpUaGFua3MsCkFo
bWVkIE5hc2VlZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
