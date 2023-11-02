Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FBDC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5njJylL+bV+Nz9G9qxK3NuU9hTJVUVgtPzDJEBs4mM=; b=e8yB7Ec3FNK0u03q/EXKh28IPC
	nL9f1jup5TKSIDu8/Zz514hmH3d3cAEyy2AuvQoDZtI3YhN9Yjl6P6iI2vq81bodt6yRcK1Dfxn+X
	R8rEUVAWkm2oQX8s6pka+JKG7FMmyTOkhhSr/Dk3N0h9qgcZ8NxZWbBzjDb3Ohaua/xRZybgs1bOE
	VUWBWZCT09Hl7/iSv0yTjCLX2ymlu4DyPSnZyQJbWjBjIw3WBTg0bpbU2/TlzSKm7mLz7gxOI7As2
	eK7hN88CxKZy1569sFVLzBx8L0mPiuBuBzexjmASI4Y/MD6FvCa0uI1J/LnlfZB6nwCJ7Td3p+DA6
	4CCtuHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qycVL-00A5gn-3B;
	Thu, 02 Nov 2023 18:33:19 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qycVF-00A5fz-04;
	Thu, 02 Nov 2023 18:33:17 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4E527863F8;
	Thu,  2 Nov 2023 19:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698949990;
	bh=JwLWWZ2WjC8z7Q0zXgOpxXsSQrz5xm/Ph5/ywFzhWmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y9tSKfy8pQumf92Y/NlQLXSTHQ0B6UlpVo9tmt8Dwu0uuzVhy3z7MHb8mYeHQ6YN6
	 onnD2Cbok4kEM9lbRJNvLLZdfjb9NaZibysRGRClu/LiI+BVC1QE88dnt6kY+htqaw
	 EnvWcAsDKAvVTap+WMTfqOPbS0Y+2U2vQL3p+vN3WPx+bXAAGEImcD0wgPJEfFaNSN
	 yowC4ZlwDblzO0++WLnjhPYcix26BWlcLZ9j+JHPzcrg2lhsdAMoD44ABRH3CsbA1s
	 aB1IM5jki9WJo6jgpkRshTpcC0hFn3f+Q8A9nIMps0kKQHBVOKz9E1K6hk4Y0pgpHu
	 m4Qbw3kN9cXnQ==
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 15:33:10 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
Message-ID: <cf0e4284f2e3193ddd57b715196ca202@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_113313_439111_31E02AA5 
X-CRM114-Status: UNSURE (   5.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/11/2023 15:21, Tudor Ambarus wrote:

> Let's see what gets to the SPI controller. Which SPI controller do you 
> use?

I am using i.MX8MP, which has drivers/spi/spi-nxp-fspi.c.

Here is the result:

root@mcde3000a:~# flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 --  0 [   26.040903] spi-nor spi0.0: ***** 
nor->reg_proto = 0x00010101
% complete [   26.049570] spi-nor spi0.0: *****
[   26.053849] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[   26.059118] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[   26.064539] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[   26.069787] spi-nor spi0.0: *****
[   26.073118] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[   26.078451] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[   26.083949] spi-nor spi0.0: ***** op.addr.buswidth = 0x0
[   26.089368] spi-nor spi0.0: *****
[   26.092699] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[   26.098123] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[   26.103713] spi-nor spi0.0: *****
[   26.107045] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[   26.112549] spi-nor spi0.0: ***** op.data.nbytes = 0
[   26.117727] spi-nor spi0.0: ***** nor->reg_proto = 0x00010101
[   26.123589] spi-nor spi0.0: *****
[   26.127012] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[   26.132274] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[   26.137706] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[   26.142956] spi-nor spi0.0: *****
[   26.146290] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[   26.151625] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[   26.157132] spi-nor spi0.0: ***** op.addr.buswidth = 0x4000000
[   26.163065] spi-nor spi0.0: *****
[   26.166402] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[   26.171815] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[   26.177405] spi-nor spi0.0: *****
[   26.180737] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[   26.186241] spi-nor spi0.0: ***** op.data.nbytes = 0
Erasing 131072 Kibyte @ 0 -- 100 % complete

root@mcde3000a:~# hexdump /dev/mtd0
0000000 a1d4 168c 4dad dfb2 2a3d c2af 0aae c18a
0000010 2d5f 177a c39f 46a4 f9cd b880 331e 2543
....

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
