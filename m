Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E68AC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEENFU42G78VGcXz5w+AFEKQ+kqS6mLob0yNukuCuuQ=; b=bOSbFRr+a/iF0y
	UGJd89ih+ZMMHykZFhwxs0ZOJbooQV5eyb8vaB/QFUzVfU0LiVNMiL7Faw4n7Yo8Rp2YGG2Auu7pL
	fT+I0sGGLb+VzL8Ia1JQf6PbpCzi2jv0ik5NdjGQj2nCV2HJIJGB45G8U7L++fS0cgUwl4Br1WbPV
	x6pp57WtWGKnST/+nZwG+WH1JcxcSh9cTseQZys/X0rLsQESq/szZ5AHS7fchVAEDHNjFMisvIEiL
	g3dO5pkW0igrwBbTToIJ04ijMzo5rL4A7M130WLOmWkI0rqUd5hPy5j/GwQSr5QpixTqB8xpajJrY
	BAUzIz0+UORDXpyCJFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYUD-000000009gv-2G08;
	Mon, 26 Feb 2024 10:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYT8-0000000094r-0iZ9;
	Mon, 26 Feb 2024 10:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=igltBX1RS9CACcoo51+Edx1JXCfvvMD3zziOJnrUnRA=; b=RijX29xqUYncDFrQv5tFur8FOZ
	b/OcbYWm5lLRhcP4KLe/rKPtjuqbKq7M4a48gJV6B4ZPpk2BxLv5UulB4VpyQRV6PA+TCAYB/Q7Jf
	uWLmQjeWicV+62iEQZHb3+zUWN2jigdDbE9/ipqx8VqvieT8qbG6h248994zVOtRiOJZJFfgfxr3V
	Gt7uCPn8/MKJHRAkmBjH1Inrno4FHYIpLPvxesnrspvOcebnkG5ABSVBB/mZ3U++QqpGsENYJJmru
	UrWsmE0YHbHKZ/Z2GJNafD1jYzjnfRJDs0QbofDgTyrTIwCcKrXh2fONu+uAAAdOPB97D/dA40Dur
	KJEKaLAA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYT3-000000017t7-2bqi;
	Mon, 26 Feb 2024 10:44:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71EA91C0014;
	Mon, 26 Feb 2024 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igltBX1RS9CACcoo51+Edx1JXCfvvMD3zziOJnrUnRA=;
	b=hWdv3uccgP5E0Amuaxr8HuqdxkuoA2qnMsmPpOKY+fRYp4N4uSMkm/WisxzLd1aiX0c4A8
	aMwG65eQ9u4GmNGphWebNTnQzapQddmmaLISYNsQPZ6pauYSAszpcnkp3FXNSPcUwVMlfB
	6HMxmRexNKYj5XPKUHYAzjNk4ND9Gb4oWGzoKmilPQbNA1ZH5H4wC7uQ8D9xOVtBHM50j6
	OfMrVqCZXGipu2u98puF4todaGLGx5P1x5Lfk4eb6z8Fa1LYgwA4bxN4Qg11F2ilpEMDdz
	Y802+sds+7NFmgKSa5ICAZkFBZU01T8xZ1kwuUG+bBP7RFH7/4kHuA66B3rWjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 07/13] ARM: dts: broadcom: bcmbca: Add NAND controller node
Date: Mon, 26 Feb 2024 11:44:11 +0100
Message-Id: <20240226104411.489517-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-8-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9bc2c33cce32171427e604eb678dad693c6925b6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104417_843429_50972DD0 
X-CRM114-Status: UNSURE (   5.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2024-02-23 at 03:47:52 UTC, William Zhang wrote:
> Add support for Broadcom STB NAND controller in BCMBCA ARMv7 chip dts
> files.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
