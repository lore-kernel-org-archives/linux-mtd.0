Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA6DC4727F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:52:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4312145D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 12:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3aq3BNJO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nldLH60D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B4312145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2lpDG2jz3ACBgkRr6EU0+rVr2+klWpNa54U582o8wzI=; b=3aq3BNJOtkYGNhOpnO2SJPfqa
	KQe+4I6MjHmM3neqVks8PGKwQdnIONUXMDSEwsUG+9EV4kLC4PFHZNRWZdf0CF9BIuaZWguM5dKWA
	CxLltR3UZiv9a4iTUCyhDZ60m5GtGOeIgAXduJNH29JNmDp6eLsR8bZAUpLLKbnjhaJVRmdrgZ+6e
	TxKwgtOq0AkUsk75ipiXfSKxZlsw/90t/yliqWLNQiLY4Q6TrN0KH8kmbepxLzvZGJZ2uPNJaqoFg
	VOwTMB3xNoZYS7nXnTh9cZVEEEqz56Z8YnCxSxW5tcndU6iDtHxATrrbArBsGxVt8Jt3yGsdZ/053
	TJWIpktCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNF6g-0001PJ-DV; Tue, 29 Sep 2020 12:51:46 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNF6c-0001Nw-US
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 12:51:44 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TCpZaM007685;
 Tue, 29 Sep 2020 07:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601383895;
 bh=hiA4CemB1Q1XHmbfcV4K/ZoN/+gJe0fRHuHo1omg+Iw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nldLH60DOVEXZTiyicdZzJO6aT3Dsh/lAA03+Dj91M60YCpEwZFmzq/14lMT9w/N2
 8LPdf0X3fdHt+UNdsVH7HqUCEzcXBEG84U0hKM1BVBr4ugnZft2qy1qASbi+7PwlBv
 7IohsaMfhB8PPWeTAQi37+VB6mWJ16v5SmkjH2yY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TCpZUQ074329
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 07:51:35 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 07:51:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 07:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TCpXqV018648;
 Tue, 29 Sep 2020 07:51:34 -0500
Date: Tue, 29 Sep 2020 18:21:33 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 09/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Message-ID: <20200929125131.fmztz4rr2iuj6uof@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-10-p.yadav@ti.com>
 <feb046fd-a9ea-9ea3-55f7-bf823ed1e61f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <feb046fd-a9ea-9ea3-55f7-bf823ed1e61f@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_085143_197499_28F32CB0 
X-CRM114-Status: GOOD (  23.44  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/09/20 11:26AM, Tudor.Ambarus@microchip.com wrote:
> Hi,
> 
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Allow flashes to specify a hook to enable octal DTR mode. Use this hook
> > whenever possible to get optimal transfer speeds.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 35 +++++++++++++++++++++++++++++++++++
> >  drivers/mtd/spi-nor/core.h |  2 ++
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 87c568debf14..6ee93544d72f 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3069,6 +3069,35 @@ static int spi_nor_init_params(struct spi_nor *nor)
> >         return 0;
> >  }
> > 
> > +/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
> > + * @nor:                 pointer to a 'struct spi_nor'
> > + * @enable:              whether to enable or disable Octal DTR
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> > +{
> > +       int ret;
> > +
> > +       if (!nor->params->octal_dtr_enable)
> > +               return 0;
> > +
> > +       if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> > +             nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> > +               return 0;
> > +
> > +       ret = nor->params->octal_dtr_enable(nor, enable);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (enable)
> > +               nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> > +       else
> > +               nor->reg_proto = SNOR_PROTO_1_1_1;
> > +
> > +       return 0;
> > +}
> > +
> >  /**
> >   * spi_nor_quad_enable() - enable/disable Quad I/O if needed.
> >   * @nor:                pointer to a 'struct spi_nor'
> > @@ -3109,6 +3138,12 @@ static int spi_nor_init(struct spi_nor *nor)
> >  {
> >         int err;
> > 
> > +       err = spi_nor_octal_dtr_enable(nor, true);
> > +       if (err) {
> > +               dev_dbg(nor->dev, "octal mode not supported\n");
> > +               return err;
> > +       }
> > +
> >         err = spi_nor_quad_enable(nor, true);
> 
> Is it possible to enable octal dtr and quad at the same time?
> Maybe an 'if/else if' here depending on the values of nor->read_proto and
> nor->write_proto

No it is not. If you look inside spi_nor_octal_dtr_enable() and 
spi_nor_quad_enable(), they both are a no-op if the protocol does not 
match. spi_nor_quad_enable() was already doing it this way so I made 
spi_nor_octal_dtr_enable() follow suit. So this is effectively an 
if-else on the value of nor->read_proto. I don't think an explicit one 
is needed.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
