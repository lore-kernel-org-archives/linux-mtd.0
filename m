Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE31CDE008
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 02:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8Xu5mNmhflhpLcVk9FP9PhqQH9DnjIty+hbdYkLSiI=; b=tOCO3FJF1AlMOS
	iL9W7oGRIaZnGUssjQ++cRgxYMVkj+UqmimVX1klDMZfR76aE8bEHLh9Iq8irGMczm773XCNC2bZ6
	MT61DzD6r0ZOpX1+onlrkrXOUmdES3O+kmERmkL1x0u3947eYGxXfzYks2RPZZJwRiTxuMLVs9hlh
	1UhqqA8dKO45iMJDgbabvkgvhqLOFBOFieuSMO93TqKjgdax1Wwito7N2vY39knkxv2rPET6gFND0
	enFBdN7cPMDVHDGViApdqkKszt4/z/9W2v0ocVO4B5IJIQf6n5kObO9TGEoQgCloAGQ5C/k0DBBs+
	B/SyBuC1z6rdElzBWDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwOq-0000000AIrE-1QaL;
	Fri, 26 Jun 2026 02:34:36 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwOn-0000000AIqc-0Hkk
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 02:34:35 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DD1E22C027A;
	Fri, 26 Jun 2026 14:34:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782441269;
	bh=iiPzdGyN4dh9ZB0BENBdxEvcTHJxHgJxQdP7rKZMFs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Il8rpwJJzcE0DKSNIqghE3SLpVpWBAJoWgUe1ubBlBbOwHU1l/E/T19+Dfr7Vx9za
	 tEjUAVvkipbWBH2N83FjWQiaT+SP6FHVNpyx79DkqYu6yESAPGDdjq06ZPkzBNxxk5
	 8VOY3Y28mD8e4s0MBpHhGxuY3j7y9J05NIg9EmDgoCrWWzuTVo42dR1hT06nkNIxfF
	 S9vYhf43ifLW/T4YsxFUge/QVeiJ27sJuydcP+tMlW9Vqh1i3jR/NP5lYxlSsN8u/K
	 alLPgEP4bg0wxY6JEQN4iw4ypbcBzedVQexEUlV9jiflIbObDZGgpmDKQJUObZk7r7
	 8NPoCDg0w/PJQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a3de5350000>; Fri, 26 Jun 2026 14:34:29 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id A770C13ED95;
	Fri, 26 Jun 2026 14:34:29 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id A33354E2026; Fri, 26 Jun 2026 14:34:29 +1200 (NZST)
From: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
To: ronan.dalton@alliedtelesis.co.nz
Cc: aryan.srivastava@alliedtelesis.co.nz,
	chris.packham@alliedtelesis.co.nz,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	takahiro.kuwano@infineon.com,
	vigneshr@ti.com
Subject: Re: [PATCH 3/3] mtd: spi-nor: fujitsu: Add support for MB85RS4MTY chip
Date: Fri, 26 Jun 2026 14:34:29 +1200
Message-ID: <20260626023429.1968812-1-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624072104.1123580-6-ronan.dalton@alliedtelesis.co.nz>
References: <20260624072104.1123580-6-ronan.dalton@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a3de535 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=FelO9ux0wxsA:10 a=xvwyoaxjI7V3y7q3p-UA:9 a=3ZKOabzyN94A:10 a=UzISIztuOb4A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_193433_586187_A94EF5FE 
X-CRM114-Status: UNSURE (   4.94  )
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

I accidentally messed up the formatting of the debug info in this patch.
I've send a new set of patches with the issue fixed.

Regards,
Ronan.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
