Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CEC606A32C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h77MX/nS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=ntBXBnEE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Do1WEwxKzClfG7EYueM9Vz+u5AAi5aU0N8EUr6jSXj4=; b=h77MX/nSojeek4+9E8mFyz4bXU
	8XKCOp7uZ9k/2BkhquLfQ+IRZuDlatLVECzYXmYdAmPtHqcuQ/D6DvnlPi+v8iTUKka5nSwZeD8fA
	KCBWF9pTHWFR+wDIngmEfaHBcIIxn3mKac+eOPeRZY14dRNrbpOXBo4AOZ17/6wexIEimHlr864x4
	WC0R+YqdURvKUVxf2uY23b0FpG8RSB/BCLWB95HhOfaCZjPNGoobAO644UWlcoSSn5szyiYD/vLsy
	gc7C0b5m/7LRlxodAN8qljT2kvY0pMNbRd7+B8fwOPiyYGQ4ibqoEhNF3eVRy2wj7GTB3rJq1GGyc
	rZg0p9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAw-0000000EVGR-1oaz;
	Fri, 20 Nov 2026 09:44:59 +0000
Received: from smtp153-141.sina.com.cn ([61.135.153.141])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULAn-0000000EVA0-1478
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 09:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795167889;
	bh=HdI3Y3CwqBOgEmQB8FbB967dYg8EAUxs8j1MxiAzIpc=;
	h=From:Subject:Date:Message-ID;
	b=ntBXBnEEm3XhgU52VVqfN84kiokibRac4oxpu95d5r0zFPRSL6CfH03s05w1NOZiz
	 pVvuAOPg6kb8pEeR5rQ0HDV01o5zaiPfPpioI9uLBahOgjFcHqrXOdvuqCE7pKwGD5
	 kW4GuFB7WdcuLftQUBTz4NU+VIlPEubm7iWxfE3I=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.31) with ESMTP
	id 6B001683000057BE; Fri, 20 Nov 2026 17:44:38 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 1279716816057
X-SMAIL-UIID: C25E5F20BEAD41B39CA7811D165235F0-20261120-174438-1
From: Edward Adam Davis <eadavis@sina.com>
To: miquel.raynal@bootlin.com
Cc: eadavis@sina.com,
	joern@lazybastard.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH v2] mtd: Use I/O memory accessors when in an uncached
Date: Fri, 20 Nov 2026 17:44:34 +0800
Message-ID: <20261120094434.107278-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87zev3c3kx.fsf@bootlin.com>
References: <87zev3c3kx.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014451_441177_3798A85C 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 09:25:02 +0100, Miquel Raynal wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issues to consider:
> > - [High] mtd: phram: uncached ioremap() pointer exposed via
> >   phram_point()
One point needs correction:
_point and _unpoint should only be registered when phram->cached is true,
because the I/O map is used exclusively when the mapping is uncached.
> > - [Low] mtd: phram: inaccurate Fixes trailer and truncated commit
> >   message
I'll update the subject in the v3;

285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
In ARM64's __pi_memcpy_generic (arch/arm64/lib/memcpy.S), copies between
33 and 128 bytes branch to L(copy32_128):

L(copy32_128):
    ldp A_l, A_h, [src]
    ldp B_l, B_h, [src, 16]
    ldp C_l, C_h, [srcend, -32]

Here:

    src = 0xffff80009594b000
    count = 0x44
    srcend = src + count = 0xffff80009594b044
    srcend - 32 = 0xffff80009594b024

The instruction ldp x10, x11, [x4, #-32] attempts a 16-byte pair load
from address 0xffff80009594b024, which is only 4-byte aligned (offset
0x24). Because the address points into Device-nGnRE memory, the MMU
generates a Data Abort alignment fault (ESR = 0x96000021, FSC = 0x21),
leading to the reported kernel Oops.

It was introduced by commit 285133040e6c, so I add the Fixes tag for
285133040e6c.
> 
> These issues look plausible, I'll let you answer them.

BR,
Edward

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
