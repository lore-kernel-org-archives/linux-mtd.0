Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BA6C433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Oct 2022 21:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ts5g3uYLV3pEwqH2hpo+f4Y6abid2AaFLT+yT7xJXn8=; b=oVZE+WqlYG9hud
	/XOKsiTQWM4RANVNJjYi6/z59XAA8jAn0FUaeBs9a3cYIez+5cRXsLtObblAYtqauQ+ZNRy1myTN8
	JFUlUCVwW9tn677JAMq5VUimUuarxiqrC9gGQSZw8gsm3IknPKJRy+M63XxQmbCgksWF8R48zGzZo
	cIxZ0cQ4YfkXLgcALCaTISK/XSsDp+9T1zbTeMPaezcmfCBU+L1G+L7Z8mj5BECizp0oicwzVu9t9
	wbS5EKYv/xp/AidlhQDveGCAF/xE5I30vwQH1bmS/xvuJSiCMY+FClR8aCVPhbEvwXj6fnWw02hEg
	dhDqKCbK2zfwWIJRePtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohHai-00EIHD-J0; Sat, 08 Oct 2022 21:42:40 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohHad-00EIDy-BB; Sat, 08 Oct 2022 21:42:37 +0000
Received: by mail-qk1-x733.google.com with SMTP id s7so883583qkj.1;
        Sat, 08 Oct 2022 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XB90Z1qj3kPK5TTwJuNvzg1Gu7i5Rnz3wWrq9Xc3CzQ=;
        b=EumsjgKwMc2Jw8Mczz4R6dcA2SGR+dlJiih8Ckk15eXQbl1ssNNcUUrPo+6xLg3PJJ
         ACJZlZtsMQ8qHF+g94jmQvqwnd0JN02OtmaV0630S04pQ33UTiRtB3d/9RZxV3IEWRUS
         2r7jZGZp8PRabENWrLu/RcNXt+h8W/EQbCXY+rIwGHkU8CMyznzvzkw9HGkZzTxMPx8w
         xr6afYXFnKmA95gCiWV/Ff4HwGyaoBIjl31rvLZlakhTDvtM9Lwa0DyWxf0sryHaK1o0
         LvM2pyhtabu/3Ucoe1BChll32HfoeeOvRbBxpmidXxDJ1YSjQ/R5moFvf8yAnsYhmD4z
         nBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XB90Z1qj3kPK5TTwJuNvzg1Gu7i5Rnz3wWrq9Xc3CzQ=;
        b=m7CqeK55JvyJOHi3ssRwv8ATbGGKZNuYOoPQb30RjNKsj+eidIthzl3cHbmLUo8iD3
         JLbfgseZU3BUq2X5inwMk4f0kdL4oGxYTY/KK7TNjw9xJE1+KZXldrSWmkyPmxIhwo5s
         GWCXD3cMmO3JOZa94i8YqJcoaF7jQvj0TxRO5TkEIA1CaSdC5FpDMcsbipvHLYtFOscI
         bfHkvN3RyYqxMeGKyPAd3iR/tGKibEVgEscDagrllFg/n37Lo9+Lzc+1H2vkW5Xewzhf
         GXResUpuJ1/mET07UJpAda6GSjlCobmiQMC3s37sbcYfP940eVOWnu/OXMy1xvFnVIM6
         eRmA==
X-Gm-Message-State: ACrzQf2lQ3Ghcq51mmmQar7A3OZG64eAwv/cSu/uADOTE83LyPyBm/La
	57kwImdQ1mM5n7e0AKLgILg=
X-Google-Smtp-Source: AMsMyM7nAvlv/cx8tIjuG0BzVtQBP7E1oOPDn/AxmQr3oNkBQsYkcM4WMSw6/AtojLZMWFu7HL2rZw==
X-Received: by 2002:a05:620a:46a4:b0:6ce:c4af:5a54 with SMTP id bq36-20020a05620a46a400b006cec4af5a54mr8239989qkb.377.1665265351668;
        Sat, 08 Oct 2022 14:42:31 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:2270:4fea:6b67:9485:addd])
        by smtp.gmail.com with ESMTPSA id j1-20020a05620a410100b006cfaee39ccesm5821626qko.114.2022.10.08.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 14:42:31 -0700 (PDT)
Date: Sat, 8 Oct 2022 14:42:30 -0700
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	Andreas Noever <andreas.noever@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Christoph Hellwig <hch@lst.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Airlie <airlied@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Huacai Chen <chenhuacai@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jakub Kicinski <kuba@kernel.org>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Jan Kara <jack@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	KP Singh <kpsingh@kernel.org>, Kees Cook <keescook@chromium.org>,
	Marco Elver <elver@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 0/7] treewide cleanup of random integer usage
Message-ID: <Y0HuxsLysThhsaTl@yury-laptop>
References: <20221008055359.286426-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221008055359.286426-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_144235_436211_6B62EABF 
X-CRM114-Status: GOOD (  32.92  )
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

T24gRnJpLCBPY3QgMDcsIDIwMjIgYXQgMTE6NTM6NTJQTSAtMDYwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IENoYW5nZXMgdjQtPnY1Ogo+IC0gQ29jY2luZWxsZSBpcyBub3cgdXNlZCBm
b3IgYXMgbXVjaCBtZWNoYW5pY2FsIGFzcGVjdHMgYXMgcG9zc2libGUsCj4gICB3aXRoIG1lY2hh
bmljYWwgcGFydHMgc3BsaXQgb2ZmIGZyb20gbm9uLW1lY2hhbmljYWwgcGFydHMuIFRoaXMgc2hv
dWxkCj4gICBkcmFzdGljYWxseSByZWR1Y2UgdGhlIGFtb3VudCBvZiBjb2RlIHRoYXQgbmVlZHMg
dG8gYmUgcmV2aWV3ZWQKPiAgIGNhcmVmdWxseS4gRWFjaCBjb21taXQgbWVudGlvbnMgbm93IGlm
IGl0IHdhcyBkb25lIGJ5IGhhbmQgb3IgaXMKPiAgIG1lY2hhbmljYWwuCj4gCj4gSGkgZm9sa3Ms
Cj4gCj4gVGhpcyBpcyBhIGZpdmUgcGFydCB0cmVld2lkZSBjbGVhbnVwIG9mIHJhbmRvbSBpbnRl
Z2VyIGhhbmRsaW5nLiBUaGUKPiBydWxlcyBmb3IgcmFuZG9tIGludGVnZXJzIGFyZToKPiAKPiAt
IElmIHlvdSB3YW50IGEgc2VjdXJlIG9yIGFuIGluc2VjdXJlIHJhbmRvbSB1NjQsIHVzZSBnZXRf
cmFuZG9tX3U2NCgpLgo+IC0gSWYgeW91IHdhbnQgYSBzZWN1cmUgb3IgYW4gaW5zZWN1cmUgcmFu
ZG9tIHUzMiwgdXNlIGdldF9yYW5kb21fdTMyKCkuCj4gICAqIFRoZSBvbGQgZnVuY3Rpb24gcHJh
bmRvbV91MzIoKSBoYXMgYmVlbiBkZXByZWNhdGVkIGZvciBhIHdoaWxlIG5vdwo+ICAgICBhbmQg
aXMganVzdCBhIHdyYXBwZXIgYXJvdW5kIGdldF9yYW5kb21fdTMyKCkuIFNhbWUgZm9yCj4gICAg
IGdldF9yYW5kb21faW50KCkuCj4gLSBJZiB5b3Ugd2FudCBhIHNlY3VyZSBvciBhbiBpbnNlY3Vy
ZSByYW5kb20gdTE2LCB1c2UgZ2V0X3JhbmRvbV91MTYoKS4KPiAtIElmIHlvdSB3YW50IGEgc2Vj
dXJlIG9yIGFuIGluc2VjdXJlIHJhbmRvbSB1OCwgdXNlIGdldF9yYW5kb21fdTgoKS4KPiAtIElm
IHlvdSB3YW50IHNlY3VyZSBvciBpbnNlY3VyZSByYW5kb20gYnl0ZXMsIHVzZSBnZXRfcmFuZG9t
X2J5dGVzKCkuCj4gICAqIFRoZSBvbGQgZnVuY3Rpb24gcHJhbmRvbV9ieXRlcygpIGhhcyBiZWVu
IGRlcHJlY2F0ZWQgZm9yIGEgd2hpbGUgbm93Cj4gICAgIGFuZCBoYXMgbG9uZyBiZWVuIGEgd3Jh
cHBlciBhcm91bmQgZ2V0X3JhbmRvbV9ieXRlcygpLgo+IC0gSWYgeW91IHdhbnQgYSBub24tdW5p
Zm9ybSByYW5kb20gdTMyLCB1MTYsIG9yIHU4IGJvdW5kZWQgYnkgYSBjZXJ0YWluCj4gICBvcGVu
IGludGVydmFsIG1heGltdW0sIHVzZSBwcmFuZG9tX3UzMl9tYXgoKS4KPiAgICogSSBzYXkgIm5v
bi11bmlmb3JtIiwgYmVjYXVzZSBpdCBkb2Vzbid0IGRvIGFueSByZWplY3Rpb24gc2FtcGxpbmcg
b3IKPiAgICAgZGl2aXNpb25zLiBIZW5jZSwgaXQgc3RheXMgd2l0aGluIHRoZSBwcmFuZG9tXyog
bmFtZXNwYWNlLgo+IAo+IFRoZXNlIHJ1bGVzIG91Z2h0IHRvIGJlIGFwcGxpZWQgdW5pZm9ybWx5
LCBzbyB0aGF0IHdlIGNhbiBjbGVhbiB1cCB0aGUKPiBkZXByZWNhdGVkIGZ1bmN0aW9ucywgYW5k
IGVhcm4gdGhlIGJlbmVmaXRzIG9mIHVzaW5nIHRoZSBtb2Rlcm4KPiBmdW5jdGlvbnMuIEluIHBh
cnRpY3VsYXIsIGluIGFkZGl0aW9uIHRvIHRoZSBib3Jpbmcgc3Vic3RpdHV0aW9ucywgdGhpcwo+
IHBhdGNoc2V0IGFjY29tcGxpc2hlcyBhIGZldyBuaWNlIGVmZmVjdHM6Cj4gCj4gLSBCeSB1c2lu
ZyBwcmFuZG9tX3UzMl9tYXgoKSB3aXRoIGFuIHVwcGVyLWJvdW5kIHRoYXQgdGhlIGNvbXBpbGVy
IGNhbgo+ICAgcHJvdmUgYXQgY29tcGlsZS10aW1lIGlzIOKJpDY1NTM2IG9yIOKJpDI1NiwgaW50
ZXJuYWxseSBnZXRfcmFuZG9tX3UxNigpCj4gICBvciBnZXRfcmFuZG9tX3U4KCkgaXMgdXNlZCwg
d2hpY2ggd2FzdGVzIGZld2VyIGJhdGNoZWQgcmFuZG9tIGJ5dGVzLAo+ICAgYW5kIGhlbmNlIGhh
cyBoaWdoZXIgdGhyb3VnaHB1dC4KPiAKPiAtIEJ5IHVzaW5nIHByYW5kb21fdTMyX21heCgpIGlu
c3RlYWQgb2YgJSwgd2hlbiB0aGUgdXBwZXItYm91bmQgaXMgbm90IGEKPiAgIGNvbnN0YW50LCBk
aXZpc2lvbiBpcyBzdGlsbCBhdm9pZGVkLCBiZWNhdXNlIHByYW5kb21fdTMyX21heCgpIHVzZXMK
PiAgIGEgZmFzdGVyIG11bHRpcGxpY2F0aW9uLWJhc2VkIHRyaWNrIGluc3RlYWQuCj4gCj4gLSBC
eSB1c2luZyBnZXRfcmFuZG9tX3UxNigpIG9yIGdldF9yYW5kb21fdTgoKSBpbiBjYXNlcyB3aGVy
ZSB0aGUgcmV0dXJuCj4gICB2YWx1ZSBpcyBpbnRlbmRlZCB0byBpbmRlZWQgYmUgYSB1MTYgb3Ig
YSB1OCwgd2Ugd2FzdGUgZmV3ZXIgYmF0Y2hlZAo+ICAgcmFuZG9tIGJ5dGVzLCBhbmQgaGVuY2Ug
aGF2ZSBoaWdoZXIgdGhyb3VnaHB1dC4KPiAKPiBTbywgYmFzZWQgb24gdGhvc2UgcnVsZXMgYW5k
IGJlbmVmaXRzIGZyb20gZm9sbG93aW5nIHRoZW0sIHRoaXMgcGF0Y2hzZXQKPiBicmVha3MgZG93
biBpbnRvIHRoZSBmb2xsb3dpbmcgZml2ZSBzdGVwczoKPiAKPiAxKSBSZXBsYWNlIGBwcmFuZG9t
X3UzMigpICUgbWF4YCBhbmQgdmFyaWFudHMgdGhlcmVvZiB3aXRoCj4gICAgcHJhbmRvbV91MzJf
bWF4KG1heCkuCj4gCj4gICAgKiBQYXJ0IDEgaXMgZG9uZSB3aXRoIENvY2NpbmVsbGUuIFBhcnQg
MiBpcyBkb25lIGJ5IGhhbmQuCj4gCj4gMikgUmVwbGFjZSBgKHR5cGUpZ2V0X3JhbmRvbV91MzIo
KWAgYW5kIHZhcmlhbnRzIHRoZXJlb2Ygd2l0aAo+ICAgIGdldF9yYW5kb21fdTE2KCkgb3IgZ2V0
X3JhbmRvbV91OCgpLiBJIHRvb2sgdGhlIHBhaW5zIHRvIGFjdHVhbGx5Cj4gICAgbG9vayBhbmQg
c2VlIHdoYXQgZXZlcnkgbHZhbHVlIHR5cGUgd2FzIGFjcm9zcyB0aGUgZW50aXJlIHRyZWUuCj4g
Cj4gICAgKiBQYXJ0IDEgaXMgZG9uZSB3aXRoIENvY2NpbmVsbGUuIFBhcnQgMiBpcyBkb25lIGJ5
IGhhbmQuCj4gCj4gMykgUmVwbGFjZSByZW1haW5pbmcgZGVwcmVjYXRlZCB1c2VzIG9mIHByYW5k
b21fdTMyKCkgYW5kCj4gICAgZ2V0X3JhbmRvbV9pbnQoKSB3aXRoIGdldF9yYW5kb21fdTMyKCku
IAo+IAo+ICAgICogQSBib3Jpbmcgc2VhcmNoIGFuZCByZXBsYWNlIG9wZXJhdGlvbi4KPiAKPiA0
KSBSZXBsYWNlIHJlbWFpbmluZyBkZXByZWNhdGVkIHVzZXMgb2YgcHJhbmRvbV9ieXRlcygpIHdp
dGgKPiAgICBnZXRfcmFuZG9tX2J5dGVzKCkuCj4gCj4gICAgKiBBIGJvcmluZyBzZWFyY2ggYW5k
IHJlcGxhY2Ugb3BlcmF0aW9uLgo+IAo+IDUpIFJlbW92ZSB0aGUgZGVwcmVjYXRlZCBhbmQgbm93
LXVudXNlZCBwcmFuZG9tX3UzMigpIGFuZAo+ICAgIHByYW5kb21fYnl0ZXMoKSBpbmxpbmUgd3Jh
cHBlciBmdW5jdGlvbnMuCj4gCj4gICAgKiBKdXN0IGRlbGV0aW5nIGNvZGUgYW5kIHVwZGF0aW5n
IGNvbW1lbnRzLgo+IAo+IEkgd2FzIHRoaW5raW5nIG9mIHRha2luZyB0aGlzIHRocm91Z2ggbXkg
cmFuZG9tLmdpdCB0cmVlIChvbiB3aGljaCB0aGlzCj4gc2VyaWVzIGlzIGN1cnJlbnRseSBiYXNl
ZCkgYW5kIHN1Ym1pdHRpbmcgaXQgbmVhciB0aGUgZW5kIG9mIHRoZSBtZXJnZQo+IHdpbmRvdywg
b3Igd2FpdGluZyBmb3IgdGhlIHZlcnkgZW5kIG9mIHRoZSA2LjEgY3ljbGUgd2hlbiB0aGVyZSB3
aWxsIGJlCj4gdGhlIGZld2VzdCBuZXcgcGF0Y2hlcyBicmV3aW5nLiBJZiBzb21lYm9keSB3aXRo
IHNvbWUgdHJlZXdpZGUtY2xlYW51cAo+IGV4cGVyaWVuY2UgbWlnaHQgc2hhcmUgc29tZSB3aXNk
b20gYWJvdXQgd2hhdCB0aGUgYmVzdCB0aW1pbmcgdXN1YWxseQo+IHdpbmRzIHVwIGJlaW5nLCBJ
J20gYWxsIGVhcnMuCj4gCj4gUGxlYXNlIHRha2UgYSBsb29rISBUaGUgbnVtYmVyIG9mIGxpbmVz
IHRvdWNoZWQgaXMgcXVpdGUgc21hbGwsIHNvIHRoaXMKPiBzaG91bGQgYmUgcmV2aWV3YWJsZSwg
YW5kIGFzIG11Y2ggYXMgaXMgcG9zc2libGUgaGFzIGJlZW4gcHVzaGVkIGludG8KPiBDb2NjaW5l
bGxlIHNjcmlwdHMuCgpGb3IgdGhlIHNlcmllczoKUmV2aWV3ZWQtYnk6IFl1cnkgTm9yb3YgPHl1
cnkubm9yb3ZAZ21haWwuY29tPgoKQWx0aG91Z2gsIGxvb2tpbmcgYXQgaXQsIEkgaGF2ZSBhIGZl
ZWxpbmcgdGhhdCBrZXJuZWwgbmVlZHMgdG8gZHJvcCBhbGwKZml4ZWQtc2l6ZSByYW5kb20gQVBJ
cyBsaWtlIGdldF9yYW5kb21fdVhYKCkgb3IgZ2V0X3JhbmRvbV9pbnQoKSwgYmVjYXVzZQpwZW9w
bGUgd2lsbCBjb250aW51ZSB1c2luZyB0aGUgJ2dldF9yYW5kb21faW50KCkgJSBudW0nIGNhcmVs
ZXNzbHkuCgpUaGFua3MsCll1cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
