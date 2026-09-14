Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73FCC88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peV2dtvXW8TD3IJr1eKPPji8+P1o0IaIcCmJ5tq8Mtc=; b=X5MJHlhZym/Gnu
	uqRcsKttj97Lwwf8+ERTosK//Aty8N8VMkRC629UhVKttaVKWCnW5QA5/ERCHk0Ft7GwMtP9lNfEa
	iC2WXKwLBjVACrix3ZPCMZIFtN+gzLH/b4uul/EEv1ZrTVlJkCAp0NbcfxCTj1erkdIMEwwxKB/tP
	DWMyIzPG/fhI2RTGGnQRSkJhN0rRunwxc7FMDM3dTDLlM5LNY2JGqzzgOQ9BpN0JYl48srkpg72ok
	DhUcI3mMK+L4XCyAvLaKVqhUJbXPphZs+m3A90ybiMYaP4LxYwHjScI59KVOUb8Z4fknjOsYQMqAU
	67QxdIbYaC+NSfZ/weGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60sM-00000002XRS-0rjk;
	Mon, 14 Sep 2026 07:13:14 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60sI-00000002XDM-3fIv
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 07:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1789369991; x=1820905991;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MdiTlf7uzI6N0Ni3wzhT7ObY+B1VrQsv7PP9X1j0apo=;
  b=Z9TLr7hu1FKpjVPRaeUwLAMw+Za3TkNgae9oN7aYbz9gYRq+i5ohesfd
   0z8Zs6swYhbevp8SSoODzHEuxtvAZk3IAt0vRgySdq33kVfn5CnudfB4G
   1n34oNIhKNuImgIfra/vpp1z40gHjtHiqWgDqTg2C3gfQMVwSxcWakzKD
   Y=;
X-CSE-ConnectionGUID: 0csU0Qx9QGCg+On3F/JFTQ==
X-CSE-MsgGUID: mKxy7xgnQ6eIwksf4gi+hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="178531538"
X-IronPort-AV: E=Sophos;i="6.27,102,1787004000"; 
   d="scan'208";a="178531538"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:11:05 +0200
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 09:11:04 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 09:11:04 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Mon, 14 Sep 2026 09:11:04 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>,
	<alex@sverdlin.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Topic: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Index: AQHdRASdQI/rAfbWgkienan9hYKZEbbNfGoAgAAmnTA=
Date: Mon, 14 Sep 2026 07:11:04 +0000
Message-ID: <fb4398e88939472eaa86cdc098a3d265@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
In-Reply-To: <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_001311_240268_9EEA2E9B 
X-CRM114-Status: GOOD (  10.41  )
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

Hi Michael,

> On Mon Sep 14, 2026 at 6:50 AM CEST, Takahiro Kuwano via B4 Relay wrote:
> > From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> >
> > s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
> > Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page size
> > and sector map.
> 
> Do you have an SFDP dump by chance? I haven't found one on the list
> for this flash.
> 

Yes, but param tables are located beyond PAGE_SIZE(1000h)...

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25fs256s1

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
0102194d0181

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion

zynq> hexdump /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
0000000 4653 5044 0106 ff05 0000 0901 1090 ff00
0000010 0500 1001 1090 ff00 0600 1001 1090 ff00
0000020 0081 1a01 10d8 ff00 0084 0201 10d0 ff00
0000030 0101 5001 1000 0100 ffff ffff ffff ffff
0000040 ffff ffff ffff ffff ffff ffff ffff ffff
*
0001000

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
