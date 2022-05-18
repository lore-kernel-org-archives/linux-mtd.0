Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B01C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 23:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZRxfUBXuzdRs+mi+aow6L/fY7HaW3TcHV0C0xOJPGic=; b=SIibP+vPUTprax
	PJdySIwm/ppl/1KRRTWT6O6I0XfgnFowy9wy/TMXIi1whGXmFVYLZYOwtz+kRXWv0x3c4hG9++oIQ
	rG3iO8zlPxaURc4jZisluUG0eMaSJ+Iw+MbzOvJNeWUzLxB6vRL4oi7WnBT59tfHH3XY1e0LbbSf5
	jmUUGWcAhY6LCiGrH+aKQj601EsjzJx1I7pzzClKDPLcr0e9Z4E5VTqpjrvrcD8uK/x7gA7/ncT9I
	we+ORK3IjHiEoFCPRUhEUEpI0fW6KnomNxuYhOvArf4jfssxHXsXyZYsnK29pnqqOA5MpWg11nong
	CoqoCj2OZ3LAcAHlyr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrTAK-004HzP-DU; Wed, 18 May 2022 23:33:16 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrTAH-004HyF-I8
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 23:33:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j24so4809891wrb.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 16:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOEp7RuGCpmLRx/E7Nt8xZm5egHCz2H71jctvM4CMtU=;
 b=qhgQtSrVoznPTJ+ZFRprLIIpBY1SHJija0hAAQY7o8uCU9zz94MDCktqqv5uFqE0QO
 lND1XzQt3XTi6Wg/NitNHyJ37tyTHPof5jSDZ4mXKEBkiAWSIizlX5q7+k5QjnwTIyBQ
 Dx3jfJvFbGIRekI6xdigOTfL/arroPyf6YQ2cAJ9Dv30zr5NJWa7aP7sBPJ+QoIzlzpZ
 EO3ur7ts9JMdZUE9aQBViZme7sVO0cNLJUGhH+9R55Fv7hTV5PvEiIqW+4bGqLlzQ/MA
 pEee1RnbjTADgtrT3C4AAgKvfs4Kg/bJxsEf1JOp/4OekCIO2nZO/6/DB+RZWucI0vTM
 0CkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOEp7RuGCpmLRx/E7Nt8xZm5egHCz2H71jctvM4CMtU=;
 b=3KP9MMOkJYOYaLgZjkpnJHnRU0v38+scvmOSZLLc1xPX0rzHizG0M+hfANz4d1zsck
 jEvRlLSO8ybzYFHbi4Q4lootooCy5gP025Vx3N6yP0C1WHYxd+HM953kWE4Ama4CTGQ5
 L8iOYS/0dYQLpKd+w42uOuF54dY+Wna/cIVzH5vwPqvW887cnn1JaAW/gmlOoJducAXF
 yeUZQw6Ptgx+CbAiV6Qqq7xFOtY3Hu1T6eHkam6n5SwnvK1fcyYDcCsrRUkRdOGxZ+Zc
 xlVlZN0IQ3Psz6aQNTij3l7YAyCccTCfFwMJbNV0uJxnNh7lo90bq13ZJIXhXIJBJDsG
 zZVg==
X-Gm-Message-State: AOAM532Qx6zveZ7tuUdZyRMKv+U5isxexPUPJ1cqSDCedIlKa1qSuVbc
 PxrqfCgK+lwzOQpbIdTM2gI=
X-Google-Smtp-Source: ABdhPJxnhCEpQNzOwxft4SfMBdFkTWxgzGUXIdSBsEze3n6hW95e9mj6mnEnEYKXsw1PeBxB8A2Axg==
X-Received: by 2002:a5d:5342:0:b0:20d:597:3953 with SMTP id
 t2-20020a5d5342000000b0020d05973953mr1581233wrv.310.1652916790893; 
 Wed, 18 May 2022 16:33:10 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 j25-20020adfa799000000b0020d042efd11sm3217476wrc.61.2022.05.18.16.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 16:33:10 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add nvmem support for dynamic partitions
Date: Thu, 19 May 2022 01:32:56 +0200
Message-Id: <20220518233258.5483-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_163313_644577_4C53D275 
X-CRM114-Status: GOOD (  23.15  )
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

This very small series comes to fix the very annyoing problem of
partitions declared by parser at runtime NOT supporting nvmem cells
definition.

The current implementation is very generic. The idea is to provide an of
node if defined for everyone and not strictly limit this to nvmem stuff.
But still the actual change is done only for nvmem-cells mtd. (just to
make sure) This can totally change by removing the compatible check.

The idea here is that a user can still use these dynamic parsers
instead of declaring a fixed-partition and also declare how nvmem-cells
are defined for the partition.
This live with the assumption that dynamic partition have always the
same name and they are known. (this is the case for smem-part partition
that would require a bootloader reflash to change and for parsers like
cmdlinepart where the name is always the same.)
With this assumption, it's easy to fix this problem. Just introduce a
new partition node that will declare just these special partition.
Mtdcore then will check if these special declaration are present and
connect the dynamic partition with the OF node present in the dts. Nvmem
will automagically fin the OF node and cells will be works based on the
data provided by the parser.

The initial idea was to create a special nvmem driver with a special
compatible where a user would declare the mtd partition name and this
driver would search it and register the nvmem cells but that became
difficult really fast, mtd notifier system is problematic for this kind
of stuff. So here is the better implementation. A variant of this is
already tested on openwrt where we have devices that use cmdlinepart.
(that current variant have defined in the dts the exact copy of
cmdlinepart in the fixed-partition scheme and we patched the cmdlinepart
parser to scan this fixed-partition node (that is ignored as cmdlinepart
have priority) and connect the dynamic partition with the dts node)

I provided an example of this in the documentation commit.
In short it's needed to add to the partitions where the compatible parser
is declared, a partition with just the label declared (instead of the reg).
Then declare some nvmem-cells and it will all work at runtime.
Mtdcore will check if a node with the same label is present and assign an
OF node to the MTD.

I currently tested this on my device that have smem-part and the
gmac driver use nvmem to get the mac-address. This works correctly and
the same address is provided.

v4:
- Make it simple. No suffix. Make label mandatory again.
- Update Documentation with new implementation.
- Rename files to a better and correct name
v3:
- Fix warning from bot (function not declared as static)
- Updated code to support also node name
- Made partition label optional
v2:
- Simplify this. Drop dynamic-partition
- Fix problem with parser with ko
- Do not pollude mtd_get_of_node
- Fix problem with Documentation

Ansuel Smith (2):
  dt-bindings: mtd: partitions: Document new dynamic-partition nodes
  mtd: core: introduce of support for dynamic partitions

 .../mtd/partitions/dynamic-partition.yaml     | 57 +++++++++++++++++++
 .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
 drivers/mtd/mtdcore.c                         | 49 ++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partition.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
