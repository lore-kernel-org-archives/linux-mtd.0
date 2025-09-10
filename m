Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6AACA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpjsb1mu+POvPfRNTYJdz2HvjWdM+RzBzm4RSGDtBhc=; b=rY1pW8Sl7oaj4b
	X5DygWjBCuTppDhCHBfDtRv2enejjn/UpRp0+qANxIb2niPwAnSC7gKJ9JU1tJ7aJ/EevOdrB5g2k
	nClcJI/xocMZV6jEuluILFe9QRb+8qgJmektDJzop2SCY/n8HU+03K1tNR6HTm8w67nwm9F4ydF7D
	XshIJSdIBOyfeAfaRnUPFQQMDMga9LCC5c1SVX0W7lQKU0BHDUjB62ZXoVlW3vv3x79gPqSq8b3bv
	V9usdUa4f/HU0KgngMtPOFJ5BET3UXukVyXo8/aeqhhZvVIRMNaCPoDwJYVZVYatenpGQk1+lZM9r
	0T+TdGhfA95Zti4lhh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN3x-0000000FEqE-1SFq;
	Wed, 10 Sep 2025 15:48:49 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN3u-0000000FEnD-0yMO
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 15:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757519301; x=1758124101;
	i=markus.stockhausen@gmx.de;
	bh=3Na7ckbtPWXVsAr2v5p94ZUz5tMHXTudnxZ2SUKr8yc=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=p6BEw2Nrc2gVxGbnYjh7plpltn0tlDZp3N7EOS+6spfVocDaC7EkdghEovGcFy/k
	 FdxJnutXb6g/qfpukNVXvMYtdcWSysf5q3o7dN6oGOsVhDFd/LZz0VOvifYpXT5RM
	 6U48LFeqDfwfMBsq67bsyZPlxOr8EWR4O/9gUQBmd41bvpVRrpbZ1NMLs/1USrOzo
	 FsH+ccdyK90M2AVleUANOKXVRvR6vPtuIayUu4sghjm2QRhMuB26naEMQOKGUhHIG
	 WRiiW4VbEH/F3MjJNyvNFZ6dDzlc+A/4OXArp7kyqaX9sLI65ZWpfGQYDKJfvB6j+
	 P023bOv6Ra5L8QN9cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1uzeqP13Ge-0017FL; Wed, 10
 Sep 2025 17:48:21 +0200
From: <markus.stockhausen@gmx.de>
To: "'Miquel Raynal'" <miquel.raynal@bootlin.com>
Cc: <richard@nod.at>,
	<vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>
References: <20250828143408.2511086-1-markus.stockhausen@gmx.de>	<20250828143408.2511086-3-markus.stockhausen@gmx.de> <87ms72elzw.fsf@bootlin.com>
In-Reply-To: <87ms72elzw.fsf@bootlin.com>
Subject: AW: [PATCH v2 2/2] mtd: nand: realtek-ecc: Add Realtek external ECC engine support
Date: Wed, 10 Sep 2025 17:48:20 +0200
Message-ID: <017601dc226a$55da4d40$018ee7c0$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG7Mp1xqFqtvWbJ3VWG0nAUZbYRIQJgfH8KAjzVqJu0qYOVoA==
Content-Language: de
X-Provags-ID: V03:K1:XrHzdY7mung0A4jpRbGdXB0o0t4c+hqBAcZOFt36dagbDRj9jty
 NttMjrwJU+VvTNDurIwaIJhalVYJQY0ak4KeY4c/NaLnbnxorXCgXEVtLAKMAlvO71vxCcg
 kdO9vP6fYvo1YycEUaUNOQjEo5UN9g4yr3UVPv19r3F7O/i+rNolhVUVz8yP9za6MwTHF9P
 UYnzGxu99QRlzFVAr5gKQ==
UI-OutboundReport: notjunk:1;M01:P0:vuHkkvAn3lw=;8e6gPRxSzN0p2QY/vdKthuxLmRk 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084846_579046_4C70BF02 
X-CRM114-Status: GOOD (  11.02  )
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

> Von: Miquel Raynal <miquel.raynal@bootlin.com> 
> Gesendet: Mittwoch, 10. September 2025 10:43
>
> > +	ret = FIELD_GET(RTL_ECC_RESULT, status);
> > +	all_one = FIELD_GET(RTL_ECC_ALL_ONE, status);
>
> Maybe you should check whether all_one remains true if there are
> correctable bitflips in your buffer (you may use nandflipbits for that
> purpose). If not, you shall probably spend extra time when checking for
> ret checking if there are less bitflips than the ECC controller can
> correct compared to ones in the *entire* buffer, which would indicate
> that you are really in the presence of an erased page, see:
> https://elixir.bootlin.com/linux/v6.16.5/source/drivers/mtd/nand/raw/nand_base.c#L2841
>
> This helper may be moved if you need it.

ECC engine cannot handle bitflips in erased blocks.
Seems as this helper really can increase robustness
in this case. I will make use of it in the next version.

What do you mean by "can be moved"?

Markus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
