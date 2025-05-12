Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FADDC3ABCD
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yr8BQ3eS3tOICF2UyKJ8DyQveSv+MZvDijJliHCYMEo=; b=uuKZ43SHixaTo8
	GFtAcPsOzy2tWeDY9xrdSA5mmNWDHyUzSs6tn0FF0cGHJQoqMKpk3FhI6zEqLVqGxzX+zgTn4Dx55
	r2x96DNDJ+W4p8jKmzPNXTEMqj0gJF51mJnaNtBN0wgJaKCWBKV9fyEhjnJVb1PTIFxYuPOZYB+jx
	WaZ0aRQL5mxZwTMTW9MiuvAjm19ojyQ6nEVcyTAKu9sNNTfBPTMj1RyzEqInwA+DIir/nFz+AKTFH
	68zBLuYQUzeJWfVOXruVOcNuVBKbP77nw2DOkEpCnl0sqZY5cg8eWnqkG2JqiSEgLgzPL9FW+NnvS
	7IcQV85YBkfCmx0a2xvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESi3-00000009Sd0-0wiN;
	Mon, 12 May 2025 12:56:43 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESI7-00000009Nm3-1XYM
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 12:29:57 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id AF5EDA0461;
	Mon, 12 May 2025 14:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=uNCUOIkt3SghEdC3j3s1
	tpULsWO85oweq3HFmF1D1Zg=; b=MITNCbtw3uyyVu6Z94YhPZ2rb62XUCa8Ig4j
	/qD7qFJI+a5QE52CbauaFrndhBAtJPECAO4N9P0ICimezdxgrKxoXJEd2wxOFmfp
	8HWHpzRAyqa0ncWebMkHuq73oa9YLejSNmlqArsonqz5uRh56SUBFqTNZPyjwx3r
	qTpY2Y7ncHteD/reYkRo65X+VYAaXLeHo7cTtp15ur5GUALflfMGA6mRHTnFe/Ck
	jTyWE+K52Uq6fO9vzrC7ZGmWJLK+yxqbrjb1mjB/My7ZdrCMoVMFMC8sWLy08aWz
	rKUAUSXZQnyFajBTAm5yzRh2ueuxKS5PJB4fKDp0NoWIeAH8ZbTATjMA90IbPa0A
	9N90HIu+qhM+ZdqSGsVbnOsWkj27I3xJ5PoO2kmsNdxWUyWo9wiMX9p4aByAg8z1
	IaFfDKrjvt953Lh2B8JBiazq7Ef8+urk8Z3e/+XCaX707TYMl3UMGw3imOXBB5U8
	hWVP6oPKDd2YmGaCJdQwuJeCjSxC39+Q2szn/jGzYNemKb6HaSb/ZgZwgED7i6+D
	lwl46cjaRPiJC7oF00Esz39vHHEcSOFFCXjKf9jO/bCmPgZgn4BsFKi3Pg8WyJlE
	3GN2YsqD1GFYwz0sKAHJ5PLTi9w57RVpyBv6hJoY1bcRChe2FkUhOhXdexe72Xna
	KBqwlus=
Message-ID: <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
Date: Mon, 12 May 2025 14:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
 <87frhambri.fsf@bootlin.com>
Content-Language: en-US
In-Reply-To: <87frhambri.fsf@bootlin.com>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_052955_876928_7BB9F056 
X-CRM114-Status: UNSURE (   6.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 2025. 05. 12. 11:14, Miquel Raynal wrote:
> Why _mtd_verify and not mtd_verify?

Hm, no particular reason, I was thinking that since it's an "internal" 
function, like `_mtd_write_oob()`, it would get the underscore. But now 
that I think about it, there are many static functions already without 
this underscore. Should I change it?

On 2025. 05. 12. 11:45, Richard Weinberger wrote:
> I still have a hard time seeing the benefit of this.
> To me it looks like you're working around broken hardware.
>
> Thanks,
> //richard

Well, yes, in our case. But the point is, we have a strict requirement 
for data integrity, which is not unique to us I believe. I would think 
there are other industrial control applications like ours, which dictate 
a high data integrity.

Bence


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
