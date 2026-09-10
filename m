Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA21C79FB9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyuTV0P5aqIsvFOpWJAO7KxB4SX/6w38OSkf9sI/CUE=; b=kqfiLXlnTg5ylB
	kRQ6wmFpzQjCrkeoQ4k/K3756zSwN9dE4UxNgHLwPue4GqtxlqLqFTmziV3ZBx80B1sY11s1muvEV
	qpd70QJgdceOa/pMyJWUxbuzF7KGZWnvkzSo/u9b/EPq+9NpSvjeGQVIVXoEcoNR1yKeLQJI5pjC9
	cTNNq3aIgoPzfSdl4V9u9G3S7HAyxRVNfsC4DMdP9kbDl2vBHjnHb5h+b8j4KHQQcOW4zkrOfaH9o
	0SD40Yho50N9yh/YN5jh3TQ4RE3uBQGWkmLx6FoLu8Qa9WIpZ7gTTcs79ddXny+mv1MhqHbH05tmv
	amkIgUiqz6OYZ0XyjVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e6l-0000000EMX7-1TNi;
	Thu, 10 Sep 2026 12:42:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e6h-0000000EMWY-4BWk
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 12:42:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DECBBC653DD;
	Thu, 10 Sep 2026 12:43:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C21E5FA2F;
	Thu, 10 Sep 2026 12:42:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C18A611C7942F;
	Thu, 10 Sep 2026 14:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789044140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=emRs8TVGLp7CDj6L8UUWJbEMGYVcjNGljr4x5y1Fbqc=;
	b=0dmmUG203ziZOKhEZV0GqNJbH1k9/jQkyT1pomwJQ8GEBIqfbUHEzuhqzjv3u6j3bNxgjT
	MFPxsxtBFR5vHUKBkE3HJbnlTXnU6vaIuwm/tbNPhuvtl81x9zionvOm7Qy2MlzCruDo8z
	Ou4upUUzzXb6YpUtw/vDJ4CBNT1qYjrwvorE9JNkoqQGCloESLzdTTZDbcVQ1Mo6UMBbR/
	bmzvlrFPvhPNs1eeoE8Z9oeC/2/uIoLYJMkPMwIdvlQYWOSzn8XH4pbRYbgNkNCz6VDx8P
	8UZPpg5zF0j1kfQOSrn6ulI67IYFo49xNwjXN5JDJsf2z43TGpoeq87avrFcbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Zongzhen Feng" <1768315307@qq.com>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  "Richard
 Weinberger" <richard@nod.at>
Subject: Re: [PATCH v4] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
In-Reply-To: <20260910042619.2A3731F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 10 Sep 2026 04:26:18
	+0000")
References: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
	<tencent_522792EE6F63A5581C238FF17E9862F10A08@qq.com>
	<20260910042619.2A3731F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 10 Sep 2026 14:42:15 +0200
Message-ID: <8733vhs2fs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_054224_200462_FDB4B953 
X-CRM114-Status: UNSURE (   4.98  )
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

SGkgWm9uZ3poZW4sCgpPbiAxMC8wOS8yMDI2IGF0IDA0OjI2OjE4IEdNVCwgc2FzaGlrby1ib3RA
a2VybmVsLm9yZyB3cm90ZToKCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2Fz
aGlrbyBBSSByZXZpZXcgZm91bmQgNCBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Cj4g
LSBbQ3JpdGljYWxdIFBhcnRpYWwgcGFnZSByZWFkcyB3aXRoIHNvZnR3YXJlL2hvc3QgRUNDIGNh
dXNlIHNpbGVudCBkYXRhIGNvcnJ1cHRpb24gb24gc3Vic2VxdWVudCBjYWNoZSBoaXRzIGR1ZSB0
byBpbmNvbXBsZXRlIGNhY2hlIHVwZGF0ZXMuCj4gLSBbQ3JpdGljYWxdIENhY2hlIGhpdCBsb2dp
YyBmYWlscyB0byBjaGVjayB0aGUgTG9naWNhbCBVbml0IE51bWJlciAoTFVOKSwgbGVhZGluZyB0
byBjcm9zcy1MVU4gY2FjaGUgYWxpYXNpbmcuCj4gLSBbSGlnaF0gTWlzc2luZyBjYWNoZSBpbnZh
bGlkYXRpb24gb24gT09CL09UUCB3cml0ZXMgY2F1c2VzIGNhY2hlZCByZWFkcyB0byByZXR1cm4g
Y2xvYmJlcmVkIGRhdGEuCj4gLSBbSGlnaF0gRXJyb3IgaGFuZGxpbmcgbGVhdmVzIGNhY2hlIHZh
bGlkIHdpdGggdW5jb3JyZWN0ZWQgZGF0YSBvbgo+IG5vbi1FQkFETVNHIGVycm9ycy4KClRoZXNl
IHN0aWxsIHNlZW0gdmFsaWQgOi0pCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
