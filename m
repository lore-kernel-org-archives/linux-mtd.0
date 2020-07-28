Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83443C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 19:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567D720656
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 19:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yskgVJAP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="Y9eOezwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567D720656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2cGbV/GjHevf4sNmsXXXBi7uPPhZ0cdKGy2kPRJ3aYs=; b=yskgVJAPooP/nWaG9zzUssDG/
	PQGXy67SSY1yJSF0mTKHih2bZHBoK8jlqMA03DzNXR4EeGF/dSVXQdNUDODrL1a/WxgygWsL9nw3v
	7NZRZKLGaG9v0JENMnZ4Y+wmRUu6OUp/Ge6xmHfmKHYDLwqIrKY/n7OaJdMuoKiI5A2bEo0+2w1WR
	CifyyQoUpW1ZVrEKyy47NZ/X+LBsYlMyXso+Yzpj7xVB9Bhj4FlfuR5vgd+Z2DT21HzhOUqzwFJQx
	iIJVo2A7Gr4wYGf7FcuDlapwZuhWgzyk41iFhUALjmL8s3rnysnBrQDAdqgW/RJm4anNjnjFHGygu
	I9Mb2uvtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0V9E-00069M-TY; Tue, 28 Jul 2020 19:20:26 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0V9C-00066c-1F
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 19:20:23 +0000
Received: by mail-pg1-x543.google.com with SMTP id o13so12621703pgf.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2020 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6vfxP0xAICcExvQMz/4lQvBsGt+MbkdQCG7TPtmY2IU=;
 b=Y9eOezwVV/XNy3ss0E8zEQZN46Jwp7Vwk2F4dYKq4GF+o38CPH9bXtrUXOyKXIv0qi
 IxCEGapawUVePV3q40k2ellTesiBEzVplHJE1NvfhyL5RCl83HKGBpQJX0QM6eO0a6fq
 K4eY6mGRbq51nbLdHdV0aIyuHM8uJTGXUryQRTt7Lj0uw/Rn/vzZ7q/sGIcO2+P5vKXM
 D+ek+rXJ/oXKvUiOA/SsGJJtECe80pX2lqhwV2Mek5vNpO9+e9YTmFR2Dc+dekaVJzW8
 tm1bitx5pVI4Q4Wm0OEfzMIXB/vw2Lt3V5PNJbWz7GH/REb/D7Ra0sQgFciGhg/c8Ve4
 LbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6vfxP0xAICcExvQMz/4lQvBsGt+MbkdQCG7TPtmY2IU=;
 b=U8TIDK0tsz4v6sAAgA+NO8zXP3iGh/6+k3Q6I+PcF0zanrYfnCOvlnm6d2WSt+gQ+m
 M0yTPK9UiS9hziF7PhJttKhIARnGx1BkwJw54xdmUgrIawDcf5wP3XgylVoSzllMYxBE
 KYW8zn8Iem/4jg92c3cg/45obkMWJ7SzTJ/rKMu8D59SQwmmIg6MwoDhn/P6790+W0ni
 Hmu+t1BRpi1fqvqndcJbkivsBg6kX37xZEbXDREE7K5yyD+X3a6YTY12dXF5jBmwiwXR
 fhN3BJT9rxmXN+HldUDue5t4x5IK+BX+H/Xw48DT/5wCaYqYE/Gsl5sv9c5cW76eSAuU
 HrSg==
X-Gm-Message-State: AOAM531c7TqwSzI9yjgIhOCiY6RtKQSQVwrKNJZhM1uZIdQFzQt2+8UP
 tQIO7ntNeH+XlfILbV7dQ+PIHg==
X-Google-Smtp-Source: ABdhPJxBQ70KSlhfE4UBk48wOVO+oTR3dAvGMGkYXZNgophmfDok6SYnNj9+4QpInUFKqraP2ypplA==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr26658462pga.335.1595964018789; 
 Tue, 28 Jul 2020 12:20:18 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id e8sm8642552pfd.34.2020.07.28.12.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 12:20:18 -0700 (PDT)
Subject: Re: bdi cleanups v3
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
 <0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Message-ID: <08ded32a-cf3a-55b0-6a88-19d201edac93@kernel.dk>
Date: Tue, 28 Jul 2020 13:20:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_152022_120053_C3DB02D0 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNy8yOC8yMCA5OjQxIEFNLCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9uIDcvMjQvMjAgMTozMiBB
TSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+IEhpIEplbnMsCj4+Cj4+IHRoaXMgc2VyaWVz
IGNvbnRhaW5zIGEgYnVuY2ggb2YgZGlmZmVyZW50IEJESSBjbGVhbnVwcy4gIFRoZSBiaWdnZXN0
IGl0ZW0KPj4gaXMgdG8gaXNvbGF0ZSBibG9jayBkcml2ZXJzIGZyb20gdGhlIEJESSBpbiBwcmVw
YXJhdGlvbiBvZiBjaGFuZ2luZyB0aGUKPj4gbGlmZXRpbWUgb2YgdGhlIGJsb2NrIGRldmljZSBC
REkgaW4gYSBmb2xsb3cgdXAgc2VyaWVzLgo+IAo+IEFwcGxpZWQsIHRoYW5rcy4KCkRyb3BwZWQ6
CgogIENDICAgICAgYmxvY2svYmxrLXN5c2ZzLm8KYmxvY2svYmxrLXN5c2ZzLmM6NjA4OjE2OiBl
cnJvcjog4oCYYmxrX3Rocm90bF9zYW1wbGVfc2hvd+KAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBp
biBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGJsa190aHJvdGxfc2FtcGxlX2VudHJ54oCZ
PwogIDYwOCB8IFFVRVVFX1JXX0VOVFJZKGJsa190aHJvdGxfc2FtcGxlLCAidGhyb3R0bGVfc2Ft
cGxlX3RpbWUiKTsKICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgpibG9j
ay9ibGstc3lzZnMuYzo1NjM6MTA6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYUVVF
VUVfUldfRU5UUlnigJkKICA1NjMgfCAgLnNob3cgPSBfcHJlZml4IyNfc2hvdywgICBcCiAgICAg
IHwgICAgICAgICAgXn5+fn5+fgpibG9jay9ibGstc3lzZnMuYzo2MDg6MTY6IGVycm9yOiDigJhi
bGtfdGhyb3RsX3NhbXBsZV9zdG9yZeKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0
aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGJsa190aHJvdGxfc2FtcGxlX2VudHJ54oCZPwogIDYwOCB8
IFFVRVVFX1JXX0VOVFJZKGJsa190aHJvdGxfc2FtcGxlLCAidGhyb3R0bGVfc2FtcGxlX3RpbWUi
KTsKICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgpibG9jay9ibGstc3lz
ZnMuYzo1NjQ6MTE6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYUVVFVUVfUldfRU5U
UlnigJkKICA1NjQgfCAgLnN0b3JlID0gX3ByZWZpeCMjX3N0b3JlLCAgIFwKICAgICAgfCAgICAg
ICAgICAgXn5+fn5+fgpibG9jay9ibGstc3lzZnMuYzo2NTc6MzogZXJyb3I6IOKAmGJsa190aHJv
dGxfc2FtcGxlX3RpbWVfZW50cnnigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlv
bik7IGRpZCB5b3UgbWVhbiDigJhibGtfdGhyb3RsX3NhbXBsZV90aW1lX3N0b3Jl4oCZPwogIDY1
NyB8ICAmYmxrX3Rocm90bF9zYW1wbGVfdGltZV9lbnRyeS5hdHRyLAogICAgICB8ICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgYmxrX3Rocm90bF9zYW1wbGVfdGltZV9z
dG9yZQpibG9jay9ibGstc3lzZnMuYzo2MDg6MTY6IHdhcm5pbmc6IOKAmGJsa190aHJvdGxfc2Ft
cGxlX2VudHJ54oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KICA2
MDggfCBRVUVVRV9SV19FTlRSWShibGtfdGhyb3RsX3NhbXBsZSwgInRocm90dGxlX3NhbXBsZV90
aW1lIik7CiAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KYmxvY2svYmxr
LXN5c2ZzLmM6NTYxOjMzOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFFVRVVFX1JX
X0VOVFJZ4oCZCiAgNTYxIHwgc3RhdGljIHN0cnVjdCBxdWV1ZV9zeXNmc19lbnRyeSBfcHJlZml4
IyNfZW50cnkgPSB7IFwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn4KbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4MTogYmxvY2svYmxr
LXN5c2ZzLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZToxNzU2OiBibG9ja10gRXJyb3Ig
MgoKZnJvbSAiYmxvY2s6IGFkZCBoZWxwZXIgbWFjcm9zIGZvciBxdWV1ZSBzeXNmcyBlbnRyaWVz
IgoKVGhpcyBoYXMgbm90IHNlZW4gYSBmdWxsIGNvbXBpbGUgdGVzdCBldmVuLi4uCgotLSAKSmVu
cyBBeGJvZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
