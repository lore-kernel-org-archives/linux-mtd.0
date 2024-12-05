Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1B4E7716C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6bQrOiMy8AqimQsg/U8EvzWFN7BJin+/E8QNQEDjOk=; b=0Yu8b2hSn4DEOB
	5MH3D6FucyYFBI8QUUc8ZdhcMRcNOCbZJKA+v6OjsCP+fF+Xl3373TSeFvM6fz7lFKFsNNNUK1fko
	kFW3p0pU/Bg10v0E+jQnRUm3925o4wDbLPC3zelAT0CJcDsWPRXBYr+uS36fK48pP/n6+MqKZnGzO
	3WiIR92w4BbwWrK9xYvtngdLXC5XlWgAWrWNGbG9SoURNfWUbeTydTZULHKSdxvM4BrnqM9rH7j/g
	08qSwRrrM6rOTtwu1W8r5k+Znk07DaqC0RHXfEeeV5klE3TxfYvllnoS6alinaq8uerkzbEe4qBXI
	XaNHpxQ6ktqMROOWB2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Yi-0000000F4nM-25xX;
	Thu, 05 Dec 2024 07:46:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6W9-0000000F4LX-1vT9
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 07:43:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso851823a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2024 23:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733384600; x=1733989400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTVpIEjfEvrYe8NCl/nn5jhUf4ZiohgnxnUSqyfH4WA=;
        b=UV0v7EV7E75zpbbT8776/ZyDoZXAcF+RK8EgBGR1fOIYS29pmd8FmnEMPMzYMdJfPw
         g66I15GbeWlXfx0dwWlWtQyDuv94SNsQh+1q1PVh3afFfwfZ66BSSfnBmbkdEW1jeSP0
         iLKghvjQU0R6ZF2Z22iZ81Q3ixVzthu7/z9k0f0lyY6OWxmLBPuGK5tfF1Q1mvjLY4bK
         28WX+JQJUQnjXzvyKaSRVSgUIcNgVBtlSt7dsduzrI7xkGxKVpJfy/QwEnNZWNVn5VPj
         SLKocJKmA5/D21FLfjD1yu2h2tB/3BGl2dd6hr63W1jiNsX6tVCn5WseYy8BamZmlx7H
         NyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733384600; x=1733989400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTVpIEjfEvrYe8NCl/nn5jhUf4ZiohgnxnUSqyfH4WA=;
        b=jD+ChmB1M8+ozVIALLDy5BQIFRBdlKuo7SjlVpU8VFeZUKUzxGfOeeDijBdoNzlhcg
         SydEaZb1ddaY5FIDoJgJTcVqx90jdKf6SiM1Xi2uu8s0r3d+CX6NSKocnz8uN32vEitx
         uz1+j4D2lHfzExerF88WkN0tmS+sNkpLM+szKv0c6HPwpQ2JMzxNDglMJRRp0ReJx+yq
         YO9hs3DuTnHN3PQyRwHip6g90B5WciO+1ciCcKfijYS4k3L1JLM5/hMWLQfdBDhhnvAF
         OImfnudYRs2NPY3sKrLIabK5kJJEw/5mm/HpUTpO/fDkpue48T1MqXyVIXlPwroe2Ash
         j9fA==
X-Forwarded-Encrypted: i=1; AJvYcCVivVQSOmNBoRpscXmaNjV37iarZwEi2A2YQE0ZzTIHYopfAM4Td8le+ZjnTSyMRWlW8AjC/+NOKHw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmV9v0hUw/axyB4uTQb6AJIqLPqf9/egqMLJU6Nx4YlAl6nJui
	Lo/ndt2N35ADKDex882SmCTXFL4RDwPgWjkQeiB2Vl0T/rMh4aHf7jdgLb+xnkmTinvfJm1d9+l
	1TsYnFHCJWTtMME9jeqGVvDaT1JQ=
X-Gm-Gg: ASbGncsDH0LmSHadnZRBYEcbS8imEKawuqOLfgqQbwmi6GJjATjlSeUgz0MgRH/9ru1
	noV3IRdNhmD5krF9+TLoO+SABFO6GHu8x
X-Google-Smtp-Source: AGHT+IFAlmjsEZSabPF2WglD5s+LvXZy8Pi/vD1bEetFg/0EHFHd5OED5Qok5xCz+iCKALLTaXE1YY7eaFMm6uNonHI=
X-Received: by 2002:a17:906:30c7:b0:aa5:29ef:3aa6 with SMTP id
 a640c23a62f3a-aa5f7d4da78mr737107466b.23.1733384599610; Wed, 04 Dec 2024
 23:43:19 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
 <CAOuPNLhhWzoBQH85zEd95LbONtrknq+b7tfcze50VPa9bEnXzw@mail.gmail.com>
 <87ldww4zrx.fsf@bootlin.com> <342000380.28770675.1733242094522.JavaMail.zimbra@nod.at>
 <CAOuPNLhZZ1rs3Hhuwh2b3HLaqrAVUY7YwviQVUXgVi6XTZxnMw@mail.gmail.com> <1562063374.32195797.1733307383533.JavaMail.zimbra@nod.at>
In-Reply-To: <1562063374.32195797.1733307383533.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 5 Dec 2024 13:13:06 +0530
Message-ID: <CAOuPNLg-EE=BMq+61h3N7=-59oFg0=cBdGG1tryXZRwhq=4MTA@mail.gmail.com>
Subject: Re: Block based OTA update needs mtdblock
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_234321_503764_0EC0C0D5 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgUmljaGFyZCwKCk9uIFdlZCwgNCBEZWMgMjAyNCBhdCAxNTo0NiwgUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWls
IC0tLS0tCj4gPiBWb246ICJQaW50dSBBZ2Fyd2FsIiA8cGludHUucGluZ0BnbWFpbC5jb20+Cj4g
Pj4gPj4gRGlkIGFueWJvZHkgdXNlZCBibG9jayBiYXNlZCBPVEEgdXBkYXRlIE5BTkQgQS9CIHN5
c3RlbSB3aXRob3V0IHVzaW5nCj4gPj4gPj4gbXRkX2Jsb2NrID8KPiA+PiA+Cj4gPj4gPiBOb3Qg
b24gbXkgc2lkZSwgaXQgaXMgYWN0dWFsbHkgYSBnb29kIHF1ZXN0aW9uLiBSaWNoYXJkLCBhbnkg
aWRlYXM/Cj4gPj4KPiA+PiBXaGF0IGFib3V0IHVzaW5nIHViaXVwZGF0ZXZvbD8KPiA+Pgo+ID4g
QXMgSSBleHBsYWluZWQgYWJvdmUsIHViaXVwZGF0ZXZvbCBhY3R1YWxseSBwZXJmb3JtcyBhIGZ1
bGwgdm9sdW1lCj4gPiB1cGRhdGUsIHJpZ2h0ID8KPiA+IEkgdGhpbmsgdGhlIHBhcnRpYWwvaW5j
cmVtZW50YWwgdXBkYXRlIGlzIG5vdCBwb3NzaWJsZSB3aXRoIHRoaXMuIE9uY2UKPiA+IHRoZSB1
cGRhdGUgaXMgdHJpZ2dlcmVkIGl0IHNob3VsZCBmaW5pc2ggZnVsbHkuCj4gPiBCdXQgZm9yIE9U
QSB1cGRhdGVzIChEZWx0YS9JbmNyZW1lbnRhbCksIG9ubHkgdGhlIGRlbHRhIGNoYW5nZXMgY2Fu
Cj4gPiBhbHNvIGJlIGFwcGxpZWQuCj4gPiBQbGVhc2UgcmVmZXIgdG8gdGhpcyBbMV0gYWJvdXQg
dXBkYXRlcyBtZWNoYW5pc20uCj4gPiBbMV0gaHR0cHM6Ly9tZWRpdW0uY29tL0B5aWdpdHBpcmls
ZGFrL2FuZHJvaWQtb3RhLXVwZGF0ZS1tZWNoYW5pc20tZWNjOGY2ZjY5ZjcxCj4gPiBbMl0KPiA+
IGh0dHBzOi8vc291cmNlLmFuZHJvaWQuY29tL2RvY3MvY29yZS9vdGEvdG9vbHMjOn46dGV4dD1B
biUyMGluY3JlbWVudGFsJTIwdXBkYXRlJTIwaXMlMjBhbixuZWVkJTIwdG8lMjBpbmNsdWRlJTIw
dW5jaGFuZ2VkJTIwZmlsZXMuCj4gPgo+ID4gT24gb3VyIE5BTkQgdGFyZ2V0IHdlIHN1cHBvcnQg
T1RBIHVwZGF0ZXMsIGluY2x1ZGluZyBpbmNyZW1lbnRhbCBvdGEgdXBkYXRlcy4KPiA+IEJ1dCB3
aXRob3V0IG10ZGJsb2NrIHRoZSBpbmNyZW1lbnRhbCBPVEEgdXBkYXRlIChvbiBBL0Igc3lzdGVt
KSB3aWxsIG5vdCB3b3JrLgo+ID4gVGhpcyBpcyB0aGUgbWFpbiBpc3N1ZS4KPiA+IEZvciBmdWxs
IHVwZGF0ZXMgb24gdWJpIHZvbHVtZXMgd2UgYXJlIGFscmVhZHkgdXNpbmcgdGhlCj4gPiAidWJp
dXBkYXRldm9sIiBtZWNoYW5pc20uCj4KPiBXZWxsLCBmb3IgZHluYW1pYyB2b2x1bWVzIHlvdSBj
YW4gdXNlIHRoZSBVQklfSU9DRUJDSCBpb2N0bCB0byByZXBsYWNlIExFQnMuCj4gU28sIGluY3Jl
bWVudGFsIHVwZGF0ZXMgYXJlIGRvYWJsZSB0b28uCj4KT2ggSSBzZWUuIFRoaXMgc2VlbXMgdXNl
ZnVsLiBJIHdpbGwgdHJ5IGl0IGFuZCBjb25maXJtIGlmIGl0IHdvcmtzIGZvciB1cy4KVGhhbmsg
eW91IHNvIG11Y2ggZm9yIHRoaXMuCgpFdmVuIHRoZSBoZWFkZXIgZmlsZSAoL3Vzci9pbmNsdWRl
L210ZC91YmktdXNlci5oKSBtZW50aW9ucyB0aGVzZSBkZXRhaWxzLgp7e3sKICogQXRvbWljIGxv
Z2ljYWwgZXJhc2VibG9jayBjaGFuZ2UKICogfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KICoKICogQXRvbWljIGxvZ2ljYWwgZXJhc2VibG9jayBjaGFuZ2Ugb3BlcmF0aW9uIGlzIGNh
bGxlZCB1c2luZyB0aGUgJVVCSV9JT0NFQkNICiAqIGlvY3RsIGNvbW1hbmQgb2YgdGhlIGNvcnJl
c3BvbmRpbmcgVUJJIHZvbHVtZSBjaGFyYWN0ZXIgZGV2aWNlLiBBIHBvaW50ZXIgdG8KICogYSAm
c3RydWN0IHViaV9sZWJfY2hhbmdlX3JlcSBvYmplY3QgaGFzIHRvIGJlIHBhc3NlZCB0byB0aGUg
aW9jdGwuIFRoZW4gdGhlCiAqIHVzZXIgaXMgZXhwZWN0ZWQgdG8gd3JpdGUgdGhlIHJlcXVlc3Rl
ZCBhbW91bnQgb2YgYnl0ZXMgKHNpbWlsYXJseSB0byB3aGF0CiAqIHNob3VsZCBiZSBkb25lIGlu
IGNhc2Ugb2YgdGhlICJ2b2x1bWUgdXBkYXRlIiBpb2N0bCkuCi4uLgovKiBBdG9taWMgTEVCIGNo
YW5nZSBjb21tYW5kICovCiNkZWZpbmUgVUJJX0lPQ0VCQ0ggX0lPVyhVQklfVk9MX0lPQ19NQUdJ
QywgMiwgX19zMzIpCgoqIEBsbnVtOiBsb2dpY2FsIGVyYXNlYmxvY2sgbnVtYmVyIHRvIGNoYW5n
ZQpzdHJ1Y3QgdWJpX2xlYl9jaGFuZ2VfcmVxIHsKICAgICAgICBfX3MzMiBsbnVtOwogICAgICAg
IF9fczMyIGJ5dGVzOwogICAgICAgIF9fczggIGR0eXBlOyAvKiBvYnNvbGV0ZSwgZG8gbm90IHVz
ZSEgKi8KICAgICAgICBfX3M4ICBwYWRkaW5nWzddOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkp
OwoKfX19ClRoaXMgcmVxdWlyZXMgdGhlIGxvZ2ljYWwgZXJhc2UtYmxvY2sgbnVtYmVyIHRvIGJl
IGtub3duLgpJIGFtIHdvbmRlcmluZyBob3cgdG8gZ2V0IHRoZSBMRUIgbnVtYmVyIGZyb20gdXNl
ciBzcGFjZS4KSSBuZWVkIHRvIGV4cGxvcmUgZnVydGhlci4uCgpUaGFuayB5b3Ugc28gbXVjaC4u
LgoKUmVnYXJkcywKUGludHUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
