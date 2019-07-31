Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37231C32750
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 02:06:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C4720665
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 02:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OZgqjcIR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06C4720665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MliwvQsSapNa+ebtnr0uwQy0Z+AnClkvf+ftSzhL/H4=; b=OZgqjcIR+yr97QgVSPieTnvdw
	9vwXIn/UoGZd6KW8HlirpvUxU+HgFB09m+8LSTI30XtTEu66fSbTehkZaCoRUzdwSnMAkOFbMjZb6
	7kqGkCm9ckIhPQNUUtSwVZ0DTF8vpTj+ylh5HXcCBzT0ZX8SaCc+VZJh4gMzuH2EcxvlU0DE+XDtw
	M2/xhctpb3PpfH+NHt7sWVzqkknCSKdWY4ynaQKj4Q3NC+2GZAVlV0PCR2674nlqjVia+ITZv+zIB
	ysyvDTQXO2jTousPrYmrrRIWQIUUZQPRE0jKHLIfBMh+4NvmjgqebGGoKLwu7pP+G0UPXSgxlWJiH
	pZitXCy8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hse06-0007L5-UY; Wed, 31 Jul 2019 02:05:58 +0000
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hse01-0007Ki-CP
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 02:05:56 +0000
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AVAACu9kBd/zXSMGcNWBkBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEHAQEBAQEBgWeBaIJKhB6RbwaBCS2DZIV+hHqMIQkBAQEBAQEBAQE?=
 =?us-ascii?q?3AQGEQAKCZTgTAQMBAQEEAQEBAQUBhVKGEAEBAQMaCQRSEAsNCyoCAlcGAQw?=
 =?us-ascii?q?GAgEBgx4BgXasDXF/MxqFLoMwgTgQgTSBY4oUeIEHgREngms+h0+CWASMJRa?=
 =?us-ascii?q?IPg2VdwmCHIMsgiCORAYbgi6HJYN6A4pBjT2UBYVkgXkzGggoCIMngk4XjjN?=
 =?us-ascii?q?gjnUBAQ?=
X-IPAS-Result: =?us-ascii?q?A2AVAACu9kBd/zXSMGcNWBkBAQEBAQEBAQEBAQEHAQEBA?=
 =?us-ascii?q?QEBgWeBaIJKhB6RbwaBCS2DZIV+hHqMIQkBAQEBAQEBAQE3AQGEQAKCZTgTA?=
 =?us-ascii?q?QMBAQEEAQEBAQUBhVKGEAEBAQMaCQRSEAsNCyoCAlcGAQwGAgEBgx4BgXasD?=
 =?us-ascii?q?XF/MxqFLoMwgTgQgTSBY4oUeIEHgREngms+h0+CWASMJRaIPg2VdwmCHIMsg?=
 =?us-ascii?q?iCORAYbgi6HJYN6A4pBjT2UBYVkgXkzGggoCIMngk4XjjNgjnUBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,328,1559491200"; d="scan'208";a="242275316"
Received: from unknown (HELO [10.44.0.22]) ([103.48.210.53])
 by icp-osb-irony-out5.iinet.net.au with ESMTP; 31 Jul 2019 10:05:45 +0800
Subject: Re: GPMI iMX6ull timeout on DMA
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190729103655.095297a2@xps13>
 <18734a1d-17d9-d390-58ef-ad8ca1be925f@kernel.org>
 <20190729144730.4a58de32@xps13>
 <17b49e7d-ff63-315f-cf12-3474f7228c6d@kernel.org>
 <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
 <53cb8db7-bcf8-ee7c-84ee-59a14a04aad9@kernel.org>
 <20190730103822.7576645d@xps13>
From: Greg Ungerer <gerg@kernel.org>
Message-ID: <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
Date: Wed, 31 Jul 2019 12:05:44 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730103822.7576645d@xps13>
Content-Type: multipart/mixed; boundary="------------4C6A22E0FCC179A8E4707514"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_190554_190627_F2359450 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: s.hauer@pengutronix.de,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-mtd@lists.infradead.org
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------4C6A22E0FCC179A8E4707514
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miquel, Boris,

On 30/7/19 6:38 pm, Miquel Raynal wrote:
> Greg Ungerer <gerg@kernel.org> wrote on Tue, 30 Jul 2019 16:06:55 +1000:
>> On 30/7/19 10:41 am, Greg Ungerer wrote:
>>> On 30/7/19 10:28 am, Greg Ungerer wrote:
>>>> On 29/7/19 10:47 pm, Miquel Raynal wrote:
>>>>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 22:33:56 +1000:
>>>>>> On 29/7/19 6:36 pm, Miquel Raynal wrote:
>>>>>>> Greg Ungerer <gerg@kernel.org> wrote on Mon, 29 Jul 2019 16:41:51 +1000:
>>> [snip]
>> Not sure if this is a useful data point... But I modified that
>> nand_init_data_interface() loop to start checking from data mode 4.
>> So now on every boot it defaults to mode 4. That has been running
>> most of the day, up to 900 boot cycles now, no failures.
> 
> Ok so after having chatted quite a bit with Boris, it is very likely
> that, for these chips, the timings in mode 5 are too tight. It could
> fail the GET_FEATURES once in mode 5. Can you please dump every single
> intermediate value in gpmi_nfc_compute_timings() (period, *_cycles,
> use of half pêriods, tRP, sample delay, etc) as well as the content
> of /sys/kernel/debug/clk/clk_summary (you'll need debugfs support
> enabled and mounted).
> 
> Also, can you be sure that the NAND chip is powered with 3.3V?

Yes, 3.3V NAND chip.

Using the attached patch I get the following trace:

...
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(426): gpmi_nfc_compute_timings()
   sdr->tBERS_max=65535000000
   sdr->tCCS_min=500000000
   sdr->tPROG_max=65535000000
   sdr->tR_max=200000000000000
   sdr->tALH_min=20000
   sdr->tADL_min=400000
   sdr->tALS_min=50000
   sdr->tAR_min=25000
   sdr->tCEA_max=100000
   sdr->tCEH_min=20000
   sdr->tCH_min=20000
   sdr->tCHZ_max=100000
   sdr->tCLH_min=20000
   sdr->tCLR_min=20000
   sdr->tCLS_min=50000
   sdr->tCOH_min=0
   sdr->tCS_min=70000
   sdr->tDH_min=20000
   sdr->tDS_min=40000
   sdr->tFEAT_max=1000000
   sdr->tIR_min=10000
   sdr->tITC_max=1000000
   sdr->tRC_min=100000
   sdr->tREA_max=40000
   sdr->tREH_min=30000
   sdr->tRHOH_min=0
   sdr->tRHW_min=200000
   sdr->tRHZ_max=200000
   sdr->tRLOH_min=0
   sdr->tRP_min=50000
   sdr->tRR_min=40000
   sdr->tRST_max=250000000000
   sdr->tWB_max=200000
   sdr->tWC_min=100000
   sdr->tWH_min=30000
   sdr->tWHR_min=120000
   sdr->tWP_min=50000
   sdr->tWW_min=100000
     hw->clk_rate=22000000
     wrn_dly_sel=0
     period_ps=45454
     addr_setup_cycles=2
     data_setup_cycles=1
     data_hold_cycles=1
     busy_timeout_cycles=31302
     hw->timing0=0x00020101
     hw->timing1=0x60000000
     dll_threshold_ps=12000
     use_half_period=1
     reference_period_ps=22727
     tRP_ps=45454
     sample_delay_ps=4294955664
     sample_delay_factor=0
     hw->ctrl1n=0x00000000
     hw->ctrl1n=0x00000000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(547): gpmi_nfc_apply_timings()
   hw>clk_rate=22000000
   clk_set_rate(r->clock[0], hw->clk_rate)=0
   clk_get_rate(r->clock[0])=22000000
random: fast init done
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(426): gpmi_nfc_compute_timings()
   sdr->tBERS_max=3000000000
   sdr->tCCS_min=100000
   sdr->tPROG_max=600000000
   sdr->tR_max=25000000
   sdr->tALH_min=20000
   sdr->tADL_min=400000
   sdr->tALS_min=50000
   sdr->tAR_min=25000
   sdr->tCEA_max=100000
   sdr->tCEH_min=20000
   sdr->tCH_min=20000
   sdr->tCHZ_max=100000
   sdr->tCLH_min=20000
   sdr->tCLR_min=20000
   sdr->tCLS_min=50000
   sdr->tCOH_min=0
   sdr->tCS_min=70000
   sdr->tDH_min=20000
   sdr->tDS_min=40000
   sdr->tFEAT_max=1000000
   sdr->tIR_min=10000
   sdr->tITC_max=1000000
   sdr->tRC_min=100000
   sdr->tREA_max=40000
   sdr->tREH_min=30000
   sdr->tRHOH_min=0
   sdr->tRHW_min=200000
   sdr->tRHZ_max=200000
   sdr->tRLOH_min=0
   sdr->tRP_min=50000
   sdr->tRR_min=40000
   sdr->tRST_max=250000000000
   sdr->tWB_max=200000
   sdr->tWC_min=100000
   sdr->tWH_min=30000
   sdr->tWHR_min=120000
   sdr->tWP_min=50000
   sdr->tWW_min=100000
     hw->clk_rate=22000000
     wrn_dly_sel=0
     period_ps=45454
     addr_setup_cycles=2
     data_setup_cycles=1
     data_hold_cycles=1
     busy_timeout_cycles=555
     hw->timing0=0x00020101
     hw->timing1=0xb0000000
     dll_threshold_ps=12000
     use_half_period=1
     reference_period_ps=22727
     tRP_ps=45454
     sample_delay_ps=4294955664
     sample_delay_factor=0
     hw->ctrl1n=0x00000000
     hw->ctrl1n=0x00000000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(547): gpmi_nfc_apply_timings()
   hw>clk_rate=22000000
   clk_set_rate(r->clock[0], hw->clk_rate)=0
   clk_get_rate(r->clock[0])=22000000
gpmi-nand 1806000.gpmi-nand: use legacy bch geometry
drivers/mtd/nand/raw/nand_base.c(913): checking mode=5
drivers/mtd/nand/raw/nand_base.c(927): BREAKING AT  mode=5
drivers/mtd/nand/raw/nand_base.c(932): chip->onfi_timing_mode_default=5
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(426): gpmi_nfc_compute_timings()
   sdr->tBERS_max=3000000000
   sdr->tCCS_min=100000
   sdr->tPROG_max=600000000
   sdr->tR_max=25000000
   sdr->tALH_min=5000
   sdr->tADL_min=400000
   sdr->tALS_min=10000
   sdr->tAR_min=10000
   sdr->tCEA_max=25000
   sdr->tCEH_min=20000
   sdr->tCH_min=5000
   sdr->tCHZ_max=30000
   sdr->tCLH_min=5000
   sdr->tCLR_min=10000
   sdr->tCLS_min=10000
   sdr->tCOH_min=15000
   sdr->tCS_min=15000
   sdr->tDH_min=5000
   sdr->tDS_min=7000
   sdr->tFEAT_max=1000000
   sdr->tIR_min=0
   sdr->tITC_max=1000000
   sdr->tRC_min=20000
   sdr->tREA_max=16000
   sdr->tREH_min=7000
   sdr->tRHOH_min=15000
   sdr->tRHW_min=100000
   sdr->tRHZ_max=100000
   sdr->tRLOH_min=5000
   sdr->tRP_min=10000
   sdr->tRR_min=20000
   sdr->tRST_max=500000000
   sdr->tWB_max=100000
   sdr->tWC_min=20000
   sdr->tWH_min=7000
   sdr->tWHR_min=80000
   sdr->tWP_min=10000
   sdr->tWW_min=100000
     hw->clk_rate=100000000
     wrn_dly_sel=3
     period_ps=10000
     addr_setup_cycles=1
     data_setup_cycles=1
     data_hold_cycles=1
     busy_timeout_cycles=2510
     hw->timing0=0x00010101
     hw->timing1=0xe0000000
     dll_threshold_ps=12000
     use_half_period=0
     reference_period_ps=10000
     tRP_ps=10000
     sample_delay_ps=80000
     sample_delay_factor=8
     hw->ctrl1n=0x00c00000
     hw->ctrl1n=0x00c28000
drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(547): gpmi_nfc_apply_timings()
   hw>clk_rate=100000000
   clk_set_rate(r->clock[0], hw->clk_rate)=0
   clk_get_rate(r->clock[0])=99000000
Scanning device for bad blocks
5 fixed-partitions partitions found on MTD device gpmi-nand
Creating 5 MTD partitions on "gpmi-nand":
0x000000000000-0x000000500000 : "u-boot"
0x000000500000-0x000000600000 : "u-boot-env"
0x000000600000-0x000000800000 : "log"
0x000000800000-0x000010000000 : "flash"
0x000000000000-0x000010000000 : "all"
gpmi-nand 1806000.gpmi-nand: driver registered.
...


And "cat /sys/kernel/debug/clk/clk_summary" gives:

                                  enable  prepare  protect                                duty
    clock                          count    count    count        rate   accuracy phase  cycle
---------------------------------------------------------------------------------------------
  dummy                                2        2        0           0          0     0  50000
     cko2_sel                          0        0        0           0          0     0  50000
        cko2_podf                      0        0        0           0          0     0  50000
           cko2                        0        0        0           0          0     0  50000
     cko1_sel                          0        0        0           0          0     0  50000
        cko1_podf                      0        0        0           0          0     0  50000
           cko1                        0        0        0           0          0     0  50000
              cko                      0        0        0           0          0     0  50000
     usbphy2_gate                      1        1        0           0          0     0  50000
     usbphy1_gate                      1        1        0           0          0     0  50000
  ipp_di1                              0        0        0           0          0     0  50000
  ipp_di0                              0        0        0           0          0     0  50000
  osc                                  6        6        0    24000000          0     0  50000
     perclk_sel                        1        1        0    24000000          0     0  50000
        perclk                         3        3        0    24000000          0     0  50000
           pwm7                        0        0        0    24000000          0     0  50000
           pwm6                        0        0        0    24000000          0     0  50000
           pwm5                        0        0        0    24000000          0     0  50000
           i2c4                        0        0        0    24000000          0     0  50000
           pwm8                        0        0        0    24000000          0     0  50000
           pwm4                        0        0        0    24000000          0     0  50000
           pwm3                        0        0        0    24000000          0     0  50000
           pwm2                        0        0        0    24000000          0     0  50000
           pwm1                        0        0        0    24000000          0     0  50000
           i2c3                        0        0        0    24000000          0     0  50000
           i2c2                        1        1        0    24000000          0     0  50000
           i2c1                        0        0        0    24000000          0     0  50000
           gpt1_serial                 1        1        0    24000000          0     0  50000
           gpt1_bus                    1        1        0    24000000          0     0  50000
           epit2                       0        0        0    24000000          0     0  50000
           epit1                       0        0        0    24000000          0     0  50000
           gpt2_serial                 0        0        0    24000000          0     0  50000
           gpt2_bus                    0        0        0    24000000          0     0  50000
     periph_clk2_sel                   0        0        0    24000000          0     0  50000
        periph_clk2                    0        0        0    24000000          0     0  50000
     gpt_3m                            0        0        0     3000000          0     0  50000
     csi_sel                           0        0        0    24000000          0     0  50000
        csi_podf                       0        0        0    24000000          0     0  50000
           csi                         0        0        0    24000000          0     0  50000
     pll7                              1        1        0   480000000          0     0  50000
        pll7_bypass                    1        1        0   480000000          0     0  50000
           pll7_usb_host               1        1        0   480000000          0     0  50000
              usbphy2                  1        1        0   480000000          0     0  50000
     pll6                              1        1        0   500000000          0     0  50000
        pll6_bypass                    1        1        0   500000000          0     0  50000
           pll6_enet                   2        2        0   500000000          0     0  50000
              enet_ptp_ref             1        1        0    25000000          0     0  50000
                 enet_ptp              1        1        0    25000000          0     0  50000
              enet2_ref                0        0        0    50000000          0     0  50000
                 enet_ref_125m         0        0        0    50000000          0     0  50000
              enet_ref                 2        2        0    50000000          0     0  50000
     pll5                              0        0        0   296600000          0     0  50000
        pll5_bypass                    0        0        0   296600000          0     0  50000
           pll5_video                  0        0        0   296600000          0     0  50000
              pll5_post_div            0        0        0    74150000          0     0  50000
                 pll5_video_div        0        0        0    74150000          0     0  50000
     pll4                              0        0        0   147456000          0     0  50000
        pll4_bypass                    0        0        0   147456000          0     0  50000
           pll4_audio                  0        0        0   147456000          0     0  50000
              pll4_post_div            0        0        0    36864000          0     0  50000
                 pll4_audio_div        0        0        0    36864000          0     0  50000
     pll3                              1        1        0   480000000          0     0  50000
        pll3_bypass                    1        1        0   480000000          0     0  50000
           pll3_usb_otg                2        2        0   480000000          0     0  50000
              spdif_sel                0        0        0   480000000          0     0  50000
                 spdif_pred            0        0        0   240000000          0     0  50000
                    spdif_podf         0        0        0    30000000          0     0  50000
                       spdif           0        0        0    30000000          0     0  50000
              esai_sel                 0        0        0   480000000          0     0  50000
                 esai_pred             0        0        0   240000000          0     0  50000
                    esai_podf          0        0        0    30000000          0     0  50000
                       esai_extal       0        0        0    30000000          0     0  50000
              qspi1_sel                0        0        0   480000000          0     0  50000
                 qspi1_podf            0        0        0   240000000          0     0  50000
                    qspi1              0        0        0   240000000          0     0  50000
                 ldb_di1_div_7         0        0        0    68571428          0     0  50000
                    ldb_di1            0        0        0    68571428          0     0  50000
                 ldb_di1_div_3_5       0        0        0   137142857          0     0  50000
              periph2_clk2_sel         0        0        0   480000000          0     0  50000
                 periph2_clk2          0        0        0   480000000          0     0  50000
              pll3_60m                 0        0        0    60000000          0     0  50000
                 can_sel               0        0        0    60000000          0     0  50000
                    can_podf           0        0        0    30000000          0     0  50000
                       can2_serial       0        0        0    30000000          0     0  50000
                       can1_serial       0        0        0    30000000          0     0  50000
                 ecspi_sel             0        0        0    60000000          0     0  50000
                    ecspi_podf         0        0        0    60000000          0     0  50000
                       ecspi4          0        0        0    60000000          0     0  50000
                       ecspi3          0        0        0    60000000          0     0  50000
                       ecspi2          0        0        0    60000000          0     0  50000
                       ecspi1          0        0        0    60000000          0     0  50000
              pll3_80m                 1        1        0    80000000          0     0  50000
                 uart_sel              1        1        0    80000000          0     0  50000
                    uart_podf          1        1        0    80000000          0     0  50000
                       uart8_serial       0        0        0    80000000          0     0  50000
                       uart7_serial       0        0        0    80000000          0     0  50000
                       uart1_serial       1        2        0    80000000          0     0  50000
                       uart6_serial       0        0        0    80000000          0     0  50000
                       uart5_serial       0        0        0    80000000          0     0  50000
                       uart4_serial       0        0        0    80000000          0     0  50000
                       uart3_serial       0        0        0    80000000          0     0  50000
                       uart2_serial       0        0        0    80000000          0     0  50000
              pll3_pfd3_454m           0        0        0   454736842          0     0  50000
              pll3_pfd2_508m           0        0        0   508235294          0     0  50000
                 epdc_pre_sel          0        0        0   508235294          0     0  50000
                    epdc_podf          0        0        0   254117647          0     0  50000
                       epdc_pix        0        0        0   254117647          0     0  50000
                       epdc_sel        0        0        0   254117647          0     0  50000
                 sai1_sel              0        0        0   508235294          0     0  50000
                    sai1_pred          0        0        0   127058824          0     0  50000
                       sai1_podf       0        0        0    63529412          0     0  50000
                          sai1         0        0        0    63529412          0     0  50000
                 sai2_sel              0        0        0   508235294          0     0  50000
                    sai2_pred          0        0        0   127058824          0     0  50000
                       sai2_podf       0        0        0    63529412          0     0  50000
                          sai2         0        0        0    63529412          0     0  50000
                 sai3_sel              0        0        0   508235294          0     0  50000
                    sai3_pred          0        0        0   127058824          0     0  50000
                       sai3_podf       0        0        0    63529412          0     0  50000
                          sai3         0        0        0    63529412          0     0  50000
              pll3_pfd1_540m           0        0        0   540000000          0     0  50000
                 lcdif_pre_sel         0        0        0   540000000          0     0  50000
                    lcdif_pred         0        0        0   270000000          0     0  50000
                       lcdif_podf       0        0        0   135000000          0     0  50000
                          lcdif_pix       0        0        0   135000000          0     0  50000
                          iomuxc       0        0        0   135000000          0     0  50000
                          lcdif_sel       0        0        0   135000000          0     0  50000
              pll3_pfd0_720m           0        0        0   720000000          0     0  50000
              usbphy1                  1        1        0   480000000          0     0  50000
     pll2                              1        1        0   528000000          0     0  50000
        pll2_bypass                    1        1        0   528000000          0     0  50000
           pll2_bus                    2        2        0   528000000          0     0  50000
              ca7_secondary_sel        0        0        0   528000000          0     0  50000
                 step                  0        0        0   528000000          0     0  50000
              periph_pre               1        1        0   528000000          0     0  50000
                 periph                3        3        0   528000000          0     0  50000
                    ahb                7        7        0   132000000          0     0  50000
                       sdma            0        0        0   132000000          0     0  50000
                       rom             1        1        0   132000000          0     0  50000
                       esai_mem        0        0        0   132000000          0     0  50000
                       esai_ipg        0        0        0   132000000          0     0  50000
                       aips_tz3        1        1        0   132000000          0     0  50000
                       enet_ahb        2        2        0   132000000          0     0  50000
                       dcp             0        0        0   132000000          0     0  50000
                       asrc_mem        0        0        0   132000000          0     0  50000
                       asrc_ipg        0        0        0   132000000          0     0  50000
                       aips_tz2        1        1        0   132000000          0     0  50000
                       aips_tz1        1        1        0   132000000          0     0  50000
                       ipg            10       10        0    66000000          0     0  50000
                          wdog3        0        0        0    66000000          0     0  50000
                          uart8_ipg       0        0        0    66000000          0     0  50000
                          usboh3       2        2        0    66000000          0     0  50000
                          sai2_ipg       0        0        0    66000000          0     0  50000
                          sai1_ipg       0        0        0    66000000          0     0  50000
                          uart7_ipg       0        0        0    66000000          0     0  50000
                          uart1_ipg       1        2        0    66000000          0     0  50000
                          sai3_ipg       0        0        0    66000000          0     0  50000
                          spdif_gclk       0        0        0    66000000          0     0  50000
                          spba         0        0        0    66000000          0     0  50000
                          wdog2        0        0        0    66000000          0     0  50000
                          kpp          0        0        0    66000000          0     0  50000
                          mmdc_p1_ipg       0        0        0    66000000          0     0  50000
                          mmdc_p0_ipg       2        2        0    66000000          0     0  50000
                          wdog1        1        1        0    66000000          0     0  50000
                          gpio4        1        1        0    66000000          0     0  50000
                          uart6_ipg       0        0        0    66000000          0     0  50000
                          uart5_ipg       0        0        0    66000000          0     0  50000
                          gpio3        1        1        0    66000000          0     0  50000
                          ocotp        0        0        0    66000000          0     0  50000
                          gpio5        1        1        0    66000000          0     0  50000
                          gpio1        1        1        0    66000000          0     0  50000
                          uart4_ipg       0        0        0    66000000          0     0  50000
                          adc1         0        0        0    66000000          0     0  50000
                          uart3_ipg       0        0        0    66000000          0     0  50000
                          adc2         0        0        0    66000000          0     0  50000
                          gpio2        1        1        0    66000000          0     0  50000
                          uart2_ipg       0        0        0    66000000          0     0  50000
                          can2_ipg       0        0        0    66000000          0     0  50000
                          can1_ipg       0        0        0    66000000          0     0  50000
                          enet         2        2        0    66000000          0     0  50000
                    axi_sel            1        1        0   528000000          0     0  50000
                       axi_podf        2        2        0   264000000          0     0  50000
                          axi          1        1        0   264000000          0     0  50000
                             eim_slow_sel       0        0        0   264000000          0     0  50000
                                eim_slow_podf       0        0        0   132000000          0     0  50000
                                   eim       0        0        0   132000000          0     0  50000
                             lcdif_apb       0        0        0   264000000          0     0  50000
                             pxp       0        0        0   264000000          0     0  50000
                             epdc_aclk       0        0        0   264000000          0     0  50000
              pll2_pfd3_594m           0        0        0   594000000          0     0  50000
                 ldb_di0_sel           0        0        0   594000000          0     0  50000
                    ldb_di0_div_7       0        0        0    84857142          0     0  50000
                       ldb_di0         0        0        0    84857142          0     0  50000
                    ldb_di0_div_3_5       0        0        0   169714285          0     0  50000
              pll2_pfd2_396m           2        2        0   396000000          0     0  50000
                 enfc_sel              0        0        0   396000000          0     0  50000
                    enfc_pred          0        0        0    99000000          0     0  50000
                       enfc_podf       0        0        0    99000000          0     0  50000
                          gpmi_io       0        0        0    99000000          0     0  50000
                 usdhc1_sel            0        0        0   396000000          0     0  50000
                    usdhc1_podf        0        0        0   198000000          0     0  50000
                       usdhc1          0        0        0   198000000          0     0  50000
                 usdhc2_sel            0        0        0   396000000          0     0  50000
                    usdhc2_podf        0        0        0   198000000          0     0  50000
                       usdhc2          0        0        0   198000000          0     0  50000
                 bch_sel               1        1        0   396000000          0     0  50000
                    bch_podf           1        1        0    99000000          0     0  50000
                       gpmi_apb        0        0        0    99000000          0     0  50000
                       gpmi_bch_apb       0        0        0    99000000          0     0  50000
                       per_bch         0        0        0    99000000          0     0  50000
                       apbh_dma        1        1        0    99000000          0     0  50000
                 gpmi_sel              0        0        0   396000000          0     0  50000
                    gpmi_podf          0        0        0    99000000          0     0  50000
                       gpmi_bch        0        0        0    99000000          0     0  50000
                 periph2_pre           1        1        0   396000000          0     0  50000
                    periph2            2        2        0   396000000          0     0  50000
                       mmdc_podf       2        2        0   396000000          0     0  50000
                          mmdc_p0_fast       1        1        0   396000000          0     0  50000
                 axi_alt_sel           0        0        0   396000000          0     0  50000
                 pll2_198m             0        0        0   198000000          0     0  50000
              pll2_pfd1_594m           0        0        0   594000000          0     0  50000
              pll2_pfd0_352m           0        0        0   352000000          0     0  50000
     pll1                              1        1        0   900000000          0     0  50000
        pll1_bypass                    1        1        0   900000000          0     0  50000
           pll1_sys                    1        1        0   900000000          0     0  50000
              pll1_sw                  1        1        0   900000000          0     0  50000
                 arm                   1        1        0   900000000          0     0  50000
     pll7_bypass_src                   0        0        0    24000000          0     0  50000
     pll6_bypass_src                   0        0        0    24000000          0     0  50000
     pll5_bypass_src                   0        0        0    24000000          0     0  50000
     pll4_bypass_src                   0        0        0    24000000          0     0  50000
     pll3_bypass_src                   0        0        0    24000000          0     0  50000
     pll2_bypass_src                   0        0        0    24000000          0     0  50000
     pll1_bypass_src                   0        0        0    24000000          0     0  50000
  ckil                                 0        0        0       32768          0     0  50000


Note that this was generated on a normal boot up (not failure).

Running boot testing now waiting for a failure.

Regards
Greg

--------------4C6A22E0FCC179A8E4707514
Content-Type: text/x-patch;
 name="imx6-nand-trace.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="imx6-nand-trace.patch"

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 95ab933a10..7d6492452b 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -423,6 +423,46 @@
 	u16 busy_timeout_cycles;
 	u8 wrn_dly_sel;
 
+	printk("%s(%d): gpmi_nfc_compute_timings()\n", __FILE__, __LINE__);
+	printk("  sdr->tBERS_max=%llu\n", sdr->tBERS_max);
+	printk("  sdr->tCCS_min=%u\n", sdr->tCCS_min);
+	printk("  sdr->tPROG_max=%llu\n", sdr->tPROG_max);
+	printk("  sdr->tR_max=%llu\n", sdr->tR_max);
+	printk("  sdr->tALH_min=%u\n", sdr->tALH_min);
+	printk("  sdr->tADL_min=%u\n", sdr->tADL_min);
+	printk("  sdr->tALS_min=%u\n", sdr->tALS_min);
+	printk("  sdr->tAR_min=%u\n", sdr->tAR_min);
+	printk("  sdr->tCEA_max=%u\n", sdr->tCEA_max);
+	printk("  sdr->tCEH_min=%u\n", sdr->tCEH_min);
+	printk("  sdr->tCH_min=%u\n", sdr->tCH_min);
+	printk("  sdr->tCHZ_max=%u\n", sdr->tCHZ_max);
+	printk("  sdr->tCLH_min=%u\n", sdr->tCLH_min);
+	printk("  sdr->tCLR_min=%u\n", sdr->tCLR_min);
+	printk("  sdr->tCLS_min=%u\n", sdr->tCLS_min);
+	printk("  sdr->tCOH_min=%u\n", sdr->tCOH_min);
+	printk("  sdr->tCS_min=%u\n", sdr->tCS_min);
+	printk("  sdr->tDH_min=%u\n", sdr->tDH_min);
+	printk("  sdr->tDS_min=%u\n", sdr->tDS_min);
+	printk("  sdr->tFEAT_max=%u\n", sdr->tFEAT_max);
+	printk("  sdr->tIR_min=%u\n", sdr->tIR_min);
+	printk("  sdr->tITC_max=%u\n", sdr->tITC_max);
+	printk("  sdr->tRC_min=%u\n", sdr->tRC_min);
+	printk("  sdr->tREA_max=%u\n", sdr->tREA_max);
+	printk("  sdr->tREH_min=%u\n", sdr->tREH_min);
+	printk("  sdr->tRHOH_min=%u\n", sdr->tRHOH_min);
+	printk("  sdr->tRHW_min=%u\n", sdr->tRHW_min);
+	printk("  sdr->tRHZ_max=%u\n", sdr->tRHZ_max);
+	printk("  sdr->tRLOH_min=%u\n", sdr->tRLOH_min);
+	printk("  sdr->tRP_min=%u\n", sdr->tRP_min);
+	printk("  sdr->tRR_min=%u\n", sdr->tRR_min);
+	printk("  sdr->tRST_max=%llu\n", sdr->tRST_max);
+	printk("  sdr->tWB_max=%u\n", sdr->tWB_max);
+	printk("  sdr->tWC_min=%u\n", sdr->tWC_min);
+	printk("  sdr->tWH_min=%u\n", sdr->tWH_min);
+	printk("  sdr->tWHR_min=%u\n", sdr->tWHR_min);
+	printk("  sdr->tWP_min=%u\n", sdr->tWP_min);
+	printk("  sdr->tWW_min=%u\n", sdr->tWW_min);
+
 	if (sdr->tRC_min >= 30000) {
 		/* ONFI non-EDO modes [0-3] */
 		hw->clk_rate = 22000000;
@@ -436,19 +476,28 @@
 		hw->clk_rate = 100000000;
 		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
 	}
+	printk("    hw->clk_rate=%lu\n", hw->clk_rate);
+	printk("    wrn_dly_sel=%u\n", wrn_dly_sel);
 
 	/* SDR core timings are given in picoseconds */
 	period_ps = div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
+	printk("    period_ps=%u\n", period_ps);
 
 	addr_setup_cycles = TO_CYCLES(sdr->tALS_min, period_ps);
+	printk("    addr_setup_cycles=%u\n", addr_setup_cycles);
 	data_setup_cycles = TO_CYCLES(sdr->tDS_min, period_ps);
+	printk("    data_setup_cycles=%u\n", data_setup_cycles);
 	data_hold_cycles = TO_CYCLES(sdr->tDH_min, period_ps);
+	printk("    data_hold_cycles=%u\n", data_hold_cycles);
 	busy_timeout_cycles = TO_CYCLES(sdr->tWB_max + sdr->tR_max, period_ps);
+	printk("    busy_timeout_cycles=%u\n", busy_timeout_cycles);
 
 	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
 		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
 		      BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
+	printk("    hw->timing0=0x%08x\n", hw->timing0);
 	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles * 4096);
+	printk("    hw->timing1=0x%08x\n", hw->timing1);
 
 	/*
 	 * Derive NFC ideal delay from {3}:
@@ -457,6 +506,7 @@
 	 *         RDN_DELAY = -----------------------
 	 *                                RP
 	 */
+	printk("    dll_threshold_ps=%u\n", dll_threshold_ps);
 	if (period_ps > dll_threshold_ps) {
 		use_half_period = true;
 		reference_period_ps = period_ps / 2;
@@ -464,19 +514,26 @@
 		use_half_period = false;
 		reference_period_ps = period_ps;
 	}
+	printk("    use_half_period=%u\n", use_half_period);
+	printk("    reference_period_ps=%u\n", reference_period_ps);
 
 	tRP_ps = data_setup_cycles * period_ps;
+	printk("    tRP_ps=%u\n", tRP_ps);
 	sample_delay_ps = (sdr->tREA_max + 4000 - tRP_ps) * 8;
+	printk("    sample_delay_ps=%u\n", sample_delay_ps);
 	if (sample_delay_ps > 0)
 		sample_delay_factor = sample_delay_ps / reference_period_ps;
 	else
 		sample_delay_factor = 0;
+	printk("    sample_delay_factor=%u\n", sample_delay_factor);
 
 	hw->ctrl1n = BF_GPMI_CTRL1_WRN_DLY_SEL(wrn_dly_sel);
+	printk("    hw->ctrl1n=0x%08x\n", hw->ctrl1n);
 	if (sample_delay_factor)
 		hw->ctrl1n |= BF_GPMI_CTRL1_RDN_DELAY(sample_delay_factor) |
 			      BM_GPMI_CTRL1_DLL_ENABLE |
 			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
+	printk("    hw->ctrl1n=0x%08x\n", hw->ctrl1n);
 }
 
 void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
@@ -485,8 +542,13 @@
 	struct resources *r = &this->resources;
 	void __iomem *gpmi_regs = r->gpmi_regs;
 	unsigned int dll_wait_time_us;
+	int ret;
 
-	clk_set_rate(r->clock[0], hw->clk_rate);
+	printk("%s(%d): gpmi_nfc_apply_timings()\n", __FILE__, __LINE__);
+	printk("  hw>clk_rate=%lu\n", hw->clk_rate);
+	ret = clk_set_rate(r->clock[0], hw->clk_rate);
+	printk("  clk_set_rate(r->clock[0], hw->clk_rate)=%d\n", ret);
+	printk("  clk_get_rate(r->clock[0])=%lu\n", clk_get_rate(r->clock[0]));
 
 	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
 	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ddd396e93e..73f94842e8 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -910,6 +910,7 @@ static int nand_init_data_interface(struct nand_chip *chip)
 	}
 
 	for (mode = fls(modes) - 1; mode >= 0; mode--) {
+		printk("%s(%d): checking mode=%d\n", __FILE__, __LINE__, mode);
 		ret = onfi_fill_data_interface(chip, NAND_SDR_IFACE, mode);
 		if (ret)
 			continue;
@@ -923,10 +924,12 @@ static int nand_init_data_interface(struct nand_chip *chip)
 						 &chip->data_interface);
 		if (!ret) {
 			chip->onfi_timing_mode_default = mode;
+			printk("%s(%d): BREAKING AT  mode=%d\n", __FILE__, __LINE__, mode);
 			break;
 		}
 	}
 
+	printk("%s(%d): chip->onfi_timing_mode_default=%d\n", __FILE__, __LINE__, chip->onfi_timing_mode_default);
 	return 0;
 }
 

--------------4C6A22E0FCC179A8E4707514
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------4C6A22E0FCC179A8E4707514--

