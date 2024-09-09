Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E470DECE588
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KE4zqHsIeALYGpGrr5dgu1RWDXao9PW2UA8iNixRl8o=; b=Jk4uKXloZcjq7w
	XkI+1dkemz51MODDBJaTpfgVxgvu4o6xJLsf79oNLdP5K8AMW3p49sibJZuVdRfeUN2Ud0QDoy0i2
	le3xbYJOXg+57PfrcMG9Jm7yqYOkVrY1BTuil5BTLxLWcpxkKrKTNHYG0+pEpCYaUvSmtpQhEBEQo
	BQG3mZ9A/bhdWee8Zd81y7b6E269M/yAxy6vpnGgFHXwavLDLbP1Rh5dEVrXkv4EgfLaHlKFAs7qK
	MjPqYqy3iyN3mfGssGu6OFPuSAT8Nsvz1bIHDJ8OMWDx1Xs5VRNHkpx9j7jor9Pe3QXHRe5pR5ez6
	t8VPlytSgmdJpc7XqfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snk5g-00000003667-3sYB;
	Mon, 09 Sep 2024 19:30:24 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snk5d-0000000364R-2ls2
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 19:30:23 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2f7529203ddso32291061fa.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725910220; x=1726515020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woE07RMIM4YJ88QTc1ZNc52E+GbLSESAkfn/9qs5W1Y=;
        b=SQFkoObw19K1I6UVhQ7yzuIkVSNBs7vWcczuCQx2kr9I90ZJS4FvYZezk6I3yTtNfF
         vJS8aks1XuVx4uA4auxST9emGpnk+hTpCVFI0OgOhZLTKZ0b7rM5sjoAmy460hw5DNpw
         E9LhUvEPE8d329EqSR+0Fp3VnF48TXKUZL0ReoeNUhFE3iRhW/cotlY6WtxhzUpZsj1L
         nmhejsvpSZSxdYPTN0tgWOCFN9MIXg2fhftMjUBRkcfEdNe7qDgsaHY6Vlhj3ELv7uPd
         z0m+hX4rDU4tDYwrGvlyh1WFd5Q1MNWm28PJX7GAsZVd4FwDaaTliO5brKxtxoKpcmf3
         DDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725910220; x=1726515020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woE07RMIM4YJ88QTc1ZNc52E+GbLSESAkfn/9qs5W1Y=;
        b=qPVg+7cPxsWO2EX9Nl8hLD4MLYc6ibrzioDtiJ93IHdObwSFFWNat2SbgXk9j4wjci
         oohmx6NUUffVqQp52bLF8dl7qz+WPZ9cV7xK1TjK8WXBuBoQItwyt71F0SBQTsFvOpfl
         fLdN5gkrtSjQcCbo6mB1bCMNsRGcJZXn7fLH9qmhKrUMIgT0bOXa4kV0Uu+zGQ/r1GmV
         4dJj9nEYU8tREl9oaBWaEkVsstw6/VQ9Xb+HNAuxEkarSdqit7Ilvrb27UkE/8pM0OlW
         TWzTDXRorc1rIz7zdQmhwgpNZSD4PCfL2XvhLMTLBGqbZ6R/uKvqrhJELi+mwmJ4Sjdv
         Xiyw==
X-Forwarded-Encrypted: i=1; AJvYcCUVC/FGn9Ve3I7lkdgmTBV6IyTSsDHMDZYy04jZOio5cXJT40T8JLQrt2sRrdaP6oLVc1a4MXsZW7I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx53mV3S62Pt9Iackz7IxNotqE6w2fJpW7ErRInxaqJ+VjK5jNn
	Bi7sFvLPwgUk3beaWxKDXTyBVBA7Ai7zr1+CGKYmP8YBP3ntQoCjZVMMO9nll1034P2RT6Mqt4M
	dsO/nkwxfHHEE+5LBNt3Tr7edM78=
X-Google-Smtp-Source: AGHT+IHGDlZWsmVxtU6Y46aEXfBA2sgXqI4naIhOyyLQHvnhEyR7+3HqFvBi8W+gcZkb/4A25yABw4d/bXms0qX89pY=
X-Received: by 2002:a05:651c:549:b0:2f7:6277:f2be with SMTP id
 38308e7fff4ca-2f7727190f4mr2037391fa.22.1725910218656; Mon, 09 Sep 2024
 12:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240909075641.258968-1-ubizjak@gmail.com> <Zt8a6_RwLG2pEnZ6@zx2c4.com>
In-Reply-To: <Zt8a6_RwLG2pEnZ6@zx2c4.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 9 Sep 2024 21:30:06 +0200
Message-ID: <CAFULd4ak3n1x0tGrqiNoxvDBRw6AWgchfBO_k4aKps34DomPvA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/19] random: Resolve circular include
 dependency and include <linux/percpu.h>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Hannes Reinecke <hare@suse.de>, 
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_123021_751996_BC9A01EB 
X-CRM114-Status: GOOD (  23.50  )
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

T24gTW9uLCBTZXAgOSwgMjAyNCBhdCA1OjU34oCvUE0gSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNv
bkB6eDJjNC5jb20+IHdyb3RlOgoKPiBPbiBNb24sIFNlcCAwOSwgMjAyNCBhdCAwOTo1Mzo0M0FN
ICswMjAwLCBVcm9zIEJpemphayB3cm90ZToKPiA+IGEpIFN1YnN0aXR1dGVzIHRoZSBpbmNsdXNp
b24gb2YgPGxpbnV4L3JhbmRvbS5oPiB3aXRoIHRoZQo+ID4gaW5jbHVzaW9uIG9mIDxsaW51eC9w
cmFuZG9tLmg+IHdoZXJlIG5lZWRlZCAocGF0Y2hlcyAxIC0gMTcpLgo+ID4KPiA+IGIpIFJlbW92
ZXMgbGVnYWN5IGluY2x1c2lvbiBvZiA8bGludXgvcHJhbmRvbS5oPiBmcm9tCj4gPiA8bGludXgv
cmFuZG9tLmg+IChwYXRjaCAxOCkuCj4gPgo+ID4gYykgSW5jbHVkZXMgPGxpbnV4L3BlcmNwdS5o
PiBpbiA8bGludXgvcHJhbmRvbS5oPiAocGF0Y2ggMTkpLgo+Cj4gVGhhbmtzIGZvciBkb2luZyB0
aGlzLiBUaGF0IHNlZW1zIGxpa2UgYSBmaW5lIGluaXRpYXRpdmUgdG8gbWUuIChJJ20KPiBhbHNv
IGN1cmlvdXMgYWJvdXQgdGhlIGZ1dHVyZSBwZXJjcHUgY2hhbmdlcyB5b3UndmUgZ290IHBsYW5u
ZWQuKQoKQXMgZXhwbGFpbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIsIHJlY2VudCBHQ0NzIGFyZSBh
YmxlIHRvIHRyYWNrCmFkZHJlc3Mgc3BhY2Ugb2YgdmFyaWFibGVzIGluIHBlcmNwdSBhZGRyZXNz
IHNwYWNlIGZyb20gdGhlCmRlY2xhcmF0aW9uIHRvIGl0cyB1c2FnZSBzaXRlLiBUaGVyZSBhcmUg
Y2VydGFpbiBydWxlcyByZWdhcmRpbmcgY2FzdHMKb2YgdmFyaWFibGVzIGFuZCB0aGVpciBwb2lu
dGVycyAod2hlbiB0aGlzIG5hbWVkIGFkZHJlc3Mgc3BhY2UgaXMgbm90CmNvbnNpZGVyZWQgYSBz
dWJzcGFjZSBvZiB0aGUgZ2VuZXJpYyBhZGRyZXNzIHNwYWNlKSwgc28gaXQgaXMgcG9zc2libGUK
dG8gY3JlYXRlIG11Y2ggbW9yZSBlZmZlY3RpdmUgY2hlY2tzIGZvciBjYXN0LWZyb20tYXMgdHlw
ZSBjYXN0cyB0aGFuCndoYXQgc3BhcnNlIGNhbiBhY2hpZXZlLgoKQmVzaWRlcyBHQ0MsIGNsYW5n
IGNhbiBkZWZpbmUgdmFyaW91cyBuYW1lZCBhZGRyZXNzIHNwYWNlIHZpYQphZGRyZXNzX3NwYWNl
IGF0dHJpYnV0ZToKCi0tY3V0IGhlcmUtLQojZGVmaW5lIF9fYXMoTikgX19hdHRyaWJ1dGVfXygo
YWRkcmVzc19zcGFjZShOKSkpCgp2b2lkICpmb28odm9pZCBfX2FzKDEpICp4KSB7IHJldHVybiB4
OyB9ICAgICAgICAgLy8gZXJyb3IKCnZvaWQgKmJhcih2b2lkIF9fYXMoMSkgKngpIHsgcmV0dXJu
ICh2b2lkICopeDsgfSAvLyBmaW5lCi0tY3V0IGhlcmUtLQoKV2hlbiBjb21waWxpbmcgdGhpcywg
dGhlIGNvbXBpbGVyIHJldHVybnM6CgpjbGFuZy1hcy5jOjM6Mzc6IGVycm9yOiByZXR1cm5pbmcg
J19fYXMoMSkgdm9pZCAqJyBmcm9tIGEgZnVuY3Rpb24Kd2l0aCByZXN1bHQgdHlwZSAndm9pZCAq
JyBjaGFuZ2VzIGFkZHJlc3Mgc3BhY2Ugb2YgcG9pbnRlcgoKQWx0aG91Z2ggY2xhbmcgY3VycmVu
dGx5IGVycm9ycyBvdXQgd2hlbiBfX3NlZ19ncyBhbmQgX19zZWdfZnMgbmFtZWQKYWRkcmVzcyBz
cGFjZSBkZXNpZ25hdG9ycyBhcmUgdXNlZCwgd2UgY2FuIGV4cGxvcmUgaXRzIG5hbWVkIGFkZHJl
c3MKc3BhY2VzIGZ1bmN0aW9uYWxpdHkgdG8gaW1wbGVtZW50IHBlcmNwdSBjaGVja3MgZm9yIGFs
bCB0YXJnZXRzLiBUaGUKcGVyY3B1IGFkZHJlc3Mgc3BhY2UgY2hlY2tzIHBhdGNoc2V0LCByZWZl
cnJlZCB0byBpbiB0aGUgY292ZXIgbGV0dGVyLAphbHNvIHN1cHBvcnRzIHRoaXMgZnVuY3Rpb25h
bGl0eSB3aGVuIHBlcl9jcHVfcXVhbCBpcyBkZWZpbmVkIHRvCl9fYXR0cmlidXRlX18oKGFkZHJl
c3Nfc3BhY2UoTikpKS4KClBlcmhhcHMgd2UgY2FuIHVzZSBkaWZmZXJlbnQgYWRkcmVzcyBzcGFj
ZXMgdG8gYWxzbyBoYW5kbGUgX191c2VyLApfX2lvbWVtIGFuZCBfX3JjdSBhZGRyZXNzIHNwYWNl
cy4gVGhpcyB3YXkgdGhlIGNvbXBpbGVyIHdpbGwgYmUgYWJsZQp0byBoYW5kbGUgYWRkcmVzcyBz
cGFjZSBjaGVja3MgaW5zdGVhZCBvZiBzcGFyc2UuCgo+IFRyZWUtd2lzZSwgd2VyZSB5b3UgZXhw
ZWN0aW5nIG1lIHRvIHRha2UgdGhpcyB0aHJvdWdoIHJhbmRvbS5naXQ/IEFuZCBpZgo+IHNvLCB3
aGF0IHRpbWVmcmFtZSBkaWQgeW91IGhhdmUgaW4gbWluZD8gRm9yIDYuMTIgbmV4dCB3ZWVrIChj
YW4geW91Cj4gcG9rZSBmb2xrcyBmb3IgYWNrcyBpbiB0aW1lPyksIG9yIHB1bnQgaXQgZm9yIDYu
MTM/IE9yIGRpZCB5b3UgaGF2ZSBhCj4gZGlmZmVyZW50IHRyZWUgaW4gbWluZCBmb3IgdHJlZXdp
ZGUgY2hhbmdlcyAoaW4gd2hpY2ggY2FzZSwgSSdsbCBzZW5kCj4geW91IGFuIGFjayBmb3IgdGhl
IFtwXXJhbmRvbS5oIGNoYW5nZXMpLgoKSSB0aGluayB0aGF0IHRoZSBiZXN0IGFwcHJvYWNoIGlz
IHRvIHRhcmdldCB0aGlzIHBhdGNoc2V0IGZvciBsaW51eAo2LjEzIHZpYSByYW5kb20uZ2l0IHRy
ZWUuIEkgd2lsbCBwcmVwYXJlIGEgdjMgYWZ0ZXIgNi4xMnJjMSwgc28gd2hlbgpjb21taXR0ZWQg
dG8gcmFuZG9tLmdpdCwgdGhlIHBhdGNoc2V0IHdpbGwgYmUgYWJsZSB0byBzcGVuZCBzb21lIHRp
bWUKaW4gbGludXgtbmV4dC4gVGhpcyB3YXksIHRoZXJlIHdpbGwgYmUgcGxlbnR5IG9mIHRpbWUg
Zm9yIENJIHJvYm90cyB0bwpkbyBhZGRpdGlvbmFsIGNoZWNrcyBhbHNvIGZvciBzb21lIGxlc3Mg
cG9wdWxhciB0YXJnZXRzIChhbHRob3VnaAppbmRpdmlkdWFsIHBhdGNoZXMgYXJlIGRlYWQgc2lt
cGxlLCByZW1vdmluZyB0aGVzZSBraW5kcyBvZiAibGVnYWN5IgppbmNsdWRlcyBjYW4gYmUgdHJp
Y2t5KSwgYW5kIEkgd2lsbCBhbHNvIGJlIGFibGUgdG8gY29sbGVjdCBBY2tlZC1ieTpzCmluIHRo
ZSBtZWFudGltZS4KCldoaWxlIHRoZSBwYXRjaHNldCBpcyBhbiBpbXByb3ZlbWVudCBieSBpdHNl
bGYsIGl0cyBpbmNsdXNpb24gaXMgbm90CnRpbWUgc2Vuc2l0aXZlLiBUaGUgZm9sbG93IHVwIHBl
cmNwdSBuYW1lZCBhZGRyZXNzIGNoZWNraW5nCmZ1bmN0aW9uYWxpdHkgcmVxdWlyZXMgYSB2ZXJ5
IHJlY2VudCBmZWF0dXJlIChfX3R5cGVvZl91bnF1YWxfXwprZXl3b3JkKSwgd2hpY2ggaXMgb25s
eSBzdXBwb3J0ZWQgaW4gcmVjZW50IGNvbXBpbGVycyAoZ2NjLTE0IGFuZApjbGFuZy0yMCkuIEJl
c2lkZXMgY29tcGlsZXIgc3VwcG9ydCwgc3BhcnNlIGRvZXNuJ3Qga25vdyBhYm91dApfX3R5cGVv
Zl91bnF1YWxfXywgcmVzdWx0aW5nIGluIGJyb2tlbiB0eXBlIHRyYWNpbmcgYW5kIGh1bmRyZWRz
IG9mCnNwYXJzZSBlcnJvcnMgd2l0aCBDPTEgZHVlIHRvIHVua25vd24ga2V5d29yZC4KClNvLCBJ
IHRoaW5rIHdlIGFyZSBub3QgaW4gYSBodXJyeSBhbmQgY2FuIHRha2UgdGhlIHNsb3cgYW5kIHNh
ZmUgcGF0aC4KClRoYW5rcyBhbmQgYmVzdCByZWdhcmRzLApVcm9zLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
