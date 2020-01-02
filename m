Return-Path: <SRS0=/21v=2X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422B6C2D0DC
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 10:31:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5C421734
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 10:31:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CrpCJe46";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5u9sXjY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5C421734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1ULGHfa2E6npEuVikFC0h9+eiDV8VgXiKPRs9fXF1z0=; b=Crp
	CJe46g+JhetRMWzw08eZ0MG1uV5c/UqxZImFleRCLpgH2ZL528jTEY4WgcjGvyVZcUb4DV/yiJUIt
	uqLvCyTcNOylzH+wKQB5/2bjPaEPOvakFtURtUiqPvPOJqZNI7eoT+Mda6B2gERcoWcaOGs1+LLI6
	Da2oyEaYXQ9odhHql8SbMqb4WOm3o2TyVrJgmJmYxiNYwMMYnyMAkL+7cxqCh75vRvkMFGMlSrpw3
	vCkD6errQxE0i5wAGzNHD3vP7Iyxx/9VhTsCDJhvcaboOCJDoIyPer5xkXDyFeGUaUXSQv5jmPyJL
	3kYb+J/Z6rFFlmrZ6O6oSmh8t6cwcCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imxl5-0002B2-UX; Thu, 02 Jan 2020 10:31:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imxl2-00027g-RD
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2020 10:31:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id m24so5170314wmc.3
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2020 02:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1oXEYG8HAF2vDLgFRkjXZhCSmEchyeAyVTdadTNKbc0=;
 b=S5u9sXjYrlua6YeWFI7dzglUc7puluiEvW/nuq9NWt6STMoOaHD/uueK5apO/bmE2E
 8CgCFGP7DVhCDLHnDR1Wp8/VW0HPMtdN0Ss6rs78bYgUuAH7hGAMBOjnyiwV8XLoM/Ci
 jYV/+o2+SG51bD74NsvkNz2ZaetPs2RKgE4VZ7z1JvLNZKUaVy8SauUu9d9dbygj+vl+
 IfiXjrD0hE1hj0ZuVBBaDBM2q141DBUFI7ih8MrMbVostjkprpOjZyTPlR8VZkN1UJ0M
 LX9//KDu1PIXd9Vod5o1ah17r2luOae6+Me54F+SSqVubyhB6jS1NCFwe+ZgFAGS8M4R
 WtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1oXEYG8HAF2vDLgFRkjXZhCSmEchyeAyVTdadTNKbc0=;
 b=WaFAayopdx31YYUP8UzcoMvnEI6JrIWjNUcfBuLFAj1SHuBgm1+UiM40bkol3gcAD7
 Im3iczelgnK5Px7xRXK9p7YRZ6UFas3Y1fBx8BrRkGFPzIqOYwa7R24kyOF+AICWN5DX
 130bdUhzgWCURTqswLeClvlT1yqXDxSGvnk4+xxna+PM51QQJHcCgI30lqs7qSb0skut
 Oy1VxDaQqmdAwD5A3Be9L6EF/tJP3Fg5CazbfFYjkMyztZLsA43n3LZvECcda6TbJs3d
 xzWv1u5O5CV77HG6WYlgoUeP2FX7q1BTqBrXKn2CFKDTtrPERnBnC9oEmC0xyDwoU6Tj
 9fbw==
X-Gm-Message-State: APjAAAWC48JzaZBjw899tyH5GUr4e01MKUe2Bo/WseaPF95CRWXs+7lU
 UhL0+Fs9x32pXPQTQcUKyCBCxS3LHeKJ2z3lTxwf9V19
X-Google-Smtp-Source: APXvYqz2oX6otJO1PdPT7WRzhQLpkGRVIgLXOO+lP2un8v1hY2fFrhEKNMsK2UnrPYTpKsxEtSTwTrKuvZGspbDXtws=
X-Received: by 2002:a1c:61d6:: with SMTP id v205mr14525823wmb.91.1577961070815; 
 Thu, 02 Jan 2020 02:31:10 -0800 (PST)
MIME-Version: 1.0
From: neutrino network <neutrino.network1@gmail.com>
Date: Thu, 2 Jan 2020 15:31:03 +0500
Message-ID: <CABbRPAU1aQcPDEiS_yb==T9zaXeDUVfSkswqyOADhBmeKRX5oA@mail.gmail.com>
Subject: Read/Write the MTD flash via Octeon Simple Executive API's
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_023112_902558_4532B3A7 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cavium Octeon appliance has mtd0 to 5 flash present. I want to
log/dump firmware/Simple Executive crash backtrace to one of the solid
state storage/ flash in the appliance. For that I try to initialize
the flash with simple executive helping function in cvmx-flash.c;

cvmx_flash_initialize()

but on boot up the initialize function in Simple Executive prints

cvmx-flash: No CFI chips found

The cvmx_flash_initialize() in cvmx-flash.c code is shared below

void cvmx_flash_initialize(void){
int boot_region;
int chip_id = 0;

memset(flash_info, 0, sizeof(flash_info));

/* Loop through each boot bus chip select region */
for (boot_region=0; boot_region<MAX_NUM_FLASH_CHIPS; boot_region++)
{
    cvmx_mio_boot_reg_cfgx_t region_cfg;
    region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFG0 + boot_region*8);
    /* Only try chip select regions that are enabled. This assumes the
        bootloader already setup the flash */
    if (region_cfg.s.en)
    {

        /* Convert the hardware address to a pointer. Note that the bootbus,
            unlike memory, isn't 1:1 mapped in the simple exec */
        void *base_ptr = cvmx_phys_to_ptr((region_cfg.s.base<<16) |
0xffffffff80000000ull);

        if (__cvmx_flash_queury_cfi(chip_id, base_ptr) == 0)
        {
            /* Valid CFI flash chip found */
            chip_id++;
        }
    }
}

if (chip_id == 0){
    cvmx_dprintf("cvmx-flash: No CFI chips found\n");

}}

However on boot up the linux shows that it has mtd flash present with
CFI conformant;

Bootbus flash: Setting flash for 256MB flash at 0x10000000 with 2 bank(s)

phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank

phys_mapped_flash: Found 1 x16 devices at 0x8000000 in 16-bit bank

Amd/Fujitsu Extended Query Table at 0x0040 phys_mapped_flash: CFI does

not contain boot bank location. Assuming top. number of CFI chips: 2

cfi_cmdset_0002: Disabling erase-suspend-program due to code

brokenness. Creating 6 MTD partitions on "phys_mapped_flash":

0x000000000000-0x000000200000 : "FAILSAFE-BOOTLOADER"

0x000000200000-0x0000003e0000 : "NORMAL-BOOTLOADER"

0x0000003e0000-0x000000400000 : "BOOTLOADER-ENVIRONMENT"

0x000000400000-0x000002200000 : "LINUX-KERNEL"

0x000002200000-0x000007200000 : "LINUX-FS"

0x000007200000-0x000008000000 : "RESERVED-14M"

and the flinfo in u-boot displays that mtd flash is present with CFI conformant;

Bank # 1: CFI conformant flash (16 x 16) Size: 128 MB in 1024 Sectors
AMD Standard command set, Manufacturer ID: 0x01, Device ID:

0x227E2228 Erase timeout: 4096 ms, write timeout: 1 ms Buffer

write timeout: 3 ms, buffer size: 64 bytes Sector Start Addresses:

B0000000 RO etc etc (lots of hex numbers displayed)

Bank # 2: CFI conformant flash (16 x 16) Size: 128 MB in 1024 Sectors

AMD Standard command set, Manufacturer ID: 0x01, Device ID: 0x227E2228

Erase timeout: 4096 ms, write timeout: 1 ms Buffer write timeout: 3
ms, buffer size: 64 bytes

Sector Start Addresses: B8000000 etc etc (lots of hex numbers displayed)


The mtd flash of the device is already being used by the u-boot and
linux but how can I use the same solid state storage/flash with
utility functions of cvmx-flash.c in bare metal simple executive
firmware of Cavium Octeon for the said purpose (i.e dumping crash)?
How octeon simple executive firmware can read/write the solid state
storage/flash that is already successfully accessible by linux &
uboot?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
