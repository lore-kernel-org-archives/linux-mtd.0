Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C82C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PejaOiAfubQgUsa1goaYUe7y5ollzWiUV9jS2mqA+34=; b=wXO8sitkjggYFg
	ojHPrIfuYSlbX0k9SDUEFBknxM8WGG9g0RkUzh4ZvK7vYyoytxLQGKyz/EJXO4KZFxsR++NK0+Pfy
	C2lKgA5jb2o1VLSoen408xwEXi7kYHDLx5R250ukW9XPd2FDqk6jV7MgyV/2QyUWKPFUEjo7R6Vsw
	iT/ntWpvLqR1kVzRR75O7kkQ8IfjjCBv919v77AXFGPuKEmR4QWcdKw9KoZpZy8Jl7yPFAkGDa8Fk
	Mr/DgibbsfFuq6SJPs1TUNIVIYw108TNg+xovKkaS7A9jN9WzNSAO+bS1wAx9TKRU0nZo7RksY6Gp
	gsCsamJEL/9HEaLZrqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngfT5-001QID-DD; Tue, 19 Apr 2022 04:27:59 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngfT2-001QGg-3E
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 04:27:57 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23J4RiFR107801;
 Mon, 18 Apr 2022 23:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650342464;
 bh=FkpkHWADvy6lzB753uq3boA4gZeMnR0i6Mh7h+xhnl8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=w6e2u4M1eK6OocrY6I0m4vjIPTyX+Ge37vxYMIkl46+vl4Ny+mF4cq6m/EIeOZwtw
 0fn8nbG45NqKKAAgjIQFu3W2GAPaayyqo8wWvlv1dwkK3bsFeZvZDVmRFJkg2u9Tl8
 UyN+xxtSDpy0Lw6FuL+3CJCfJDxeOmpZQuBY3g14=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23J4RiOU065589
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Apr 2022 23:27:44 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Apr 2022 23:27:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Apr 2022 23:27:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23J4RgkX012789;
 Mon, 18 Apr 2022 23:27:43 -0500
Date: Tue, 19 Apr 2022 09:57:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
CC: <tudor.ambarus@microchip.com>, <michael@walle.cc>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <quic_asutoshd@quicinc.com>, <quic_rampraka@quicinc.com>,
 <quic_pragalla@quicinc.com>, <quic_sartgarg@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <quic_sayalil@quicinc.com>
Subject: Re: [PATCH V8] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Message-ID: <20220419042742.qqfj6wurpxxqhr6l@ti.com>
References: <1648191975-1366-1-git-send-email-quic_c_sbhanu@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1648191975-1366-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_212756_357409_7BDAB634 
X-CRM114-Status: GOOD (  14.90  )
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

On 25/03/22 12:36PM, Shaik Sajida Bhanu wrote:
> Add support for winbond W25Q512NW-IM chip.
> 
> Below are the tests done:
> 
> 1. Verified flashing binary image on spi card using flashrom tool.
> 2. Verified OTP support, below are the test results:
> 
>  localhost / # cat
>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>  spi16.0/spi-nor/jedec_id
>  ef8020
> 
>  localhost / # cat
>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>  spi16.0/spi-nor/manufacturer
>  winbond
> 
>  localhost / # cat
>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>  spi16.0/spi-nor/partname
>  w25q512nwm
> 
>  localhost / # hexdump
>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/sp
>  i16/spi16.0/spi-nor/sfdp
>  0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
>  0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
>  0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
>  0000030 ffff ffff ffff ffff ffff ffff ffff ffff
>  *
>  0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
>  0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
>  00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
>  00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
>  00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
>  00000d0 0aff fff0 ff21 ffdc
>  00000d8
> 
>  localhost / # md5sum
>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi
>  16/spi16.0/spi-nor/sfdp
>  106d89d6c049110bc94c01517cb4ce24
>  /sys/bus/platform/devices/soc@0/88dc000.spi/
>  spi_master/spi16/spi16.0/spi-nor/sfdp
> 
> 3. Tested flash lock, below are the test results (looks like the lock is
>  not working as expected, so when we do lock the whole card and tried to
>  write, write was successful without any errors.)

What should we do with this then? Drop the locking support? Or is there 
something wrong/missing in SPI NOR core that needs to be fixed first so 
locking for this flash works?

> 
>  localhost ~ # flash_lock -i /dev/mtd0
>  Device: /dev/mtd0
>  Start: 0
>  Len: 0x4000000
>  Lock status: locked
>  Return code: 1
>  localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
>  Erased 4096 bytes from address 0x00400000 in flash
>  localhost ~ # mtd_debug read /dev/mtd0 0x400000 4096
>  temp
>  Copied 4096 bytes from address 0x00400000 in flash
>  to temp
>  localhost ~ # mtd_debug write /dev/mtd0 0x400000
>  4096 temp
>  Copied 4096 bytes from temp to address 0x00400000
>  in flash
>  localhost ~ # flash_lock -u /dev/mtd0
>  localhost ~ # flash_lock -i /dev/mtd0
>  Device: /dev/mtd0
>  Start: 0
>  Len: 0x4000000
>  Lock status: unlocked
>  Return code: 0
>  localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
>  Erased 4096 bytes from address 0x00400000 in flash
>  localhost ~ # mtd_debug read /dev/mtd0 0x400000
>  4096 tempCopied 4096 bytes from address 0x00400000 in
>  flash to temp
>  localhost ~ # mtd_debug write /dev/mtd0 0x400000 4096 temp
>  Copied 4096 bytes from temp to address 0x00400000 in flash
>  localhost ~ #
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Michael Walle <michael@walle.cc>
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
