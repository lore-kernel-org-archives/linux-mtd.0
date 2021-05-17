Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4DAC43616
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 15:14:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4E860FD7
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 15:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B4E860FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P32qm3gSRx3O8x8MqZQXiL1wwekozLOs3MEBr7caEAs=; b=SYHqZBXe9/Z+7rMvoQB1xvFI7
	4cjETq+zNwOYUo9nX6HNLjDYn0pq2jXIDl1oz77paknTdKzbYvAawjUt1q8p2dL/hmgkxgcpK5IYn
	K9CGXyXzwVmic6rwp1br80INi6wLidPJDbMgAth+fVMx3YH6z0+K3W0mHRZ+DO6+3VnRJ7elsKGLh
	hTFLMBCfInQN+RWFbtYRi6lHCEyNzSSYGrdrBIWiLPuP9SKccqWR8Pv5jkQwLX/t39WBC3+UHo4NV
	V2M+NqT+FIfJrr/7xr1uYHqbddMAz90XcQVw1v1hr3HuTDcvOR02LjMLBWKWHQ00BnMd78YLtsdGv
	WRpsKV7GQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lievl-00FMya-OL; Mon, 17 May 2021 15:13:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lieve-00FMyL-St
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 15:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=W5xkZsukITwxD2vyq79yAHhInfmLtEQuAjuviEfY5Gw=; b=CUYMH3nN/mmKvERr+6YykbsCxi
 CSR/6rrS64V76DKO8VX5LEVixMjHRAz1Ko5IKggPuGC/cdTCEy+0rsH3kfAaP9/GFB5n0chcxXtfs
 eGTgCKsSXB0NhKdgO9L6pt4hm4H1XOjKOYL8mu+WIgFc7s/jtomRH2HuYn8Rg2VhS2gkaSW+CVFTm
 hayKrJQ+NacILsc/5EDBEtNqLnRYl8Z5pWezebGBufkMXPes3i7Ce6e7oQLoWXCqMpmdJenLFmW4S
 0qg4yt/r7T2Zy5oFOfAI9ZD7VFQr+r4ljfSY7JW6i+BCOKlk+wKMOraUIBUeRiTjI/E1UEq+NeSoK
 XvQi3wKA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lievY-00DuMC-Uh
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 15:13:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60FEF610FA
 for <linux-mtd@lists.infradead.org>; Mon, 17 May 2021 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621264384;
 bh=W5xkZsukITwxD2vyq79yAHhInfmLtEQuAjuviEfY5Gw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JJQmSbUHURNv1p453cVx1E+CiI67NzqNDt5EQVhK0jwX2D4kJhMgTyUdWRO+YOwQI
 yaORaFDJh4XkfzmcgS2naqPTjXGDFq3MZiB3+jLg9fzb2CWC5YMga98J8bmtPynkjN
 Vgf5NJeLR+L+mhS4kWK5tCEQk2tBjfduCc+BZmCKH2k9oYyyErNYe+HE626ey8YIIy
 SvE4Gn78abXd3w/CPbc8cDS3TloZX156Ifmxxpv6ZlwWCo/4N0jStnSTjlhMB3ctKy
 wNa9B1wCU8XIthaxJDrgpCdDLPEoVkFY+1FSWcvyxNT8VBsVkYAIUo4QmSYlSFo+LZ
 JOjovBjkqgkCA==
Received: by mail-ed1-f46.google.com with SMTP id n25so7349059edr.5
 for <linux-mtd@lists.infradead.org>; Mon, 17 May 2021 08:13:04 -0700 (PDT)
X-Gm-Message-State: AOAM530q92wp/AfG6uhuzqKrAzEafnnZxIuhRlpkt6OcN0wGPmyrVFFU
 O0Iur+YMieoSo84+5lWaC/RGHsvd73Hw8aK5yQ==
X-Google-Smtp-Source: ABdhPJzlXPKQhfjtV7b7SxTeY0v65tOCReL5EfTzNb8MxkY9dfVx8RFPbEhGN+/BM+4NxfE1ePCtAV3Swas4r/nkUOA=
X-Received: by 2002:a05:6402:100c:: with SMTP id
 c12mr579637edu.165.1621264382986; 
 Mon, 17 May 2021 08:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210424110608.15748-3-michael@walle.cc>
 <20210510104411.11267-1-miquel.raynal@bootlin.com>
In-Reply-To: <20210510104411.11267-1-miquel.raynal@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 17 May 2021 10:12:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK3Wym+ERaQ0np-v8HM39TyNUTAwbhKHPasOPx5xnMNsQ@mail.gmail.com>
Message-ID: <CAL_JsqK3Wym+ERaQ0np-v8HM39TyNUTAwbhKHPasOPx5xnMNsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: mtd: add YAML schema for the generic
 MTD bindings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_081305_031991_F6851AC6 
X-CRM114-Status: UNSURE (   8.59  )
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

On Mon, May 10, 2021 at 5:44 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> On Sat, 2021-04-24 at 11:06:05 UTC, Michael Walle wrote:
> > Convert MTD's common.txt to mtd.yaml.
> >
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

This is causing a warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/spi/spi-mux.example.dt.yaml:
spi-flash@0: $nodename:0: 'spi-flash@0' does not match '^flash(@.*)?$'
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
