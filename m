Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF8CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR43W9ZgUhBM7y01aJAD6+gD6H7SY1sU+eZETZEQUag=; b=1lMDWKNK0ke+2t
	HenO25ulPA6WJAXgkUbwI+AIcwcCWXbCrQ/YZvyFc2bHxuBsyw/hS9XbH61nfFs9u1naEnf3LgaK9
	8JVCF5npaUsVXyNvpDvM97vgSN5V+dYHauP35cW9uRDc03ULEYiLIc41CvMQ3jOrDnQYp/v27rG0S
	7aBwsrSQR+lG5pu454a+FDf6T6Bek8/VnPbB4ONWFfsFG9Cpv6E8ONUX058bU0U4t3xyPthioqQms
	HbMpMVYnRTyU7s2qBqBC+D2WRXNLx6tQM8fOLPsXAMcKIJwL7R8fqUTZiO7uzDcPje/A5aQrrXo0E
	w+2HLOK6+z3d/JxHwVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwErJ-0000000CNvF-3Q1q;
	Wed, 10 Sep 2025 07:03:13 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwErH-0000000CNu9-2Ah9
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 07:03:12 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-403a893fb99so22171465ab.1
        for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757487790; x=1758092590; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3sb3O0WaaCu0/VJziTkMwe7dsY/QjdigziLXVPL3Iw=;
        b=IHR1mp81RWKdaNkuhGXR4/hHbenvU7mPfyFs/ieEdpifx6QZaUyXVdp1XeCfUW3ecb
         /j06DwoixuiM7tI78XY7mhMOtmgIlGWOyVPaxCr8FLShCLEG6pghDF6vj7nYuhp3TRY/
         1ksj+VEfokrRFbFEff2OyxUx0BNTgBK2Ya2R8PG/na4Q5R1x7h1LRN4yldlp5GU3s3Z3
         scwuPoJqNLrj6X7Wsd83RWwS25CXgZVO9hF3Xs49C6YVo6H85mg2gLU96WsvbB6411tZ
         Fs3cOMMktodGIuC2KluM68C0Zq8XaQskAwXSyzLVaotsKP8l2M7GuUV8h92kf2NlGaBd
         lH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757487790; x=1758092590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3sb3O0WaaCu0/VJziTkMwe7dsY/QjdigziLXVPL3Iw=;
        b=jQsoj/gB24n00TbGl42Brjbn5uFlYrPjPKTJ27wl55Ef9ORMWuVMncQHkOmakhX+cQ
         Ayv45AvsVLmx2WPBrjVMW/DZgKXC7wTgMHaXQ0KIAsom1RcvEsNn6LKzUQcekLqbL3DE
         drHIwsm1iy/6HjGYUfXbpHo4Gnl0kryTYZ1jnGXI5VBWtEmZsZJqPk6PJFmE2+0IwEDz
         UtdlYdgK1TSfdC1nWTY5zCN0lximZ+pbVebt6ozV5nuosqMn0Ku/m2R0M3O6YaiuEAgQ
         gtu2ufyTEcTtd3upXKADzTnSh03pmP8yGvRG689OkvUrsMEYuer9XnaNFB37gbWWMCzz
         zYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0SzoXxJpJ3604fpMYjU7fCyifXZBq8sr+Mob3NlIwXyTD8RqTfOlpxNL181BmiCVyjXqnAYj8bUk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ws3LvJGNyL5madU2Wa1kehJX99J/btZdp2poPrf+YUpOsGZ9
	2qj1Hie51V58SjP2P2jVEQK5FgG+lDhUkmkMhaqeSs3hmSs3H8PB8jsO7tXTCF5LhnV9ABgjIp+
	79N7BG0qRCUlCqNX9KULBKvfvD0DslRk=
X-Gm-Gg: ASbGnctIKT/jSC1f+izr90nEojvcZu0h4t0Bcw6qN1wtK6bGaF0ijygTwdFlNHmhsPl
	5N9VnNR+mbCgV4jFGdZy2cXTWSrOFiedr5Oz+/9CIw62Q6ZMoHbSzaceQr+nnXvi2AtobentXM1
	FQ5kGlEcCvP9iEOMbVqYO2xBRUGYYMPWY54jX44QSSDKMlfdR4avrhffORLQOkaGapp/ugBxyIa
	31rNj/zRnG8f78u
X-Google-Smtp-Source: AGHT+IFRXCqGqREn+YxT6ZRBQQ+/gQ+Gwx5iX5XmgokBagKB2BNEC9oKGjvvsbIx8yoWxpnf5nOBNea7lamS0o/4C6A=
X-Received: by 2002:a92:c26a:0:b0:40e:adf8:ca2a with SMTP id
 e9e14a558f8ab-40eadf8cc5bmr102324035ab.6.1757487790409; Wed, 10 Sep 2025
 00:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250908070124.2647038-1-rk0006818@gmail.com> <87tt1djtot.fsf@bootlin.com>
 <93578759.11447.1757322260340.JavaMail.zimbra@nod.at> <mafs08qinn92v.fsf@kernel.org>
 <CAKY2RybqkE74EADTPnCUHAXpJLJmM9skPXQ6S3UOq8TK_y9EQA@mail.gmail.com> <589829523.18235.1757447430401.JavaMail.zimbra@nod.at>
In-Reply-To: <589829523.18235.1757447430401.JavaMail.zimbra@nod.at>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Wed, 10 Sep 2025 12:32:59 +0530
X-Gm-Features: Ac12FXwBsZJOjWnbMMWv1I2jpV-70BlTyF34pse8dnrTr5YRb8hM2Y46Rkfg8n8
Message-ID: <CAKY2Ryb6CLLYBWH6pipDGV5SHv8GiZJrPb-KOWU29g=yYkzUgQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
To: Richard Weinberger <richard@nod.at>
Cc: pratyush <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-kernel-mentees <linux-kernel-mentees@lists.linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_000311_558491_723E2C3A 
X-CRM114-Status: GOOD (  13.59  )
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

SGkgUmljaGFyZCwKCkkgc2luY2VyZWx5IGFwcHJlY2lhdGUgeW91ciBlbmNvdXJhZ2luZyB3b3Jk
cy4gVGhleSBtb3RpdmF0ZSBtZSB0bwpjb250aW51ZSBpbXByb3ZpbmcgYW5kIG1ha2luZyBiZXR0
ZXIgY29udHJpYnV0aW9ucy4KCkJlc3QgcmVnYXJkcywKUmFodWwgS3VtYXIKCgpPbiBXZWQsIFNl
cCAxMCwgMjAyNSBhdCAxOjIw4oCvQU0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5h
dD4gd3JvdGU6Cj4KPiBSYWh1bCwKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0K
PiA+IFZvbjogIlJhaHVsIEt1bWFyIiA8cmswMDA2ODE4QGdtYWlsLmNvbT4KPiA+IFRoYW5rcyBh
IGxvdCBmb3IgdGhlIGRldGFpbGVkIGZlZWRiYWNrIG9uIG15IHBhdGNoLiBJIHVuZGVyc3RhbmQg
bm93Cj4gPiB0aGF0IHRoaXMgY2hhbmdlIGRvZXMgbm90IGFkZCBtdWNoIHZhbHVlLCBhbmQgSeKA
mWxsIGtlZXAgeW91ciBwb2ludHMgaW4KPiA+IG1pbmQgZm9yIGZ1dHVyZSBjb250cmlidXRpb25z
LiBJIHJlYWxseSBhcHByZWNpYXRlIHRoZSBndWlkYW5jZS4KPgo+IEkgaG9wZSBteSBjb21tZW50
IHdhc24ndCB0b28gZGVtb3RpdmF0aW5nLgo+IFlvdSBhcmUgKnZlcnkqIHdlbGNvbWUgdG8gaW1w
cm92ZSB0aGUgY29kZS4KPiBPbmUgb2YgdGhlIG1ham9yIHByb2JsZW1zIGluIG9wZW4tc291cmNl
IHByb2plY3RzIGlzIHRoYXQKPiB3ZSdyZSBzaG9ydCBvbiByZXZpZXcgcG93ZXIuIFRoYXQncyB3
aHkgc29tZXRpbWVzIG1haW50YWluZXJzIChpbmNsdWRpbmcgbWUpCj4gcmVhY3QgZ3J1bXBpbHkg
d2hlbiBjb2RlIGlzIGNoYW5nZWQganVzdCBmb3IgdGhlIHNha2Ugb2YgY2hhbmdlLgo+Cj4gVGhh
bmtzLAo+IC8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
