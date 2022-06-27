Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF9DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYv2/FdPodWqxZ79ajcsvrPZwrguf4cpaYpucSoYdqs=; b=RGGarW3dTt0BbO
	kKOmXvIl2zeSEG/PyVFcnANQ4f3LK5sWSVTbhjh1aTAUscrKIMKDfHBlO0UCI0A0t7Xm+FjLGTL0p
	SF+KL2wSsUPijzQoIEtPwQpaT1Vg0TFuZS38OQoKUQpCbsRpOG46BppTE8o7mfkQB3vtwiNk5ZtwT
	FaHWD3JH4Aw75DpxaECTeY7DTU14zGQpKk8SPcdjYtP0YRGLUX0yw/6obzuDr/YHMK1pvGOafkfPe
	8IzY7X6e0bGsIJ8bcGJsnwmtrKGSm5YhxgyW1EUE/292lsaraJPz2r3CQ2ZdMTJ/V61EywmTO3HS5
	54ioTQ64sLNjW7/kBRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uo7-002fs3-LM; Mon, 27 Jun 2022 19:54:03 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5unv-002fnV-Nf
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2022 19:53:53 +0000
Received: by mail-pg1-x534.google.com with SMTP id g4so3151617pgc.1
        for <linux-mtd@lists.infradead.org>; Mon, 27 Jun 2022 12:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k/l4LcE4w+6LYrCo6/Ek+44r04gbnpHm9yyPA0qKR6A=;
        b=ryYp2naL1201DMNfPmSbpexCs+zqiLsBQDBXHc9esFHxBJ8Ep2LLrsgHtxJtosu2+J
         1iBYfvQQXv6NYwKQ2qXQCc4mHXYQGPYeeUC3hu2OgPUPjZXH+3Hi6Zqo5SyTeGerBVQA
         p1Bh5daOuP6Q9UMRPxlj6vxZpUjBpxOPEYhjttl3pP6gtksJnO1wA5G3ERXmm3iOhFrs
         MlyYmEaZt8I/cdZ0xlE1RQA9V/oE3k4e+iV7r8nrUlXmSvlRImOQktUmXD254MFh7ceV
         2zbWTxt+/QD0MTYLBrv8xqePAliI2A59OkEqXOPrksIatTeOcW53aiRz+65e7KopsoX+
         3osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k/l4LcE4w+6LYrCo6/Ek+44r04gbnpHm9yyPA0qKR6A=;
        b=j9XwsEU5mPob7dicnidHfEpd6y+IdPimwFzeKYtpauqBblh9orhTtYFL1ookOtKCEs
         YwkvdKuP9R+bHa5RSpdglelM2YTNLWTKJ2qzfeHgiG2vi1aZvE4B+ZocQifAeGEKLItH
         Vpn5Zcrqj4liVhjST8w0Xv49pDSfEy216ijX4HhXGZNL+nPW1WmD9n948DYo3I2mYdlg
         aQeSFEmNSaoMfvUuGRDaoR47P8hik7XrJEWy8PiONYNbgH+sqGz2KguL+cEgzfwkMG83
         Hj7bBanZWvpHBxTJlbjpsBUCQBW6XH7x6l2muC/G/2URyzblM8Ezy7yNnhlIkYuL+ae7
         jWDA==
X-Gm-Message-State: AJIora8kNc9Ov+bKp7vKUtzHgflRveTD0rZu1+2oBJU0Rboli4HF7u0Q
	UqToXirhTUFcyGkUVkEeqk2RNA==
X-Google-Smtp-Source: AGRyM1ssDeW6Ux1oaY9ixgaaapzXMFszbxcRVeOWaHAYiiaVMZ4HUYtPzqxXzR6I8+fqeJNf8u9hpg==
X-Received: by 2002:a63:7a5d:0:b0:40c:fcbe:4799 with SMTP id j29-20020a637a5d000000b0040cfcbe4799mr14428539pgn.297.1656359626928;
        Mon, 27 Jun 2022 12:53:46 -0700 (PDT)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
        by smtp.gmail.com with ESMTPSA id c16-20020a056a00009000b0051c1b445094sm7821510pfj.7.2022.06.27.12.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:53:46 -0700 (PDT)
Date: Mon, 27 Jun 2022 12:53:43 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, dm-devel@redhat.com, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-btrfs@vger.kernel.org,
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
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220627125343.44e24c41@hermes.local>
In-Reply-To: <20220627180432.GA136081@embeddedor>
References: <20220627180432.GA136081@embeddedor>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_125351_796067_774B4D3F 
X-CRM114-Status: GOOD (  15.37  )
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

T24gTW9uLCAyNyBKdW4gMjAyMiAyMDowNDozMiArMDIwMAoiR3VzdGF2byBBLiBSLiBTaWx2YSIg
PGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoZXJlIGlzIGEgcmVndWxhciBuZWVk
IGluIHRoZSBrZXJuZWwgdG8gcHJvdmlkZSBhIHdheSB0byBkZWNsYXJlCj4gaGF2aW5nIGEgZHlu
YW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLgo+
IEtlcm5lbCBjb2RlIHNob3VsZCBhbHdheXMgdXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJlcnPi
gJ1bMV0gZm9yIHRoZXNlCj4gY2FzZXMuIFRoZSBvbGRlciBzdHlsZSBvZiBvbmUtZWxlbWVudCBv
ciB6ZXJvLWxlbmd0aCBhcnJheXMgc2hvdWxkCj4gbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4gCj4g
VGhpcyBjb2RlIHdhcyB0cmFuc2Zvcm1lZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGU6Cj4g
KGxpbnV4LTUuMTktcmMyJCBzcGF0Y2ggLS1qb2JzICQoZ2V0Y29uZiBfTlBST0NFU1NPUlNfT05M
TikgLS1zcC1maWxlIHNjcmlwdC5jb2NjaSAtLWluY2x1ZGUtaGVhZGVycyAtLWRpciAuID4gb3V0
cHV0LnBhdGNoKQo+IAo+IEBACj4gaWRlbnRpZmllciBTLCBtZW1iZXIsIGFycmF5Owo+IHR5cGUg
VDEsIFQyOwo+IEBACj4gCj4gc3RydWN0IFMgewo+ICAgLi4uCj4gICBUMSBtZW1iZXI7Cj4gICBU
MiBhcnJheVsKPiAtIDAKPiAgIF07Cj4gfTsKPiAKPiAtZnN0cmljdC1mbGV4LWFycmF5cz0zIGlz
IGNvbWluZyBhbmQgd2UgbmVlZCB0byBsYW5kIHRoZXNlIGNoYW5nZXMKPiB0byBwcmV2ZW50IGlz
c3VlcyBsaWtlIHRoZXNlIGluIHRoZSBzaG9ydCBmdXR1cmU6Cj4gCj4gLi4vZnMvbWluaXgvZGly
LmM6MzM3OjM6IHdhcm5pbmc6ICdzdHJjcHknIHdpbGwgYWx3YXlzIG92ZXJmbG93OyBkZXN0aW5h
dGlvbiBidWZmZXIgaGFzIHNpemUgMCwKPiBidXQgdGhlIHNvdXJjZSBzdHJpbmcgaGFzIGxlbmd0
aCAyIChpbmNsdWRpbmcgTlVMIGJ5dGUpIFstV2ZvcnRpZnktc291cmNlXQo+IAkJc3RyY3B5KGRl
My0+bmFtZSwgIi4iKTsKPiAJCV4KPiAKPiBTaW5jZSB0aGVzZSBhcmUgYWxsIFswXSB0byBbXSBj
aGFuZ2VzLCB0aGUgcmlzayB0byBVQVBJIGlzIG5lYXJseSB6ZXJvLiBJZgo+IHRoaXMgYnJlYWtz
IGFueXRoaW5nLCB3ZSBjYW4gdXNlIGEgdW5pb24gd2l0aCBhIG5ldyBtZW1iZXIgbmFtZS4KPiAK
PiBbMV0gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvRmxleGlibGVfYXJyYXlfbWVtYmVy
Cj4gWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuMTYvcHJvY2Vzcy9kZXBy
ZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVtZW50LWFycmF5cwo+IAo+IExpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy83OAo+IEJ1aWxkLXRlc3RlZC1i
eTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82MmI2NzVlYy53S1g2QU9aNmNiRTcxdnRG
JTI1bGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxn
dXN0YXZvYXJzQGtlcm5lbC5vcmc+CgpUaGFua3MgdGhpcyBmaXhlcyB3YXJuaW5nIHdpdGggZ2Nj
LTEyIGluIGlwcm91dGUyLgpJbiBmdW5jdGlvbiDigJh4ZnJtX2FsZ29fcGFyc2XigJksCiAgICBp
bmxpbmVkIGZyb20g4oCYeGZybV9zdGF0ZV9tb2RpZnkuY29uc3Rwcm9w4oCZIGF0IHhmcm1fc3Rh
dGUuYzo1NzM6NToKeGZybV9zdGF0ZS5jOjE2MjozMjogd2FybmluZzogd3JpdGluZyAxIGJ5dGUg
aW50byBhIHJlZ2lvbiBvZiBzaXplIDAgWy1Xc3RyaW5nb3Atb3ZlcmZsb3c9XQogIDE2MiB8ICAg
ICAgICAgICAgICAgICAgICAgICAgIGJ1ZltqXSA9IHZhbDsKICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICB+fn5+fn5+Xn5+fn4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
