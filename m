Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BE5C636CC
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Feb 2023 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7QVNq+N4HfjytipIJbCbAWb84pHl38uPRIuQ6B+QKLo=; b=On8auWZggdYXv/
	6UpTFePjEGK+lthvF023WYApm95nZWyitSayk/JshI4SrfIbHCPFvVy4cK3dU/sgpq9VBjlTMSw+q
	CAWpjL1oYJbC20Ti9GHi0HfyX7ZbK3VWXVQ45oWXPKNoTXEP4YCSep/0lw5Bhy/Z+JEvXJIH6K0pO
	JKPDN7uc2/T9GCMYaqnuQlEcnGIsunSz7Ria3beXxoGANlWB+LV25W1d0B/QuFqiOxHrJn0ho0ryO
	xWq1mwawyLQq0NfslHvrlWv07ru5WYJPsB++aDWnwMlX0UcLRzk/jAWTOAibGYDwfBQwZlVd1uiKe
	7w8edOqzcTKwMhyMB2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOJe1-005BvA-Rk; Sat, 04 Feb 2023 14:35:58 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOJdT-005Bky-1g; Sat, 04 Feb 2023 14:35:25 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 9AF2D5C00B2;
	Sat,  4 Feb 2023 09:35:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 04 Feb 2023 09:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1675521317; x=1675607717; bh=xQ+77WxDcU7LsWzVt9+SldMRg
	mN28mhoYTDjd14rlqg=; b=c2Gy5mL8aq4qjm1aNmxy7JKWI4UbVsp0hyXDTUzTm
	MyQaPxKUoj0InfI4ZV+ieo0UgxFbz4EMIInGLkiD1jceqbooJDtSh4dYZ0GDGXY+
	4t8HjczBkrTWZBUwXKHaU+CxyN3nXueJ77CYA2yEE0eNABnczgl7d/tVnuMeiRmY
	kvgphu32n30p0xoiU+AjFmzEU39NF7c9pDLcBpe8wKEqVauoN0Qib2ppPy79P/bo
	UePQyJrIqZlYhVF8SSMyOrl0UzqsdfJjwe/iC1jpSfH1O+0pa5mBBS5eFlSMovZH
	xIXGM7le/yKBIRxyRqH1ESvsrSKuhe3tLI1c5TCZ9/QvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1675521317; x=1675607717; bh=xQ+77WxDcU7LsWzVt9+SldMRgmN28mhoYTD
	jd14rlqg=; b=m1hnD1sVpWB0RRFfS/7k2abqgp8vWLdoimv5XrWE7sRHRoe3ohA
	RlN4Q5EJnKzRkNK4aE1xw3XOby4F2g7YZxKHa6PVm79KWgYYcVUjx7l6jrLgxxob
	JWK/MKD8RAAt0YdnT/79kl8N9f3zJB24YxjsMNKxoBtYdSXUHmyjhVDH65JM6dgr
	rQAPUo2XgTIru2I/3fZsyoL8hZOuK8rCBennjEVBPNlEHOOloP3cWJyaGdQz1tC0
	kyzUdeS+lRMd+YNbExAiwJqnEX38wP4aYBj+2lVw9hScS6SNNx23yOWWCRVMa3f+
	Y8ykhSSRJe2nmIDXqT8zVVU80n+z0pNTxQg==
X-ME-Sender: <xms:JG3eY5PD4jZOZl-KeHCkqsdChQ5JT5Mf-rZMpC70HU4WaZs8rA6cyg>
    <xme:JG3eY79zvServTzlVn3Gu3w1nx4qsdvie4coT2sz6NbAKHY6IQ1yxM-C88fz03kOC
    jQdxrAksWSrxKPCDQ>
X-ME-Received: <xmr:JG3eY4Q6HG-iyYW5MB50kak0vmydb8Y7vdfYDUg6FELL02I7tzxh0hBfSmwUufZ5ktNXN2zoz1x8VJ8QFWtYJpsGDUWJZ-_z4f6Jo1YMcLIgrbsE80QE1f7aDC8ePWKNABmk9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegvddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeehffethedtteffgfefteetjedvfeelueevudffgfeutdejvdehledv
    vdffhfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:JG3eY1vuKlrIu7-ySLvHe64iI47-2yFmUEWoJhPWicdUaL8KbD9fTw>
    <xmx:JG3eYxcDldiiUcymve0EzomL7Px_pfKIMCXqE0xQl_oZt4K0M62HDA>
    <xmx:JG3eYx2XU2RxdNTabFuRjKvoIcz1SielsiZxpON0ZZHnEZaX_Po9IA>
    <xmx:JW3eY95bFHkqAqa4MrkjYX9LhMEwS951M8OOv6-lVtJRzZhbQX907A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Feb 2023 09:35:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] mtd: rawnand: sunxi: Some cleanup
Date: Sat,  4 Feb 2023 08:35:17 -0600
Message-Id: <20230204143520.9682-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_063523_393270_FABF4A50 
X-CRM114-Status: GOOD (  11.55  )
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

(Apologies for the delay in sending v2. As discussed previously[1],
the first patch needs to be merged in the same merge window as commit
34569d869532 from v1 of the series, even if the others don't make it.)

I have an A33 tablet with MLC NAND, and I wanted to use mainline Linux
to dump the NAND. To do that, I updated this driver's ECC ops to fully
utilize the hardware for ECC and scrambling. This made the driver
compatible with the existing (scrambled) on-flash bad block map, and I
was able to read the full NAND contents.

This series contains some cleanup from that effort. The first patch
ensures we can make good use of the hardware ECC/descrambler. The other
two patches simplify some code for managing the ECC engine.

[1]: https://lore.kernel.org/linux-mtd/20230102175351.64690aaf@xps-13/

Changes in v2:
 - Update commit message to address backward-compatibility concerns
 - Keep `struct sunxi_nand_hw_ecc` but change the pointer to a value
 - Split ECC_CTL precomputation and structure updates to two patches

Samuel Holland (3):
  mtd: rawnand: sunxi: Update OOB layout to match hardware
  mtd: rawnand: sunxi: Embed sunxi_nand_hw_ecc by value
  mtd: rawnand: sunxi: Precompute the ECC_CTL register value

 drivers/mtd/nand/raw/sunxi_nand.c | 73 +++++++++----------------------
 1 file changed, 20 insertions(+), 53 deletions(-)

-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
