Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32C2C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9BCD2173C
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZzstB43N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoDUu5P4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9BCD2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPfiVn+7oOzw+se+lcNEPSnOR0RYyEXXCkOcJQPFLCE=; b=ZzstB43NX6nRxx
	4XSgJUZb0MGLOhKjV7A7xPXuxx3ZBdLgElUstqD6M3EAZCMs2iVc7OBLgA+c6s3QiCgS6NaGNdg8u
	g3rw0UnQdsfhhLH0d2WSRehBpkcsy/yPP5ym1BY8/k2vHojk+w70Dc9K4eqD3lv6GkM5FhpkFFEcB
	B9vyslPgU68WG5JmCkjOt6TfxCuPEH3DEOgS98foXmi3Uovgaioqykd7gjECVy7jnsmpSFVC2j8DS
	0ixFCbtR0plKOCcBF4FCVuqf5SD/i+mlG9gr11DKnCftvEVqMxZ3Nvus/QKi91E5GB0pnlTXLoZGN
	+5SL89kngSzwzBhuUFFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9h76-0008IR-Cm; Fri, 29 Mar 2019 02:19:24 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9h71-0008HO-Ty
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 02:19:22 +0000
Received: by mail-pf1-x444.google.com with SMTP id r15so275809pfn.9
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 19:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o1KjgXuHZ/02QqD9qn6ij11Zg/MLP+k+C9+IcABDTA8=;
 b=UoDUu5P435o+GQMV+rUps4rXO8BXPYKd3GwKFsX1D45HJlxewBBn7Ejeuz5dgUs3x3
 Xzhbm73hQOk6EJQKcCwztjbRzuXaFbNKQVnra42w35wjSC3A/DEblwe/WmB7LPksc6Zt
 AuV9PceViHMRJiwM6vtDiI3UkNx9/wc7pDcuhDXd/OzO4xmf/dRFFwG8TIEYup5U2uux
 FvHsXj98YWFmcucVPEn+wQs24UZe5tBfD86An2xoLfUECXxfzQY1Ruiex/xyz+dAxbsn
 Uy0jmRof2qylznAZB9zI1NSH8EG8nFsvFr44E7c4iQ+azi3D+XGa1kIeftYg8s25m5pQ
 3frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o1KjgXuHZ/02QqD9qn6ij11Zg/MLP+k+C9+IcABDTA8=;
 b=XXOT+kKn/NjTKao61ZQhxgneFyo6bU9cQimg/5iQ30jTPswAXU7nYEU+W2uHHVRfx5
 gWGyE+EkAbk308sQ0/Mu725wKy8ht3f6+jAA+LAH0BCQJ/DLAbD0NrEYKpUp9h6yID/t
 7bKMnc7ZBjvkgvjXXJoXDG83wM3+JrrrefxUORgR0ADEv+RIQE8eI4gkaFJs6oEWYcl6
 Rv3kx2qDJAVAxvHDBeUdQNfBZMhsKiU4tIw/RzCaV4+2M3uwRay5bx2i/VinwPargSSH
 QajeZ6OFTTyeGVEg73bt4bZRDpUelnOj5xIlRXtcLP3ZfKIJH0NIqMuL5vuucrQARyMv
 Bqpg==
X-Gm-Message-State: APjAAAW9qwPrBIdgvTXH1GAes3WcVEjSFYGil5ARsk0QhK/wB9785Rfl
 RHfM00lSFkWrQIut4rOMACI=
X-Google-Smtp-Source: APXvYqxhfHfIfk2hYfwYmaMDcHvE4QOh8YGdjGspJjUMLIsPQcWajt9POFOjXUMz2HSvJt8rvx45ZA==
X-Received: by 2002:a62:209c:: with SMTP id m28mr5242457pfj.233.1553825955957; 
 Thu, 28 Mar 2019 19:19:15 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id m16sm709762pfi.29.2019.03.28.19.19.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 19:19:15 -0700 (PDT)
Subject: Re: [PATCH V2 3/5] mtd: bcm63xxpart: move imagetag parsing to its own
 parser
To: Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
 <20190328141910.5723-4-jonas.gorski@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <471411ff-bd00-f7c6-7520-6f89d94afa70@gmail.com>
Date: Thu, 28 Mar 2019 19:19:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328141910.5723-4-jonas.gorski@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_191919_970066_89395229 
X-CRM114-Status: GOOD (  13.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/28/2019 7:19 AM, Jonas Gorski wrote:
> Move the bcm963xx Image Tag parsing into its own partition parser. This
> Allows reusing the parser with different full flash parsers.
> 
> While moving it, rename it to bcm963* to better reflect it isn't chip,
> but reference implementation specific.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
