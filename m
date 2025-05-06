Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8B2C3ABAC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 May 2025 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHOBRVSLo8RK4RXH4CE/4gfLUVQ7uuVLfdWJNneVh94=; b=2jjOs1R9YM+eE3
	J43QKyfUBGP8S+MVjBKe6a8C7lA3kGjwc0TkHni+1ZtrAR8bOO2IRG691JC1OuLhACGMdWbm4yAck
	9eoD9N/lE/3MXSj4HZ+Td7K/EJ5j3nAhzmgSCQzfgGh8Hnwb3Yiy4vur23wN4mXeU2ZmU/l49VGgE
	bMLI51o3vI6z5eft8F2FY6+A2+1qqzkkbHxAbZrFsWpemHPlAargI0wCXVT/ZQlScSQTfH392HL3m
	Ms7lb8k+gZnj1JniXL/2/kg7H2hyQw1LJTqYq536qgxVH4m7+v6jELJhzpJXoY8OzLjLbeSpb0hMN
	ipGjQVKwKFOo0KGJ4TBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGGr-0000000BhIA-17Nl;
	Tue, 06 May 2025 11:15:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEil-0000000BPI3-2TaP
	for linux-mtd@lists.infradead.org;
	Tue, 06 May 2025 09:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46CD1437E2;
	Tue,  6 May 2025 09:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30517C4CEE4;
	Tue,  6 May 2025 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746524175;
	bh=dNpNuDQZ0IRai5YOjti9o5t6K0rutdp8byO87u/mU+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LWh0WXpk22UQ1dyR6lV8NAtI8i+s5eHKqcpjlFUMtvg80E7iL/EFCX7Y4X0pn3PDq
	 nPLtPPPReJffm+4hx8jV/ds0XsGfi1Qavzzhe05dFKMmERDQd0VJFvn+KaQDifxqLn
	 4tocZ3aHAMtg3jc2blukpTdoJr3q98DVll1ygHIwo82qrQRPFTWciSG6plYyxRnVm+
	 pZzRR3S+RwORz1JliViMAfzQ5K1iKW2gtRVtkChM+370MduxN3cxeqKtiBWndJl9z4
	 rtqlEcIECEmKYaUF5/s+NKW0XwviX2JL8iTb3s3bPgn2zzWZdQv6KBsK9JXthUgumB
	 q5RcnIMK1aXiQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: macronix: Cleanup macronix flash info
In-Reply-To: <20250407075400.1113177-1-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
Date: Tue, 06 May 2025 09:36:12 +0000
Message-ID: <mafs04ixy3wtv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023615_645255_DA997982 
X-CRM114-Status: UNSURE (   5.64  )
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

On Mon, Apr 07 2025, Cheng Ming Lin wrote:

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> Organize Macronix flash information to make it more readable.

Series applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
