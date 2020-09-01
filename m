Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581BFC43461
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 12:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20525206EB
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 12:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fecwOfpE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ySj7NSdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20525206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OEpt3Khc1I5QMFXNj7+g/dU9qaR2CFsBhASvTUXzlaU=; b=fecwOfpEhwhwRRRzYG8A/CUIA
	smqKIGkdke2xgIQqHh30o8iEDpszuRPojZo8olBshUPy6R1c8T5JF8kYIY6Avmaz/8oPVc2daPyys
	xhQ4VZjA7X62U205mPtFzrQgfg5VxtlBpP65CZIhdS8MUi8DKhnKz+h+r0osQQbG9ndTeZc2KtdM1
	Mop9tqN5uG5BrBKzG6PvFVdEuShzL66TJGEQeYzDE5gD32iPAI9dOeZE9nqmMCad2P8rjGssUmFdp
	Oaq0G2qz8JKgpRFtXKQ43PYG+6tEmkTbVGF8g+y7XBFco1QXuazjD7HgwkMmpcb+sfC+k1iphvvhn
	YNXNNzd4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD4CJ-0003uX-At; Tue, 01 Sep 2020 11:11:31 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD4CF-0003tM-Hm
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2020 11:11:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 081BBF6x113215;
 Tue, 1 Sep 2020 06:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598958675;
 bh=mhy6hjtWUaKoXOjuj/CFnf/DYRYZmMS26NZbab9+NGI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ySj7NSdzKQVREydZruzFoJTLzNMikA24OC4VS/m+DmHJinhBX+mCV69s0vgJyYOXV
 NrTIghmoGpwWXWn3qj4AFBn7Acx7QlaL/xY8AgSEDHSuVhwcWt8OQMyXJ1xe9B+nFb
 0POzRzVWubPNmXyh0urB8XspJhw8DIkkEafa98yQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 081BBFB4079936
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Sep 2020 06:11:15 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 06:11:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 06:11:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081BBDtJ000874;
 Tue, 1 Sep 2020 06:11:14 -0500
Date: Tue, 1 Sep 2020 16:41:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Matthias =?iso-8859-1?Q?Wei=DFer?= <m.weisser.m@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Message-ID: <20200901111111.wwazfnc3k5flr6qy@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <20200901094816.ddw2do2ryjvqvasq@ti.com>
 <CAO8h3eF_XQZBAP2szOu2oHv=DxznSo-2bDEOsthsJk+MP1s6ng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO8h3eF_XQZBAP2szOu2oHv=DxznSo-2bDEOsthsJk+MP1s6ng@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_071127_688895_99A8A3B3 
X-CRM114-Status: GOOD (  33.72  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com,
 Yicong Yang <yangyicong@hisilicon.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/09/20 12:08PM, Matthias Wei=DFer wrote:
> Am Di., 1. Sept. 2020 um 11:48 Uhr schrieb Pratyush Yadav <p.yadav@ti.com=
>:
> > On 01/09/20 08:16AM, Matthias Wei=DFer wrote:
> > > Am Di., 16. Juni 2020 um 15:03 Uhr schrieb Yicong Yang
> > > <yangyicong@hisilicon.com>:
> > > > If the flash's quad mode is enabled, it'll remain in the quad mode =
when
> > > > it's removed. If we drive the flash next time in SPI/Dual mode, then
> > > > problem occurs as the flash's quad enable bit is not cleared.
> > >
> > > On flash devices with a non-volatile quad enable bit (we use S25FL512=
S)
> > > this will wear out the quad enable bit as on every boot the bit is
> > > set and reset on shutdown. Or do I miss something here?
> >
> > Yes, I think it will. If you always want the bit enabled (and it being
> > non-volatile suggests that is the intended use), why not set
> > nor->params->quad_enable() to NULL? That way it won't be touched at all,
> > neither on boot nor on shutdown.
> =

> Because we want to use plain mainline kernel without any local patches.

IMO SPI NOR should not touch non-volatile bits at all. They should be =

set by some other software and SPI NOR should only read them. So I can =

see a change like this justifiable for merging into mainline.

The other option would be to put the call to spi_nor_quad_enable() =

behind a check for SNOR_F_BROKEN_RESET, like we do for 4-byte addressing =

mode.

Either way, the patch has already landed in mainline. You will have to =

submit a patch with whichever option you think is better.
 =

> > > > Disable the quad mode in spi_nor_restore(), the flash will leave
> > > > quad mode when remove. This will make sure the flash always enter t=
he
> > > > correct mode when loaded.
> > >
> > > We have a system which relies on an enabled quad mode on boot
> > > (bootloader uses quad mode without enabling it) so using this patch
> > > will prevent our device from booting.
> >
> > Out of curiosity, how does the flash get detected by SPI NOR? It issues
> > the Read ID command in 1S-1S-1S mode but the flash is expecting 1S-4S-4S
> > commands. Do you have any extra patches applied to make it work?
> =

> The RDID command (0x9F) is always a 1S-1S-1S command regardless of the
> QE bit state as e.g. the READ command (0x03). The only reason for the QE
> bit is that it remaps the usage of the !WP and !HOLD signals to IO2 and I=
O3.
> =

> The SPI controller (QSPI on imx6 in our case) have to be programmed
> accordingly to execute the RDID command in 1S-1S-1S mode but then the
> state of the QE bit doesn't matter.
> =

> > I tried solving this problem for 8D-8D-8D mode but never really found a
> > good solution.
> =

> I don't know your hardware but I am sure that should work that way to.

Unfortunately for the hardware I'm using (S28HS512T) once Octal mode is =

enabled RDID is also in 8D-8D-8D mode. So this isn't applicable there. =

Still, thanks for the explanation.
 =

> The current way it is done in your patch may wear out the QE bit (and
> maybe others in status/configuration register) quite quickly if you
> have a device which is booted frequently.

This isn't my patch :-)

-- =

Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
