Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D336C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjKguuOUiDYJPqS+z3L9ngvouG5wRehSx9v3pt+/NSE=; b=Im1EQdLgyji+Zg
	0tdh5SA4nJ5q0OXaQM7cWHuLHdpbNeKZY6wu6wSXAc0AWEh2mYwupi42r2trB+ZOa6Mw1WPXTh65l
	u+Uwrt6bXblz47uBVNd5ijrqL5z2tHrTDlM27txWg5ApHfIRLzAptbUAhWPpdtI+vBvzBmJVUGHoB
	bZXtRE6DaEyAs1nZYPbNUWKhIUy14FpIau1H+xbFN5t6Rg4IQWP1S8LtINBPEDQiNH/3n0BA4Wiaw
	ZkWv3osiHGpmYnmWFSzLzu0bGu88tGYAuw/Qg/cehVFIn8kKJ3tztJTAByKjnylPM1tdRVAFLPgIz
	/sXKoKEAFRbUxqZPiqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvK5E-00GDJV-BR; Thu, 09 Dec 2021 14:07:40 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvK52-00GDG1-Hq
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 14:07:32 +0000
Received: from skn-laptop.hinnerup (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 83129E1BC8;
 Thu,  9 Dec 2021 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1639058842; bh=O3N669Y1t5MeBIeL4+y0nF9iRMMYvpmo/umTBGgqoc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Y1IEXrnF4uESXKSCH5miK1ja38hW/CwHvoNEh/tTzppELjS5iGuSsgieFNu51wwgu
 KW/IvMQ2wodHLdrOt4wKKxlk6VFT4zVCFzTC6Mml7Ss9ITrnFm6d2edEZIA6Y0Zqog
 mg0v+R1KfA7HwHnML57JwRjVJk6g4VQdxwc9vCo4C1pNa+KJot+ngCJwtpfnljO4zj
 X/HOXSm3o81eN6wJvbrVmJ2Yjch5xCu8ZOKcqsPwMTkLZd4isQgOwpoCP/7k5eXBPy
 1bp/EXXwnZPvC+74apuTM5dvOhoEB+MrhyVhPPyMkRuLwKixtIxQYHrtUExO5RwnYX
 pwc7rdetPuM3A==
Date: Thu, 9 Dec 2021 15:07:21 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while in
 suspend
Message-ID: <20211209140721.6ki7gznvxwyn3cze@skn-laptop.hinnerup>
References: <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
 <20211123140715.280b2f70@collabora.com>
 <20211129101908.6f1aa715@xps13>
 <20211129094129.xn364czofrgtvfb4@skn-laptop>
 <63be9121-18c3-1ef2-c448-f99fb861490f@samsung.com>
 <20211130124131.6pgu7enjgk6y536m@skn-laptop>
 <20211130141551.400331c8@collabora.com>
 <20211130132912.v6v45boce2zbnoy3@skn-laptop>
 <20211130143705.5d0404aa@collabora.com>
 <20211203143958.40645506@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203143958.40645506@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_060728_828907_9802D3EE 
X-CRM114-Status: UNSURE (   6.97  )
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

On Fri, Dec 03, 2021 at 02:39:58PM +0100, Miquel Raynal wrote:
> Hello,
> 
> > > Fine by me, lets drop this series.
> 
> FYI I've dropped the entire series from mtd/next. I'm waiting for the
> fix discussed below (without abusing the chip mutex ;-) ).

Cool, looking forward to test a patch series :)

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
