Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC35CD5BCC
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXY2DEA8Sp++NNwF8oNpKNsnyHcb6okgMcXdaEgmOU8=; b=zv1yncAIWjjfHc
	9SkmgNMr+QUHw5c/1XQ9+98Le3Qg7EzDF1XTDDkoA62s6CKdC+MHrer6DDzPZlkNIU5m0H5DCoLqz
	nixvbj2mQMJhH3mTV1GraWYoiCMj07sn16tg/lDm7/+xrx2KrXmIxKn1UdsMsY6UTua4CWQKvG3SE
	Xxd/oO+YKivl+fVvXV7BvJ4s6nwXdn5or8VTOJwKWTJU9EblSUPjSdUYpALlWfkVF8q651uk4cWzC
	4Zxb/UVStQ2koEuHYs6B4Cc2DBFzt4DMtqz35+uhZdQD4GD16QKtmUAEfcnNu6gnhwhzjsTFI1RYJ
	piHRIythip9FThe4uT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smEZJ-00000008y8u-0w8f;
	Thu, 05 Sep 2024 15:38:45 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smEZ2-00000008y3p-1OJr
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 15:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725550708; x=1757086708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WqFaPHVKKRJUrSjh96WSLvDVpyIouu48maZXtKVDdA8=;
  b=kRxXWoaLkZ+7oM0La0Gpa4XLXTr2HjKsjCDAYauJtKvuf2EdltOOdV9Q
   Da3/iHFH/kDsCoWqet5ZeoflDr8s9I3P+NmDsnOdqRH6NlK7UVpUlpCmO
   0/+0eK0GI0NHt4opBEXBEKjVc48t0+1BqOpCehfwQvUsAneWn+M+LncYn
   VQ4FrkDhjLQKrPRlm53D+EcPswjkWZunKXbU0arbHGAIyWeUYnQ3yS+JU
   reKKk/zRuztGB8pcS+lRUukcW9/WsNrp9fJuYrV9k3Z5xbviE/5jF5UBB
   GD774Ika5KRr/6+n9JGqCKNilJbNX9freFyd3pqvuolCgftXwSaxqeml0
   w==;
X-CSE-ConnectionGUID: OcCRTTPrS/WeHX1t/1Jprg==
X-CSE-MsgGUID: cwUIie+UT0Ch6hOkWTZQ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35634046"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="35634046"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 08:38:24 -0700
X-CSE-ConnectionGUID: u6pWWqheTeempRaYMfBO/g==
X-CSE-MsgGUID: pKR7g3A+S6q/KP0BCfW6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65652927"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 08:38:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smEWm-00000005Rhy-32CS;
	Thu, 05 Sep 2024 18:36:08 +0300
Date: Thu, 5 Sep 2024 18:36:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH 00/18] random: Include <linux/percpu.h> and resolve
 circular include dependency
Message-ID: <ZtnP6CK-Zd8SJAgY@smile.fi.intel.com>
References: <20240905122020.872466-1-ubizjak@gmail.com>
 <Ztmm00eLBQGtiwRM@smile.fi.intel.com>
 <CAFULd4bzyNGcJqeg7w2ZQ0Xmw-HsBhczf8yPna7mSgG4NmdcWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFULd4bzyNGcJqeg7w2ZQ0Xmw-HsBhczf8yPna7mSgG4NmdcWw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_083828_553125_E397DB83 
X-CRM114-Status: GOOD (  37.10  )
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

T24gVGh1LCBTZXAgMDUsIDIwMjQgYXQgMDM6MDM6MjRQTSArMDIwMCwgVXJvcyBCaXpqYWsgd3Jv
dGU6Cj4gT24gVGh1LCBTZXAgNSwgMjAyNCBhdCAyOjQx4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1
LCBTZXAgMDUsIDIwMjQgYXQgMDI6MTc6MDhQTSArMDIwMCwgVXJvcyBCaXpqYWsgd3JvdGU6Cj4g
PiA+IFRoZXJlIHdlcmUgc2V2ZXJhbCBhdHRlbXB0cyB0byByZXNvbHZlIGNpcmN1bGFyIGluY2x1
ZGUgZGVwZW5kZW5jeQo+ID4gPiBhZnRlciB0aGUgYWRkaXRpb24gb2YgcGVyY3B1Lmg6IDFjOWRm
OTA3ZGE4MyAoInJhbmRvbTogZml4IGNpcmN1bGFyCj4gPiA+IGluY2x1ZGUgZGVwZW5kZW5jeSBv
biBhcm02NCBhZnRlciBhZGRpdGlvbiBvZiBwZXJjcHUuaCIpLCBjMDg0MmZiYzFiMTgKPiA+ID4g
KCJyYW5kb20zMjogbW92ZSB0aGUgcHNldWRvLXJhbmRvbSAzMi1iaXQgZGVmaW5pdGlvbnMgdG8g
cHJhbmRvbS5oIikgYW5kCj4gPiA+IGZpbmFsbHkgZDlmMjlkZWI3ZmU4ICgicHJhbmRvbTogUmVt
b3ZlIHVudXNlZCBpbmNsdWRlIikgdGhhdCBjb21wbGV0ZWx5Cj4gPiA+IHJlbW92ZXMgaW5jbHVz
aW9uIG9mIDxsaW51eC9wZXJjcHUuaD4uCj4gPiA+Cj4gPiA+IER1ZSB0byBsZWdhY3kgcmVhc29u
cywgPGxpbnV4L3JhbmRvbS5oPiBpbmNsdWRlcyA8bGludXgvcHJhbmRvbS5oPiwgYnV0Cj4gPiA+
IHdpdGggdGhlIGNvbW1pdCBlbnRyeSByZW1hcms6Cj4gPiA+Cj4gPiA+IC0tcXVvdGUtLQo+ID4g
PiBBIGZ1cnRoZXIgY2xlYW51cCBzdGVwIHdvdWxkIGJlIHRvIHJlbW92ZSB0aGlzIGZyb20gPGxp
bnV4L3JhbmRvbS5oPgo+ID4gPiBlbnRpcmVseSwgYW5kIG1ha2UgcGVvcGxlIHdobyB1c2UgdGhl
IHByYW5kb20gaW5mcmFzdHJ1Y3R1cmUgaW5jbHVkZQo+ID4gPiBqdXN0IHRoZSBuZXcgaGVhZGVy
IGZpbGUuICBUaGF0J3MgYSBiaXQgb2YgYSBjaHVybiBwYXRjaCwgYnV0IGdyZXBwaW5nCj4gPiA+
IGZvciAicHJhbmRvbV8iIGFuZCAibmV4dF9wc2V1ZG9fcmFuZG9tMzIiICJzdHJ1Y3Qgcm5kX3N0
YXRlIiBzaG91bGQKPiA+ID4gY2F0Y2ggbW9zdCB1c2Vycy4KPiA+ID4KPiA+ID4gQnV0IGl0IHR1
cm5zIG91dCB0aGF0IHRoYXQgbmljZSBjbGVhbnVwIHN0ZXAgaXMgZmFpcmx5IHBhaW5mdWwsIGJl
Y2F1c2UKPiA+ID4gYSBfbG90XyBvZiBjb2RlIGN1cnJlbnRseSBzZWVtcyB0byBkZXBlbmQgb24g
dGhlIGltcGxpY2l0IGluY2x1ZGUgb2YKPiA+ID4gPGxpbnV4L3JhbmRvbS5oPiwgd2hpY2ggY2Fu
IGN1cnJlbnRseSBjb21lIGluIGEgbG90IG9mIHdheXMsIGluY2x1ZGluZwo+ID4gPiBzdWNoIGZh
aXJseSBjb3JlIGhlYWRmZXJzIGFzIDxsaW51eC9uZXQuaD4uCj4gPiA+Cj4gPiA+IFNvIHRoZSAi
bmljZSBjbGVhbnVwIiBwYXJ0IG1heSBvciBtYXkgbmV2ZXIgaGFwcGVuLgo+ID4gPiAtLS9xdW90
ZS0tCj4gPiA+Cj4gPiA+IF9fcGVyY3B1IHRhZyBpcyBjdXJyZW50bHkgZGVmaW5lZCBpbiBpbmNs
dWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmgsCj4gPiA+IHNvIHRoZXJlIGlzIG5vIGRpcmVjdCBu
ZWVkIGZvciB0aGUgaW5jbHVzaW9uIG9mIDxsaW51eC9wZXJjcHUuaD4uCj4gPiA+IEhvd2V2ZXIs
IGluIFsxXSB3ZSB3b3VsZCBsaWtlIHRvIHJlcHVycG9zZSBfX3BlcmNwdSB0YWcgYXMgYSBuYW1l
ZAo+ID4gPiBhZGRyZXNzIHNwYWNlIHF1YWxpZmllciwgd2hlcmUgX19wZXJjcHUgbWFjcm8gdXNl
cyBkZWZpbmVzIGZyb20KPiA+ID4gPGxpbnV4L3BlcmNwdS5oPi4KPiA+ID4KPiA+ID4gVGhpcyBw
YXRjaCBzZXJpZXMgaXMgdGhlICJuaWNlIGNsZWFudXAiIHBhcnQsIGFuZCBhbGxvd3MgdXMgdG8g
ZmluYWxseQo+ID4gPiBpbmNsdWRlIDxsaW51eC9wZXJjcHUuaD4gaW4gcHJhbmRvbS5oLgo+ID4g
Pgo+ID4gPiBUaGUgd2hvbGUgc2VyaWVzIHdhcyB0ZXN0ZWQgYnkgY29tcGlsaW5nIHRoZSBrZXJu
ZWwgZm9yIHg4Nl82NCBhbGxjb25maWcKPiA+ID4gYW5kIHNvbWUgcG9wdWxhciBhcmNoaXRlY3R1
cmVzLCBuYW1lbHkgYXJtNjQgZGVmY29uZmlnLCBwb3dlcnBjIGRlZmNvbmZpZwo+ID4gPiBhbmQg
bG9vbmdhcmNoIGRlZmNvbmZpZy4KPiA+Cj4gPiBPYnZpb3VzIHF1ZXN0aW9uKHMpIGlzKGFyZSk6
Cj4gPiAxKSBoYXZlIHlvdSBzZWVuIHRoZSBJbmdvJ3MgZ2lnYW50aWMgcGF0Y2ggc2VyaWVzIHRv
d2FyZHMgcmVzb2x2aW5nIGlzc3VlcyB3aXRoCj4gPiB0aGUgaGVhZGVycz8KPiA+IDIpIGlmIG5v
dCwgcGxlYXNlIGxvb2sgYXQgdGhlIHByZWxpbWluYXJ5IHdvcmsgYW5kIHRha2Ugc29tZXRoaW5n
IGZyb20gdGhlcmUsIEkKPiA+IGJlbGlldmUgdGhlcmUgYXJlIG1hbnkgdXNlZnVsIGNoYW5nZXMg
YWxyZWFkeSB3YWl0aW5nIGZvciBhIGNvdXBsZSBvZiB5ZWFycyB0bwo+ID4gYmUgYXBwbGllZC4K
PiA+Cj4gPiBCZWNhdXNlIEkgaGF2ZW4ndCBmb3VuZCBhbnkgcmVmZXJlbmNlcyBub3IgbWVudGlv
bnMgb2YgdGhhdCBpbiB0aGUgY292ZXIgbGV0dGVyCj4gPiBoZXJlIGFuZCBleHBsYW5hdGlvbiB3
aHkgaXQgd2FzIG5vdCB0YWtpbmcgaW50byBjb25zaWRlcmF0aW9uLgo+IAo+IEkgYW0gYXdhcmUg
b2YgdGhlIHNlcmllcywgYnV0IHRoZSBwYXRjaCB0YWtlcyBvbmx5IGEgc21hbGwgYml0ZSBvZiBp
dAo+IGFuZCBzcGVjaWZpY2FsbHkgcmVzb2x2ZXMgdGhlIGluY2x1c2lvbiBvZiA8bGludXgvcHJh
bmRvbS5oPiBmcm9tCj4gbGludXgvcmFuZG9tLmguIFRoZSBzZXJpZXMgZml4ZXMgdGhlIG1pc3Np
bmcgaW5jbHVzaW9uIG9mCj4gPGxpbnV4L3ByYW5kb20uaD4gaW4gZmlsZXMgdGhhdCB1c2UgcHNl
dWRvLXJhbmRvbSBmdW5jdGlvbiBhbmQgaXQgd2FzCj4gbm90IG1lYW50IHRvIGJlIGEgZ2VuZXJh
bCBoZWFkZXIgY2xlYW51cC4gVGhlIGVuZCBnb2FsIGlzIHRvIGFsbG93IHVzCj4gdG8gaW5jbHVk
ZSA8bGludXgvcGVyY3B1Lmg+IGluIGxpbnV4L3ByYW5kb20uaCAtIHdoaWNoIHVzZXMgX19wZXJj
cHUKPiB0YWcgd2l0aG91dCB0aGUgY29ycmVjdCBpbmNsdWRlLgoKVGhhbmsgeW91IGZvciBlbGFi
b3JhdGlvbiwgaXQncyBhbGwgY2xlYXIgbm93LgoKPiBUaHVzLCB0aGUgcGF0Y2ggc2VyaWVzIGlz
IG9ubHkgdGFuZ2VudGlhbGx5IGNvbm5lY3RlZCB0byBJbmdvJ3MgcGF0Y2ggc2VyaWVzLgoKLS0g
CldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
