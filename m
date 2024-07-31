Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C8CC3DA7F
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 17:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNCJ6DNoXa3OL8Lw4j9p3Jvei5TiIU6SnznGsLN1GKU=; b=rMHRYqiN2G7Bci
	EChf4tPysQh1IRgTCAuURilmEqGwINWcsEqLzTxkBgnIdA+QMURjWC6xteKp5F2winD6KO5raw9iI
	5ICmEAOQ19L7kkfdcALbz6W15h8r+zQeipTGh7ZZbHguHd3i/1Npnqcfl7eq+IlayPHxjATNIxofw
	+C/nYg63/jCWyq5zTMMK4TK0pXb4IBaHaadvrCQJGZK6kIckUt0z9eU8zqx1zPXdoybhyRHO5o8Fk
	+9H8NmMirbvX5ZOhBaZKFwmsYUk3/ypZ3eHtvopXm/1iZfvJ0vLLvi4W3UpaGqLHrGXh7n4+KBQr6
	lfa6+UAeyVx3BcB7B0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZCrU-00000001yd0-0TaF;
	Wed, 31 Jul 2024 17:11:40 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZCqb-00000001yLS-49rp
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jul 2024 17:10:47 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-661369ff30aso45804737b3.2
        for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2024 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722445844; x=1723050644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG9Dsrk5EbbKUqbUuC/SLfjiErZu07ODQyjNbdBQFKM=;
        b=kCoW0Zl6wt2TrQuAtaKawqRRhnjYj/FqIHDxfXYgET4t/i8NzSbDrlEE3ADow8Qz7u
         d4KGZyGSy7J0J81aEdifo2tT7LNkBfzjl3IsAVBdGjffWhEibcsq9DvJFkLZCpeuhRQF
         C12AN9vN4x+eiX6KcwcpMmzPtufPXh+kP20Qv8Yxrkm+K4N3l9vshoZOMe4JGu+KPv7d
         CpEZHO7sBAHOmE+eZulquMGLFaZfhzfWZBBck2KrfjkIof2gkCJj0oLo6Z3q6oggDtuR
         jPsBpnzoXsoph2zhJd18t9hQFo5HiDCL6F53qpwrke3OJjxG/EipCP4vTorYi7RgLf2C
         XuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722445844; x=1723050644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG9Dsrk5EbbKUqbUuC/SLfjiErZu07ODQyjNbdBQFKM=;
        b=mBvmIYYdpfAcAqN1o+ZT4VQY73NFVgbAzKSqtU6LOu802jm2x2Uurlz6XCflRnL73J
         spfwMfiHMQJPWyDG7+kLxJPjW/zCXJeURsjkUsLB2ajZ7oGTX0t3grTMl2bMcJiv6Mg/
         h00jR/EHMzsUHNYajHtaTvHdkyGoYvha6NFiTN6sESLEjc/29v0bc3PGvX8QGK9Sr9zQ
         8muaT7DTlzWVGc8GnWhSFTHXcH9aw0ua13EpPldfmoZSHQpHfy+1kIfFJd/ohVanZ8sV
         4gDHp1FDczvkayhIelGIFOWbCOpQl117KdSaeI6lZCALIYHSmxr6gstDvQTFgqAWFcOw
         EH2g==
X-Forwarded-Encrypted: i=1; AJvYcCVipQz3HBM6oLey7xcAI7a/lFdrVI0rQ2eT2zux/2slHZe5F2wFx/wBru32QIc5Wz+mukse3cr+SFG6o3cMl8Jz+U7PS5b+FZGcDo2UBQ==
X-Gm-Message-State: AOJu0Yxd8dkjdCZq+4kIcG49DfR82OmZ7OE7/eMwhp/OrFyPn/CqnMH7
	WdO6HtYgBd6tWX+CPDw4QLs3clxTyK28+Lk14hMBZ4ofjIJywRk+neaJVaSsnt6yZS85iPKlC5/
	7rCTCeuXzJ3mtHIaW+7004zPF4iY=
X-Google-Smtp-Source: AGHT+IFCW0KBtutTT9yo+ccyb6xdU+bDoCL8vXjw62S5YbYqpKMe64BaRn6jyq9lgwFDPjqYD3SPVCD48sQtrx7IcUk=
X-Received: by 2002:a81:8805:0:b0:64b:44b4:e1a with SMTP id
 00721157ae682-67a0769c813mr157755737b3.26.1722445844349; Wed, 31 Jul 2024
 10:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240726185825.142733-1-computersforpeace@gmail.com>
 <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org> <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
 <CAN8TOE8-9=P7p8Tkc+5kG5Sqan+RAWAc7k2VH-p5W9hR-bb_Xg@mail.gmail.com> <0685ef1b-b0e1-4c53-94dc-4d5de5be8e94@linaro.org>
In-Reply-To: <0685ef1b-b0e1-4c53-94dc-4d5de5be8e94@linaro.org>
From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 31 Jul 2024 10:10:32 -0700
Message-ID: <CAN8TOE-YGSRxjrMNqHWfP7RYKUnPs-V=d_FFJfZtquPedEe+dA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_101046_052185_A0EAD221 
X-CRM114-Status: GOOD (  17.02  )
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

SGkgVHVkb3IsCgpPbiBXZWQsIEp1bCAzMSwgMjAyNCBhdCAxOjUx4oCvQU0gVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPiBBIHNoYXN1bSBvbiB0aGUgU0ZE
UCBkdW1wIHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBzb21lIHNvcnQgb2YgaW50ZWdyaXR5Cj4gYXNz
dXJhbmNlLCBlLmcuOgo+IHNoYTI1NnN1bSAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkwLjAvc3Bp
LW5vci9zZmRwCgojIHNoYTI1NnN1bSAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkwLjAvc3BpLW5v
ci9zZmRwCjIwMzBkMDQ3NTgxNjQ0OTFlNDE0ZTFkNTVlMTZiMDQ4MDNmNTY1M2ZiNTkxZmRhNTA5
OTFjNzI4YzQ5YzFjMzcKL3N5cy9idXMvc3BpL2RldmljZXMvc3BpMC4wL3NwaS1ub3Ivc2ZkcAoK
PiBTb21lIHRlc3QgaW4gbXRkLXV0aWxzIHdvdWxkIGJlIGdvb2QgaW5kZWVkLCBidXQgbmFycmF0
aXZlIHNoYWxsIGJlIGFsc28KPiBvayBmb3Igbm93LiBXaGF0IEkgZmVhciBpcyB0aGF0IHBlb3Bs
ZSBqdXN0IHVzZSBqdXN0IGEgZmxhc2ggbG9jay91bmxvY2sKPiBhbGwgc2VjdG9ycyB0ZXN0LCB3
aGljaCBpcyBub3QgaWRlYWwuIFdlIHNoYWxsIGFsc28gdGVzdCBsb2NraW5nIG9uIHNvbWUKPiBz
ZWN0b3JzIGZyb20gdGhlIHRvcCBhbmQgYm90dG9tLCB0byB2ZXJpZnkgdGhlIGNvcnJlY3RuZXNz
IG9mIHRoZSBUQgo+IGJpdCwgY2hlY2sgaWYgQlAzIGlzIHdvcmtpbmcgYnkgbG9ja2luZyBzb21l
IHNlY3RvcnMgaW4gdGhhdCBhcmVhLgo+IEhhdmVuJ3QgbG9va2VkIGF0IHRoZSBCUCBhcmVhIGlu
IGEgd2hpbGUsIGJ1dCB5b3UgZ2V0IG15IHBvaW50LCBJIGZlZWwKPiB0ZXN0aW5nIGlzIG5vdCBp
ZGVhbCBhbmQgYSBndWlkZWxpbmUgd291bGQgaGVscC4KPgo+IElmIHlvdSBldmVyIGZlZWwgdGhh
dCB5b3UgY2FuIHNwZW5kIHNvbWUgdGltZSBvbiB0aGlzLCBoZWxwIGlzIGFwcHJlY2lhdGVkLgoK
T0suIEl0J3MgcG9zc2libGUsIGJ1dCBubyBndWFyYW50ZWVzLiBJIHRoaW5rIGluIHRoZSBkaXN0
YW50IHBhc3QKKHdoZW4gSSB3YXMgc3RpbGwgbWFpbnRhaW5pbmcgc29tZSBvZiB0aGlzIGFyZWEp
LCBJIGFjdHVhbGx5IHN0YXJ0ZWQKdG8gd3JpdGUgc3VjaCBhIG10ZC11dGlscyB0ZXN0LCBidXQg
SSBuZXZlciBjbGVhbmVkIGl0IHVwIGFuZApzdWJtaXR0ZWQgaXQuIEZvciBvbmUsIGEgcHJvcGVy
IGV4aGF1c3RpdmUgdGVzdCB3b3VsZCBiZSByYXRoZXIgc2xvdywKYXMgd2UnZCB3YW50IHRvIHRl
c3QgYWxsIHRoZSBwb3NzaWJsZSBwcm90ZWN0aW9uIHJhbmdlcywgYW5kIHRoZW4KZXJhc2Uvd3Jp
dGUvcmVhZCB0aGUgd2hvbGUgdGhpbmcuIFNvbWUgcm91Z2ggbWVhc3VyZW1lbnQgb24gbXkgc3lz
dGVtCnNob3dzIGFib3V0IGEgbWludXRlIGZvciBlcmFzaW5nIHRoZSB3aG9sZSBjaGlwLCAyNSBz
ZWNvbmRzIGZvcgp3cml0aW5nLCBhbmQgNyBzZWNvbmRzIGZvciByZWFkaW5nIC0tIHdoaWNoIG1l
YW5zIHdpdGggNSBiaXRzIG9mCnByb3RlY3Rpb24gcmFuZ2UgKDQgYml0cywgcGx1cyB0b3AvYm90
dG9tIGJpdCkgd2UgaGF2ZSAzMiBjb21iaW5hdGlvbnMKKiB+MS41IG1pbnV0ZXMgdGVzdCA9IDQ4
IG1pbnV0ZXMuIFRoYXQncyAuLi4gZG9hYmxlIEkgZ3Vlc3MsIGFuZCBpdApjb3VsZCBwcm9iYWJs
eSBiZSBvcHRpbWl6ZWQgYSBiaXQgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2YgZXJhc2UKY3ljbGVz
LiBCdXQgaXQncyBub3QgZ3JlYXQuCgpBbnl3YXksIG1heWJlIEknbGwgcGxheSB3aXRoIGl0LgoK
QnJpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
