Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950FDC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfRoPBa6WSYfetTac/G2h57hu/OUZLS0hE6yTo/2qo0=; b=4qmUyMzHXW9VNg
	DZsEoQl0/f+5URgd4gyM3xg2zLB7dVdJprQ5LRUPCKzKH34472xynmqnD8L+SNU0WRbFPm9x8IC1a
	dg5fBS9FLC6OeF38cI8Graq78X34CjJaoINlVm6FH0NhxQk4CRqACJQgIk9fNDedkH60659VRyAlU
	E0B9upOv6ySWwaR1wIJ/dQTXIwpFKFzNoNlMUVyiDH1QnojBWTiEJ497PToZmgN1QS+1CCdfyPWAV
	uowJTvq3nznGbeYoIafChzr21sE9geXXsPY2t3MOsKh4sqToBh87uXUt+5bC7g7pmXOrIcGoC8PtE
	/kb7UTieWph/vNA9UCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD96-001IBV-0j;
	Fri, 28 Jul 2023 02:24:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD93-001IAO-0x
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:23:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3175f17a7baso1687923f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690511035; x=1691115835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnwwkjLPKewjpBvJNXc6W5/dlQD2bHf4zuHLM4hWy2k=;
        b=h06G1p0wKsW2nXVv8ewVzKC/YJF+PbktpixLsZMtVNk6MDf30slI91WD9kPS8cLGJ3
         vb/BQo/cobhzLqmFlraJD+o/Bvpr0OaXbnD2M6d+xi7P1z6Lr+6hHEc8q0Ixgq78iATY
         o1LWTiHSkom3ipZOuC7+OLOX0+C3KDRA1EJI8ZRj39KaGADM/MXW3TrwBVj3c+s+dBiP
         LNixpjRlJvCBVyKWXwv1V+KzX5j8nbWxjUdCVYUXYvnB0l4tfX3PvJ0P5cNJxs7vlZuf
         6acUIcY90YKTn4qDBHV5cQqia22AC8aEtoVVDGnE5nrd0EnnnfQ1ZXEp7yHk7m7i3kyT
         bTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690511035; x=1691115835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnwwkjLPKewjpBvJNXc6W5/dlQD2bHf4zuHLM4hWy2k=;
        b=fD04/qZ72kkkRLd5HjzIStoJkVpdiBoB49eFynldCNm9P6omLKFMqlJRibbMzAvIVz
         CDIE2MNwW2/CQDiNEMxkShBebgXhQ7PxmRxWux71sKYIxn01mSfy0jxS6PAeHLaZ3/wG
         TqwyJ/+XQKzVauZb8DcR66pAKkpa6FmYkOlwyzJyyqB+aX20ExsiFu9VItZvXy7klhaK
         PLbmYOWOAeauJqG/bNgklBLLV1ABRL3BBEGAkFKorbMgkVluWeMp81L0S4qFcOpWptXX
         1S9N1BUvv2obe0tLc6+U3OcBAASPdjofaQi18Iv2+R/d1K7zdCOqaZ0ZdpU1wX7tjGbd
         IyfQ==
X-Gm-Message-State: ABy/qLZXkwkiJzyc0CPIauHp1JQ0SEjWDCCUhb5hkZYYgvmC9XrPt4/9
	gbg0h0oQAvagHB0Jz3cmlJmXuA==
X-Google-Smtp-Source: APBJJlGLxV6ETgZiECAeJJBDsKBasmiX5KbFGTNujdHQ+IlupecbhdUu9leI0p54OFLgUf4VwcgZCQ==
X-Received: by 2002:a5d:61cb:0:b0:317:5e91:5588 with SMTP id q11-20020a5d61cb000000b003175e915588mr600000wrv.3.1690511034819;
        Thu, 27 Jul 2023 19:23:54 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id p15-20020a056000018f00b0030ae53550f5sm3509190wrx.51.2023.07.27.19.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:23:54 -0700 (PDT)
Message-ID: <6e976c3b-700f-fe8c-5a83-8f4c5bde1669@linaro.org>
Date: Fri, 28 Jul 2023 03:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] mtd: rawnand: qcom: Early structure initialization
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-8-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_192357_343651_4C86F232 
X-CRM114-Status: GOOD (  18.59  )
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



On 7/16/23 15:46, Miquel Raynal wrote:
> Instead of allocating a structure on the stack with random data and then
> expect the callee to perform the initialization (which is, in general,
> error prone), prefer zeroing the structure explicitly at allocation and
> provide the already zeroed area, so no explicit memset operation is
> needed. It is probably safer to do so, so we limit the timeframe when
> dirty data could actually be accessed by mistake.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index cb6ccaa19224..4fc8dafa8f03 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2600,8 +2600,6 @@ static void qcom_parse_instructions(struct nand_chip *chip,
>  	unsigned int op_id;
>  	int i;
>  
> -	memset(q_op, 0, sizeof(*q_op));
> -
>  	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
>  		unsigned int offset, naddrs;
>  		const u8 *addrs;
> @@ -2681,7 +2679,7 @@ static int qcom_read_status_exec(struct nand_chip *chip,
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -	struct qcom_op q_op;
> +	struct qcom_op q_op = {};
>  	const struct nand_op_instr *instr = NULL;
>  	unsigned int op_id = 0;
>  	unsigned int len = 0;
> @@ -2744,7 +2742,7 @@ static int qcom_read_id_type_exec(struct nand_chip *chip, const struct nand_subo
>  {
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
> -	struct qcom_op q_op;
> +	struct qcom_op q_op = {};
>  	const struct nand_op_instr *instr = NULL;
>  	unsigned int op_id = 0;
>  	unsigned int len = 0;
> @@ -2795,7 +2793,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
>  {
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
> -	struct qcom_op q_op;
> +	struct qcom_op q_op = {};
>  	int ret = 0;
>  
>  	qcom_parse_instructions(chip, subop, &q_op);
> @@ -2838,7 +2836,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
>  {
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> -	struct qcom_op q_op;
> +	struct qcom_op q_op = {};
>  	const struct nand_op_instr *instr = NULL;
>  	unsigned int op_id = 0;
>  	unsigned int len = 0;
> @@ -2935,7 +2933,7 @@ static int qcom_erase_cmd_type_exec(struct nand_chip *chip, const struct nand_su
>  {
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> -	struct qcom_op q_op;
> +	struct qcom_op q_op = {};
>  	int ret = 0;
>  
>  	qcom_parse_instructions(chip, subop, &q_op);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
