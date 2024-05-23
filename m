Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DBBC25B79
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2024 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giQs5inn6vu/+6yWEDKSahh08bIcqxbW9o3BQAD9Lyg=; b=SoY6B2WJUX4AQd
	VpWuxvzmhrAvS1zH0YaNBDshZBIBUcyCZP+IypAkSBUZzo+TivFz0xBnIiyGvIeEyZLA9C31uDWg5
	JDYfMCFvDVh0DypNjdLAop7WAxU3ZhI/nhU4uhNxVpSeZ34zjJHU85L/uVtLlOCv0QqpkyOTX8L/i
	BuXelxw2xSfGmvn1nE2s/uQH7ej42hOM8DvCXVRM7X1AfUZgpCC85sYmezneUAH0Sr8qWwV+OO7zA
	QJTG0tnR3yCkU4YyDwQB3xxldnOizQltLHdsn+PYMCVaP86/mP4toHhHPnBsFhWVaVDAjktf8EYE4
	ezz2coukr1ZBjGpLLsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9UF-00000006V3k-0t6V;
	Thu, 23 May 2024 14:32:07 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9UC-00000006V2p-15Ia
	for linux-mtd@lists.infradead.org;
	Thu, 23 May 2024 14:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=BgtQCP6BWnj0hRmGehM9bywN+sdsudwiKyVkchOsOcE=; b=w4xREilkyEQQd0NwD/AflGGIMg
	7OJ6VqBJ01JHn+GLQJXsH9U8HZ1hrOYGWv46vofTf9uYokTE67ZpgU9ASXFsN4MMnUsDuruGp5dCQ
	wcf/gNi/kS3jaoGMbJAsTB55QITEdL703+ck/zu26irY54bst09AR/wF5SULbetN1pyp3ayi8akq+
	BtTSIXUXCNkpsuZQhOb4wp5qN7neMFAVSIZm8jTwS8uWKtjtxq+zuQbx4qJiTfO5YnjsR6Juxp8kn
	fuL0PqIM+ujJ+kCTCYGLcam0t+GfO6nPligH28OmMMCHPFslorQvYcnWjLmvUg7sda/VqLwxP3tFM
	wn4GRwig==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sA9UA-000FCg-Po; Thu, 23 May 2024 16:32:02 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sA9UA-000NG2-27;
	Thu, 23 May 2024 16:32:02 +0200
From: Esben Haabendal <esben@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
In-Reply-To: <979fd913-050b-445d-9ca8-0ec6906ce3ea@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 23 May 2024 16:01:49 +0200")
References: <20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com>
	<979fd913-050b-445d-9ca8-0ec6906ce3ea@kernel.org>
Date: Thu, 23 May 2024 16:32:01 +0200
Message-ID: <87cypc38gu.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27284/Thu May 23 10:32:30 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_073204_322127_56A70DF2 
X-CRM114-Status: UNSURE (   7.14  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 23/05/2024 15:58, Esben Haabendal wrote:
>> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
>> driver selects FSL_IFC automatically, we need the option to be selectable
>> for platforms using fsl_ifc with NOR flash.
>
> Which driver is that?

This is drivers/memory/fsl_ifc.o driver. It is for Integrated Flash
Controller (IFC) from NXP. It is used in various Layerscape socs.

> Which DTS?

It is for "fsl,ifc" compatible devices.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
