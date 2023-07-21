Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AA9EB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 05:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0Nb8GCkcPib2tX7BQhOtuwjGn8DADh+RWFfaYqkfYY=; b=t567VojA9IDwpd
	eDeSILGgxf/FM2JTIzh/YauyRk2N/qu3S21J8LMQHxK/ry1gpwi0Q02Y+5W/Lz99JgcjsNlNCPmXW
	Kbb9YRHslZ4hbH/yHp3S0rw9LFtoYqV9w+p41c1OaaEB+q0j3bKG1yWSTTQpYaJWzq7UT3PmoEP8H
	j2YOdbePCetUZj6rsW+KfjM7ToxnY+araRnHkr0dnAkbyGfuOEWndzEKkasGDh1TkSSYByb/6wZLK
	lq2WkfbVXRYa4O5EhFaW1C7cpXKn7B49GFu+2DdaYupyKRh7dQwMe4QU5OPtbHU3tzMcBnSg1X8Np
	Sgmd/FurEHnbKrpfRgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMipI-00Cw1C-11;
	Fri, 21 Jul 2023 05:37:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMipF-00Cw0D-2Z
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 05:37:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso13040025e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 22:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689917830; x=1690522630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vX/JkYsTJ988R/jCJEP3BfL7G/1slMZU41YSurteI2o=;
        b=cRa+TxE5YsEqvBdKD5o7cITaabLFv6sjdy6P6XfGu8K/hmOCOfl70qGcRIwYPv5c7Q
         t8k+5TNSqPwr5k0C4Kq7aF6a3XvJ24z1Eh8s0wo/HpkRQf3xO58UqcJD1mn3XM6QZFGR
         u+W/lqKUM+ne+jyeXsBHnnf8qWpgFgoxo4trX85idDJ+j/MtiA60gevN4ajdbHSXBBp3
         nOMsDtAm/npF8oqBGE4SHQDIQeHkxicP3tnUmGk5Mb3J+1kbEaYWJBSj2EJpIoRppjPr
         rIfDnSqmtOD+YFuxLOYfhJ1st5S3wOX8RqWHa0BcSxhpNcSO/vYJqhraZeT8Yri3yn+u
         TJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689917830; x=1690522630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vX/JkYsTJ988R/jCJEP3BfL7G/1slMZU41YSurteI2o=;
        b=TIkcx92VPrVMZmoQRfe7kPpS4VWrisJbUc9TNk0UdiCLe7vFxusgfcvqUov+Wifj2R
         Gtpk1UvNPmd9rpdEFCGxyRJVIAxv6SxixbXqhjtB9J1NLnGIGAn146DSlnwPZsI2T52o
         oa7wINzFRXd6+b/kRzzkALgBNWXv+kRbgyAxQ6PmFxTEjMj0nQAY6I5TaA0M6zs8AQbv
         buzyczDo2V6ToFPYffQYKEajY2Jn6wV6Oo4HBgZp7GMVuFugDnTjaV2nLtI/o0uxeKap
         9XlClTOxCH76TFz82OpZFDuHeESGFOV36fQhjhldkXFgf557xZnCwfyMvb6IsFtmQx0h
         P48g==
X-Gm-Message-State: ABy/qLabmFYNXTc7bUA2u+itQqHo2NbVfXnnwnuXgTjJdrcs4qmrbiBl
	uH1J6TifB+lUMtNDCjJXkbA2Og==
X-Google-Smtp-Source: APBJJlHuuEtVJXP90otgD42oqbE5kUntVWwp5lSVN+QyO4G3yrhO6MftAcWJefiLMXZjXf/Ea8z+Vg==
X-Received: by 2002:a7b:c401:0:b0:3fb:bc4a:46ad with SMTP id k1-20020a7bc401000000b003fbbc4a46admr497865wmi.9.1689917829691;
        Thu, 20 Jul 2023 22:37:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c229300b003fb40f5f553sm5409400wmf.31.2023.07.20.22.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 22:37:06 -0700 (PDT)
Date: Fri, 21 Jul 2023 08:37:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>,
	Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in
 fun_exec_op()
Message-ID: <604b0c70-01cf-4cbc-b387-8c709c972fef@kadam.mountain>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
 <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
 <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_223713_898441_F44675DE 
X-CRM114-Status: GOOD (  17.99  )
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

On Thu, Jul 20, 2023 at 08:27:28PM +0200, Christophe JAILLET wrote:
> Le 20/07/2023 =E0 09:04, Dan Carpenter a =E9crit=A0:
> > On Wed, Jul 19, 2023 at 11:55:01PM +0200, Christophe JAILLET wrote:
> > > 'op-cs' is copied in 'fun->mchip_number' which is used to access the
> > > 'mchip_offsets' and the 'rnb_gpio' arrays.
> > > These arrays have NAND_MAX_CHIPS elements, so the index must be below=
 this
> > > limit.
> > > =

> > > Fix the sanity check in order to avoid the NAND_MAX_CHIPS value. This
> > > would lead to out-of-bound accesses.
> > > =

> > > Fixes: 54309d657767 ("mtd: rawnand: fsl_upm: Implement exec_op()")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > =

> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > =

> > Good eye.  I'm assuming you did something like this:
> > =

> > #!/bin/bash
> > =

> > FILE=3D$1
> > WORDS=3D$(cat $FILE | perl -ne 'if ($_ =3D~ /\[([\w_]+)\];/) { print "$=
1\n" }' | sort -u)
> > for i in $WORDS ; do
> >      grep -Hn " > $i" $FILE
> > done
> > =

> > regards,
> > dan carpenter
> > =

> =

> I did with the help of a coccinelle script.
> (which can certainly be improved, so adding Julia in cc: :) )

Harshit and I were mucking with this about yesterday.  He made
Coccinelle script as well.

We found three bugs in max9286_parse_dt(), hisi_inno_phy_probe() and
jent_testing_store().  Only the one in hisi_inno_phy_probe() is real
life bad because the others do an out of bounds check followed by a
mask.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
