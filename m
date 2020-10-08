Return-Path: <SRS0=8c9b=DP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69091C4363A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 14:37:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B923821789
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 14:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZMSiR7co";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=robart.cc header.i=@robart.cc header.b="Paj6bJJf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B923821789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robart.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YAuosn2gy0gpOHq3fY1jOfSJEwt8Bl/CximKJ+nEb2g=; b=ZMSiR7cohMCwZSQha9cTzqqsne
	Dww/RYHV5SH7lDNv7R8nsCtfoo/1B0/C7Z+S3GbzFJBrqukyt1j6VVlSSEVseDAzj2o/Iym4hWYV0
	gbLe9ygSjHUE4V7fB85jMcW9E3nx8xUabGUnepQL2QymdH4wY9h+9Apm7/JfyzxbTEQ43Y9skdzwc
	mE60FTGl4po2hPb/UJOxWO76Fb6nfMwBjrCbIKsNuvxJe5/+wVl/t7P41IPRI9kmXvbqXJyfFSVzS
	N6TyIm29DGp67htUXoKSSAn9zir20GayAymEZHg0Gv66A/cEnkuE0uMJKuLUCgM22liRTwj5A7ywS
	xG8CLj2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQX2M-0008HR-Cx; Thu, 08 Oct 2020 14:36:54 +0000
Received: from srv-mta-01.robart.cc ([80.123.245.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQX2I-0008Gk-ID
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2020 14:36:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 6D3711C0DDE
 for <linux-mtd@lists.infradead.org>; Thu,  8 Oct 2020 16:36:49 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5hl50Wxyhyyp for <linux-mtd@lists.infradead.org>;
 Thu,  8 Oct 2020 16:36:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 335C81C0DE1
 for <linux-mtd@lists.infradead.org>; Thu,  8 Oct 2020 16:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc 335C81C0DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
 s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1602167809;
 bh=/znOaNN4qnrfc8ZnpzqOQuNKXKyVeyt6UKbU06VdQRQ=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Paj6bJJfRUG/LAu8vzNGssMHrizI0soBFPMsc+OM2uQcUzWqvuUUvzuvvXOonXgQx
 Y1eQ3qaJULfBnNQdwCLy1wbJEexI/hjI2cEMOk1vZhum2/BKnNq4Ljivw5zYzIIPxS
 zuZEhiQ0Wi45e0Si7pE5JufQRmo8hiPuywGLO8cGOPqFMcvDYyDzef8OaXmgCj7Gb7
 lLjMpImezX+2jzQu4/YRe9e+fSxDRSch9p3LLwHZCgTgule6mLm+JT8DZtE4WSzuDe
 LHo0kr++xi4Q5eFcby5BHcLiEFCk4n9vKEZOviN7UaTElrYFweNRiIiFRwqX7y4LVx
 JiFQBj8fht8Qw==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zC3AY1RCaEj1 for <linux-mtd@lists.infradead.org>;
 Thu,  8 Oct 2020 16:36:49 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.robart.cc [10.0.10.21])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 0EEF91C0DE0
 for <linux-mtd@lists.infradead.org>; Thu,  8 Oct 2020 16:36:49 +0200 (CEST)
Date: Thu, 8 Oct 2020 16:36:48 +0200 (CEST)
From: Manuel Dipolt <mdipolt@robart.cc>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1697859969.981204.1602167808910.JavaMail.zimbra@robart.cc>
Subject: [PATCH v4] mtd: sunxi-nand: add mdma support for allwinner h3
MIME-Version: 1.0
X-Originating-IP: [10.0.20.40]
X-Mailer: Zimbra 8.8.15_GA_3959 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Index: d+yItepBCI4UDQUE/53GXRNubGkJQA==
Thread-Topic: sunxi-nand: add mdma support for allwinner h3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_103650_937766_FCC98919 
X-CRM114-Status: GOOD (  21.79  )
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


The Allwinner H3 soc supports mdma mode, this patch enable support for it 
see old sunxi drivers https://github.com/allwinner-zh/linux-3.4-sunxi/tree/master/modules/nand


Signed-off-by: Manuel Dipolt <manuel.dipolt@robart.cc> 
--- 
drivers/mtd/nand/raw/sunxi_nand.c | 196 ++++++++++++++++++++++-------- 
1 file changed, 147 insertions(+), 49 deletions(-) 

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c 
index 2a7ca3072f35..28ee2f44f179 100644 
--- a/drivers/mtd/nand/raw/sunxi_nand.c 
+++ b/drivers/mtd/nand/raw/sunxi_nand.c 
@@ -51,6 +51,7 @@ 
#define NFC_REG_USER_DATA(x) (0x0050 + ((x) * 4)) 
#define NFC_REG_SPARE_AREA 0x00A0 
#define NFC_REG_PAT_ID 0x00A4 
+#define NFC_REG_MDMA_ADDR 0x00C0 
#define NFC_REG_MDMA_CNT 0x00C4 
#define NFC_RAM0_BASE 0x0400 
#define NFC_RAM1_BASE 0x0800 
@@ -60,7 +61,7 @@ 
#define NFC_RESET BIT(1) 
#define NFC_BUS_WIDTH_MSK BIT(2) 
#define NFC_BUS_WIDTH_8 (0 << 2) 
-#define NFC_BUS_WIDTH_16 (1 << 2) 
+#define NFC_BUS_WIDTH_16 BIT(2) 
#define NFC_RB_SEL_MSK BIT(3) 
#define NFC_RB_SEL(x) ((x) << 3) 
#define NFC_CE_SEL_MSK GENMASK(26, 24) 
@@ -118,7 +119,7 @@ 
#define NFC_SEND_CMD4 BIT(29) 
#define NFC_CMD_TYPE_MSK GENMASK(31, 30) 
#define NFC_NORMAL_OP (0 << 30) 
-#define NFC_ECC_OP (1 << 30) 
+#define NFC_ECC_OP BIT(30) 
#define NFC_PAGE_OP (2U << 30) 

/* define bit use in NFC_RCMD_SET */ 
@@ -207,12 +208,14 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand) 
* NAND Controller capabilities structure: stores NAND controller capabilities 
* for distinction between compatible strings. 
* 
+ * @has_mdma: use mbus dma mode, otherwise general dma 
* @extra_mbus_conf: Contrary to A10, A10s and A13, accessing internal RAM 
* through MBUS on A23/A33 needs extra configuration. 
* @reg_io_data: I/O data register 
* @dma_maxburst: DMA maxburst 
*/ 
struct sunxi_nfc_caps { 
+ bool has_mdma; 
bool extra_mbus_conf; 
unsigned int reg_io_data; 
unsigned int dma_maxburst; 
@@ -289,7 +292,7 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events, 
writel(events, nfc->regs + NFC_REG_INT); 

ret = wait_for_completion_timeout(&nfc->complete, 
- msecs_to_jiffies(timeout_ms)); 
+ msecs_to_jiffies(timeout_ms)); 
if (!ret) 
ret = -ETIMEDOUT; 
else 
@@ -393,6 +396,35 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf, 
return ret; 
} 

+static int sunxi_nfc_mdma_op_prepare(struct sunxi_nfc *nfc, const void *buf, 
+ int chunksize, int nchunks, 
+ enum dma_data_direction ddir, 
+ __u32 *mem_addr) 
+{ 
+ enum dma_transfer_direction tdir; 
+ int ret; 
+ 
+ if (ddir == DMA_FROM_DEVICE) 
+ tdir = DMA_DEV_TO_MEM; 
+ else 
+ tdir = DMA_MEM_TO_DEV; 
+ 
+ *mem_addr = (__u32)dma_map_single(nfc->dev, (void *)buf, nchunks * chunksize, tdir); 
+ ret = dma_mapping_error(nfc->dev, *mem_addr); 
+ if (ret) { 
+ dev_err(nfc->dev, "DMA mapping error\n"); 
+ return ret; 
+ } 
+ 
+ writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL); 
+ writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM); 
+ writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT); 
+ writel(*mem_addr, nfc->regs + NFC_REG_MDMA_ADDR); 
+ writel(chunksize, nfc->regs + NFC_REG_CNT); 
+ 
+ return 0; 
+} 
+ 
static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc, 
enum dma_data_direction ddir, 
struct scatterlist *sg) 
@@ -402,6 +434,21 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc, 
nfc->regs + NFC_REG_CTL); 
} 

+static void sunxi_nfc_mdma_op_cleanup(struct sunxi_nfc *nfc, 
+ enum dma_data_direction ddir, 
+ __u32 *mem_addr, size_t size) 
+{ 
+ enum dma_transfer_direction tdir; 
+ 
+ if (ddir == DMA_FROM_DEVICE) 
+ tdir = DMA_DEV_TO_MEM; 
+ else 
+ tdir = DMA_MEM_TO_DEV; 
+ 
+ dma_unmap_single(nfc->dev, *mem_addr, size, tdir); 
+ writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL); 
+} 
+ 
static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs) 
{ 
struct mtd_info *mtd = nand_to_mtd(nand); 
@@ -656,7 +703,7 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm) 
} 

static void sunxi_nfc_randomizer_write_buf(struct nand_chip *nand, 
- const uint8_t *buf, int len, 
+ const u8 *buf, int len, 
bool ecc, int page) 
{ 
sunxi_nfc_randomizer_config(nand, page, ecc); 
@@ -911,14 +958,20 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf 
unsigned int max_bitflips = 0; 
int ret, i, raw_mode = 0; 
struct scatterlist sg; 
- u32 status; 
+ u32 status, wait_event_flags; 
+ __u32 mem_addr; 

ret = sunxi_nfc_wait_cmd_fifo_empty(nfc); 
if (ret) 
return ret; 

- ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks, 
- DMA_FROM_DEVICE, &sg); 
+ if (nfc->caps->has_mdma) 
+ ret = sunxi_nfc_mdma_op_prepare(nfc, buf, ecc->size, nchunks, 
+ DMA_FROM_DEVICE, &mem_addr); 
+ else 
+ ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks, 
+ DMA_FROM_DEVICE, &sg); 
+ 
if (ret) 
return ret; 

@@ -929,19 +982,27 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf 
writel((NAND_CMD_RNDOUTSTART << 16) | (NAND_CMD_RNDOUT << 8) | 
NAND_CMD_READSTART, nfc->regs + NFC_REG_RCMD_SET); 

- dma_async_issue_pending(nfc->dmac); 
+ wait_event_flags = NFC_CMD_INT_FLAG; 
+ 
+ if (nfc->caps->has_mdma) 
+ wait_event_flags = NFC_DMA_INT_FLAG; 
+ else 
+ dma_async_issue_pending(nfc->dmac); 

writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS, 
nfc->regs + NFC_REG_CMD); 

- ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0); 
- if (ret) 
+ ret = sunxi_nfc_wait_events(nfc, wait_event_flags, false, 0); 
+ if (ret && !nfc->caps->has_mdma) 
dmaengine_terminate_all(nfc->dmac); 

sunxi_nfc_randomizer_disable(nand); 
sunxi_nfc_hw_ecc_disable(nand); 

- sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg); 
+ if (nfc->caps->has_mdma) 
+ sunxi_nfc_mdma_op_cleanup(nfc, DMA_FROM_DEVICE, &mem_addr, nchunks * ecc->size); 
+ else 
+ sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg); 

if (ret) 
return ret; 
@@ -1199,7 +1260,7 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand, 
} 

static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand, 
- const uint8_t *buf, int oob_required, 
+ const u8 *buf, int oob_required, 
int page) 
{ 
struct mtd_info *mtd = nand_to_mtd(nand); 
@@ -1277,6 +1338,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand, 
struct nand_ecc_ctrl *ecc = &nand->ecc; 
struct scatterlist sg; 
int ret, i; 
+ u32 wait_event_flags; 
+ __u32 mem_addr; 

sunxi_nfc_select_chip(nand, nand->cur_cs); 

@@ -1284,10 +1347,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand, 
if (ret) 
return ret; 

- ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps, 
- DMA_TO_DEVICE, &sg); 
+ if (nfc->caps->has_mdma) 
+ ret = sunxi_nfc_mdma_op_prepare(nfc, buf, ecc->size, ecc->steps, 
+ DMA_TO_DEVICE, &mem_addr); 
+ else 
+ ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps, DMA_TO_DEVICE, &sg); 
+ 
if (ret) 
- goto pio_fallback; 
+ return ret; 

for (i = 0; i < ecc->steps; i++) { 
const u8 *oob = nand->oob_poi + (i * (ecc->bytes + 4)); 
@@ -1304,20 +1371,28 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand, 
writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG, 
nfc->regs + NFC_REG_WCMD_SET); 

- dma_async_issue_pending(nfc->dmac); 
+ wait_event_flags = NFC_CMD_INT_FLAG; 
+ 
+ if (nfc->caps->has_mdma) 
+ wait_event_flags = NFC_DMA_INT_FLAG; 
+ else 
+ dma_async_issue_pending(nfc->dmac); 

writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | 
- NFC_DATA_TRANS | NFC_ACCESS_DIR, 
- nfc->regs + NFC_REG_CMD); 
+ NFC_DATA_TRANS | NFC_ACCESS_DIR, 
+ nfc->regs + NFC_REG_CMD); 

- ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0); 
- if (ret) 
+ ret = sunxi_nfc_wait_events(nfc, wait_event_flags, false, 0); 
+ if (ret && !nfc->caps->has_mdma) 
dmaengine_terminate_all(nfc->dmac); 

sunxi_nfc_randomizer_disable(nand); 
sunxi_nfc_hw_ecc_disable(nand); 

- sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg); 
+ if (nfc->caps->has_mdma) 
+ sunxi_nfc_mdma_op_cleanup(nfc, DMA_TO_DEVICE, &mem_addr, ecc->size * ecc->steps); 
+ else 
+ sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg); 

if (ret) 
return ret; 
@@ -1359,7 +1434,7 @@ static const s32 tWB_lut[] = {6, 12, 16, 20}; 
static const s32 tRHW_lut[] = {4, 8, 12, 20}; 

static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration, 
- u32 clk_period) 
+ u32 clk_period) 
{ 
u32 clk_cycles = DIV_ROUND_UP(duration, clk_period); 
int i; 
@@ -1695,7 +1770,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand, 
mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops); 
ecc->priv = data; 

- if (nfc->dmac) { 
+ if (nfc->dmac || nfc->caps->has_mdma) { 
ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma; 
ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma; 
ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma; 
@@ -1949,10 +2024,8 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc, 

sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels), 
GFP_KERNEL); 
- if (!sunxi_nand) { 
- dev_err(dev, "could not allocate chip\n"); 
+ if (!sunxi_nand) 
return -ENOMEM; 
- } 

sunxi_nand->nsels = nsels; 

@@ -2058,6 +2131,41 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc) 
} 
} 

+static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r) 
+{ 
+ int ret; 
+ 
+ if (nfc->caps->has_mdma) { 
+ writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL, 
+ nfc->regs + NFC_REG_CTL); 
+ } else { 
+ nfc->dmac = dma_request_chan(nfc->dev, "rxtx"); 
+ if (IS_ERR(nfc->dmac)) { 
+ ret = PTR_ERR(nfc->dmac); 
+ if (ret) 
+ return ret; 
+ 
+ /* Ignore errors to fall back to PIO mode */ 
+ dev_warn(nfc->dev, "failed to request rxtx DMA channel: %d\n", ret); 
+ } else { 
+ struct dma_slave_config dmac_cfg = { }; 
+ 
+ dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data; 
+ dmac_cfg.dst_addr = dmac_cfg.src_addr; 
+ dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES; 
+ dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width; 
+ dmac_cfg.src_maxburst = nfc->caps->dma_maxburst; 
+ dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst; 
+ dmaengine_slave_config(nfc->dmac, &dmac_cfg); 
+ 
+ if (nfc->caps->extra_mbus_conf) 
+ writel(readl(nfc->regs + NFC_REG_CTL) | 
+ NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL); 
+ } 
+ } 
+ return 0; 
+} 
+ 
static int sunxi_nfc_probe(struct platform_device *pdev) 
{ 
struct device *dev = &pdev->dev; 
@@ -2132,30 +2240,10 @@ static int sunxi_nfc_probe(struct platform_device *pdev) 
if (ret) 
goto out_ahb_reset_reassert; 

- nfc->dmac = dma_request_chan(dev, "rxtx"); 
- if (IS_ERR(nfc->dmac)) { 
- ret = PTR_ERR(nfc->dmac); 
- if (ret == -EPROBE_DEFER) 
- goto out_ahb_reset_reassert; 
+ ret = sunxi_nfc_dma_init(nfc, r); 

- /* Ignore errors to fall back to PIO mode */ 
- dev_warn(dev, "failed to request rxtx DMA channel: %d\n", ret); 
- nfc->dmac = NULL; 
- } else { 
- struct dma_slave_config dmac_cfg = { }; 
- 
- dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data; 
- dmac_cfg.dst_addr = dmac_cfg.src_addr; 
- dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES; 
- dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width; 
- dmac_cfg.src_maxburst = nfc->caps->dma_maxburst; 
- dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst; 
- dmaengine_slave_config(nfc->dmac, &dmac_cfg); 
- 
- if (nfc->caps->extra_mbus_conf) 
- writel(readl(nfc->regs + NFC_REG_CTL) | 
- NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL); 
- } 
+ if (ret) 
+ goto out_ahb_reset_reassert; 

platform_set_drvdata(pdev, nfc); 

@@ -2197,16 +2285,22 @@ static int sunxi_nfc_remove(struct platform_device *pdev) 
} 

static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = { 
+ .has_mdma = false, 
.reg_io_data = NFC_REG_A10_IO_DATA, 
.dma_maxburst = 4, 
}; 

static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = { 
+ .has_mdma = false, 
.extra_mbus_conf = true, 
.reg_io_data = NFC_REG_A23_IO_DATA, 
.dma_maxburst = 8, 
}; 

+static const struct sunxi_nfc_caps sunxi_nfc_h3_caps = { 
+ .has_mdma = true, 
+}; 
+ 
static const struct of_device_id sunxi_nfc_ids[] = { 
{ 
.compatible = "allwinner,sun4i-a10-nand", 
@@ -2216,6 +2310,10 @@ static const struct of_device_id sunxi_nfc_ids[] = { 
.compatible = "allwinner,sun8i-a23-nand-controller", 
.data = &sunxi_nfc_a23_caps, 
}, 
+ { 
+ .compatible = "allwinner,sun8i-h3-nand-controller", 
+ .data = &sunxi_nfc_h3_caps, 
+ }, 
{ /* sentinel */ } 
}; 
MODULE_DEVICE_TABLE(of, sunxi_nfc_ids); 
-- 
2.20.1 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
