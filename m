Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F60FC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 14:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OVt1f0IfMmsDyr+smJdDYAYk6YJWSB2TbMOdJp4YSY=; b=nojHfXtj7ax4mm
	BDYmJd1NxzgEkZe5fJ/YY8X+Ph0dPL7rL/Y3v111Z9DXR8bhS51FQ55/E60PVtRlk4ffdCuttl/T8
	JyEhGXjDDG5tjdx2Y/k/S8HO5gsPIoS/esf2aMIJx51jfg+6R7TRxdh39MqRtjxGk+V0IFZSOWS+B
	Se5UXEyaZsCW0mZ3RmjbIkz7X47DYEzV8+P4KH8CThGVyPU0X0bTIHT+mJgPsAZqrBVl2QEOxl1kx
	cnnoP/JLH/gxH3VxK4KfqX4Atfq4Qs441vSA33BJawRQWGDep+MzpmUXmvyaUBVum+oI0V0/N4WPO
	8+VDoLL21voOfp8lKDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6C3E-006gFM-Vq; Tue, 28 Jun 2022 14:18:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6C2w-006g7F-OQ; Tue, 28 Jun 2022 14:18:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48579B81E3B;
	Tue, 28 Jun 2022 14:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5F2C341C6;
	Tue, 28 Jun 2022 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656425908;
	bh=gNqsfpabtVurh3KrN/HDHkVIuq5HYEGkFj0dq9pxBp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKmDxdeiZbNhcfCtRCGKrWsyjlCMGrWNe6JPI6+0Ud4+CdurjXwUmrO+N85g9uStN
	 ZMyX+h6jcWDShk2bKHv4I1CwjG76KgIokSJRaPNHE+tAExMRqCJhyYb+qk23PpSnt8
	 UZagMIRlLLl0N2746CMcacDFBvR451lE95WpeBq0GW4QDuaouxlRRNIVOVHDclrQ6f
	 3R9oBNaPqtGDm4Fzozu0TEhclsuvbNSWpoAarBMEoFPJEcd4AO2pVjb65zJgdF1PVp
	 ef3Ggil+1czhmYD/i4aHezmCjBjk3ri61YXhTXJoT9Ami17Y24U2vq1uockAAm5n3K
	 LL1PsE5NQ0Syg==
Date: Tue, 28 Jun 2022 16:18:23 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, dm-devel@redhat.com,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-can@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
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
Message-ID: <20220628141823.GB25163@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <20220627125343.44e24c41@hermes.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627125343.44e24c41@hermes.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_071830_995229_048367A7 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMTI6NTM6NDNQTSAtMDcwMCwgU3RlcGhlbiBIZW1taW5n
ZXIgd3JvdGU6Cj4gVGhhbmtzIHRoaXMgZml4ZXMgd2FybmluZyB3aXRoIGdjYy0xMiBpbiBpcHJv
dXRlMi4KPiBJbiBmdW5jdGlvbiDigJh4ZnJtX2FsZ29fcGFyc2XigJksCj4gICAgIGlubGluZWQg
ZnJvbSDigJh4ZnJtX3N0YXRlX21vZGlmeS5jb25zdHByb3DigJkgYXQgeGZybV9zdGF0ZS5jOjU3
Mzo1Ogo+IHhmcm1fc3RhdGUuYzoxNjI6MzI6IHdhcm5pbmc6IHdyaXRpbmcgMSBieXRlIGludG8g
YSByZWdpb24gb2Ygc2l6ZSAwIFstV3N0cmluZ29wLW92ZXJmbG93PV0KPiAgIDE2MiB8ICAgICAg
ICAgICAgICAgICAgICAgICAgIGJ1ZltqXSA9IHZhbDsKPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgIH5+fn5+fn5efn5+fgoKR3JlYXQhIFRoaXMgZ2l2ZXMgbWUgaG9wZS4gOikKClRo
YW5rcwotLQpHdXN0YXZvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
