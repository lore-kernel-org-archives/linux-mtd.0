Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8ACC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 08:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B5F8610C7
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 08:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B5F8610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CyO76hJ6NV0ax26jvOcr5DGN9IUP4RCThIkrFA/IIY8=; b=pezca6JVs89hU5
	9ZypAPLfAqu4SbwmYEyNpTDN+V464YD1x22NoZ86jFravBXENlxsWYiaKoDetdNoNO/wqxnIYn9jK
	JBs8Ue47drI2hAij2NHbmblF7MRFw6e8bmsD+T4j/pIhaKaKvP7qAbsk3E9hCY8RBl9HEmxAgc/dZ
	fZF8f/QAoe84AmKJAZypQLrMwR7lZ2SsGpLKUUdXOaOIHiOWqlzKwlPRI4trViUT1ewuU+WZe5AmR
	58Lfaqd1AKYk7hbHB491PljhodOqHKCq1z/FQ6kPQpQMOA9KujM2iPt77fvP/w/Atwab7p0IpazIg
	ZP/c71iI0IpHH2Ja5Mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg0Jz-007DbZ-6h; Thu, 28 Oct 2021 07:59:35 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg0Jt-007DYr-KC
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 07:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635407962;
 bh=jmSqqwsTmKlXEHUVDmzYrAqJX1kVbs9mcRUpYNGTweA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=cVZ7YNWY0mvx2BhH7pIDHOixPNAqsGFIHTU0UORN/+LotTb91Qubs2lv1MiEY+Veb
 u3hbcLuLYyAPq24MsvboZTB35viRmPy95YJX/TDs1pr13L8INAApHKMrBa+bFB81eR
 hrKn8bDyfXic73Egyss3q8/08M3sOCdyiKyegjvg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.131]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M8ygY-1mc8xr1x4w-006APr; Thu, 28 Oct 2021 09:59:22 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id 2F5EA27FC40; Thu, 28 Oct 2021 00:59:15 -0700 (PDT)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Stefan Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH] ubifs: document sysfs nodes
Date: Thu, 28 Oct 2021 00:44:04 -0700
Message-Id: <20211028074404.9739-1-schaecsn@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Jrw2wLUw4vnbpuLx6LVkh6aLNEeKDC0j/lA3eLQnyEl3bzpfbMo
 cYHcKPjRQQdehc4J7zv+tCNluHs1XcdKguzIp/DN8Pp4u80OalAOWyjMxvBYJtnrAixhqYg
 BNy4B/Tk3NKHYKZht6t7c3Fa0hDo1JHMegaGSwKMuMHPjJKI9b/fivXKFayEcW29NGaVnP5
 YnYluGMXJKR5n1J7Qg1BA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KP6gfw0l2A4=:ioIF4Tgg4ilz/G/7/eoSDS
 OiWyY4SR7zwrzNKZH5BiPzmnKWt+pPSZs3GK067+d83ku7CHtlugdCbVARj9XHwB4XNir/a9b
 Avq1qzSjM2rExvGKKcstL9UvT6p1HzCkpK6JVKgm+YO8uUswgj6THgGgUechuD3EmCfd0Ad8e
 aBP5X4h3tNb5arGEW5qJd30qhgOe1mTRuEw71hK8UARGOhf5SaYY2/IalzmiXMhTStTOz9fuu
 mRwnS9eM8aPqCSmu8oxDm5B6n5NW48LtSkED+NljYqL0tXOAptrf1s+FUHwPCdvnNDd75eDgm
 25jIu9w15Ife2Ho8afpYt+TXCD49EBiq9GtJHTNtrVwSMiEnfgxoODwVlXx3U/3ZhoCdSxbX1
 pdA/o2OpbA7krONhR3tLV/SNsTWSma6GZBQvQvpWxKk8nBarZS1ssg9jL9/hr042x0QNFZz3s
 BNv7/xJCejRjJbZr0jCPx7esowpI/RyZTN4/e5pgcttgS2WaYW50DBeio7ZA1XbK8qE1PyBQM
 TFkWbi9yeuadhke/pWvzRa1PYB2FZxNLM8d+Au2rayV0/TWa2cOO4dZfVRH2qKdqXLznF5d+v
 NYu8kEKYJTktL+55d3uiOMs59O06cAIUDZAmaHNyO1PR6BxVUgcghDUNZ+Limc25HoYKpbY0B
 R9IFkNSjuFhNkpbEDcZoGN+qBNKBT2dlpUqcaS1RgQ2osYVSg1s5Pdcxi9x+Bu/dNDF1MnQNG
 aTT9GBp2+N8+PR1VOIY4l+q71rYozX4ik3Oa0u4Bm9H+nyhCqy8w+MrtLE0KPUMxYE25bnibz
 5t/JDQGl8MJtnzvyqSLQulH8ffpLNVZHdZqM9qr3sNVrKYMsqNKJG5g8+O0W2mR0NCL/cQBoE
 uydkoD6qN/2L3LG6g1GxygBNjdfWKQq+rj1lLzuYRHiZlvdArSWT/Vciwek7XzWB/MwMLu79K
 wrJxu7a0qLCUUdFYF3jsN02kpDVFTii3T9OoBuruF1WPwPvtwG33ZWsT5rpqk/CiorehXZaVz
 jDNtP/nH021k3kGGxPA3FEKBhQf7A8hKb/NPzzIOioEossHKshmzm7b+XPwiiUkYdXVysiOJa
 2sZsB8/Ggi1KAo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_005930_001232_AC5FEA08 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Stefan Schaeckeler <sschaeck@cisco.com>

Add documentation for the new sysfs nodes

 /sys/fs/ubifs/ubiX_Y/errors_magic
 /sys/fs/ubifs/ubiX_Y/errors_node
 /sys/fs/ubifs/ubiX_Y/errors_crc

Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>
---
 Documentation/ABI/testing/sysfs-fs-ubifs | 35 ++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-fs-ubifs

diff --git a/Documentation/ABI/testing/sysfs-fs-ubifs b/Documentation/ABI/testing/sysfs-fs-ubifs
new file mode 100644
index 000000000000..19a8ebf7fe61
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-fs-ubifs
@@ -0,0 +1,35 @@
+What:		/sys/fs/ubifsX_Y/error_magic
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Exposes magic errors: every node starts with a magic number.
+
+		This counter keeps track of the number of accesses of nodes
+		with a corrupted magic number.
+
+		The counter is reset to 0 with a remount.
+
+What:		/sys/fs/ubifsX_Y/error_node
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Exposes node errors. Every node embeds its type.
+
+		This counter keeps track of the number of accesses of nodes
+		with a corrupted node type.
+
+		The counter is reset to 0 with a remount.
+
+What:		/sys/fs/ubifsX_Y/error_crc
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Exposes crc errors: every node embeds a crc checksum.
+
+		This counter keeps track of the number of accesses of nodes
+		with a bad crc checksum.
+
+		The counter is reset to 0 with a remount.
diff --git a/MAINTAINERS b/MAINTAINERS
index b43662a9a5f3..a8f0e3e38b2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19105,6 +19105,7 @@ S:	Supported
 W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git fixes
+F:	Documentation/ABI/testing/sysfs-fs-ubifs
 F:	Documentation/filesystems/ubifs-authentication.rst
 F:	Documentation/filesystems/ubifs.rst
 F:	fs/ubifs/
--
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
