Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E6BCA5FB3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4kWGn11pG/Kq70oKVcGbG5uRBc7LH4yOzr3wD1P0TE=; b=TIyMxAqX/xUu7q
	UZIKtFa4OPw+73oCVyXVBbaTLlX9D28a8Rhw4PtBqsoL6DIlRhRyu8q10Ue131BqfmsgHoWqhhzGs
	hz3r00W2jgO6he4NP6kCeMHnvagcSS4Vupy7FADTscrdB3waHRiCrkXYo18HF4250VqZN/29HpenE
	DNwB4iQLLi/Y2Uf9y22QkNy7HxXd+ixyOfWjJtG9hdfu+KQWz5obOpX64jm2cvwSHdFpnFT5iXx7f
	c9bbwZvTBsPekzlwwHao3qU0iUFCZ29j77PiEGv0A95RS/d9CoGUBAK0dM09b/fP6T+/c7EAK13Xq
	Dqdd9DKenVqr+78j0FQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFzy-000000094FP-2KUW;
	Thu, 01 Oct 2026 12:34:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFzu-000000094E3-16ig
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 12:34:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D31341A20E3;
	Thu,  1 Oct 2026 12:34:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F9F960341;
	Thu,  1 Oct 2026 12:34:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAB2D103280FE;
	Thu,  1 Oct 2026 14:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858081; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=WXVNcWeUH8epTB39AmkstQlvprF7SocOaWo+4tbelHA=;
	b=A+q3HM7wMIDOoaC63YOxmwSh5Et7+Pjy0PEE1IA8f9hIEXA13Pr42F1kboIlg3DDun6Mbg
	9OGkRSAlooGHTyFnr+ncVOP97RiFHfs6ZF5F+dw83CHIX4SlCz8+n+yCJ4jSMxMTSRoc7i
	744a60OHd4vu2PpTHqETdv+qq+LG0mqLdJtGSJPynvmHYE+nv1DPNDy2pZ7LGW9cTYGMor
	kEAbcqBLLBeMhdCTwoXkeKOMPsYm1twUmCJHhEK/nZrdQBO9slbVxDyX5m5pkH1I0pQdSM
	DehYPzknc+1m1S9z3wBnKOPCtDX/iBs3WjrEvXoE+Xl3rM1II3obC7ZILyJRzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "wang wei" <a929244872@163.com>
Cc: richard@nod.at,  vigneshr@ti.com,  bbrezillon@kernel.org,
  yamada.masahiro@socionext.com,  wenyou.yang@microchip.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale
 NAND_ROW_ADDR_3 with overridesize
In-Reply-To: <eeef96a.1a8e.1a0f74ef8cf.Coremail.a929244872@163.com> (wang
	wei's message of "Thu, 1 Oct 2026 19:52:22 +0800 (CST)")
References: <20261001103359.20216-1-a929244872@163.com>
	<875wzlofmj.fsf@bootlin.com>
	<eeef96a.1a8e.1a0f74ef8cf.Coremail.a929244872@163.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 01 Oct 2026 14:34:33 +0200
Message-ID: <87zewxmwfa.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_053450_856836_DA695BBB 
X-CRM114-Status: UNSURE (   6.68  )
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


>>> +		if (chip->chip_shift - chip->page_shift > 16)
>>> +			chip->options |= NAND_ROW_ADDR_3;
>>> +		else
>>> +			chip->options &= ~NAND_ROW_ADDR_3;
>>>  	}
>>>  
>>>  	ret = ns_setup_wear_reporting(nsmtd);
>>
>>Instead of repeating the operation in nandsim, why not calling
>>nand_scan() after over writing the size? (inverting the two blocks)
>
> The override cannot be moved before nand_scan(): In nand_detect(), 
> chip ->chipushift will be set to the actual flash size. In addition,  
> In addition, expressed in erase blocks (new_size = nsmtd->erasesize << overridesize)
> and erasesize is what nand_scan_ident() decodes from the ID bytes, so
> the override has a hard data dependency on the scan.

Ok, fine then.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
