Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A51C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 16:54:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0D122269
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 16:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xGQaUC+T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXwWLbQb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0D122269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bk0UlJWqWyfuDBgBMzHp60mSR6KqJCb6Ip+ETKZLebI=; b=xGQaUC+TspNEyifF0iKzaZaUp
	IfMM0OzBV/8pJVTHJgCCQl1QdzXoGrHPjnVos1drpTAxZ9980THB3Esb0szeen4L3kToUD9c9PMK+
	QthkXHQT4u/3QeK5M52X0//lkqwqXY+xEDXA2zq8UcUxF5gjmtqx3QkbXhTTPahGcbGVzn7Hlh6lE
	iDv6fjDGIytWYeVSlY/cdHb3Bo2qe0iHdBbQ+8o23G7rT9uD87m1UuwzVH/O75AB0K3L7LTdlh2bq
	ncxTPGpSwIarwRDyf1iaIReVcvjJuTXHPKUXQtB84dxqVKU4qyIehqhG7dHnCLs188tvkwourZ32c
	F8cCTbBLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUYP0-0005ZL-CL; Mon, 19 Oct 2020 16:52:54 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUYOy-0005YU-37
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2020 16:52:52 +0000
Received: by mail-lf1-x144.google.com with SMTP id b1so257308lfp.11
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2020 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oeJENKnL6RlCYQZtisLig2cGUNPLYtt9SwyXyIaymzM=;
 b=rXwWLbQbBk2NyYYguSuq25QKMGtSZKMU0fyTndh4wPOhpV5ogUf3Y07OVJkqyV5NrL
 Buxa7hdWABZGSgogb/UGctWRqYqmtS4rvLu6jmXpSKh/AbhTRIXsg20kjiJuB5mszPpe
 Evq92MJL3xVI38nMOPQ1KwYvQiM+vaJH1E9L9c9M9jjvXGkeevrrhpU+0ZR3JmLrSFOj
 8peAKbWmqSXAhP8a30ZsyIwqT8C3s3kr+7Y4yZelPehNb4hz2t5qJOz6P1q/DOXmpeB8
 1ysZE5gBpoeP2fQNocG/WQtupnAMumg4NIh6tv32N1KkHnJAS8skysVr89LUU4Qo1ANF
 9ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oeJENKnL6RlCYQZtisLig2cGUNPLYtt9SwyXyIaymzM=;
 b=LYuEMDIcuHbQbhXdDs+V2mEgER6iHBh11iP492fDUYINEUjJ/WtvPrspX2oz+m2bZG
 znG8WmR5zJX//+HY6a0nSZJIe180/a0YeqY0ZXmWeaOn9rdhW+tBdDXz9/wg4hh8z5Y6
 MtjJee8nAB9QORbKCjzE3lk0qwi7FWKQSYHMDh3c7TtVxixdEufs/RaU0SSVw0orlDDX
 DALd3+6xoBffdVMvKhxT1HvVk6zSpXSZgI/6C+qQPjOJ48Z/ItJZK2oQZP8v5rpLCfkg
 VhjeHjyBcVw/qEI0OvrKCftGQ93zllcFOe19bD7usEQLZxZrj/9mSQ/c7sjkEmerFqTB
 iazw==
X-Gm-Message-State: AOAM532Lu9idMac0Hsl7ni0mfXTbLe+UjUHzsaDttE+xYv/Oqrm4bv28
 LGPyu9geo1ytUn7Cf9BP+MYM2CxV/s85NUAIk1U=
X-Google-Smtp-Source: ABdhPJwZV7t/tBBnirO2PeyRVBBRGKujDuPcEaITy2zgrFpxYknCfjcyqJ2qDu29KgSF7tPda5dYW2/wwGN3LsH+5Bs=
X-Received: by 2002:a19:3f06:: with SMTP id m6mr188268lfa.25.1603126370318;
 Mon, 19 Oct 2020 09:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
 <20201015092502.2ea2a7fc@xps13>
 <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
 <20201016191424.2a41b632@xps13>
 <CA+EcR20Lm2m-bkECKWC5RvB8wb1C_s7uH2PENzLK0iD14oAGUg@mail.gmail.com>
 <CAOMZO5DXJ=V0xvyEFWkwCEzwsiv6Gt4Gb+4BjmHfTTOBkDdvsA@mail.gmail.com>
 <CA+EcR21w_0jYhovUs7siqWQdq6+kPiv9mxgLBWE6JHoraYiR2g@mail.gmail.com>
In-Reply-To: <CA+EcR21w_0jYhovUs7siqWQdq6+kPiv9mxgLBWE6JHoraYiR2g@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Oct 2020 13:52:38 -0300
Message-ID: <CAOMZO5BeoXpZGf-_6sC9kN=WE2-vKnKo8Z0pEkijJyW22RYRfQ@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Han Xu <xhnjupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_125252_148396_9091DE1D 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Han Xu,

On Mon, Oct 19, 2020 at 12:51 PM Han Xu <xhnjupt@gmail.com> wrote:

> Tested on ls1043ardb board, the issue can be fixed. Thanks.

Thanks for testing.

Please reply with your Tested-by in the original patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
