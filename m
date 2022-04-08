Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0959DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Apr 2022 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyItcX9QQb03Q3GWIJ3c1LxKg5nVmpI/BBL5nczQHq8=; b=ts6UVFI2g4MoCq
	VzjpkAB9UJNE1lsSNvmiFUO5h71m3aIsfHNrMc+OogeSKG7x7l6Z8/X0F730YHL0kBYC9kQzRlAX/
	o0hIcxuqkY4bvDZ2cttdu+7xoLLQu2KQfqq6rVYgolECUfmvV+Ba0wnjo7HYeq5xFR3nBAI20F5iC
	9tCoCWHfGInGlsSQ3imU/+UnryG/uhftt/TFIOStWKH75a2KkI4ICAdqLwOCYu1JmUPO7k7PdXzbv
	07Mhh8m1FyU0uO8AxZTej/LPq0OGHpmvtxWmCDIKvFDR9wzdEklt1xDmWv6nGOZ29oFCD9rHsLipd
	Hxtc2JzdqEvSmrhe04iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncogY-00HMw2-J0; Fri, 08 Apr 2022 13:29:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncogV-00HMv6-Lo
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2022 13:29:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E271B82A8E;
 Fri,  8 Apr 2022 13:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2C3C385A1;
 Fri,  8 Apr 2022 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649424592;
 bh=ZYBCD+SPuaGoxrvq8XHNiTRw9xSpDQGJOvCPXfOLPQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N1lQ5PFIN1NRAsqYA4S6/bjVaNjL4bLs1G19GAvsgRWJL8/UjLVc7xD/rpTa2ysZC
 DyEhFeJYZshOf/8vVNnZN15nT7yWHYTgUAwbdWyAqbRzREeO3FGea9v0A/FwzJWJXk
 Fxbyz/Uoal++MJCQx04x+damhnPtRzgHUpQUi7dmbutgq+ZzFrol6Df5WE08Fyf3ZZ
 t3ceR3WHO6Ugksnyt5nMaiCiglr2fvREbh8dXI6EARox6Dx0aQdxQEQQqdft0XAG46
 0Up7E87EknJBEpyjXc+gOGxU91HuyJiF9Hdmpotj/fZ60rU34/eXAPdRERvMvfc5/g
 rGapS3feISiCQ==
Date: Fri, 8 Apr 2022 18:59:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Sricharan Ramabadhran <sricharan@codeaurora.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>, pragalla@codeaurora.org,
 ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, jamipkettunen@somainline.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mdalam@codeaurora.org,
 bbhatt@codeaurora.org, hemantk@codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
Message-ID: <20220408132941.GA12635@thinkpad>
References: <0a8d6550-aa19-0af1-abae-66bf34c91ea8@somainline.org>
 <be779ed9-bd80-8f01-fe7f-d3c07d3d85aa@codeaurora.org>
 <12cad24a-fa2f-9a82-cf43-241a0a6fe4f6@somainline.org>
 <20220201145204.54646475@xps13>
 <d79bf21d-5a90-0074-cef6-896f66e80d28@somainline.org>
 <c63d5410-7f08-80fe-28ac-f4867038ff30@codeaurora.org>
 <cc1302f4-9150-0145-421c-bf2b7a7bf258@codeaurora.org>
 <6b839237-74f0-7270-2f33-f5c17e6b59de@somainline.org>
 <2fb9d943-d6c8-06b1-08cc-b0c3a8256082@codeaurora.org>
 <b428593e-a4db-984b-df7f-7cd14795d5e2@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b428593e-a4db-984b-df7f-7cd14795d5e2@somainline.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_062955_898250_13207A74 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Mar 11, 2022 at 10:22:51PM +0100, Konrad Dybcio wrote:
> =

>

[...]
 =

> I have 3 logs for you:
> =

> [1] is KASAN=3Dy, with this patch
> [2] is KASAN=3Dy, WITHOUT this patch (should die, but doesn't - does KASA=
N prevent it from doing something stupid?)
> [3] is KASAN=3Dn, WITHOUT this patch (dies as expected)
> =


We reproduced the same issue on SDX65-MTP board and your hack worked :)
Since this board is available inside Qcom, now Sadre and Sricharan should be
able to investigate it properly.

Thanks,
Mani

> Looks like there's a lot happening..
> =

> =

> Konrad
> > =

> > Regards,
> > =A0 Sricharan
> > =

> > =

> =

> [1] https://paste.debian.net/1233873/
> [2] https://paste.debian.net/1233874/
> [3] https://paste.debian.net/1233878/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
