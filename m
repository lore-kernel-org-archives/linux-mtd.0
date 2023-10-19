Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248BDCDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WLtvOuTJCqA6F5D7dINl5i66pgGxMo1F0SaTpRMqWsA=; b=3p4kv+4MdsA9dO
	OShKlvWRdVmbxi6FNZCfDVMn3K5EH2rGfyU2WS8FCqaG7DaVtCRXNiT7/9C+mdfNICJODm8It61em
	2zm5Sk8FVj1X3gE6LJWBzdQN6InV8kGckproTiSpz4QsgoumfRWBmazMcpYYWN839wn9N6U/w1e5g
	gjpj/lTxWy5B5jZ/VNOec9e7G2/foiCZcn6YJKGFPV3Trp8lryhOU1H/tDRdEIYAVNFcDD0jtsxDF
	c4VuuB4Y3p/b0sYmCcS2crnLIqLtJXLU0/rkcO2NgmA9gOE6ngDyA+QvVD+TN0f8PQ4r4nTTPrxFv
	IFELmfUmctDxuBb+ttzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNcT-00GcWN-04;
	Thu, 19 Oct 2023 07:39:01 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNcO-00GcTn-1x
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 07:38:58 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 90779120009;
	Thu, 19 Oct 2023 10:38:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 90779120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1697701127;
	bh=qHjagzBNZKS0ba9ZInkR/Ivhhk92bbpsh29/iG18+hQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XxpYGcDJc+HSvMqApotEG9nODqofEAVEDU0s/+s+2xDHnTt+0yuAUJAb9NvbGZJAo
	 YNteXy8I1h3cJNE5/V1CkhHivhC7nXjYD/lf52rreWoLhlCGCtBUS26E+oGRBfDE2m
	 azqe5fa68YAQri5RVa//rVlaEJSlSQi9SMKmbKVeOig1QsX+uCxkRdqj8z0M3rZBp9
	 SW7CE12j1DwfXxiUi02zUKZR9xAHzlB8kwmmTT66k3vXfHh3+hvwz3FDZ48KKrkd7s
	 l5hrIgd+sISkBUCnjetWHDWZVU90jPKfN3qWtLMf+UrkENNiUScXinrHswanMsNvOb
	 tkkx2MYkdZ0qQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 19 Oct 2023 10:38:47 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 19 Oct 2023 10:38:47 +0300
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
	<richard@nod.at>, Christian Brauner <brauner@kernel.org>, Dave Chinner
	<dchinner@redhat.com>, Yu Zhe <yuzhe@nfschina.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v1 0/2] jffs2: make cleanmarker support option
Date: Thu, 19 Oct 2023 10:38:36 +0300
Message-ID: <20231019073838.17586-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180720 [Oct 19 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 541 541 6f62a06a82e8ec968d29b8e7c7bba6aeceb34f57, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/19 05:18:00 #22229383
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_003857_205265_C0393F54 
X-CRM114-Status: GOOD (  14.39  )
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

This patchset support for disable cleanmarker option. This is useful on
some NAND devices which entire OOB area is protected by ECC. Problem
fires when JFFS2 driver writes cleanmarker to some page and later it
tries to write to this page - write will be done successfully, but after
that such page becomes unreadable due to invalid ECC codes. This occurs
because the second write necessitates an update to ECC, but it is
impossible to do it correctly without block erase.

Martin Kurbanov (2):
  jffs2: introduce jffs2_nandflash()
  jffs2: make cleanmarker support option

 fs/jffs2/Kconfig    | 10 ++++++++++
 fs/jffs2/erase.c    |  2 +-
 fs/jffs2/fs.c       |  4 ++--
 fs/jffs2/os-linux.h |  7 ++++++-
 fs/jffs2/scan.c     |  2 +-
 5 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.40.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
