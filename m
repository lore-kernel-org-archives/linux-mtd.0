Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9391ACD5BC7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHFB8dXyoIYoNNVX1916iJkvFTC9Rk3sZVh3N1JXQB8=; b=c4jE+0C5JgLgCi
	CP1UrR5I7QS+jLDWuVE8JLUytC66N/8/kOeVsmFKrEMImw+ddueOo4ruHv9RmnUqy2e2A/7Sdsfgi
	8pCeM6hnEa8w0dJZy9tDRRXY22f8V7AjjcBHOIE5v77/AGeXXOWbpfgs6dDcXciD8m4vhAOklhk0+
	5qlaNeNf6wl2N8Q0Rnpoa5yf54UX8qLgbUS0Xud1DUTjp0X4XqfNHEo4KzcKBnidZMQIa2knIMozL
	kMwmZc5PBrqTVu0XrXDHARWI4t6k6cuwUnEL53b0+5v1728byMi/zZK3qLJaQrPM/OFpsF3uoU2aC
	jEUzfVjbBbMzW2qAL6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smC9G-00000008SMH-2jsC;
	Thu, 05 Sep 2024 13:03:42 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smC9D-00000008SKk-1i6f
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 13:03:41 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2f50966c448so9574431fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2024 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725541417; x=1726146217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Ap3iChcCI6LjI4bbXEj5UiVcIZisPfcA3U2HCE+kE=;
        b=FPiGlvGLxY5tebNFmFkB9a2yPlhIa/yP7OfSOCB1Pn+OJLuKb94196QduzsI8JSd7v
         kNkbYGgFjeQoPVv02Q3CONzObtt82/D/8rp6XDDtQng47XWhralwhqwqxSonESTFiOkY
         5QByc/1aeo0Thv90R/y4/Edl1DaPi84qb2r7xm39VJ3XUAPo8N61uTpDWwP4EP+sEiS0
         eatqI+Q1ELJq6K/592X5dryf4qslVHCiIOUAQzyzLQyWmDzj7VtHcPVWFnqye4ubEU+O
         aeWHsFdV0uRREX2jOVpI3gL6Bjd+F38oq25OV3lcik5ftGexFSMrhWYihyF5G1jxJRoW
         vH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541417; x=1726146217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4Ap3iChcCI6LjI4bbXEj5UiVcIZisPfcA3U2HCE+kE=;
        b=UBfGlESNbw+NElHbMwDlDbeXMeAFuXH+OBH5spq+TSZx6t5CIVipU8pCCs6XCPKQMN
         5hccOQ2Bbq76VqHXTnhutNoWNbHGQugKc3NCyKITZVC3rS+miobSK4DUo4C90ZUDWs2G
         uIkkC91uYhDk7sEjCVMtADaQ/KxfRWyP4aplu+C7n0LeqaCmXT1ekf2U29s6yukF3GkL
         CH5zZ/NcWGt78FLhdoFieZ2uavcV2qmiHZH6Y0CY+lKgEXQ43AuGaaEmnbkWYkVGnv7K
         yi8TzY+uHQR7oPct/aGPmYDuv4R6ByCwqcthqPXgEGKFHyRZSY+vHWBlK3YTbK4egxGz
         JYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjDWwMSq+IApxjx84yZsIA5MYG/J756ZjV5vqWrd1qZmqYYHhwM4EJ8X6bFmDwsjMOU4lksrpzjhU=@lists.infradead.org
X-Gm-Message-State: AOJu0YykIeXK7OYriQWVUKtFc2qHyGatIRaoeKqeVatDhLTA9F4vXntw
	LuCZiUVfBK1WIZIA33Xke23W6dW2O5Tix0a52F94H94N4Dh7+ZgUKf+qQcJszFQ9dW1SzUBAvP/
	oge7Bk0srKzVoMQ1POCUqJ0rB7rc=
X-Google-Smtp-Source: AGHT+IETBLGAu3Qd00jjqcPIw+YbfEw8PL6KVZG3phkN8mEHyaiFDy+b4h0Zi/X597x+B58/kQSA12RjAv0BY7eFUFU=
X-Received: by 2002:a2e:a54b:0:b0:2ef:2b06:b686 with SMTP id
 38308e7fff4ca-2f6103a565bmr183794191fa.17.1725541415766; Thu, 05 Sep 2024
 06:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240905122020.872466-1-ubizjak@gmail.com> <Ztmm00eLBQGtiwRM@smile.fi.intel.com>
In-Reply-To: <Ztmm00eLBQGtiwRM@smile.fi.intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Sep 2024 15:03:24 +0200
Message-ID: <CAFULd4bzyNGcJqeg7w2ZQ0Xmw-HsBhczf8yPna7mSgG4NmdcWw@mail.gmail.com>
Subject: Re: [PATCH 00/18] random: Include <linux/percpu.h> and resolve
 circular include dependency
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Hannes Reinecke <hare@suse.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_060339_509746_A0096958 
X-CRM114-Status: GOOD (  32.70  )
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

T24gVGh1LCBTZXAgNSwgMjAyNCBhdCAyOjQx4oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMDUsIDIw
MjQgYXQgMDI6MTc6MDhQTSArMDIwMCwgVXJvcyBCaXpqYWsgd3JvdGU6Cj4gPiBUaGVyZSB3ZXJl
IHNldmVyYWwgYXR0ZW1wdHMgdG8gcmVzb2x2ZSBjaXJjdWxhciBpbmNsdWRlIGRlcGVuZGVuY3kK
PiA+IGFmdGVyIHRoZSBhZGRpdGlvbiBvZiBwZXJjcHUuaDogMWM5ZGY5MDdkYTgzICgicmFuZG9t
OiBmaXggY2lyY3VsYXIKPiA+IGluY2x1ZGUgZGVwZW5kZW5jeSBvbiBhcm02NCBhZnRlciBhZGRp
dGlvbiBvZiBwZXJjcHUuaCIpLCBjMDg0MmZiYzFiMTgKPiA+ICgicmFuZG9tMzI6IG1vdmUgdGhl
IHBzZXVkby1yYW5kb20gMzItYml0IGRlZmluaXRpb25zIHRvIHByYW5kb20uaCIpIGFuZAo+ID4g
ZmluYWxseSBkOWYyOWRlYjdmZTggKCJwcmFuZG9tOiBSZW1vdmUgdW51c2VkIGluY2x1ZGUiKSB0
aGF0IGNvbXBsZXRlbHkKPiA+IHJlbW92ZXMgaW5jbHVzaW9uIG9mIDxsaW51eC9wZXJjcHUuaD4u
Cj4gPgo+ID4gRHVlIHRvIGxlZ2FjeSByZWFzb25zLCA8bGludXgvcmFuZG9tLmg+IGluY2x1ZGVz
IDxsaW51eC9wcmFuZG9tLmg+LCBidXQKPiA+IHdpdGggdGhlIGNvbW1pdCBlbnRyeSByZW1hcms6
Cj4gPgo+ID4gLS1xdW90ZS0tCj4gPiBBIGZ1cnRoZXIgY2xlYW51cCBzdGVwIHdvdWxkIGJlIHRv
IHJlbW92ZSB0aGlzIGZyb20gPGxpbnV4L3JhbmRvbS5oPgo+ID4gZW50aXJlbHksIGFuZCBtYWtl
IHBlb3BsZSB3aG8gdXNlIHRoZSBwcmFuZG9tIGluZnJhc3RydWN0dXJlIGluY2x1ZGUKPiA+IGp1
c3QgdGhlIG5ldyBoZWFkZXIgZmlsZS4gIFRoYXQncyBhIGJpdCBvZiBhIGNodXJuIHBhdGNoLCBi
dXQgZ3JlcHBpbmcKPiA+IGZvciAicHJhbmRvbV8iIGFuZCAibmV4dF9wc2V1ZG9fcmFuZG9tMzIi
ICJzdHJ1Y3Qgcm5kX3N0YXRlIiBzaG91bGQKPiA+IGNhdGNoIG1vc3QgdXNlcnMuCj4gPgo+ID4g
QnV0IGl0IHR1cm5zIG91dCB0aGF0IHRoYXQgbmljZSBjbGVhbnVwIHN0ZXAgaXMgZmFpcmx5IHBh
aW5mdWwsIGJlY2F1c2UKPiA+IGEgX2xvdF8gb2YgY29kZSBjdXJyZW50bHkgc2VlbXMgdG8gZGVw
ZW5kIG9uIHRoZSBpbXBsaWNpdCBpbmNsdWRlIG9mCj4gPiA8bGludXgvcmFuZG9tLmg+LCB3aGlj
aCBjYW4gY3VycmVudGx5IGNvbWUgaW4gYSBsb3Qgb2Ygd2F5cywgaW5jbHVkaW5nCj4gPiBzdWNo
IGZhaXJseSBjb3JlIGhlYWRmZXJzIGFzIDxsaW51eC9uZXQuaD4uCj4gPgo+ID4gU28gdGhlICJu
aWNlIGNsZWFudXAiIHBhcnQgbWF5IG9yIG1heSBuZXZlciBoYXBwZW4uCj4gPiAtLS9xdW90ZS0t
Cj4gPgo+ID4gX19wZXJjcHUgdGFnIGlzIGN1cnJlbnRseSBkZWZpbmVkIGluIGluY2x1ZGUvbGlu
dXgvY29tcGlsZXJfdHlwZXMuaCwKPiA+IHNvIHRoZXJlIGlzIG5vIGRpcmVjdCBuZWVkIGZvciB0
aGUgaW5jbHVzaW9uIG9mIDxsaW51eC9wZXJjcHUuaD4uCj4gPiBIb3dldmVyLCBpbiBbMV0gd2Ug
d291bGQgbGlrZSB0byByZXB1cnBvc2UgX19wZXJjcHUgdGFnIGFzIGEgbmFtZWQKPiA+IGFkZHJl
c3Mgc3BhY2UgcXVhbGlmaWVyLCB3aGVyZSBfX3BlcmNwdSBtYWNybyB1c2VzIGRlZmluZXMgZnJv
bQo+ID4gPGxpbnV4L3BlcmNwdS5oPi4KPiA+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpcyB0aGUg
Im5pY2UgY2xlYW51cCIgcGFydCwgYW5kIGFsbG93cyB1cyB0byBmaW5hbGx5Cj4gPiBpbmNsdWRl
IDxsaW51eC9wZXJjcHUuaD4gaW4gcHJhbmRvbS5oLgo+ID4KPiA+IFRoZSB3aG9sZSBzZXJpZXMg
d2FzIHRlc3RlZCBieSBjb21waWxpbmcgdGhlIGtlcm5lbCBmb3IgeDg2XzY0IGFsbGNvbmZpZwo+
ID4gYW5kIHNvbWUgcG9wdWxhciBhcmNoaXRlY3R1cmVzLCBuYW1lbHkgYXJtNjQgZGVmY29uZmln
LCBwb3dlcnBjIGRlZmNvbmZpZwo+ID4gYW5kIGxvb25nYXJjaCBkZWZjb25maWcuCj4KPiBPYnZp
b3VzIHF1ZXN0aW9uKHMpIGlzKGFyZSk6Cj4gMSkgaGF2ZSB5b3Ugc2VlbiB0aGUgSW5nbydzIGdp
Z2FudGljIHBhdGNoIHNlcmllcyB0b3dhcmRzIHJlc29sdmluZyBpc3N1ZXMgd2l0aAo+IHRoZSBo
ZWFkZXJzPwo+IDIpIGlmIG5vdCwgcGxlYXNlIGxvb2sgYXQgdGhlIHByZWxpbWluYXJ5IHdvcmsg
YW5kIHRha2Ugc29tZXRoaW5nIGZyb20gdGhlcmUsIEkKPiBiZWxpZXZlIHRoZXJlIGFyZSBtYW55
IHVzZWZ1bCBjaGFuZ2VzIGFscmVhZHkgd2FpdGluZyBmb3IgYSBjb3VwbGUgb2YgeWVhcnMgdG8K
PiBiZSBhcHBsaWVkLgo+Cj4gQmVjYXVzZSBJIGhhdmVuJ3QgZm91bmQgYW55IHJlZmVyZW5jZXMg
bm9yIG1lbnRpb25zIG9mIHRoYXQgaW4gdGhlIGNvdmVyIGxldHRlcgo+IGhlcmUgYW5kIGV4cGxh
bmF0aW9uIHdoeSBpdCB3YXMgbm90IHRha2luZyBpbnRvIGNvbnNpZGVyYXRpb24uCgpJIGFtIGF3
YXJlIG9mIHRoZSBzZXJpZXMsIGJ1dCB0aGUgcGF0Y2ggdGFrZXMgb25seSBhIHNtYWxsIGJpdGUg
b2YgaXQKYW5kIHNwZWNpZmljYWxseSByZXNvbHZlcyB0aGUgaW5jbHVzaW9uIG9mIDxsaW51eC9w
cmFuZG9tLmg+IGZyb20KbGludXgvcmFuZG9tLmguIFRoZSBzZXJpZXMgZml4ZXMgdGhlIG1pc3Np
bmcgaW5jbHVzaW9uIG9mCjxsaW51eC9wcmFuZG9tLmg+IGluIGZpbGVzIHRoYXQgdXNlIHBzZXVk
by1yYW5kb20gZnVuY3Rpb24gYW5kIGl0IHdhcwpub3QgbWVhbnQgdG8gYmUgYSBnZW5lcmFsIGhl
YWRlciBjbGVhbnVwLiBUaGUgZW5kIGdvYWwgaXMgdG8gYWxsb3cgdXMKdG8gaW5jbHVkZSA8bGlu
dXgvcGVyY3B1Lmg+IGluIGxpbnV4L3ByYW5kb20uaCAtIHdoaWNoIHVzZXMgX19wZXJjcHUKdGFn
IHdpdGhvdXQgdGhlIGNvcnJlY3QgaW5jbHVkZS4KClRodXMsIHRoZSBwYXRjaCBzZXJpZXMgaXMg
b25seSB0YW5nZW50aWFsbHkgY29ubmVjdGVkIHRvIEluZ28ncyBwYXRjaCBzZXJpZXMuCgpCZXN0
IHJlZ2FyZHMsClVyb3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
