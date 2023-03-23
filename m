Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F57C6FD1D
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1+ViAud7E0xY4qWAVCkiO2vp2NUVwM1W0cUgv6lcBo=; b=27BzQdNzYnSEnq
	za91cXVQ1MdSpR2fnzaWq4OpbZFHNj3vxqJl8uKGkevcccpCm485mDzKzxqqE8dJPsYTL3Fvr2H28
	VjN2IjjTApaZ0zGZ6qiCkTCHc29p1oFmkKX3Lsjh35AiYgZr8MOBYeqpImX7SDJ5gQcVD3L9jfRSD
	nPzygrIncR4dAOhcs57tAwxWw/fJ+JN9d5Klw1rUODW2jjwSxCRhIj9iECoNApoFqnUmrwmoMQ7vB
	rOXbT5tZnidVPzD2G+9jb3J3gzbwKG54RnUfjB23VarbDMo3erkrEtRcGXKZH2++B+GpQWS7vyieR
	UvCUw9TpohJ0DUxM69Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJj-001xtH-0z;
	Thu, 23 Mar 2023 12:45:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJg-001xrg-0i
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 12:45:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso1105223wms.1
        for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2023 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86x0zvA5byPNNNQeEfDkZ0SfOCaptmVsPMQn2MPWsCw=;
        b=pWxu6HE9L3uWLBS7HuW28lvIdzq2C/5qeeV420Mtvh+eX3zQWvdw8fccYSmFZXEslv
         U1GHQ6ZkRuMwHP+hPGhMahR+ym7M5qgN+WnrWd/uI6/FXvQT8IdIzWu2xPHydKYxLewg
         WRbmh76GeIEzz+XFHvpLCqkp3Mnr/+4QbJucWZgyUOoiL00t+FGYgHXnz0OJJGetvNWo
         ypjyzhNpPQRjaVbFzGfUnNTj8nZQs20xmSKRvAAWzVmgx+4SkkFCAGR8GavttuFwSbpa
         swK8O/eROiKN6NjoZTj6S72KJ+vTzSf0JYLhngv9k0Yx9djcXa0lxeYBx91yTG0yUTS7
         eweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86x0zvA5byPNNNQeEfDkZ0SfOCaptmVsPMQn2MPWsCw=;
        b=vOcA7OVgvZH5olfn3UcYRbFrFlSq3bIbIIg4RdCNXJ28GlVkarA1sn5ZF2qsXRNExS
         hjvscka7fVmOKPxztFtpAY+TQgL0LkBZOYolF3boPpg649cdMPRReuAYGZLM955ESqvJ
         XWfSTLPhaBusoRwE5dKKv//sqvfVAAKnJ2y7WK4E7hstIe+jF7qTPEMwSb7HRxPdYIbT
         JzoPpBsvVNIxqok7/VdtlXLkLswi5fkgO1yuJWcNo/YQF1cWRhNYR33B+TwktBoah5t2
         J0MZuqpy0EIORSSukPSfO+IWU1wdP1Tylm583hchWxYl4pwV69+R+STD7m9F6hWBGd+i
         KVIQ==
X-Gm-Message-State: AO0yUKXzR0HSan8MLV/xxKa+rGsYnJaMStMgULkGCS0wKp3kTdMHT2uQ
	E+DVWr4uXftqWHZY7qcZ0J0=
X-Google-Smtp-Source: AK7set86s1gqsxDfS6CDvNip5x9UPde2UgGq76W9Jw+wJll9YwgOkOenQ/4F731zFE3BCaKj5XfXww==
X-Received: by 2002:a7b:c7d1:0:b0:3ed:301c:375c with SMTP id z17-20020a7bc7d1000000b003ed301c375cmr2182556wmk.21.1679575513972;
        Thu, 23 Mar 2023 05:45:13 -0700 (PDT)
Received: from atlantis.lan (255.red-79-146-124.dynamicip.rima-tde.net. [79.146.124.255])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c1c0900b003ee6aa4e6a9sm1942939wms.5.2023.03.23.05.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:45:13 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	masonccyang@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mtd: nand: Macronix: document new binding
Date: Thu, 23 Mar 2023 13:45:09 +0100
Message-Id: <20230323124510.2484808-2-noltari@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230323124510.2484808-1-noltari@gmail.com>
References: <20230323124510.2484808-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_054516_275805_9A6017B6 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWRkIG5ldyAibXhpYyxkaXNhYmxlLWJsb2NrLXByb3RlY3Rpb24iIGJpbmRpbmcgZG9jdW1lbnRh
dGlvbi4KVGhpcyBiaW5kaW5nIGFsbG93cyBkaXNhYmxpbmcgYmxvY2sgcHJvdGVjdGlvbiBzdXBw
b3J0IGZvciB0aG9zZSBkZXZpY2VzIG5vdApzdXBwb3J0aW5nIGl0LgoKU2lnbmVkLW9mZi1ieTog
w4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KLS0tCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtbWFjcm9uaXgudHh0IHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtbWFjcm9uaXgudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dAppbmRleCBmZmFi
MjhhMmM0ZDEuLjAzZjY1Y2EzMmNkMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtbWFjcm9uaXgudHh0CkBAIC0xNiw2ICsxNiw5IEBA
IGluIGNoaWxkcmVuIG5vZGVzLgogUmVxdWlyZWQgTkFORCBjaGlwIHByb3BlcnRpZXMgaW4gY2hp
bGRyZW4gbW9kZToKIC0gcmFuZG9taXplciBlbmFibGU6IHNob3VsZCBiZSAibXhpYyxlbmFibGUt
cmFuZG9taXplci1vdHAiCiAKK09wdGlvbmFsIE5BTkQgY2hpcCBwcm9wZXJ0aWVzIGluIGNoaWxk
cmVuIG1vZGU6CistIGJsb2NrIHByb3RlY3Rpb24gZGlzYWJsZTogc2hvdWxkIGJlICJteGljLGRp
c2FibGUtYmxvY2stcHJvdGVjdGlvbiIKKwogRXhhbXBsZToKIAogCW5hbmQ6IG5hbmQtY29udHJv
bGxlckB1bml0LWFkZHJlc3MgewotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
