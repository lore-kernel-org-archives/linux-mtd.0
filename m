Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E23CE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K16ZmMFtEW8j07ZM2LWh7gFfa7sPQTGKElMjwgZl96Q=; b=p9mDelHIwcFIxI
	benGZ0zJ01/F8N3sDlolWWNY6T+IPkbZfINNqw7gelkUKjPyZyckko6OmxXZ/k0asXJepndl5tjun
	RV3jHPoEy4ZEz5Spd9i2rs7tZyrZnpzwv9GmZ5mU9LED+n2NAGaF+fRysV4ufvA1UhrCoJxWUm0rH
	5Kwpgk5O5lnHuZk0abffPq6z2GKet8150vCocGnPfJt46oQISojGQi+uOIXn6xrul3gz0FxtMxhhB
	wK25xC7durUGJ0YtuXHuje1A/O3EZD3bpqJg1bb8eoaTXS3ykDbLV0ioOAgnDFDirzgGtvxoNx8Gl
	Up8UfDvWlwuxVQxpUBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfof-00DX8K-1u;
	Mon, 25 Sep 2023 07:15:37 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfob-00DX7F-2Q;
	Mon, 25 Sep 2023 07:15:35 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59eb8ec5e20so68867707b3.3;
        Mon, 25 Sep 2023 00:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695626131; x=1696230931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUKabpGVYgW6P+Y98WJL/wVs6f3BlyZwdnvjcrlU8F0=;
        b=oUOmAJYp5haYRcVTcjBUS6yZAokC1r2jVbNirqdyMBee0nZHqpT+pTXRvP/ugei7im
         pKOKQ/sfIxaetADjck9PpOjNvXNRVeQfhB0bacyYAuMg2APPuZf8OU7+ppxncC5cdHxv
         tfNlGYujK/7TrYvt2dk+crutfjpFNNdoXWFaw9XdRZekjmy1R6HINssKLXpf0PGAEapC
         Bm1eH5uy32nVKJceNYhDLVeNXz0ielRZmS7/9N8SR1EJU3VHAOfDpSYhGPC+eHLC9w3z
         XptmYLp1UWOiOYV3paL4UzhW4ZDX+WvNFoyHfvS3pO2bn0tCe6Kalv0Mhalcl/sfB6VN
         7P1w==
X-Gm-Message-State: AOJu0Yx5w6MCNcbldRFa4ILwYIzliZZsXDdY3beMHrTvXqjP3362TbyA
	ChlbyK5A3My7EjZPw7rkzdpYE7ImF7HUaw==
X-Google-Smtp-Source: AGHT+IEG1JFrV5PXl9PVuoOgFlaW4bTtW64mReKAZeEXvlS2UtLy2krq5jqhf9mFTvech7IswjOsEg==
X-Received: by 2002:a05:690c:2c8d:b0:59f:b0d9:5df2 with SMTP id ep13-20020a05690c2c8d00b0059fb0d95df2mr625251ywb.0.1695626131396;
        Mon, 25 Sep 2023 00:15:31 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id eh15-20020a05690c298f00b005773afca47bsm512455ywb.27.2023.09.25.00.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:15:29 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59c26aa19b7so68727667b3.2;
        Mon, 25 Sep 2023 00:15:29 -0700 (PDT)
X-Received: by 2002:a81:9341:0:b0:569:e7cb:cd4e with SMTP id
 k62-20020a819341000000b00569e7cbcd4emr6125854ywg.48.1695626129605; Mon, 25
 Sep 2023 00:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693409184.git.geert+renesas@glider.be>
In-Reply-To: <cover.1693409184.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 09:15:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvX9F2-Bkwkw0ihTxfuQ3C2hHK3sQTjpqMq07w2f84aw@mail.gmail.com>
Message-ID: <CAMuHMdVvX9F2-Bkwkw0ihTxfuQ3C2hHK3sQTjpqMq07w2f84aw@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/4] ARM: shmobile: Reserve boot area when SMP is enabled
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_001533_808713_435C5B2D 
X-CRM114-Status: GOOD (  42.37  )
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

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMToxN+KAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+IE9uIFJlbmVzYXMgQVJNIFNvQ3MgcHJlZGF0
aW5nIFItQ2FyIEdlbjMsIENQVSBjb3JlIGJyaW5ndXAgZG9lcyBub3QgdXNlCj4gYSBoYXJkd2Fy
ZSByZWdpc3RlciB0byBwcm9ncmFtIHRoZSBDUFUgYm9vdCBhZGRyZXNzIGRpcmVjdGx5LiAgSW5z
dGVhZCwKPiBpdCB1c2VzIGEgc2V0IG9mIHJlZ2lzdGVycyAodGh1cyBub3QgaW52b2x2aW5nIHRo
ZSBNTVUpIHRvIHJlbWFwIGFueSBDUFUKPiBhY2Nlc3MgdG8gdGhlIHBhZ2UocykgYXQgcGh5c2lj
YWwgYWRkcmVzcyB6ZXJvIHRvIHRoZSBzcGVjaWZpZWQgYWRkcmVzcwo+IGJsb2NrIGNvbnRhaW5p
bmcgdGhlIENQVSBjb3JlIHN0YXJ0dXAgY29kZS4gIHRoZSBNTVUuICBIZW5jZSB3aGVuIHRoaXMK
PiBpcyBlbmFibGVkLCBhbnkgZGV2aWNlIHJlc2lkaW5nIGluIHRoaXMgbG93IHBhcnQgb2YgcGh5
c2ljYWwgYWRkcmVzcwo+IHNwYWNlIGNhbm5vdCBiZSBhY2Nlc3NlZC4gIE9uIHNvbWUgYm9hcmRz
LCBhIENGSSBGTEFTSCBsaXZlcyB0aGVyZS4KPgo+IEhlbmNlIHRoaXMgY2F1c2VzIGNvbmZsaWN0
cyBiZXR3ZWVuIENQVSBvbmxpbmluZyBhbmQgRkxBU0ggb3BlcmF0aW9uOgo+ICAgLSBSZWFkaW5n
IHRoZSBmaXJzdCBwYWdlKHMpIG9mIEZMQVNIIHJldHVybnMgdGhlIENQVSBzdGFydHVwIGNvZGUK
PiAgICAgaW5zdGVhZCBvZiB0aGUgRkxBU0ggY29udGVudHMsCj4gICAtIENGSSBGTEFTSCBwcm9i
aW5nIGZhaWxzLCBhcyBpdCBvcGVyYXRlcyBvbiB0aGUgUkFNIHRoYXQgY29udGFpbnMgdGhlCj4g
ICAgIENQVSBzdGFydHVwIGNvZGUuICBNb3Jlb3ZlciwgYXMgdGhpcyBwcm9iaW5nIGludm9sdmVz
IHdyaXRlcywgaXQKPiAgICAgY29ycnVwdHMgdGhlIENQVSBzdGFydHVwIGNvZGUsIGNhdXNpbmcg
YW55IHN1YnNlcXVlbnQgQ1BVIG9ubGluaW5nCj4gICAgIHRvIGZhaWwuCj4KPiBDUFUgY29yZXMg
Y2FuIGJlIG9ubGluZWQgaW4gMyBwbGFjZXM6Cj4gICBBLiBTZWNvbmRhcnkgY29yZSBicmluZ3Vw
LCBkdXJpbmcgZWFybHkgYm9vdCAoRkxBU0ggbm90IHlldCBpbiB1c2UpLAo+ICAgQi4gRW5hYmxp
bmcgc2Vjb25kYXJ5IENQVXMgd2hlbiByZXN1bWluZyBhZnRlciBzMnJhbSAoRkxBU0ggbm90IGlu
Cj4gICAgICB1c2UpLAo+ICAgQy4gTWFudWFsIENQVSBob3RwbHVnIChhdCBhbnkgdGltZSwgRkxB
U0ggbWF5IG9yIG1heSBub3QgYmUgaW4gdXNlKS4KPgo+IFBvc3NpYmxlIHNvbHV0aW9uczoKPiAg
IDEuIERpc2FibGUgRkxBU0ggaW4gU01QIGluaXRpYWxpemF0aW9uOgo+ICAgICAgICAtIFNpbXBs
ZSB0byBpbXBsZW1lbnQsCj4gICAgICAgIC0gQWNjZXNzaW5nIHRoZSBGTEFTSCBmcm9tIExpbnV4
IG5lZWRzIGEgcmVib290IHdpdGggbm9zbXAuCj4KPiAgIDIuIERpc2FibGUgU01QIHdoZW4gRkxB
U0hAMCBpcyB1c2VkOgo+ICAgICAgICAtIEhvdyB0byBjaGVjayBpZiBAMCBpcyBhY3R1YWxseSB1
c2VkL21hcHBlZD8KPiAgICAgICAgICBTTVAgaXMgaW5pdGlhbGl6ZWQgYmVmb3JlIEZMQVNILgo+
Cj4gICAzLiBNYXAgY29yZSBzdGFydHVwIGNvZGUgb25seSB3aGVuIG5lZWRlZDoKPiAgICAgICAt
IFVubWFwIGNvcmUgc3RhcnR1cCBjb2RlIGFmdGVyIHNlY29uZGFyeSBjb3JlIGJyaW5ndXAsCj4g
ICAgICAgLSBNYXAvdW5tYXAgY29yZSBzdGFydHVwIGNvZGUgZHVyaW5nIHMycmFtIHN1c3BlbmQv
cmVzdW1lLAo+ICAgICAgIC0gQ2FsbCBjcHVfaG90cGx1Z19kaXNhYmxlKCkgZnJvbSBzbXBfY3B1
c19kb25lKCksCj4gICAgICAgICAgIC0gQ1BVIGhvdHBsdWcgaXMgYnJva2VuLgo+ICAgICAgICAg
ICAtIEhvdyB0byBjaGVjayBpZiBAMCBpcyBhY3R1YWxseSB1c2VkL21hcHBlZD8KPgo+ICAgNC4g
QXMgdGhpcyBGTEFTSCBpcyB0eXBpY2FsbHkgdXNlZCB0byBib290IHRoZSBzeXN0ZW0sIE1hcmVr
IHN1Z2dlc3RlZAo+ICAgICAgdG8gZml4IHRoaXMgaW4gdGhlIGJvb3QgbG9hZGVyIChlLmcuIHB1
dCBhIChtb2RpZmllZCkgY29weSBvZiB0aGUKPiAgICAgIENQVSBicmluZ3VwIGNvZGUgaW4gRkxB
U0gpLiAgQnV0IEkgdGhpbmsgdGhpcyBpcyBmcmFnaWxlLCBhbmQgY2Fubm90Cj4gICAgICBiZSBh
IGdlbmVyaWMgc29sdXRpb24sIGFzIHRoZXJlIGFyZSBvdGhlciB3YXlzIHRvIGJvb3QgdGhlIHN5
c3RlbSwKPiAgICAgIGFuZCB0aGUgRkxBU0ggbWF5IGJlIHVzZWQgZm9yIG90aGVyIHB1cnBvc2Vz
Lgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50cyBzb2x1dGlvbiAxLCBieSBtYXJraW5n
IHRoZSBib290IGFyZWEgcmVnaW9uCj4gcmVzZXJ2ZWQgZHVyaW5nIFNNUCBpbml0aWFsaXphdGlv
biAoYW4gYWx0ZXJuYXRpdmUgbWV0aG9kIHdvdWxkIGJlIHRvCj4gZGlzYWJsZSBhbnkgZGV2aWNl
IG5vZGUgaW4gRFQgdGhhdCByZXNpZGVzIGluIHRoaXMgYXJlYSkuICBTdWJzZXF1ZW50Cj4gcHJv
YmluZyBvZiBGTEFTSCB3aWxsIGZhaWwgd2l0aCAtRUJVU1k6Cj4KPiAgICAgcGh5c21hcC1mbGFz
aCAwLmZsYXNoOiBjYW4ndCByZXF1ZXN0IHJlZ2lvbiBmb3IgcmVzb3VyY2UgW21lbSAweDAwMDAw
MDAwLTB4MDNmZmZmZmZdCj4gICAgIHBoeXNtYXAtZmxhc2g6IHByb2JlIG9mIDAuZmxhc2ggZmFp
bGVkIHdpdGggZXJyb3IgLTE2Cj4KPiBXaGVuIENPTkZJR19TTVAgaXMgZGlzYWJsZWQsIG9yIHdo
ZW4gYm9vdGVkIHdpdGggIm5vc21wIiwgdGhlIEZMQVNICj4gaXMgYXZhaWxhYmxlIGFnYWluLgo+
Cj4gVGhlIGZpcnN0IHBhdGNoIGlzIGEgc21hbGwgY2xlYW51cCBpbiBjb2RlIGFmZmVjdGVkIGJ5
IHRoZSB0aGlyZCBwYXRjaC4KPiBUaGUgb3RoZXIgdGhyZWUgcGF0Y2hlcyBmaXggdGhlIGlzc3Vl
IG9uIFItQ2FyIEdlbjIgKGFuZCBSWi9HMSksIFItQ2FyCj4gSDEsIGFuZCBTSC1Nb2JpbGUgQUc1
IFNvQ3MuCj4KPiBPdGhlciBSZW5lc2FzIFNvQ3M6Cj4gICAtIFItTW9iaWxlIEFQRTYgaXMgYWxz
byBhZmZlY3RlZCwgYnV0IGhhcyBubyB1cHN0cmVhbSBTTVAgc3VwcG9ydCB5ZXQsCj4gICAtIEVN
TUEgTW9iaWxlIEVWMiBpcyB1bmFmZmVjdGVkLCBhcyBpdCB1c2VzIGludGVybmFsIGJvb3QgUk9N
IGNvZGUKPiAgICAgdGhhdCB3YXRjaGVzIGEgc3BlY2lhbCBnZW5lcmFsIHB1cnBvc2UgcmVnaXN0
ZXIgaW4gdGhlIFNNVSBibG9jaywKPiAgIC0gUlovTjEgaXMgbm90IGFmZmVjdGVkLCBhcyBpdCB1
c2VzIGEgImNwdS1yZWxlYXNlLWFkZHIiIHByb3BlcnR5IGluCj4gICAgIERULAo+ICAgLSBSLUNh
ciBHZW4zIGlzIG5vdCBhZmZlY3RlZCwgYXMgaXQgZXh0ZW5kZWQgdGhlIFItQ2FyIEdlbjIgUlNU
IGJsb2NrCj4gICAgIHdpdGggQ29ydGV4LUE1My9BNTcgQm9vdCBBZGRyZXNzIFJlZ2lzdGVycyBm
b3IgNjQtYml0IG1vZGUKPiAgICAgKENBNVszN11DUFVuQkFSW0hMXSksIHdoaWNoIGNvbnRyb2wg
dGhlIGJvb3QgYWRkcmVzcyBkaXJlY3RseSwKPiAgIC0gUi1DYXIgR2VuNCBpcyBub3QgYWZmZWN0
ZWQsIGFzIGl0IGhhcyBSZXNldCBWZWN0b3IgQmFzZSBBZGRyZXNzCj4gICAgIFJlZ2lzdGVycyAo
UlZCQVJbSExdQ24pLCB3aGljaCBjb250cm9sIHRoZSBib290IGFkZHJlc3MgZGlyZWN0bHkuCj4K
PiBUaGlzIHNlcmllcyBoYXMgYmVlbiB0ZXN0ZWQgb24gUi1DYXIgVjJIIChCbGFuY2hlKSBhbmQg
Ui1DYXIgSDEKPiAoTWFyemVuKS4gIFdpdGggdGhpcywgdGhlIENGSSBGTEFTSGVzIG9uIE1hcnpl
blsxXSBhbmQgQmxhbmNoZSAoRFRTCj4gcGF0Y2ggdG8gYmUgcG9zdGVkKSB3b3JrIHdoZW4gYm9v
dGVkIHdpdGggbm9zbXAuCj4KPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMhCj4KPiBbMV0gIltQ
QVRDSC9SRkNdIEFSTTogZHRzOiBtYXJ6ZW46IEFkZCBGTEFTSCBub2RlIgo+ICAgICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzA3Y2Y1ZTJiNDY2ZjNiYTIxNzQwM2FmYzY2YTgyNDY0NjA2MDll
MDkuMTY3OTMzMDEwNS5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUvCj4KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gKDQpOgo+ICAgQVJNOiBzaG1vYmlsZTogcmNhci1nZW4yOiBSZW1vdmUgdW5uZWVk
ZWQgb25jZSBoYW5kbGluZwo+ICAgQVJNOiBzaG1vYmlsZTogcmNhci1nZW4yOiBSZXNlcnZlIGJv
b3QgYXJlYSB3aGVuIFNNUCBpcyBlbmFibGVkCj4gICBBUk06IHNobW9iaWxlOiByOGE3Nzc5OiBS
ZXNlcnZlIGJvb3QgYXJlYSB3aGVuIFNNUCBpcyBlbmFibGVkCj4gICBBUk06IHNobW9iaWxlOiBz
aDczYTA6IFJlc2VydmUgYm9vdCBhcmVhIHdoZW4gU01QIGlzIGVuYWJsZWQKClRoYW5rcywgcXVl
dWluZyBpbiByZW5lc2FzLWRldmVsIGZvciB2Ni43LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
