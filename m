Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A74103E177
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7i8pA7Jht1y73jCa4MMpc599BH4cHNx0Ln7OiEVh+uA=; b=vw00tC/rKZs190
	NIFktDKnC3G1xdqyaSZgS+PmgGIFqTU2zzqk3yanxmSu0QaGZRUBwJOIxR0cVAgUzEHZmZkRlCqar
	0gHSOfBVN4L8m4BJqJKrAcY/qnIWk5WEgbsTSYD4NGA3ooybsArmdUZFfYwmFlPwXT4H3GqStFkzw
	98O0xMl4bP+oXK08PainIR+2px9j0FVtlEL/zBNly7BCd7tCiqCfjpDz3BT5pazgo925dm45CmA4f
	44wWeAvJ7Ole9bg/lN+iaxh0AkLYWkpLpXhbxNJVtnWKx+0Hf0S2fXm36sBlNv3vVzTyfutlccelC
	h5zZQ5t25VldOMNT428w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qoC-00000008TCP-0cfD;
	Wed, 18 Mar 2026 13:19:36 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qo9-00000008TB9-1yWn
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 13:19:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773839954; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JbpuFD5M8VyqBBfjag5Sh9zMijBIoCUE1k7o2aB+/DYEWPjpeW0HbHiizUN+dQg3o0
    BoEsSGn5Stfz0k+fEaYFK6I7ZnNftRKAj7SVwPQUC68P2ffSYggXvJEG8CLbS6rkRrxQ
    w6gl7IQyjlEKSNXmpP31e6qBEvmpn4USICrjQCWsbJa1ufmyttCfrjNe9r6KpUcU/IzO
    nn3ApHbc4/2Gxe33h+yHd9ifG/2XZ8bR14Slzdt9MyH4aB6/8i/vtdWXnCqHqCy+rPT9
    3N9a+lPPXgVX5zvrI+3vxdRBMOSby2K9FKJyHkMyO4ORo0qIWkfoSD/fOrgdZSh63raS
    3eAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1773839954;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=I/uG8WadfGOEs8IsUfuu9YM8DWeLiNne33lmLuugg+c=;
    b=HTOAwGxK3vEEDld8Ki/FmEZrs40ImazQyVVmRYp8lyYEY/HVJYaQyjDSfPerFiMY9l
    ONHzJuzmxHoIglVaQN3AsbojTKcrAJO9xs+2KRjGgKRFWHpmPG0iGu9h+pyHqhX7LAoC
    fVSlTo+JlzuU39htjGNcGoD/LbHkyTSa0QSOvTmAKoovRDlU6Bbml9Xp1ZlnqRxtk0Xk
    rV2ytbkdICeM0q/eqgM1KOhGoptaFhc8SGl44dMyj9NYpDtoAgtUkZLMHUP0fffvvUzA
    YCxIS3C7J3lcDJrJBgXstU2MiVOk7QnBrDH5UrXpgTX7Fd3qwBBjGGg5QWGt6cBdsTkt
    ZLXg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1773839954;
    s=strato-dkim-0002; d=iokpp.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=I/uG8WadfGOEs8IsUfuu9YM8DWeLiNne33lmLuugg+c=;
    b=epv6EhOWg2g+cE1YFtEKRMZLFs87xQnZ24IOrcVhDAyXPWgYuLbaj7HPTy4eotZeMN
    wglv1lhGFn5yujuaNAcNBI8AVCXX9w3t2huOK5uQCtLJ/v7uxojWLACbl2DeuQaPJMm1
    V0vh8eXep9EW3OEFH8fbiydpnWQmO1kZaAg8DmY5T8yCR3Yy3GWraUbqqD2bpyP431lr
    tuHUzBB7ATpqNhCWi/LP81uMnbFnVXNdqbhkgq9GKV9p+4yVtiHURNyY0L2LJZG1yCoF
    VNv1Fnp3QHJrUW+YgLt1wDEsMk5Zv26EQlg+3HXRxKENFIXR3v5ZQofkNc0P+L4rFfbe
    pjWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1773839954;
    s=strato-dkim-0003; d=iokpp.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=I/uG8WadfGOEs8IsUfuu9YM8DWeLiNne33lmLuugg+c=;
    b=rXCbDpySz3uKWMCswr+w2s2uB8AzMSzB43JKw1iD3ogqZ1UJSCgweQyVR0CCs9p6SG
    D3WgwMymSYByeSo1LPBw==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSfNuhhDSDt3O2J2YOom0XQaPis+nU/5K"
Received: from Munilab01-lab.micron.com
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522IDJD9G0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Mar 2026 14:19:13 +0100 (CET)
From: Bean Huo <beanhuo@iokpp.de>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaizhang@cisco.com,
	Bean Huo <beanhuo@micron.com>
Subject: [PATCH] mtd: spi-nor: micron-st: fix FSR read fallback for controllers returning -ENOTSUPP
Date: Wed, 18 Mar 2026 14:18:56 +0100
Message-Id: <20260318131857.2685004-1-beanhuo@iokpp.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_061933_766389_23E2AF3C 
X-CRM114-Status: GOOD (  12.44  )
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

From: Bean Huo <beanhuo@micron.com>

micron_st_nor_ready() falls back to SR-only polling when the SPI
controller does not support low-level FSR reads, but only checks for
-EOPNOTSUPP (95).  Some SPI master drivers return the kernel-internal
-ENOTSUPP (524) for the same condition.  The two codes carry identical
semantics but have different numeric values, so the fallback is never
reached when the master returns -ENOTSUPP; the function propagates the
error instead, causing all subsequent erase/program operations on the
Micron flash to fail.

Fix this by treating -ENOTSUPP equivalently to -EOPNOTSUPP in the FSR
error path.  Note that spi-mem.c already treats both error codes as
equivalent in its own fallback logic, so this aligns micron_st_nor_ready()
with that existing convention.

Fixes: 90c517f435a9 ("mtd: spi-nor: micron-st: Skip FSR reading if SPI controller does not support it")
Reported-by: Zailiang Zhang <zaizhang@cisco.com>
Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/spi-nor/micron-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 88033384a71e..4be6a76fc3e5 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -598,7 +598,7 @@ static int micron_st_nor_ready(struct spi_nor *nor)
 		 * operations to the software. If this is the case we use
 		 * only the status register value.
 		 */
-		return ret == -EOPNOTSUPP ? sr_ready : ret;
+		return (ret == -EOPNOTSUPP || ret == -ENOTSUPP) ? sr_ready : ret;
 	}
 
 	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
