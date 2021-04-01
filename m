Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A82C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 16:31:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4B561381
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 16:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4B561381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y8pstha4DpDokXlOy7Mh0eU0iiSbid1HmlzQgDpFm8Q=; b=rdEwNy/fu3IoCxSiIjJOAEo4m
	awR0Lvx5Vo920Z5WS4px3e71IXv4HXtcpuDkAIB3AjwOIeU6M7At9eswmw127TWi9NdTnUJV3aAF2
	DpYfrvPfvVdoE92YldDuXaePgDz3EibEDLlPe+mcHKNDB4QQyyja7PGab5b3Z653aBtzflIAqco1F
	4TPIlZhX1g+4jPKwU0J3EQ9mqMKNnfWcrNNUaW4U5UIiaeVfgSalUv/PI05WwH739qaSsxegursde
	9+pNHykyVEFdsCZNht6LHReUHc67CosNzSAhTTpfCSuWUePlRh+tGoTj+hD3GQ6eipFdCe6qC7oLW
	/VNjstsDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS0DN-00AJOU-MK; Thu, 01 Apr 2021 16:30:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzzh-00ADjQ-Qp
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 16:16:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id j25so1822729pfe.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T0rYie3R/Ll/Af9JkBaLcz+s5C8Xgvssk29GDuQKtVo=;
 b=hZTs4t39HPYJt8nFN3+uw+fFkJwWZQ+USL2SvOKmRHoMWJYlqMgchLE/jdrKEQcQm7
 gG67zb/7GhmqoLrWGHg/Yppb1uBDzTF4+FiwMtt71zoxlxDEOpkE6h66XxFp9l4QDcdE
 pOik5kwxa6cfUCHP7d0vnJwUPTSuG6/ydSUHmYcQwMtYti/RPWW9m9F1HQ+cvqZO7y6g
 vcsd0I9j/k/SQfuOIP2v5L4FHaNZcKbdeDIEDHbOc22oisyz2nLQzXyvKa9bg65dG5Ar
 m2g128D1RWoAMw08JIBItzjtBpzSKa6iZmzUxG1MYB410HY9xC1t9vYZnw8gRJJ3KZju
 BFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T0rYie3R/Ll/Af9JkBaLcz+s5C8Xgvssk29GDuQKtVo=;
 b=Xzku04zSdqhPY81tJEveC8O77spoj6TlGvgykwJ21dEtLTIY7Jg2T+j6gJeSl7eS2G
 nsOTJloOA8rfrN/w4lUm2wcxdBynF9wbttyeKJttcDJcPJCxESrFaOKbA/oiPn6wuZtT
 Lo0/Qmu9ZfINhBO0qzjArVlvRthIG12Lgr3fiVIeLWu7teTQWKliH+xcPEbZNqOur9Kg
 /KKPtAgBxKY/3P2LthCxrIf/tOa61G6NSiKj45L9MHIA8sHpRWT6N038BQG2bzo2Qk7A
 fIaMSmvShwMjDKKd3xe3P+W9e54D/O/rITPLp3EETkKtMoEOfUimbpDl9IigCmZsEpau
 hwtg==
X-Gm-Message-State: AOAM533qIP1Q5APQkFWGUkDoJIiOqo9+JHXkTa3o2lJj/AcS/4Aei2lw
 8hpdM8EvC9IxklyhxWON7UPt
X-Google-Smtp-Source: ABdhPJzRfPJ4ww9afESIc0EdZwAUVJbhKldoXwCOD5bB0LhtoJSQ3txH5Jvp0nJUZlBjYBX4u6rxEg==
X-Received: by 2002:a63:c741:: with SMTP id v1mr8045403pgg.207.1617293787509; 
 Thu, 01 Apr 2021 09:16:27 -0700 (PDT)
Received: from work ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id t18sm6174736pfq.147.2021.04.01.09.16.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 01 Apr 2021 09:16:26 -0700 (PDT)
Date: Thu, 1 Apr 2021 21:46:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v10 3/4] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210401161622.GH14052@work>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
 <20210401151955.143817-4-manivannan.sadhasivam@linaro.org>
 <20210401175421.65db63bf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401175421.65db63bf@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_171630_287385_CEB33911 
X-CRM114-Status: GOOD (  14.52  )
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

On Thu, Apr 01, 2021 at 05:54:21PM +0200, Boris Brezillon wrote:
> On Thu,  1 Apr 2021 20:49:54 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > @@ -565,6 +608,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> >  
> >  	if (!chip->bbt)
> >  		return 0;
> > +
> > +	/* Check if the region is secured */
> > +	if (nand_region_is_secured(chip, ofs, 0))
> > +		return -EIO;
> 
> That would is still wrong, you should never pass a 0 size to
> nand_region_is_secured().
> 

Size doesn't matter here, that's why I passed 0. Maybe 1 would be
appropriate?

Thanks,
Mani


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
