Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D3CEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=FMsjnhvX253XbC
	N843WjkaLEgkXWsgUBdDtKz5sKb4ZTyyzPgrBxFcAj6qFU2kwLCBPsWsAM/U4g8GwSilrJVnuEuPP
	XObM2YXI8HqLeZK8+IVJLuXew7ygWri28a13wSUTFeQoDIYdin0LhSXwyrSfIlp0xwv3E96qniTYW
	TcHxiJ3cg6kyP6fpgfzHn7S/6vsy90B0nT+Wv4IYYBd3JuGNXNFVKhuAJFVN+CqnLBBGBHsaEk/IC
	0Jliw8WvTfwzkRhmlQ831Xyzk2U/Q6aps6z6zOhBbbTEvHeICxM8VZ+30vG98fRj0qcncbONq/xSX
	Vjovpmy9kdSKqh2S8hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jHU-00EIOh-0F;
	Thu, 15 Jun 2023 09:28:40 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jHR-00EINL-2D
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 09:28:38 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id C57CF8752F; Thu, 15 Jun 2023 10:26:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1686821188; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=DfzuwWdRA/H5HFv2rt+HkpAi5vLji62Jfpzdi52xL1MrAWQV1mYPMQnMuCrIcQABa
	 uhZ92LVA2jBPtmMdU20H0pz3yWCBlh5zF72KCQ0xr7mDH5jstQiWL4ygrZjvRavs3u
	 laan26FkNAV4YvvEsryjVOpsbYGw+eHriRCO8hO7B08etmrSjEwu1vQfm7taN1rjyo
	 3ZCX51pMRI9IR6FFJbbtmHNz3W+ektObKGU949by06JAyN0YvRJdi6CXXDgndVf5Vi
	 MZZC1VptYmw0eH5VXVl5peBGvhfdpAb8GQuP8Z4KD1f+OzR4dlIogFhmYvfD6jiWCo
	 CeCWHkHLYpiEQ==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2023 09:26:02 GMT
Message-ID: <20230615094301-0.1.6n.2mda6.0.er8gn4d06n@lokoho.com>
Date: Thu, 15 Jun 2023 09:26:02 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_022837_879380_1CC4E420 
X-CRM114-Status: UNSURE (   2.07  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
