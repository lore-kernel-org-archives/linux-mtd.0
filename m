Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B34BC021AA
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WJhLdgoxLf7NZpGI0VYd/gvx9V58Z+FvHsHHd3bEik=; b=CZ2lWMhMHbIioH
	uBgruRqMM9OYI8uzKmHK3CI+fWrPin1lXr00hlVa5wzYjMvipewq8W/PIzGF8gKMZ2yL9+w51Smp3
	X6oYU4B0gYd4YSC6FzJjJBCMNf60LW7pJcWf43aVYELwDK+KtDVaKs0JPx3lPAbclju04RrWd7UBe
	ZYY+WuvXlnUxUFsnS8buvWIZqTfNUYUf+A3KlQWukUcD6SsQgicgynd/sONvnv8jy2fNtEMwWJ7S6
	KDmfFeSTAbB/y5OP4jJyAK+vcpxCWRC0iXeusGHw2/dDsxxlGOXLDLq6uRuHmpa8HOVVK1lrFo/P/
	D7tGvj0v78KOU733Y+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOot-00000004njl-332D;
	Fri, 21 Feb 2025 08:55:39 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOmD-00000004nCy-2PU9
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 08:52:54 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 2AFAF2548E; Fri, 21 Feb 2025 09:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1740127585;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=IuUwWxiD++tDhvnwf6QTIJXeESddozUqlXu82FiOq0+uv40dd8K3lA9BFbzkgH5Um
	 Qazmc3NCe8mdgKXXdUJNaL4xckoBC8C9APS/R4DfxjcMZdzwaNSfxeT/Wo3vECsarv
	 54ObqiJXaHWpNmDVJMxvpONTfzfh8k+6vSNUQdu6/qDrLJzIh2LcGpH9h4jkGm9Edg
	 ZGwj2rcuoi1TfJwvLQqZrR0c411G0R0nCwxrX3yFx2mk56NF9Kx1nfDvoKPLXXMqlV
	 W3zNd5yOcyVfDSmGaHLxO048RXoie+TmWcnMcGgue8WBmanREK+M2tw1IjQX8+X63g
	 gSSiVz20OS5Sw==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Fri, 21 Feb 2025 08:45:52 GMT
Message-ID: <20250221084500-0.1.gm.2i997.0.hlqoc2adp5@completesolutions.pl>
Date: Fri, 21 Feb 2025 08:45:52 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_005253_753699_970553BA 
X-CRM114-Status: UNSURE (   1.62  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
