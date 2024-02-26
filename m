Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A857C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGQXEsAysNejgfdqqMewk7TMJeHNDi+N66ssYm7Fdw0=; b=YivbaKwRrxkrVC
	01wvbDjCOvCfp8HGX1Kmi5iejG7/vYi2JZOwcPBRA6OZjc0yw6/88cKXyPTpEb6ZGi4d8YPN2RnHV
	5e3KacIxghkKVEDkzLRALxOjVsVuzGx6dn9nW1ZLgeMxucc39WufN6fk2/Gocd03ZJeOtYS1OBdr1
	fDUPfpaTRVkCdHiGKp4R9x4fDoEXY1Zzl0ofFuIrk0H2zNnoxAXOR4p8YwgGxv2PvDogEIvMNiWpd
	jKzo8oTal7Jg0U34jDf75gflRx9mVy5GshVfwspOEUt7tDTLM5L5lz+7nPTLWWLnFtb1sVnKXFqts
	TALn/EbvV/vlAVoE+LMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYU1-000000009Xf-1IWA;
	Mon, 26 Feb 2024 10:45:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYT0-0000000090I-2xEB;
	Mon, 26 Feb 2024 10:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YS0xtPJLUWz/J44LlF/6XFwOsdD0shWEo8A0ddxsJAk=; b=cAfbHi0hWZoHDgcy+kRyg5b3aI
	MSHHX2fI9TTUAwrwij2cjTjFidtZ7G8mJRkj1ifUKhxbGgvZ5MO1PxhqT6NmUPGzsnsiA1oQ20Akx
	GZwGKsjepIDPEUa71lL/33AQM8fV/s98qwRBACIJq5OzjPfuf6UmUmXvw50ORy/aGEHRK0cI7bGO4
	EUMJhbwh5XGIVwOyXsWfqeqQ/OOiqwSxYQYWlk31zqec01OmYfjcx3BNGQIy613eJ0Hy/2exC6wAq
	gopI3D2FpUBPfu8YVlM6ols8cwwXP7/B+h/ftyyMfy3591gc101bthAA9KN4j01jyVN7D8S1bF2Gh
	NDzoWsew==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSx-000000017qc-1LtI;
	Mon, 26 Feb 2024 10:44:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82CEE1BF20E;
	Mon, 26 Feb 2024 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YS0xtPJLUWz/J44LlF/6XFwOsdD0shWEo8A0ddxsJAk=;
	b=U5pFjkvYgh0y2PiE1W+62YAIs4NhEF7VTUKjSqllfIkvKmONJALI1a8QyJ5n/uvwPnp57c
	LdULRXff4M5HuUZbFTA16ibyXoseEq04WA7gPw0h9puZVwIb6T3nVCwZCw4pgutuI0QD8L
	Af95BjzvRGOORziuyaAMKpIPtI0QHYVGnAJ02qRW2kodeFUFzJzyrxbvqKxKYDs6jduiEH
	1u6h81SeVhgHO2e9xWPW8m8bKG0SMuqO9whFoDDQs7QVsaU/+IvdCMt8+30RnkQvN5is5B
	9254ysHoT2/0P/c5tOZY3Dc23ACqaISLfUszKcrhUZvwjGsg4gx9Z330yH86MA==
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v6 08/13] arm64: dts: broadcom: bcmbca: Add NAND controller node
Date: Mon, 26 Feb 2024 11:44:08 +0100
Message-Id: <20240226104408.489472-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-9-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'87b0c3f2cd0247c843dd118068ff0d7539b8f791'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104411_515412_D771F330 
X-CRM114-Status: UNSURE (   5.23  )
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

On Fri, 2024-02-23 at 03:47:53 UTC, William Zhang wrote:
> Add support for Broadcom STB NAND controller in BCMBCA ARMv8 chip dts
> files.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
