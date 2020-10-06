Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714E6C4363D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 11:41:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4D82078E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 11:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLLX7wNN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Asts4OR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4D82078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RmqXD1PcrI4YvK8wfRV2HPPma8kcpkwQ9QM/ptVGbzs=; b=HLLX7wNN9LPig8c8t96ykQNLG
	vH2f2kbyfR6SipkV0+leazjzPu+ipt2erNdXkab/74qzybKkY2at6yMP3sE3wXdPjJYJ8D04mk60D
	u4TGhnjpDLzHbZeCBu8Bveuh4vxdfGt8tBzCeq0fm1l1WjkkffNgep6vrpqXYp99YZA6ql9h7MWsM
	YI9bUz8owMJqfujBXAS8WVUNAhB5Hq2OPhzP+OHz64sJmf02exNiyCsmapwpDDRJmPQuUTQQYBSEW
	FBIP87lcUPQjd0TtM43sRAYkCOQSRnbfWae/c8HQp3ns+r3DV9cfzc71XhVzBJrCeU1JIA0B8nEMP
	pjivZuhoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPlKf-0005FN-CL; Tue, 06 Oct 2020 11:40:37 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPlKb-0005Ew-T0
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 11:40:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096BeQfR120482;
 Tue, 6 Oct 2020 06:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601984426;
 bh=gk+2qUIMQWuyNdV4sTokPJU6E+XSqonOsjTKKCf0OR4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Asts4OR2kH069b6/rSAUEAVtrjAsBvS/LDn1UeDSWEl6TfIvFtAs6PIzmz5dS4mCo
 txynuqsc6KYn/f/eMrTlCE+c8+txc82dasGHpuR1DyiN9qUbobXGfz2z+BkhBTJEp2
 fxdqsNmg0kEQI8vd2LWdDRoLax6+3kA8fsppGFik=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096BeQuY006999
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Oct 2020 06:40:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 06:40:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 06:40:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096BePv9121668;
 Tue, 6 Oct 2020 06:40:25 -0500
Date: Tue, 6 Oct 2020 17:10:24 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
Message-ID: <20201006114022.cwc6mnpboeuzrezd@ti.com>
References: <20200930235611.6355-1-bert@biot.com>
 <20201001063421.qcjdikj2tje3jn6k@ti.com>
 <ed7e13a5-db3e-79ad-0cdc-d2875cef2d22@microchip.com>
 <73a258f3-45dd-1354-d5fd-904d5e372d2c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73a258f3-45dd-1354-d5fd-904d5e372d2c@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_074034_112824_B75649DB 
X-CRM114-Status: GOOD (  23.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, bert@biot.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 06/10/20 11:19AM, Tudor.Ambarus@microchip.com wrote:
> On 10/6/20 2:03 PM, Tudor Ambarus - M18064 wrote:
> > On 10/1/20 9:34 AM, Pratyush Yadav wrote:
> >> So using an address width of 4 here is not necessarily the right thing
> >> to do. This change would break SMPT parsing for all flashes that use
> >> 3-byte addressing by default because SMPT parsing can involve register
> >> reads/writes. One such device is the Cypress S28HS flash. In fact, this
> >> was what prompted me to write the patch [0].
> > 
> > Do you refer to spi_nor_get_map_in_use()?
> 
> oh, I see. If addr width is set via the SMPT_CMD_ADDRESS_LEN_USE_CURRENT,
> case, and if the flash comes in 4 byte address mode from a bootloader,
> then setting addr_width to 3 in case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4,
> will break the reading of the map.

Yes it will but that is not the problem I was trying to solve. The 
problem is simply that nor->addr_width is 0 without the
BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 case that I added, since BFPT parsing 
won't touch it at all. And so SMPT_CMD_ADDRESS_LEN_USE_CURRENT results 
in the command using an op.addr.nbytes == 0 for the register read even 
though op.addr.val is set correctly. This means the controller skips the 
address phase and the register read fails.

Defaulting to 3 for the BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 case means 
op.addr.nbytes is correctly set to 3 and register read works correctly 
and SMPT parsing correctly detects the current configuration.

If the address width is set to 4 by the bootloader then we have the same 
problem in some ways as the 8D boot problem where we have no way of 
easily detecting which mode is being used. I did not try to solve that 
problem with this change.
 
> If the Address Mode bit is volatile, maybe we can reset the flash to
> its power on state immediately after identification. For the NV bits,
> we have the same recurring problem.

Yes, the U-Boot xSPI series I sent does this somewhat. It issues a soft 
reset before handing control over to the kernel, so the kernel sees the 
flash in PoR state. This also helps when U-Boot uses the flash in 8D 
mode.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
