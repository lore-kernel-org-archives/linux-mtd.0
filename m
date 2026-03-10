Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6062EB1054
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFIknpa/iaZTp4/iCB2YW84G0NycnAW/rp9P5TK69bs=; b=ub1dAYY7uh4SRg
	FRxeDcE5JnzAFVkO2dBZ1a3HmxUP0h27xYq+JWHKN19sGUoGzRQXWYA2G0noKFT+8Fn7FEmslJuwK
	nwPZvJSORChyLrMjt0L1RrKVHKz0sX+ixQeFnsM8BE0QDGEPmFzzfGkfbc+onluipzfWsszmz0OFq
	usTwPsjRv2fKm/E21Wa1+dQoyxdnUrZylm1syUmczvE4cL/XshFG+cz1GIhFpOUlJYVtrBq4shqxE
	wWqMMUULRkDLYqJFmEekKzXmTosGJpBj4rtFNQwDmNLqgMeArZG0/X/YaJa1DI2qjuYPlVAVcAwH1
	x//phWMBkrOB+0wYrmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviW-00000009Npk-2yyo;
	Tue, 10 Mar 2026 11:57:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgi-00000009Klo-3qVP;
	Tue, 10 Mar 2026 11:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=XP4gpPWqTj9pDSzwMZXMboF2wk9nIzIBQDXj9hzH44E=; b=MpUY58TxhN1hpy5a4vApv0BQYt
	mt6qvEdADemNTPh7b4gX0ILzsME/+smhA9EaBIRpp5p80HJMcvsyig88sPyBxTfujKlA8A4XfEhL4
	Ma5+EOOoa6tBrigoAyv53jDX5s6uhKojv3wZPOlqqB/9LPMua1fo2NFETWPa0P/+05+KWBdB5gVav
	+J2z2cqio/n6Xt/xTHvGrbzDzP9368o10AtEzgcNGdE1ECELmXKNgZzDt2Ngh6XTP8Hx8JOP9cAq9
	t4TcnX7Qb7+5lGFKGqKZerwyHLyIbOx0qySreH2MmfYNs/Y/I0mcaYUn6sI5tfhGXCnq3FvLeryb7
	+vhVh7ZA==;
Received: from mail.avm.de ([2001:bf0:244:244::119])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgb-00000007lgI-1INh;
	Tue, 10 Mar 2026 11:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143726; bh=Ch69HE8buqP46euP+YYFTxXSo2whzs/OaZa7KOXrnvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cflriKS/Uv58AGT33/uwNkwB7J2sdEXakW9Rj3yjFGXI+RI4a366cceElHliZyuuJ
	 mPSZ4TFmYIg3AF1ANgH8AJ4fIbLOCMfBhLuXzJMYqTbevJEc4r+piLw+nWaz0hy5uE
	 Y9GvHMtmRIkJRf4y+wtLqshG0kOCxTBOOJdztUGI=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ad-2367-7f0000032729-7f000001c97a-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:26 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:58 +0100
Subject: [PATCH 32/61] net/wireless: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-32-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Johannes Berg <johannes@sipsolutions.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=Ch69HE8buqP46euP+YYFTxXSo2whzs/OaZa7KOXrnvQ=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZCB6VtswQFIkNrtK394BinlB0uxLllvDTnj
 z6f33li4q+JATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGQgAKCRA0LQZT0ays
 29wzCAChPFrcW+FfvZBVjABe7F29XZ5724a8XRQE85Iu6UGQCVTrGSBLyo8jXYsg5J3peaPVeKT
 KKhoEQfBVKbt6EAaScrTEpLi3KNOnd86Q8Wna7PddPHX6e15k2MlGUGDjd2Bw64F5NdG8ERAjc6
 DA0lCDlLGGjTu5XPxTGz5ABOwv4DjK6Yeb1iOXElewR1+d8c0JuR13TfzCtZK7b2pKqoZzkmtsk
 88UMWo9/5GiOCX9lUMyP/7qRCJPVDMHslX+kZfg6K27OVxqrHU+QQ1K66P5yscc52ULdw9obFw9
 w1Ny2/RuJ7C5Uaac1egGmoDY7u2Te8bNEht0/tO/Xq6O2NMq
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143726-964B0E1F-7D6D0A0A/0/0
X-purgate-type: clean
X-purgate-size: 919
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115541_564229_4EAE7B66 
X-CRM114-Status: UNSURE (   9.85  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 net/wireless/reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 1c5c38d18febd511285bc4aab93a60b4287dc054..222764a151ea25bec6179dbaffa87f34fdbf8da6 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -1014,7 +1014,7 @@ static void regdb_fw_cb(const struct firmware *fw, void *context)
 	}
 
 	rtnl_lock();
-	if (regdb && !IS_ERR(regdb)) {
+	if (!IS_ERR_OR_NULL(regdb)) {
 		/* negative case - a bug
 		 * positive case - can happen due to race in case of multiple cb's in
 		 * queue, due to usage of asynchronous callback

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
