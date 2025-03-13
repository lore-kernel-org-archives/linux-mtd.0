Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF99C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WJhLdgoxLf7NZpGI0VYd/gvx9V58Z+FvHsHHd3bEik=; b=iWxgU7khNcMXrh
	RZCmvXcpol553Q3NSvyL7pEOxYSWRfG5DCg+qixGFGeQ53L8uPwbGlbmtir1VE/O8a8I3C92Kqobz
	F09pclvzpaXmlI5dao7RRHFPjcmBwc/G2eVyFFphmc/jo1A4U3l8PRVBZHVWqkCtg2R0mpYDtdzJa
	ySTdHYPb/m1Ifq4lgGllFTBYTelkFXDXpKGFgyGRzPFE470f+bMXWWQErLE0dtwAUVpTTRYsSUWwA
	2RPXtVJD0DcWSoKKxwOaMJ4H9RhaZ0bndnQpktIhjzEB39Uzj8Ytwi1nt3Z4RlL4LrU81OgbZypNw
	OOA7/LZrx0tOZfnlKPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseFH-0000000Ab8l-2ShK;
	Thu, 13 Mar 2025 08:48:51 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseFE-0000000Ab6q-2Eb0
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 08:48:50 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id DF9E724D38; Thu, 13 Mar 2025 09:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1741855661;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=ohm2WpxHLSPPaaxD7Q4XcnFxsOAm4XGvnjJcGM8P+ysT3uVneIpg2aFr99+hKMezi
	 dQWWcfcmiwl7WmYipwN7IDw5iT9cEMGm4lEu8l8z5eCruMZs9EpgWW7vo8p3jt37Ok
	 scypIzuVd6fe3vR3GYwcc/lw57GU3QUSLZjQwJJ+1p1GOFB90rGv1POSASbZkV9ubb
	 DslFX054FDcsWotvhHJKdfbKYAYwJ0pa9GTSJxLzd6lM+YLMkK0c9p4aYz9WKhVEu5
	 hGqHx/Wmf2rt62jlAg4LIn2Q5tqytCAK2Nv2ZU1zV+Y/1P08PrEtJuZwxxhS0KjfMQ
	 LgTpObqmgloDw==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 08:46:11 GMT
Message-ID: <20250313084500-0.1.h0.2ob2v.0.31461bd2mw@completesolutions.pl>
Date: Thu, 13 Mar 2025 08:46:11 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_014849_244579_B8318BEB 
X-CRM114-Status: UNSURE (   1.52  )
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
