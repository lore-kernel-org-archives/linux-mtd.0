Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7228AC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 15:02:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1892D60FEF
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 15:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1892D60FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pGVVP5FTA/dwTfVmvVfMQSA33PSzEbSBKxlCo4US3U0=; b=C5jjXkh6dIgf8O0IdmruSlw4Yk
	jWk8Bn0v5Tzo1VbKmtFWHcud4LzHK6TVGLGMs1suBFs3VHA3Q0i6FYjcLLzi7jfEqpx1UMkkbqATB
	66/W1/L+e1Ku36LuJW4sghYQ9k3ZtBMVhLYTsLIqCC45tsVngDjLCxwFE1A+t+PY8XkgbltQMZKD+
	PD7v/po/5ggYy/xcJNrNgS7Hr63ng//mV8lT3qVRfpj9o2ljSkGnLPSSY6/7exozbeFxIjcjPiHV4
	ckwiVEjl2G5k5gOAbhC4zpV7cZgAKFBbybPlB4kCJu6+chaIFJU7yUkXn5aSahGHhVBQB0SVn+2R7
	b1kz3pbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLIy-00DAL8-5m; Fri, 02 Apr 2021 15:01:48 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLIu-00DAKO-O1
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 15:01:46 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so4738351pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 02 Apr 2021 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldZzMYp9rBIEkuelFhL1o+s+U9zYs7UBzeIApWLg0og=;
 b=n6RIi2rOaJ2VF59xOiWxOs+AUToxL9jEvdKG47HKc6iG15nkn0+iwj7DezBguhzxZ+
 JKO+naDulBdXIQyejCZ1GOKRxR7GzHxhUvEM/VOx0tpqj95rE3tt7Dv1MM6WPbIiKYhh
 7th+iejlGRsQTYTzRQFUPiRPFHBGWhsj+FtKmqVlNBShm1m5D2Ssnn+ieyK3pY0Hdnph
 sf2iQ18tsjcAYdnxeL8iTkLTlW7D4OkARNbWSH76eoaTck5nyF5yckrdIKtDyKu59R6f
 wbZNPtsN/S9qRMJoKRVUxfymcM5FYvOY6Qqql7zlRFwgy4Os6GV7KXNL5W5B4iMIasAs
 5xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldZzMYp9rBIEkuelFhL1o+s+U9zYs7UBzeIApWLg0og=;
 b=HK8IafZfmv8jrpPyAm0n9JTWGZoMxt/UdJfFWzp/P1MJnaPSNPV8GlufO2co7AA7sB
 JwfSGtj9TbIx90frSh1bhEGfPeeoHdCov6/PtmYQxAzjVgSt9oxPqulzAhUdUYUOAZ10
 RT8p1CTF/oTRrWqCghaJZXtgXrARuX0rK6ntCcL5O5EtoGvvYPN/PQ4zQOZm6xrvlrAR
 7lRI1w0ECgIC+CSfEnYaNXHwjMAivkxnGwoIL4IBY07cOE7Sf8OzlyWKYwYMXU/yD4wx
 isc1NjjgKwCZIxPPiolK6PBaJQjetRMji/LKpByi2BLegRQHJZpkOyRSJzs7iAVMY2PV
 bKzw==
X-Gm-Message-State: AOAM533kospt8/NuIa/nGJWlmUbTJMdxCohVnugNE74LpFLHZf9x3a2a
 Nmbv/kuibcfunjWG9W5HAo5N
X-Google-Smtp-Source: ABdhPJzysKHkD5hPLLoXR+L/SXqkFq153ovg5+Vmyw8i0BA/UvbNYS6f/EmK3dcKK6n+aVLWn8gBQw==
X-Received: by 2002:a17:902:bb8e:b029:e6:3b2:5834 with SMTP id
 m14-20020a170902bb8eb02900e603b25834mr13267915pls.38.1617375702769; 
 Fri, 02 Apr 2021 08:01:42 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.174])
 by smtp.gmail.com with ESMTPSA id x7sm8773647pff.12.2021.04.02.08.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 08:01:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v11 0/4] Add support for secure regions in NAND
Date: Fri,  2 Apr 2021 20:31:24 +0530
Message-Id: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_160145_135040_CA354139 
X-CRM114-Status: GOOD (  14.81  )
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

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So this series adds a property for declaring such secure regions in DT
so that the driver can skip touching them. While at it, the Qcom NANDc
DT binding is also converted to YAML format.

Thanks,
Mani

Changes in v11:

* Removed unneeded check in nand_block_isreserved()
* Used mtd->erasesize as the size in nand_isbad_bbm()

Changes in v10:

* Added Rob's review tag for binding

Changes in v9:

Based on review comments from Miquel:

* Fixed the secure-regions check
* Renamed the function to nand_region_is_secured() and used bool return
* Moved the parsing function to nand_scan()

* Added a patch to fix nand_cleanup in qcom driver

Changes in v8:

* Reworked the secure region check logic based on input from Boris
* Removed the check where unnecessary in rawnand core.

Changes in v7:

* Made "size" u64 and fixed a warning reported by Kernel test bot

Changes in v6:

* Made use of "size" of the regions for comparision
* Used "secure" instead of "sec"
* Fixed the sizeof parameter in of_get_nand_secure_regions()

Changes in v5:

* Switched to "uint64-matrix" as suggested by Rob
* Moved the whole logic from qcom driver to nand core as suggested by Boris

Changes in v4:

* Used "uint32-matrix" instead of "uint32-array" as per Rob's review.
* Collected Rob's review tag for binding conversion patch

Changes in v3:

* Removed the nand prefix from DT property and moved the property parsing
  logic before nand_scan() in driver.

Changes in v2:

* Moved the secure-regions property to generic NAND binding as a NAND
  chip property and renamed it as "nand-secure-regions".

Manivannan Sadhasivam (4):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in NAND
    chips
  mtd: rawnand: Add support for secure regions in NAND memory
  mtd: rawnand: qcom: Add missing nand_cleanup() in error path

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/nand_base.c              | 100 ++++++++-
 drivers/mtd/nand/raw/qcom_nandc.c             |   1 +
 include/linux/mtd/rawnand.h                   |  14 ++
 6 files changed, 317 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
