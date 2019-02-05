Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1801C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:12:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF092080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H6Kki6fX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="VH4uR3kZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF092080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nhH77m0FxpKE2ngVo3s9z0QR4l8W6AILrV2SGR0lghM=; b=H6K
	ki6fX/MeVvT7Y2c/x6gcOq3bMBeosoMaOF31eq1/RFc49CweLVfRr+TbaciC7TfTAy2a55G0C+iH7
	W6ahqiWS+wtJ+3DIOyZKz3OUul37U99MuwxUddqbk64czmvxyLwRVdcqAdD2z+pqNgNzonMGH470B
	F0LlSL69J1LktfhojHDzpKQrj3b7AM72drBxny9Ka+b4IfJ3830fAFXu+4fRLtU62l/Hy+h4doft+
	Rg9DZ2jPPdJiuwmof2eIKQwshrDirIebpuAd9fFBgFf3qWkXfHhK1x7Fmy5wOHGyH/hgbQC8b1Oef
	chpqhp2EyQ8IuSZf/8Gq8P4UhKPfvrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1SD-0001xY-J2; Tue, 05 Feb 2019 14:12:01 +0000
Received: from nh602-vm12.bullet.mail.ssk.yahoo.co.jp ([182.22.90.37])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1S5-0001xG-2i
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:11:59 +0000
Received: from [182.22.66.104] by nh602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:54 -0000
Received: from [182.22.91.130] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:54 -0000
Received: from [127.0.0.1] by omp603.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:54 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 216643.46333.bm@omp603.mail.ssk.yahoo.co.jp
Received: (qmail 45524 invoked by alias); 5 Feb 2019 14:08:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375733; bh=Zr/VNgYFvgJe8h7Fzfy5wvrsFquSBp0R3Timf0Cqrwo=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=VH4uR3kZttkVF32J1NnwaJriOxrvYLgrKEOjJJWniaNm27YhLAC3xf46rkS3XuCTdxswkTRlP3bhjdvQp03TqhJYYG5Y1uUixGAeLw1X5obXSjgDb8tJ31X2UH1IEEDGduQXdoKPcKlDzM8X7PJTmlQqVhOdfLD7Rr8jysBXuk4=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer;
 b=E80jHyR/ylEGRSIKBUijwftK0otmbYt63r+UNQgdZlyno+MfFneBj26/efLC4OwhtE4WiGWiXcnt4PLwQDnPjiNMIgmNMg/f8zgXt61O0NrKK83e6tcEngYT46dAtnT7VWHs28be54smWhKO3wvoEpPkoaTqABtvjZ+mHkDSCs0=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:53 -0000
X-YMail-JAS: WGQfgO8VM1lF3OcEzapsTL29JZmdLy4dhMV7f0ri1he5HlDoQu0AdYgo9wustwxC_ahl3QfQA.an_jkeAYowgR7KmbTyXwxvMqne3Z1H13sqL5D4x_BLbT04ZkJwdazOkMEr5ddTlQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 9Q350ykVM1k9jokBNbONJ96ri1eHgNN4nMtFTUWAHRZpxOx
 s3VN4asGRkqS..sXX95obbcc9FJ4gdUyT1ljbLLUaqmfV8a0ATKULFHrYNJX
 FfgOZ_MMvf4NacvLwPy7EIoBhJXISM3IdznLYe.eYeLPZEaYBIo0zM2gECp8
 n1HAD4NfDFo3FJ.mU81s2TsO5H6uG71PTDGP2dCG1jTk3LHZFSRgiQloFnxi
 hdeVQrZuN8FPUzR4R9G7xxS8kfuXRudxRrAgalkOtqRj_L2wZl52UqPhERHl
 LW4R2JGyvJhOS9nR27HV4lwSZSGZVvQwtrXk8xboy0eG41BuuJlhXuZQSvU3
 zTzHG3.rVdLZsWfT5jGUi5lpQgEOAstOg0G7vcNZ16j3WevTO.NmQnirFSBC
 tsrWJ.sQrWv1klNzonlHPTQaUHj9NfXAiwTs17SBaFTLdqUTK3MKks5kaVaL
 89V3Zk10BekVL3tk15.Tg3OmfllVw26SnffU3xBFKUmoRKNXIpvCtUU0w8DV
 OaK38CXQQuxIhweFs8JjGr1z2vPk_BGkxfs_lBowh32g.PFEc73hbUSvDsfw
 KVsjS2.4v7v5tzio0qJKnzrV7uWSu5L73CNqhwlOVpf8goKzy
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 00/11] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Date: Tue,  5 Feb 2019 23:07:48 +0900
Message-Id: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_061153_433464_06338E32 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The change is based on the fix for flash erase to use chip_good() done in the past.
And it is fixed as same way in the OpenWrt Project as below.
  <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>
Also includes some refactoring changes.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org

Tokunori Ikegami (11):
  mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
  mtd: cfi_cmdset_0002: Remove chip_ready() from do_write_buffer()
  mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
  mtd: cfi_cmdset_0002: Call xip_enable() once only in
    do_write_buffer().
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
  mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
  mtd: cfi_cmdset_0002: Remove op_done goto statement from
    do_write_oneword()
  mtd: cfi_cmdset_0002: Remove retry goto statement from
    do_write_oneword()
  mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
  mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
  mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths

 drivers/mtd/chips/cfi_cmdset_0002.c | 274 ++++++++++++++++++++++--------------
 1 file changed, 168 insertions(+), 106 deletions(-)
 mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
