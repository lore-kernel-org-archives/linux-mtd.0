Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BF6C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sySjm2D3l+aUP3owL2slFRaKT+fo4Idwx5U6QUsJ38=; b=NzM62RdQd+NqQ7WQNq1EHNHX9o
	7SuDaAaMEyPQ+nUbuNgrmpMrK5RbmA7VGb8XxM7B4l8qd6zbqGyIgrTe2pPOGfR3wohCjruO5VaRF
	8gOE3be7jw2gOuzatIvd5yerWa9Xjs6oNcxxTBpzg26Febk1qpm1uVntJ8CPMsafLQaYR4hv9ng+B
	hi/LfT5SmM4CHUs+RHx9vZMc8OKo2ZuCPwKcrc6+BkI1COs6G7O9P/aFQm+VWAhAwqr3VU1Ny0fsC
	DVYjMbz3oCQwi/fHaIGdf+/Nk7owcuKW92CWA1Ys3b1bT9v/5NlOTfyyroYD7xaGZU2ZU9a7UYr2O
	w1L0muDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5tSs-002OWj-Ks; Mon, 27 Jun 2022 18:28:02 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5tSp-002OVv-8i; Mon, 27 Jun 2022 18:28:00 +0000
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <daniel@iogearbox.net>)
	id 1o5tSV-000G0X-5e; Mon, 27 Jun 2022 20:27:39 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1o5tSU-000TKD-AF; Mon, 27 Jun 2022 20:27:38 +0200
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, dm-devel@redhat.com, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-can@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, io-uring@vger.kernel.org,
 lvs-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kasan-dev@googlegroups.com, linux-mmc@vger.kernel.org,
 nvdimm@lists.linux.dev, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-perf-users@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-usb@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 v9fs-developer@lists.sourceforge.net, linux-rdma@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org
References: <20220627180432.GA136081@embeddedor>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
Date: Mon, 27 Jun 2022 20:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20220627180432.GA136081@embeddedor>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.6/26586/Mon Jun 27 10:06:41 2022)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_112759_336576_598A316A 
X-CRM114-Status: GOOD (  18.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNi8yNy8yMiA4OjA0IFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IFRoZXJlIGlz
IGEgcmVndWxhciBuZWVkIGluIHRoZSBrZXJuZWwgdG8gcHJvdmlkZSBhIHdheSB0byBkZWNsYXJl
Cj4gaGF2aW5nIGEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGlu
IGEgc3RydWN0dXJlLgo+IEtlcm5lbCBjb2RlIHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxl
IGFycmF5IG1lbWJlcnPigJ1bMV0gZm9yIHRoZXNlCj4gY2FzZXMuIFRoZSBvbGRlciBzdHlsZSBv
ZiBvbmUtZWxlbWVudCBvciB6ZXJvLWxlbmd0aCBhcnJheXMgc2hvdWxkCj4gbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCj4gCj4gVGhpcyBjb2RlIHdhcyB0cmFuc2Zvcm1lZCB3aXRoIHRoZSBoZWxwIG9m
IENvY2NpbmVsbGU6Cj4gKGxpbnV4LTUuMTktcmMyJCBzcGF0Y2ggLS1qb2JzICQoZ2V0Y29uZiBf
TlBST0NFU1NPUlNfT05MTikgLS1zcC1maWxlIHNjcmlwdC5jb2NjaSAtLWluY2x1ZGUtaGVhZGVy
cyAtLWRpciAuID4gb3V0cHV0LnBhdGNoKQo+IAo+IEBACj4gaWRlbnRpZmllciBTLCBtZW1iZXIs
IGFycmF5Owo+IHR5cGUgVDEsIFQyOwo+IEBACj4gCj4gc3RydWN0IFMgewo+ICAgIC4uLgo+ICAg
IFQxIG1lbWJlcjsKPiAgICBUMiBhcnJheVsKPiAtIDAKPiAgICBdOwo+IH07Cj4gCj4gLWZzdHJp
Y3QtZmxleC1hcnJheXM9MyBpcyBjb21pbmcgYW5kIHdlIG5lZWQgdG8gbGFuZCB0aGVzZSBjaGFu
Z2VzCj4gdG8gcHJldmVudCBpc3N1ZXMgbGlrZSB0aGVzZSBpbiB0aGUgc2hvcnQgZnV0dXJlOgo+
IAo+IC4uL2ZzL21pbml4L2Rpci5jOjMzNzozOiB3YXJuaW5nOiAnc3RyY3B5JyB3aWxsIGFsd2F5
cyBvdmVyZmxvdzsgZGVzdGluYXRpb24gYnVmZmVyIGhhcyBzaXplIDAsCj4gYnV0IHRoZSBzb3Vy
Y2Ugc3RyaW5nIGhhcyBsZW5ndGggMiAoaW5jbHVkaW5nIE5VTCBieXRlKSBbLVdmb3J0aWZ5LXNv
dXJjZV0KPiAJCXN0cmNweShkZTMtPm5hbWUsICIuIik7Cj4gCQleCj4gCj4gU2luY2UgdGhlc2Ug
YXJlIGFsbCBbMF0gdG8gW10gY2hhbmdlcywgdGhlIHJpc2sgdG8gVUFQSSBpcyBuZWFybHkgemVy
by4gSWYKPiB0aGlzIGJyZWFrcyBhbnl0aGluZywgd2UgY2FuIHVzZSBhIHVuaW9uIHdpdGggYSBu
ZXcgbWVtYmVyIG5hbWUuCj4gCj4gWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0Zs
ZXhpYmxlX2FycmF5X21lbWJlcgo+IFsyXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L3Y1LjE2L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3plcm8tbGVuZ3RoLWFuZC1vbmUtZWxlbWVu
dC1hcnJheXMKPiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMv
NzgKPiBCdWlsZC10ZXN0ZWQtYnk6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNjJiNjc1
ZWMud0tYNkFPWjZjYkU3MXZ0RiUyNWxrcEBpbnRlbC5jb20vCj4gU2lnbmVkLW9mZi1ieTogR3Vz
dGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+IC0tLQo+IEhpIGFsbCEK
PiAKPiBKRllJOiBJJ20gYWRkaW5nIHRoaXMgdG8gbXkgLW5leHQgdHJlZS4gOikKCkZ5aSwgdGhp
cyBicmVha3MgQlBGIENJOgoKaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL2JwZi9y
dW5zLzcwNzg3MTkzNzI/Y2hlY2tfc3VpdGVfZm9jdXM9dHJ1ZQoKICAgWy4uLl0KICAgcHJvZ3Mv
bWFwX3B0cl9rZXJuLmM6MzE0OjI2OiBlcnJvcjogZmllbGQgJ3RyaWVfa2V5JyB3aXRoIHZhcmlh
YmxlIHNpemVkIHR5cGUgJ3N0cnVjdCBicGZfbHBtX3RyaWVfa2V5JyBub3QgYXQgdGhlIGVuZCBv
ZiBhIHN0cnVjdCBvciBjbGFzcyBpcyBhIEdOVSBleHRlbnNpb24gWy1XZXJyb3IsLVdnbnUtdmFy
aWFibGUtc2l6ZWQtdHlwZS1ub3QtYXQtZW5kXQogICAgICAgICAgIHN0cnVjdCBicGZfbHBtX3Ry
aWVfa2V5IHRyaWVfa2V5OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICAg
MSBlcnJvciBnZW5lcmF0ZWQuCiAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6NTE5OiAvdG1wL3J1bm5l
ci93b3JrL2JwZi9icGYvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL21hcF9wdHJfa2Vybi5v
XSBFcnJvciAxCiAgIG1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAg
IEVycm9yOiBQcm9jZXNzIGNvbXBsZXRlZCB3aXRoIGV4aXQgY29kZSAyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
