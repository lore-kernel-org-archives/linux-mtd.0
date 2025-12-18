Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00BBD6E2CA
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Dec 2025 18:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4cbPezQIgdqvxNfec+VfkyKNkx5AtEc4VFkHWX8bNk=; b=vwKdKcfg4HWW1u
	PlSdkPaGLxw9xmuUt5B0cwqClyKncw0u+paMpqheEBHr0drzXWHs0TmYaaYg809zLblEZFz3NyMu2
	i4Qmo8kaB0diRa7UiU1ARhVAzA0lJDX+0gfJkQCd00AGWLN1suT4K8DcVM6PN1HqvvRojJguM7JX9
	Eb+9h852RP5JbjgUPErrMXjRWlMNxBR7kvATC3CIaWzHCe9VhudykAPM3K8lqQK9FW33je0kH/FB5
	XIBmH7EGUeRARkH+6zaLTVVqi7kw5qF88swBywZ1sFHbEncPy4OFp6g85eLTolCgIU6GUPHqnOgLP
	PDdZ8kRNR/mAzKn+uzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIM7-00000008yFX-1j4W;
	Thu, 18 Dec 2025 18:04:03 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIM0-00000008yDQ-3byz
	for linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2025 18:04:01 +0000
X-QQ-mid: esmtpgz12t1766080957t6cdf7b4c
X-QQ-Originating-IP: 1O3gaj4ACK8WXXkB2Iw1cUX0B1+/aacB837MLA5+Y80=
Received: from bigfoot-server-arm-node1.classf ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Dec 2025 02:02:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8351619728533894091
EX-QQ-RecipientCnt: 16
From: Junhao Xie <bigfoot@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Junhao Xie <bigfoot@radxa.com>,
	Xilin Wu <sophon@radxa.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] firmware: qcom: scm: Add SCM storage interface support
Date: Fri, 19 Dec 2025 02:02:04 +0800
Message-ID: <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218180205.930961-1-bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Odky5wNUcHo/kOzkVQRNW20E7NDyuZtl8jOE5lEMB+QzAJFE6wPm44IT
	h9aHIQEyjYZdg2G57UOoeYt4erzJaxtms5uXeqoJ5ViCZanScGENJD4eR9hUbwxZE/hESwY
	kxv1OoJj5L0eMG7KnFwwRLKbaRzCJAsKRPvtCKFbr4Q+ZPHgbCvLchsi+Nmj3xiyhtEeV3t
	WRz4uaY1zHExooYdi+xBmi0J85ewrOajmhPUVU3fIV0RinK+ZjfWsXGntdaXhef2pt2lJ8k
	PP+zja1nNF8YVxsrbbcb1UHi3s0zahYgbP0J5kqxjVx401PTkHjqr4E4CUmC3mXkDP65VIq
	ljQKNJGbDQ/Gz4RZQTH2XHf5et8OfD4s96jYm7F0azkBq5DeZwAp0TBEJZIwXEukOYRbQM9
	K+36zg+qub8oLJtAiPi76Ait9h+236dkZHPK9D+klvrw5rR8DnOfEnwMgdJBDfFnt40YxIs
	PN0TKs47mlVJPt64eq7dC93ZCP2cncD3wQ2Mr9iN3+x7KPNa/42OkGMem5l971vC3+jtqxl
	qM1l5i9ul2q3P0KCJtho8ewNPmnxkgn4eM4U8am3KQhQ4xxDYONvi+lh3p4UQVApwtquPCP
	m8cR7HUHgjdA9HG5Xd2Tqry89ili/VYO38UdEyXIzmBbWirMmBX3eYO9DmKabQf0scVd60M
	l/kotFmw0bB/86s9tbf/PJ62zdnTxSiDzKVl+72s/GD4F0NUh8ppCcOa/vnHiIQrNJOAJol
	EhoebyAYvG7Zlx8ewX5yVOXT/kR2IGZGsGQ28Vkr+UG5K1dxpbec+xgMVfZ9ca+mT6txq8G
	4EUQNJnzUQQ5IV7def2/0u0WcspIFhTCpNbwr0Rx+ZsmEDtK/sfLfOGB8EvDYUNLbtuuf+W
	63nGkmZz8brmCkNKgYTfuuFD88WN7LeeENs2fkpcxxCDTr1/ng75sUocZETID3IXl9WtQ4V
	cO5BlbZMZJOxcCNUw5DNSoydfD/KuZKbZleVqcPm+hLlkGt40LEt6X+x/wIktasnzj+E=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_100357_360234_B1F7EEDD 
X-CRM114-Status: GOOD (  18.13  )
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

Add infrastructure to support accessing TrustZone-protected storage
devices through SCM (Secure Channel Manager) calls. Some Qualcomm
platforms protect their firmware storage (typically SPI NOR flash)
via TrustZone, making it inaccessible from the non-secure world.

Currently allowlisted for Radxa Dragon Q6A (QCS6490) where it has been
validated. Additional platforms can be added as they are tested.

Signed-off-by: Junhao Xie <bigfoot@radxa.com>
Tested-by: Xilin Wu <sophon@radxa.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 183 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   3 +
 include/linux/firmware/qcom/qcom_scm.h |  47 +++++++
 3 files changed, 233 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 731074ca1ebbe..b117e1b58e363 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -66,6 +66,21 @@ struct qcom_scm_mem_map_info {
 	__le64 mem_size;
 };
 
+struct qcom_scm_storage_cmd {
+	__le64 storage_type;
+	__le64 slot_num;
+	__le64 lun;
+	__le64 guid_ptr;
+	__le64 storage_cmd;
+};
+
+struct qcom_scm_storage_cmd_details {
+	__le64 lba;
+	__le64 length;
+	__le64 data_ptr;
+	__le64 data_size;
+};
+
 /**
  * struct qcom_scm_qseecom_resp - QSEECOM SCM call response.
  * @result:    Result or status of the SCM call. See &enum qcom_scm_qseecom_result.
@@ -111,6 +126,15 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+enum qcom_scm_storage_result {
+	STORAGE_RESULT_SUCCESS			= 0,
+	STORAGE_RESULT_NO_MEMORY		= 1,
+	STORAGE_RESULT_INVALID_PARAMETER	= 2,
+	STORAGE_RESULT_STORAGE_ERROR		= 3,
+	STORAGE_RESULT_ACCESS_DENIED		= 4,
+	STORAGE_RESULT_NOT_SUPPORTED		= 5,
+};
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 #define SHMBRIDGE_RESULT_NOTSUPP		4
 
@@ -2214,6 +2238,159 @@ static void qcom_scm_qtee_init(struct qcom_scm *scm)
 	devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
 }
 
+#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
+
+int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+			      enum qcom_scm_storage_cmd_id cmd_id,
+			      u64 lba, void *payload, size_t size)
+{
+	struct qcom_scm_res scm_res = {};
+	struct qcom_scm_desc desc = {};
+	struct qcom_scm_storage_cmd *cmd;
+	struct qcom_scm_storage_cmd_details *details;
+	size_t buf_size;
+	void *payload_buf;
+	int ret;
+
+	buf_size = sizeof(*cmd) + sizeof(*details);
+	if (payload)
+		buf_size += size;
+	void *data __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							 buf_size,
+							 GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	memset(data, 0, buf_size);
+	if (payload) {
+		payload_buf = data + sizeof(*cmd) + sizeof(*details);
+		memcpy(payload_buf, payload, size);
+	}
+
+	cmd = data;
+	cmd->storage_type = storage_type;
+	cmd->storage_cmd = cmd_id;
+
+	details = data + sizeof(*cmd);
+	details->lba = lba;
+	if (payload)
+		details->data_ptr = qcom_tzmem_to_phys(payload_buf);
+	details->length = size;
+
+	desc.svc = QCOM_SCM_SVC_STORAGE;
+	desc.cmd = QCOM_SCM_STORAGE_CMD;
+	desc.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RO, QCOM_SCM_VAL,
+				     QCOM_SCM_RW, QCOM_SCM_VAL);
+	desc.args[0] = qcom_tzmem_to_phys(cmd);
+	desc.args[1] = sizeof(*cmd);
+	desc.args[2] = qcom_tzmem_to_phys(details);
+	desc.args[3] = sizeof(*details);
+	desc.owner = ARM_SMCCC_OWNER_SIP;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &scm_res);
+	if (ret)
+		return ret;
+
+	if (payload)
+		memcpy(payload, payload_buf, size);
+
+	switch (scm_res.result[0]) {
+	case STORAGE_RESULT_SUCCESS:
+		return 0;
+	case STORAGE_RESULT_NO_MEMORY:
+		return -ENOMEM;
+	case STORAGE_RESULT_INVALID_PARAMETER:
+		return -EINVAL;
+	case STORAGE_RESULT_STORAGE_ERROR:
+		return -EIO;
+	case STORAGE_RESULT_ACCESS_DENIED:
+		return -EACCES;
+	case STORAGE_RESULT_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	default:
+		return -EIO;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_scm_storage_send_cmd);
+
+/*
+ * Allowlist of platforms known to support and have tested SCM storage interface.
+ * This is a safety mechanism to prevent exposing potentially dangerous firmware
+ * access on untested platforms. New platforms should be added here after validation.
+ */
+static const struct of_device_id qcom_scm_storage_allowlist[] = {
+	{ .compatible = "radxa,dragon-q6a" },
+	{ }
+};
+
+static bool qcom_scm_storage_machine_is_allowed(void)
+{
+	struct device_node *np;
+	bool match;
+
+	np = of_find_node_by_path("/");
+	if (!np)
+		return false;
+
+	match = of_match_node(qcom_scm_storage_allowlist, np);
+	of_node_put(np);
+
+	return match;
+}
+
+static void qcom_scm_storage_free(void *data)
+{
+	struct platform_device *storage_dev = data;
+
+	platform_device_unregister(storage_dev);
+}
+
+static int qcom_scm_storage_init(struct qcom_scm *scm)
+{
+	struct qcom_scm_storage_info info;
+	struct platform_device *storage_dev;
+	int ret;
+
+	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					QCOM_SCM_STORAGE_GET_INFO,
+					0, &info, sizeof(info));
+	if (ret < 0) {
+		dev_info(scm->dev, "scm storage not available: %d\n", ret);
+		return 0;
+	}
+
+	if (!qcom_scm_storage_machine_is_allowed()) {
+		dev_info(scm->dev, "scm storage untested, skipping\n");
+		return 0;
+	}
+
+	dev_info(scm->dev, "scm storage size %llu bytes\n",
+		 info.total_blocks * info.block_size);
+
+	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
+	if (!storage_dev)
+		return -ENOMEM;
+
+	storage_dev->dev.parent = scm->dev;
+
+	ret = platform_device_add(storage_dev);
+	if (ret) {
+		platform_device_put(storage_dev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(scm->dev, qcom_scm_storage_free,
+					storage_dev);
+}
+
+#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
+static int qcom_scm_storage_init(struct qcom_scm *scm)
+{
+	return 0;
+}
+
+#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2449,6 +2626,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Initialize the QTEE object interface. */
 	qcom_scm_qtee_init(scm);
 
+	/*
+	 * Initialize the SCM storage interface.
+	 */
+	ret = qcom_scm_storage_init(scm);
+	WARN(ret < 0, "failed to initialize scm storage: %d\n", ret);
+
 	return 0;
 }
 
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c4..3b68b33c5ccc3 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -149,6 +149,9 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
 
+#define QCOM_SCM_SVC_STORAGE			0x1a
+#define QCOM_SCM_STORAGE_CMD			0x01
+
 #define QCOM_SCM_SVC_WAITQ			0x24
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca771286bf..41f799d8de54f 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
 	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
 };
 
+enum qcom_scm_storage_cmd_id {
+	QCOM_SCM_STORAGE_INIT      = 0,
+	QCOM_SCM_STORAGE_READ      = 1,
+	QCOM_SCM_STORAGE_WRITE     = 2,
+	QCOM_SCM_STORAGE_ERASE     = 3,
+	QCOM_SCM_STORAGE_GET_INFO  = 4,
+	QCOM_SCM_STORAGE_DEINIT    = 5,
+};
+
+enum qcom_scm_storage_type {
+	QCOM_SCM_STORAGE_NULL    = 0,
+	QCOM_SCM_STORAGE_SPINOR  = 1,
+};
+
+#define QCOM_SCM_STORAGE_FW_VER_LEN	32
+#define QCOM_SCM_STORAGE_MEM_TYPE_LEN	5
+#define QCOM_SCM_STORAGE_PROD_NAME_LEN	32
+
+struct qcom_scm_storage_info {
+	u64 total_blocks;
+	u32 block_size;
+	u32 page_size;
+	u32 num_physical;
+	u64 manufacturer_id;
+	u64 serial_num;
+	char fw_version[QCOM_SCM_STORAGE_FW_VER_LEN];
+	char memory_type[QCOM_SCM_STORAGE_MEM_TYPE_LEN];
+	char product_name[QCOM_SCM_STORAGE_PROD_NAME_LEN];
+} __packed;
+
 #define QCOM_SCM_PERM_READ       0x4
 #define QCOM_SCM_PERM_WRITE      0x2
 #define QCOM_SCM_PERM_EXEC       0x1
@@ -181,4 +211,21 @@ int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
 int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
 				    u64 *result, u64 *response_type);
 
+#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
+
+int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+			      enum qcom_scm_storage_cmd_id cmd_id,
+			      u64 lba, void *payload, size_t size);
+
+#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
+static inline int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+					    enum qcom_scm_storage_cmd_id cmd_id,
+					    u64 lba, void *payload, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
 #endif
-- 
2.51.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
