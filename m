Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C312BCCD193
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 00:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2JWnma2OZteJ0nQRthlbYAqOPlOFce6SXPBFHfkK2f4=; b=SxnDsdDKB8oTBl
	ZQ1MDA6WX8UiO3iZzn6Ad3XO0YMghhDn68C3udXtyZAWtcMNokVroMkOyKj2rg6JDPahsZ8gmygkI
	+j31W/yv4B+u/qWiQK+G9EXyNtBaeWMh5X+SiT2WgxNKYgbQJKWqOOKy2pVNsuf4SDAZV8J2R/alJ
	xbUNH4GztNDyiuSdlJ7vf8BMI1AMLiedhroqaNkjsQ5Bgqx90i8XgG9W9o0LHuEopHH/o+gnPoW2m
	I5x17iyrBv7IK6NYKOoSSI9Cy+tmlr5XDe87x2mzOLhPA+tzjRrPCyavqFmCEdOdpfxf/J95Oc0nq
	mrM6CDKTJuGGNY9VjSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5dU-00000007u4o-3QZ6;
	Fri, 24 Oct 2025 00:26:28 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5dR-00000007u41-2Pcx
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 00:26:27 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0E7382C01FD;
	Fri, 24 Oct 2025 13:19:49 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1761265189;
	bh=ZupoVAigkdpoTMBJ+8X5ukJ5HKFW2qvccHluhJLygIE=;
	h=From:To:Cc:Subject:Date:From;
	b=SSC63OpnVhGVbHuEf7m5IJWMni2as0eUyVNSEuq+EHCWJUvSn56eqH2i1NXUbC3cc
	 fhAB5qCj7i0B05PcUZldExThV/Js9K+Bz4APGwawEZieRqtHUVV58Y+P026zHvAlOa
	 Y8ivkAiphXfVVOMuIkwO1htsx0O5CG/2Rdc0TA9ZfDBGkDmu9QPx0O6ceRjKoJT1xz
	 iGH6FUaf1nt1HfXgoKPjkCG+Uk0+nBfREyqIOW1IA19ZpuW9D2eUJB06zj1XvmmefN
	 MpPBBxcVyuuKP8f5F8FF0PmBspfGuF6htQ3pi5hmqTC7+5t9qMRf3jTIGlLp+nsSyE
	 FdQ8ulfPbm5iw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68fac6240000>; Fri, 24 Oct 2025 13:19:48 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.12.16])
	by pat.atlnz.lc (Postfix) with ESMTP id C40E913ED0C;
	Fri, 24 Oct 2025 13:19:48 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id C23512A0433; Fri, 24 Oct 2025 13:19:48 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v0 0/2] mtd: nand: allow unconventional NAND layouts
Date: Fri, 24 Oct 2025 13:19:40 +1300
Message-ID: <20251024001943.29557-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=NbFF1HD4 c=1 sm=1 tr=0 ts=68fac624 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=x6icFKpwvdMA:10 a=E9JnvtB01pNfywlg1hkA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_172626_079225_04D46EB7 
X-CRM114-Status: UNSURE (   5.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently validity checks in nand_scan_tail only allow NAND layouts with
evenly sized chunks. This results in controllers which use
unconventional layouts to fail these checks. To pass these checks
the marvell_nand driver would incorrectly read pages (leaving out the
unevenly sized chunk).

Relax this check and remove the change which modifies the layouts
resulting in errounous read/writes.

Aryan Srivastava (2):
  Revert "mtd: rawnand: marvell: fix layouts"
  mtd: nand: relax ECC parameter validation check

 drivers/mtd/nand/raw/marvell_nand.c | 13 ++++++++-----
 drivers/mtd/nand/raw/nand_base.c    | 13 ++++++++-----
 2 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
