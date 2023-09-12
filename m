Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473F1CA0EEB
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYJqUIofOi1bUwh7Uo/F3UXGhKmZcY/k7qWmhPYABCg=; b=OAdG8M3mIJ6+Tp
	PtxcpeXDf9TFzgoOPhdHpDNOpr6qj3m7sP2IYr7YT+ZMKclgkIDSsMyfXNpQkxR869UGYicnpfNCY
	ZDYpNgV8VPHyfDwI9RWmVH8SknwlBDzO0UyqEzy5wWPcaXTxRNwokJOzNWJQ5Mv97Feo5xIGeHSUF
	xWpb5otVC92zeeYs1eyzTFaLDWqwQsbFgXoLL6YvXkMAlFtljDzh3VHTxX4cQBbvONZ0dMTJvbJx+
	2DmLKauVBKhWvYn/y87G/9Nb/U5TOVPzvqoeyrUsKZ+KZBdUdddBTSLs/MVjS5Y7UeG/Op2C5zfK5
	69HNTYl5FZMjNqqElx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4WT-003bZt-2u;
	Tue, 12 Sep 2023 14:37:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4WR-003bYM-0g
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 14:37:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66DD1B81C68;
	Tue, 12 Sep 2023 14:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A878C433C7;
	Tue, 12 Sep 2023 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694529461;
	bh=seZ6bO2O8khY6IiLFbM8+idr9y7j2e+ADHMa7vktAEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THANbBEBHj2+bi3aQdqBFY9j9RePLe9TwkgGsmWadUn4ykiigSzcNk4gfJC060MIP
	 k7aUYHwJvJFGR/GmAaVw7x1p4qQUep0DJiR+pknPIq3ugBIkvESOX4UwmYvXStf7f3
	 UMGj9r35tBb2ROvI72inVtvvgxcF5yd+NzmIp2CCe4EFAcioSu4IGncTt+3BQzxKB3
	 QVLOEDs4hZjiZrINFCjX+d9cYzvWluTDY0xv9e8Zfed+ol38THmFcBAT8DvRPx5b+7
	 g8dSxrbrpICJljZly28FU+J+x1jviKW+vnh8yzXl85qL27por6mihI5k5lWsqOrETz
	 /W2YnPqoh2fug==
Date: Tue, 12 Sep 2023 20:07:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
	vigneshr@ti.com, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com, quic_charante@quicinc.com,
	quic_kaushalk@quicinc.com, quic_pkondeti@quicinc.com
Subject: Re: [PATCH v4] mtd: rawnand: qcom: Unmap the right resource upon
 probe failure
Message-ID: <20230912143726.GE6404@thinkpad>
References: <20230912115903.1007-1-quic_bibekkum@quicinc.com>
 <20230912142847.4610c0a0@xps-13>
 <5e80e600-b523-476a-81bd-93d2c517b7b6@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e80e600-b523-476a-81bd-93d2c517b7b6@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_073747_418462_46FFAA24 
X-CRM114-Status: UNSURE (   8.91  )
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMDg6MDI6MDdQTSArMDUzMCwgQmliZWsgS3VtYXIgUGF0
cm8gd3JvdGU6Cj4gCj4gCj4gT24gOS8xMi8yMDIzIDU6NTggUE0sIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPiA+IFdlIGN1cnJlbnRseSBwcm92aWRlIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9mIHRo
ZSBETUEgcmVnaW9uCj4gPiA+IHJhdGhlciB0aGFuIHRoZSBvdXRwdXQgb2YgZG1hX21hcF9yZXNv
dXJjZSgpIHdoaWNoIGlzIG9idmlvdXNseSB3cm9uZy4KPiA+ID4gCj4gPiA+IEZpeGVzOiA3MzMw
ZmM1MDVhZjQgKCJtdGQ6IHJhd25hbmQ6IHFjb206IHN0b3AgdXNpbmcgcGh5c190b19kbWEoKSIp
Cj4gPiBDYzogc3RhYmxlPwo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCgpZb3UgbmVlZCB0
byBzZW5kIGFub3RoZXIgdmVyc2lvbiBhZGRpbmcgdGhlIENDIHRhZy4KCldpdGggdGhlIHRhZyBh
ZGRlZCwKClJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9y
Zz4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprg
rr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
