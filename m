Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27509C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BD12184C
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PcAn1G4y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQOlomdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BD12184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gpb5r1nx8AHI1UhBvQPVvhkKolPt7cr+miF0YWW/vc=; b=PcAn1G4y/uR1zg
	i2V5c2BvkHweo+jU79/SNUl4AXwNa9O7V6fIwmf86IyvQ9vV1YA/0TGfdVOgMYvaH+b+Jhsg5sIfg
	dghZlNe3tMmKWLV7gG4ZdsE0zGk8R0fJG1bV1sV4AddTefPYO7beHz4IYc0N14vkWf8cTzlUM43sx
	L0Vz51WLfxrX6U1CwdNkOhFUxTtV7rmG/6RQxTR6oFXpcWtpeE65Ug0E897KUOh3mgqDsCeiyyp/9
	2UxvU4Peolbd+J+OvQfUIc2ujnrKLW+hDGNCjRxvQsFLsi89UwzoL1ZyOm3rgBY5V2RhsUve49VeX
	RKDL6KbfE+Au9LliIxIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhzz-0000kz-Mi; Thu, 24 Jan 2019 16:37:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhzw-0000kf-VG
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 16:37:02 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 550962184C;
 Thu, 24 Jan 2019 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548347820;
 bh=tdKh2qxCVtFLVjtpe0yu1gzoN4SC989h+dFQ0Z2rgYo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jQOlomdzSyDPK75xm+QzO7xlL3L/Jd9vlPac8fh0tRp+R/elvDvZ/6KHeP3oNRJUr
 7fu1Gl+RCrIOOcwTIrdbQFxamQOucVbnPJWsQSWkvDW+zLXX+uE+r+APs3zaZ5w1A2
 zzqfxb4Gbbbsx9kL2rLEQ9cUMfRhOsaOzspJhDBI=
Date: Thu, 24 Jan 2019 17:36:51 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190124173651.5b930b62@bbrezillon>
In-Reply-To: <93819bce-b03e-c3f4-e22e-f7e63b14003b@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
 <20190123103512.722095cd@bbrezillon>
 <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
 <20190123122514.0db87887@bbrezillon>
 <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
 <20190123132249.2e7f65a2@bbrezillon>
 <358c78d9-6507-3998-a065-ddd18809d02b@denx.de>
 <20190123134050.7efe59a6@bbrezillon>
 <20190123135735.358fc9a6@bbrezillon>
 <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
 <20190124085018.2ad33dab@bbrezillon>
 <39d6edd9-14ad-8110-b618-6454f6840b28@denx.de>
 <20190124091459.11cb2912@bbrezillon>
 <6dadd565-aa59-82ba-757f-db0a1c03656d@denx.de>
 <20190124101901.7b44c5c5@bbrezillon>
 <29f49243-6b52-5c98-29a6-81f9a32697b9@denx.de>
 <20190124121435.4ed6069d@bbrezillon>
 <d504c576-d2f8-c325-528e-e4ba71ab1361@denx.de>
 <20190124131808.11165b42@bbrezillon>
 <bde33ebf-dd3d-d237-68a8-9eeb43c22368@denx.de>
 <20190124134136.7fb975ac@bbrezillon>
 <93819bce-b03e-c3f4-e22e-f7e63b14003b@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_083701_026342_3A7C9CCB 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Jan 2019 14:59:36 +0100
Stefan Roese <sr@denx.de> wrote:

> On 24.01.19 13:41, Boris Brezillon wrote:
> > On Thu, 24 Jan 2019 13:28:36 +0100
> > Stefan Roese <sr@denx.de> wrote:
> >   
> >> This one works as well. Feel free to add my:
> >>
> >> Reviewed-by: Stefan Roese <sr@denx.de>
> >> Tested-by: Stefan Roese <sr@denx.de>
> >>
> >> tags if appropriate.  
> > 
> > I will.
> >   
> >>
> >> Another question though regarding older kernel versions (e.g. v4.19 LTS).
> >> Could you perhaps push your fix [1] from yesterday as well?  
> > 
> > Yep, will send a separate patch with Fixes+stable tags and queue it to
> > the mtd/fixes branch after you have reviewed/tested it.  
> 
> Thanks. Could you perhaps also check if the U-Boot implementation also
> needs a fix/change in this area?

Yes it does.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
