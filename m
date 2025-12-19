Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5E1D74964
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Dec 2025 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aSWWdKXBfhiHpmmnRgctBIZxKmX/BMNO1zcOjmanmkc=; b=NHdKhLgOuRWFNc
	Sz84HG96vT864zrTyEKvOPUuhrajD6HOKf7TfVS3qqQ8JknJuiHVh6JymQd1bDLwLJgkPi9H45hB+
	EoqPY7raSP0THMriKWHGRGjbbmgxrEpOfL1BytOY9wmNUOjjrWp52KDFC0NGmdUF6YzEHyFeHeV2/
	vUMPWLWbqVaW9Bk8QTnz7lgFI+kMLP2jtuPkSITrEdecufLOqqBySU54BD/oTDtL+StaBiU+z9L4/
	pRBw0ot2i8PIUVBSFVm3L0BO/+AF1agESIQPo9b6Z6zEqm7jKGbtz0Is/RmHP3iGvQupa3rqxUNui
	ZyctmQ9m+uG4go1JBg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWW2C-00000009spD-0iDT;
	Fri, 19 Dec 2025 08:40:24 +0000
Received: from mail.bizexo.pl ([51.75.78.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWW28-00000009sod-1RJ0
	for linux-mtd@lists.infradead.org;
	Fri, 19 Dec 2025 08:40:21 +0000
Received: by mail.bizexo.pl (Postfix, from userid 1002)
	id 0E825A58B2; Fri, 19 Dec 2025 09:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizexo.pl; s=mail;
	t=1766133057; bh=Pl7RbJExSy+xwIfg0f6KsghPAQsAhOrZ6VAmcCcu47E=;
	h=Date:From:To:Subject:From;
	b=QVpCErhjFq1FoiR/zOEyZz9gvkuNcWromzfEnuUgcVvy8i7S2okp9NC12WvPPFe8i
	 2HHm8jjg4OC7Lvf97sEzMsCEAj8w3dMUaaPVjgZWLesEcZ8P6vNm3D3dDcc/Cu1Nu/
	 WbNRKsWOUezrsiuosdf9tjvNrzeHa8xcu0GQosfafX6ow4ZO85xG5VJSfn0npHSUZC
	 oIzeHE7RR85GocZLbdCYkjGmt6YA00bMxwK2zLlrWQe9LP6buaFcDqHMCUHyuVEOoD
	 +GLEZ6maSULWHuHQLxO53smFeq6ehsqZFXi/hZE2n/fjEhaOwbaPHu+1xJH5F+rcVe
	 MVGmjmSA05Vpw==
Received: by mail.bizexo.pl for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2025 08:30:56 GMT
Message-ID: <20251219084500-0.1.s7.4ur0l.0.qghxvt8poe@bizexo.pl>
Date: Fri, 19 Dec 2025 08:30:56 GMT
From: "Jolanta Wnuk" <jolanta.wnuk@bizexo.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Uniewa=C5=BCnienie_umowy_frankowej?=
X-Mailer: mail.bizexo.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_004020_532365_36CB8FB6 
X-CRM114-Status: UNSURE (   1.77  )
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

RHppZcWEIGRvYnJ5LAoKamXFm2xpIHBvc2lhZGFqxIUgUGHFhHN0d28ga3JlZHl0IGhpcG90ZWN6
bnkgd2UgZnJhbmthY2ggc3p3YWpjYXJza2ljaCwgaXN0bmllamUgbW/FvGxpd2/Fm8SHIG9kenlz
a2FuaWEgem5hY3puZWogY3rEmcWbY2kgd3DFgmFjb255Y2ggxZtyb2Rrw7N3LgoKVHlzacSFY2Ug
a3JlZHl0b2Jpb3Jjw7N3IGtvcnp5c3RhIHogbW/FvGxpd2/Fm2NpIHPEhWRvd2VnbyB1bmlld2HF
vG5pZW5pYSBzd29pY2ggdW3Ds3csIGNvIHBvendvbGnFgm8gaW0gbmEgendyb3QgbmFkcMWCYWNv
bnljaCByYXQgaSB1d29sbmllbmllIHNpxJkgb2Qgbmllc3ByYXdpZWRsaXd5Y2ggd2FydW5rw7N3
IG5hcnp1Y29ueWNoIHByemV6IGJhbmtpLgoKUHJ6ZXByb3dhZHppbGnFm215IHogc3VrY2VzZW0g
c2V0a2kgcG9zdMSZcG93YcWEIHByemVjaXdrbyBpbnN0eXR1Y2pvbSBmaW5hbnNvd3ltLCBvc2nE
hWdhasSFYyBkbGEgbmFzenljaCBrbGllbnTDs3cga29yenlzdG5lIHJvenN0cnp5Z25pxJljaWEu
IAoKWmFjaMSZY2FtIGRvIGtvbnRha3R1LCBhYnkgb23Ds3dpxIcgUGHFhHN0d2EgaW5keXdpZHVh
bG7EhSBzeXR1YWNqxJkuIAoKClBvemRyYXdpYW0KSm9sYW50YSBXbnVrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
