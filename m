Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC50CAC5BB
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b5VZI+Krj9ka31hDHOlpfItmVc+TtKiClEcFLdIK15E=; b=fxjifRv8qqZZpd
	ak9EbbBWE2usgK2gp+vUzH4J1K34zQ8SpaUcUC5FkEKYDatq9HOXLDJEmrSr6ExAHESAnzBrIy66e
	MiYLNpwFz5sNe4G3HIBzrSAwUVCSvuoFpPLRaVr1eUwTA9eM+uBcxN9w8Qjw+e6VWhTPa35VP4LTS
	+6qLK7MXfqdpuVs9QVAu5GXxiFLCD8uyvhIRKdtXEDJgW4wKDReIHRRRq5muhgMjIcRi/vhcJUiJA
	Ecwp2UM39niBM3i362w98f54Dw1hRBNZkOAgSpg+aFQag8mGAXS2/FZTqIqDZc8gMfL97uBtrzvWF
	bJm40ws48fQ0RoI/7ocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v789p-00000007x1Q-2Un0;
	Fri, 10 Oct 2025 08:07:21 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v789m-00000007wzk-2iFF
	for linux-mtd@lists.infradead.org;
	Fri, 10 Oct 2025 08:07:20 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 863CB2ACC2; Fri, 10 Oct 2025 10:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1760083261; bh=JvuWKFUQUJpOJ2bAkrqaCtACbxZAO0avZaBH++nQ1CI=;
	h=Date:From:To:Subject:From;
	b=WU9VrJmcWkCXHTxZJoDVUQgBLQ0pO7YQXF6MWOkXOCtiYMjn9fiT9hVK9WiWPc2T9
	 LuTJvLS96V3ftp5bDgSqSRtc+MidNsZASYf+/4yXUQI1/sU8eHBbw3h5swc3a6W/yc
	 8TjUk/iub3XZBZeaWgyd5iIfCJhT9yUTj6Sf4S8PDsh08eLXzH2HrzkVujtl+e90Tf
	 xxgesKDgB4ZWgXE0peUGVik0vZMS2ZcCev1FHbt0DyglyYh+DWUeFU/gmyKdCiNIn4
	 e2oOnQknCEEasGc1d8UscT1+m7zvDEJi+fP7IdMKOfq7A6q6C7o7Cn1dRz589RbqAl
	 TDUfOv0KeEZKQ==
Received: by mail.biznator.pl for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2025 08:00:24 GMT
Message-ID: <20251010084501-0.1.k7.26yy4.0.jp35fr4z91@biznator.pl>
Date: Fri, 10 Oct 2025 08:00:24 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_010719_000728_F78F99C8 
X-CRM114-Status: UNSURE (   0.94  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KIAoKUG96ZHJhd2lhbSwKV29q
Y2llY2ggTXJvY3prYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
