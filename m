Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29217C54E41
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQu4e2MxH0aMzpWVd8+VPbOM1J7Iz1NKTGMh2jz20c8=; b=XxyEgmFKfO182K
	IVl5NWp9OUgAyF8IJO3j4s+6Y5RrYooUmUz0Mz71OzzsmrG4j9r54/CWhtRS9M3V7myxpNAzauB1U
	/uxObm0tG33jL4a7wA2P2Dqk0BRmzcNY9Zoc9FBtD6yBqMWGp9L9Nh414MmsosGMNWouIZ1r2FwQE
	pBOTBwqnrl2rwMvO2jeFj6SRtH21tnqfd/G0i3yDQ8Ko1PSLn1V7zC+NA2Qep2dCkwHS99ONIWCDe
	1w+9bWsCgy8vvHeiIE8V5d5scYrkgu0HOIayjLiiQ278clXJCJsT9h9MeyLZTet6b8RVBnq/rEOQw
	NIFvBtP+APdZEh+W82mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmMA-0000000Gp6L-03T1;
	Wed, 06 Mar 2024 08:10:30 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmM7-0000000Gp5D-1U9s
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 08:10:28 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-608ceccb5f4so43419397b3.3
        for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2024 00:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709712625; x=1710317425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgBoqrOAgaLAPx7rydT1ctP3KqDR0Oo6bSo9imw7eG4=;
        b=H9zxhAFFd5UIxQftoyKxwA3A55TPGgdLk36CKNlHMbFG0Uth2YTO7JVZKn6AQ2vTE0
         +pBnHJ7P2U/KQeJMjzqlIx+0nvberQ4t6CgnfunEIqG32kCertfvtX+ioqIB25K2mvK2
         CLM9vFpVbb4m9P6n9taVrwk+bKsIoQIKVFWjNXJzKB41PevBxGAQUlWhXP3fIiex52PM
         8ULIXLB4RexCgAHn24ivgiJgMk3DOUaz9JETOR23REH1jMVplNhQ5zTBtoc8bZojP9xZ
         jJvxE+4rt4FZnDY/NJDMNAlzhu2Sa6Lx7fGWtBbcKXQql4k1VH2/YVoQNMUyWjnZUw95
         K+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709712625; x=1710317425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgBoqrOAgaLAPx7rydT1ctP3KqDR0Oo6bSo9imw7eG4=;
        b=E0+DwT+KkEdrCUwdjbJ5ZHNq+7MdXW+KxJeVTKEP4hTHVzxwXXJw82CoCNY96B7RFG
         cThzVRE9NUIRaCd6N1I14XSgO3WqFBac8wv60tMK77r3zipW2zeeF3QgoYjm+qCw/sns
         sVzcC5pZD6agU1umytFKyncf0NAXs8bPbS0oAVu21rs6wXEka32nbpdjH0h1Y5VIYwzh
         7qqzTeG3jAviUbCkwPInG4ReEq7PV9Av7sLNjz5Xxt+bXB/RWB5lr1yRRT4GSdoe3qPd
         7N65GC3WLlAHdtO3x7xUkX1TB8cqfbiwsY5Jyb4Ye9kmzJ5lPOES5s/7KmwT6nP0geB8
         8Zaw==
X-Forwarded-Encrypted: i=1; AJvYcCVyoaM/heSZmCnVX3MskluhOjeghOwdlKawdQ4MisIPt3kVaEexGo9tRu6D4EOZgZxCpfDwbLebCLcyG7CFRyvU0Q75W3AFFIssdCEwFg==
X-Gm-Message-State: AOJu0YyBzUD4jOQM9n73uTkKjW4zL81LCzLcbNDyXUa6lqLQ1O5/cv64
	OHB4DqPg1sdquVxikKyRPaVU21CvvQfhuhtHuNlBEEwJkeY9seKW3Oy0EDKeZYsQvYTMg8Jpf33
	xLNz0+qEPC+JToI0OG5mA7FioKAU=
X-Google-Smtp-Source: AGHT+IGVq1zfcOq74/DXHH76wxegg0dwloHQshJNGoWrU1dFWyau1kRoYYEX+DYi2EtDlFpQV+30pS0NRefQHxnT+6c=
X-Received: by 2002:a0d:c7c5:0:b0:609:339a:b144 with SMTP id
 j188-20020a0dc7c5000000b00609339ab144mr13480009ywd.51.1709712625516; Wed, 06
 Mar 2024 00:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20240306041532.16985-1-kr.kim@skyhighmemory.com>
In-Reply-To: <20240306041532.16985-1-kr.kim@skyhighmemory.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 6 Mar 2024 16:10:13 +0800
Message-ID: <CAJsYDVLHNODkL3zg-X6fP8N_FPFtReP_poFBua3kJHJ6m-a7Hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] SPI Nand Patch code for SkyHigh Momory
To: KR Kim <kr.kim@skyhighmemory.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	mmkurbanov@salutedevices.com, ddrokosov@sberdevices.ru, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	moh.sardi@skyhighmemory.com, changsub.shim@skyhighmemory.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001027_417120_E319D924 
X-CRM114-Status: UNSURE (   8.97  )
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

SGVsbG8hCgpPbiBXZWQsIE1hciA2LCAyMDI0IGF0IDEyOjE24oCvUE0gS1IgS2ltIDxrci5raW1A
c2t5aGlnaG1lbW9yeS5jb20+IHdyb3RlOgo+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvc3Bp
L01ha2VmaWxlICB8ICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL3NreWhpZ2guYyB8IDU3
ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKCllvdSBzaG91bGQgc2VuZCBhbiB1cGRh
dGVkIHZlcnNpb24gb2YgeW91ciBvcmlnaW5hbCBwYXRjaCB3aXRoCnJlcXVlc3RlZCBjaGFuZ2Vz
LCBub3QgYSBuZXcgcGF0Y2ggb24gdG9wIG9mIHlvdXIgb3JpZ2luYWwgb25lLgpBbmQgeW91ciBj
dXJyZW50IHBhdGNoIGlzIG1pc3NpbmcgYSBwcm9wZXIgdGl0bGUgYW5kIGNvbW1pdCBtZXNzYWdl
LgoKSSBiZWxpZXZlIHRoZXJlIGFyZSBtdWx0aXBsZSBkb2NzIGFuZCB0dXRvcmlhbHMgb25saW5l
IGZvciBzdWJtaXR0aW5nCnBhdGNoZXMgdG8gdGhlIExpbnV4IGtlcm5lbCwgZm9yIGV4YW1wbGUg
dGhpcyBvbmU6CgpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNz
L3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sCgpSZWFkIHRocm91Z2ggdGhlIGRvY3MgZmlyc3QgYmVm
b3JlIHN1Ym1pdHRpbmcgeW91ciBjaGFuZ2VzLgoKLS0gClJlZ2FyZHMsCkNodWFuaG9uZyBHdW8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
