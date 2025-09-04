Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ADDCA1013
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2wEJJVjRyUHOqVc1FvVUz3gfk4jb89TPla5NCnWIayg=; b=f/TxyHvZcLOwl8
	605+HeKzre5a2Fty5DmPRAygnXTXb1I01oifmQNoeU5TZmslgJftfbVJUN0As96hSmQppirhKqNoW
	tCqwN2VeaF6ZkJrdtDuHWQeMCbVhxb7yTiUuC8zZCn3Twhil6DEZswBNglC9tQTNzWqr/M77wPdg0
	2DsO5TCJwLPBs61bnMiFCHN7X47BhMUptLlQwe2wK+w+OtTnN10sk/SsYVB8IjQzApivOxK8ST0wT
	w4ppFnLSaOFTYzqWEZv8KJF1S7QG4j6DrDvl0y3J98REkSI9EjPDJUhZ8+7/bEpV8pVs3QbTIEd+Y
	HxCNvSJqifyvIS0hvO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu545-0000000A7Bz-1FIj;
	Thu, 04 Sep 2025 08:11:29 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4hM-00000009zE6-2O04
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 07:48:01 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 8B5EAA8C96; Thu,  4 Sep 2025 09:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1756972076; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=rfkvTVqUeGFVjnyDAZBF8sAUPnnw/88Ptz1dUeR//MW5CaRY9AERWCSuM+l1lDuA2
	 yo/iFeork7yB5xUfNjMdk1XfaHfLkGFcmHDwkyJm2qeEMWkkjdAikk5IWJmbcjbVtr
	 mjhydyPZjLz5kbskgPioLjyu8/U9GR0qKqZLce9eAdRDcrecP50i7HYWFFRVURaPyd
	 J4SiPlJQk7ErepaFHEElHHMX5VD5QKRfr7uyydLkCDsQxrDyFZ/UX1lnVpAny5NsQo
	 6N7vsLdJQbZWSODWC70uWD5H9NuqAl1xjLcF58Z3yBg9WtU3H+j5+Ja1PpHIRzJUM5
	 kCGXSi95So69w==
Received: by mail.vexro.pl for <linux-mtd@lists.infradead.org>; Thu,  4 Sep 2025 07:46:04 GMT
Message-ID: <20250904084501-0.1.n7.3sw1h.0.7gycq5g63m@vexro.pl>
Date: Thu,  4 Sep 2025 07:46:04 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_004800_872708_157D514E 
X-CRM114-Status: UNSURE (   1.32  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
