Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A306C10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 06:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0913420663
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 06:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALi0O2yo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tf52Gkfm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0913420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ckzofv0CQ5k9zaxx1HOwvKOOzKCLCeEPV591IenLnQ=; b=ALi0O2yoLpTr0T
	hDPsruFtMlpxd+ZQSKRFPC2VLC4XwIfekx0ba8UFVFAEADto+0hjNc9PK6cy/onQLo+7yrtyw+q/r
	tWQED/1Uykhku4fpz6I/vBiw0D/BfxpzEX5dZnVj37CIA3ATFb6Zv88aUhUlfHhHvAcJy9oAHWq1E
	OHIaYEltEHcMxft8yxrAvpOlk7w1c7qiyG4QaJbHUHr+ddwy8Qz7qlOaAGpTYWdtlbhtgAAV/U6M1
	H3o0TalRb3DirXatMXwaqhSwycDgnaJODrdWURBFYUEncT6gWTX91Pxp+s989xH+diiZm4S5G+TU6
	co1DuXTaebHhr+p12c8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jERld-0005Hv-Vq; Wed, 18 Mar 2020 06:01:25 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jERlZ-0005Gm-TL
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 06:01:24 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200318060102epoutp04868319c2f430c8e7b5fec7ef3490a926~9UJkle7Ys0996209962epoutp04J
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 06:01:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200318060102epoutp04868319c2f430c8e7b5fec7ef3490a926~9UJkle7Ys0996209962epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584511262;
 bh=9xreDDOVO3ibhanAIpkdeDKfQgsWWCt5cZPdH1vsgGI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tf52GkfmW7zBReBJTcrftxOUxeB5nZoHxpisfx6lNfcwXzAiRbA7MBXBxWsGK+IlS
 y8nGWsJQd8oT8Jfv1g3g/VL0GEKGohx40YcgwvQh2B+8ZtJxAi1cirlFL8+LjlWrf5
 +5Tr0znJL1ihyYa2CPS3nCQa00dwy11s2iPYgKsg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200318060102epcas1p2c09adf1a8fd74ed24ae2b420fcacb7d4~9UJkRb3Ct0715707157epcas1p2m;
 Wed, 18 Mar 2020 06:01:02 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.160]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48hztP1CNCzMqYkk; Wed, 18 Mar
 2020 06:01:01 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 1B.11.04074.C19B17E5; Wed, 18 Mar 2020 15:01:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200318060100epcas1p45ac0986373b60c5dbeb4ce15dad6a232~9UJixPbIw1831218312epcas1p4S;
 Wed, 18 Mar 2020 06:01:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200318060100epsmtrp13003df1e4fd11eac5e69f06d7033ff02~9UJivnVXZ1111511115epsmtrp1E;
 Wed, 18 Mar 2020 06:01:00 +0000 (GMT)
X-AuditID: b6c32a39-573ff70000000fea-01-5e71b91cf097
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D1.9F.04024.C19B17E5; Wed, 18 Mar 2020 15:01:00 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200318060100epsmtip27b444ccb1644dd4fe6281c664dbaf9d7~9UJikpsT43152731527epsmtip2q;
 Wed, 18 Mar 2020 06:01:00 +0000 (GMT)
Message-ID: <5343b759e4272bf7a77b2a774f748c4410a0c510.camel@samsung.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>
Date: Wed, 18 Mar 2020 15:01:00 +0900
In-Reply-To: <f6f3806275cef43d51c368a76596eddd@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRmVeSWpSXmKPExsWy7bCmga7szsI4g92XmSyuX7vCaPF3zjsm
 i0c3f7Na7G5axm7x9vQGdouPSxws/p/9wO7A7rFz1l12j8dzN7J7bF5S73Hnx1JGj74tqxg9
 jt/YzuRxYG8LWwB7VI5NRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2S
 i0+ArltmDtA9SgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCQ4MCveLE3OLSvHS9
 5PxcK0MDAyNToMqEnIz5c44zFSyvqGjbPZO9gfGLXxcjB4eEgInEyV1CXYxcHEICOxglptyZ
 wwbhfGKU+PzgMGMXIyeQ841RYsK5LBAbpOHJwp1QRXsZJVr6t7BAOI8YJa43nQbr4BXwkHh+
 axM7iC0MZM84/xDMZhPQkrjxexMriC0ioCLx+PMFRpBmZoFTjBIH988CK2IRUJVo/joHzOYU
 sJCYtG83I8RqHYm3p/pYQO7mFRCU+LtDGCTMLCAvsf3tHGaQORICj9kk/pz6zARR7yJxaelp
 FghbWOLV8S3sELaUxMv+Nii7WGLnyonsEM0tjBKPli+BShhLvHu7lhlkGbOApsT6XfoQYUWJ
 nb/nMkIs5pN497WHFRKOvBIdbUIQJUoSbx60QK2VkLjwuJcVwvaQuH/pJzTkpjNL3Fp0i2UC
 o8IshHdmIXlnFsLiBYzMqxjFUguKc9NTiw0LTJEjeBMjOH1qWe5gPHbO5xCjAAejEg8vx4aC
 OCHWxLLiytxDjBIczEoivIsL8+OEeFMSK6tSi/Lji0pzUosPMZoCA3sis5Rocj4wteeVxBua
 GhkbG1uYmJmbmRorifNOvZ4TJySQnliSmp2aWpBaBNPHxMEp1cC4IT+Pi3HrnJA9W0X38qfe
 P1Py4v/qlMjVE/k/p85nE1mhv0rUpfHB3L5FdjkXQ2RPJs3gs/NfeG1x0K22X4aJl4rzZDWX
 m7DPP6LYnnq/2r3Ws71oblZN2m3Otp3TdHgWKp47+EAzp4jh6eRKqw3/l3GWXNz6i8n+dkYp
 d338p7XB06SXbryqxFKckWioxVxUnAgA0gM5GLUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSvK7MzsI4g/ezlSyuX7vCaPF3zjsm
 i0c3f7Na7G5axm7x9vQGdouPSxws/p/9wO7A7rFz1l12j8dzN7J7bF5S73Hnx1JGj74tqxg9
 jt/YzuRxYG8LWwB7FJdNSmpOZllqkb5dAlfG/DnHmQqWV1S07Z7J3sD4xa+LkZNDQsBE4snC
 nWxdjFwcQgK7GSW2LvrCBJGQkHi08wtLFyMHkC0scfhwMUTNA0aJmX0XwGp4BTwknt/axA5i
 CwPZM84/BLPZBLQkbvzexApiiwioSDz+fIERpJlZ4BSjxO7tO5hBEiwCqhLNX+eANXAKWEhM
 2rebEcQWEpjLLHHiThiIzSygKdG6/Tc7xEE6Em9P9YEdxCsgKPF3hzBEibzE9rdzmCcwCs5C
 0jELoWoWkqoFjMyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCo0JLcwfj5SXxhxgF
 OBiVeHgTNhXECbEmlhVX5h5ilOBgVhLhXVyYHyfEm5JYWZValB9fVJqTWnyIUZqDRUmc92ne
 sUghgfTEktTs1NSC1CKYLBMHp1QDY+o1sXmnvaaeiq/nsPjnmyUXcIWVWcL+Jk9rqZ39mZ7I
 BSfvPD+zlLP1n7Hodrs/rJLvTGcdi/jR/yzv/V4TnU/c7Gdcy0IWpNVmsS9VU3tksuCt0QJT
 N9mr1rlr9+2/skZdwZlzh/wNt/2LsqTeH7FxOtzWOuPzg+3X7PUEFgRcLQu5tulHihJLcUai
 oRZzUXEiABF3xCOGAgAA
X-CMS-MailID: 20200318060100epcas1p45ac0986373b60c5dbeb4ce15dad6a232
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8
References: <20200304110800.20658-1-js07.lee@samsung.com>
 <CGME20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8@epcas1p4.samsung.com>
 <20200304110800.20658-2-js07.lee@samsung.com>
 <ab18ece8973dbf89448d2070a78ff50b@walle.cc>
 <b3e7a00fb5014efefc7214e12883deb77e3ae02f.camel@samsung.com>
 <f63aebbd17eba621e0cd6852743cc0b282dbdefd.camel@samsung.com>
 <f6f3806275cef43d51c368a76596eddd@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_230122_387475_64A376DD 
X-CRM114-Status: GOOD (  40.13  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 chenxiang <chenxiang66@hisilicon.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 2020-03-17 at 15:52 +0100, Michael Walle wrote:
> Am 2020-03-17 12:35, schrieb Jungseung Lee:
> > Hi, Micahel
> > 
> > On Tue, 2020-03-17 at 20:00 +0900, Jungseung Lee wrote:
> > > Hi, Michael,
> > > 
> > > On Fri, 2020-03-13 at 17:24 +0100, Michael Walle wrote:
> > > > Hi Jungseung,
> > > > 
> > > > sorry for the late review.
> > > > 
> > > 
> > > Not at all. thanks for your review.
> > > 
> > > > Am 2020-03-04 12:07, schrieb Jungseung Lee:
> > > > > Currently, we are supporting block protection only for
> > > > > flash chips with 3 block protection bits in the SR register.
> > > > > This patch enables block protection support for flashes with
> > > > > 4 block protection bits(bp0-3).
> > > > > 
> > > > > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > > > > ---
> > > > >  drivers/mtd/spi-nor/spi-nor.c | 82
> > > > > ++++++++++++++++++++++++++++++++---
> > > > >  include/linux/mtd/spi-nor.h   |  4 ++
> > > > >  2 files changed, 79 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > > > > b/drivers/mtd/spi-nor/spi-nor.c
> > > > > index c58c27552a74..31a2106e529a 100644
> > > > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > > > @@ -238,6 +238,14 @@ struct flash_info {
> > > > >  					 * status register.
> > > > > Must be
> > > > > used with
> > > > >  					 * SPI_NOR_HAS_TB.
> > > > >  					 */
> > > > > +#define SPI_NOR_4BIT_BP		BIT(17)	/*
> > > > > +					 * Flash SR has 4 bit
> > > > > fields
> > > > > (BP0-3)
> > > > > +					 * for block
> > > > > protection.
> > > > > +					 */
> > > > > +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> > > > > +					 * BP3 is bit 6 of
> > > > > status
> > > > > register.
> > > > > +					 * Must be used with
> > > > > SPI_NOR_4BIT_BP.
> > > > > +					 */
> > > > > 
> > > > >  	/* Part specific fixup hooks. */
> > > > >  	const struct spi_nor_fixups *fixups;
> > > > > @@ -1786,7 +1794,16 @@ static int spi_nor_erase(struct
> > > > > mtd_info
> > > > > *mtd,
> > > > > struct erase_info *instr)
> > > > > 
> > > > >  static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
> > > > >  {
> > > > > -	return SR_BP2 | SR_BP1 | SR_BP0;
> > > > > +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > > > +
> > > > 
> > > > can we just use the SR_BP3 eg:
> > > > 
> > > > 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > > 	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> > > > 		mask |= SR_BP3;
> > > > 	return mask;
> > > > 
> > > > 
> > > 
> > > I'd prefer this one too if we can, but there are some places to
> > > need
> > > the real mask value. It is also used in other places such as
> > > spi_nor_sr_lock/unlock.
> > > 
> > > > > +	if (nor->flags & SNOR_F_HAS_4BIT_BP) {
> > > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > > > +			mask = mask | SR_BP3_BIT6;
> > > > > +		else
> > > > > +			mask = mask | SR_BP3_BIT5;
> > > > > +	}
> > > > > +
> > > > > +	return mask;
> > > > >  }
> > > > > 
> > > > >  static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
> > > > > @@ -1797,12 +1814,26 @@ static u8 spi_nor_get_tb_mask(struct
> > > > > spi_nor
> > > > > *nor)
> > > > >  		return SR_TB_BIT5;
> > > > >  }
> > > > > 
> > > > > +static u8 stm_get_bpval_from_sr(struct spi_nor *nor, u8 sr)
> > > > > {
> > > > > +	u8 mask = spi_nor_get_bp_mask(nor);
> > > > > +	u8 bp = sr & mask;
> > > > > +
> > > > > +	if (bp & SR_BP3_BIT6)
> > > > > +		bp = (bp & ~BIT(6)) | BIT(5);
> > > > > +
> > > > > +	bp = bp >> SR_BP_SHIFT;
> > > > > +
> > > > > +	return bp;
> > > > > +}
> > > > 
> > > > Don't convert this. It makes the code really hard to read. See
> > > > below.
> > > > 
> > > > > +
> > > > >  static int stm_get_min_prot_length(struct spi_nor *nor)
> > > > >  {
> > > > >  	int bp_slots, bp_slots_needed;
> > > > > -	u8 mask = spi_nor_get_bp_mask(nor);
> > > > > 
> > > > > -	bp_slots = (mask >> SR_BP_SHIFT) + 1;
> > > > 
> > > > Then just keep this.
> > > > 
> > > > > +	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> > > > > +		bp_slots = 1 << 4;
> > > > > +	else
> > > > > +		bp_slots = 1 << 3;
> > > > > 
> > > > >  	/* Reserved one for "protect none" and one for "protect
> > > > > all".
> > > > > */
> > > > >  	bp_slots = bp_slots - 2;
> > > > > @@ -1821,9 +1852,8 @@ static void stm_get_locked_range(struct
> > > > > spi_nor
> > > > > *nor, u8 sr, loff_t *ofs,
> > > > >  {
> > > > >  	struct mtd_info *mtd = &nor->mtd;
> > > > >  	int min_prot_len;
> > > > > -	u8 mask = spi_nor_get_bp_mask(nor);
> > > > >  	u8 tb_mask = spi_nor_get_tb_mask(nor);
> > > > > -	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> > > > > +	u8 bp = stm_get_bpval_from_sr(nor, sr);
> > > > 
> > > > also this.
> > > > 
> > 
> > hmm, it looks like we still need some convertion here to get the
> > exact
> > bp value.
> 
> OK I see. What has confused me before was that some "fixups" were
> done
> in helper functions whereas others where done in the actual
> stm_lock/stm_unlock().
> 
> What do you think about:
> 
> (1) read the BP bits, if they are not consecutive move them around
> and
>      normalize the value, eg. fix them up to be
>          SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0  >> SR_BP_SHIFT
> (2) do the operations on these bits, eg this should not shift the
>      value by SR_BP_SHIFT anymore. This would be done in (3)
> (3) convert it back to the representation the flash would need it.
> 
> So there could be a function spi_nor_get_bp_val() for (1) and
> spi_nor_set_bp_val() for (3).
> 
> u8 spi_nor_get_bp_val(u8 sr)
> {
>      u8 val;
> 
>      val = sr & (SR_BP2 | SR_BP1 | SR_BP0);
> 
>      if (nor->flags & SNOR_F_HAS_4BIT_BP)
>          if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && sr & SR_BP3_BIT6)
>              val |= SR_BP3;
>          else
>              val |= sr & SR_BP3
> 
>      return val >> SR_BP_SHIFT;
> }
> 
> void spi_nor_set_bp_val(u8 val, u8 *sr)
> {
>      u8 bp3_bit;
> 
>      val <<= SR_BP_SHIFT;
> 
>      /* clear and set common bits */
>      *sr &= ~(SR_BP2 | SR_BP1 | SR_BP0);
>      *sr |= val & (SR_BP2 | SR_BP1 | SR_BP0)
> 
>      /* BP3 is special because it may be on different bits */
>      if (nor->flags & SNOR_F_HAS_4BIT_BP) {
>          if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
>              bp3_bit = SR_BP3_BIT6;
>          else
>              bp3_bit = SR_BP3;
> 
>          if (val & SR_BP3)
>              *sr |= bp3_bit;
>          else
>              *sr &= ~bp3_bit;
>      }
> }
> 
> This way we'd have all the fixups in one place.
> 

It's good suggestion, but if there are no additional use cases, it
would be good idea to place them within without using helper function.

I'm going to post new patch soon.

Thanks,

> 
> -michael
> 
> > > > 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > > 	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> > > > 		mask |= SR_BP3;
> > > > 	return mask;
> 
> 
> }
> 
> 
> -michael
> 
> > 
> > Thanks,
> > 
> > > > > 
> > > > >  	if (!bp) {
> > > > >  		/* No protection */
> > > > > @@ -1881,7 +1911,7 @@ static int stm_is_unlocked_sr(struct
> > > > > spi_nor
> > > > > *nor, loff_t ofs, uint64_t len,
> > > > > 
> > > > >  /*
> > > > >   * Lock a region of the flash. Compatible with ST Micro and
> > > > > similar
> > > > > flash.
> > > > > - * Supports the block protection bits BP{0,1,2} in the
> > > > > status
> > > > > register
> > > > > + * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3}
> > > > > in
> > > > > the
> > > > > status register
> > > > >   * (SR). Does not support these features found in newer SR
> > > > > bitfields:
> > > > >   *   - SEC: sector/block protect - only handle SEC=0 (block
> > > > > protect)
> > > > >   *   - CMP: complement protect - only support CMP=0 (range
> > > > > is
> > > > > not
> > > > > complemented)
> > > > > @@ -1889,7 +1919,7 @@ static int stm_is_unlocked_sr(struct
> > > > > spi_nor
> > > > > *nor, loff_t ofs, uint64_t len,
> > > > >   * Support for the following is provided conditionally for
> > > > > some
> > > > > flash:
> > > > >   *   - TB: top/bottom protect
> > > > >   *
> > > > > - * Sample table portion for 8MB flash (Winbond w25q64fw):
> > > > > + * Sample table portion for 8MB flash (Winbond w25q64fw /
> > > > > BP0-
> > > > > 2):
> > > > >   *
> > > > >   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > > > > Protected
> > > > > Portion
> > > > >   *
> > > > > -----------------------------------------------------------
> > > > > ------
> > > > > ---------
> > > > > @@ -1909,6 +1939,32 @@ static int stm_is_unlocked_sr(struct
> > > > > spi_nor
> > > > > *nor, loff_t ofs, uint64_t len,
> > > > >   *    0   |   1   |   1   |   0   |   1   |  2 MB         |
> > > > > Lower
> > > > > 1/4
> > > > >   *    0   |   1   |   1   |   1   |   0   |  4 MB         |
> > > > > Lower
> > > > > 1/2
> > > > >   *
> > > > > + * Sample table portion for 64MB flash (Micron n25q512ax3 /
> > > > > BP0-
> > > > > 3):
> > > > > + *
> > > > > + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  |
> > > > > Protected
> > > > > Portion
> > > > > + *
> > > > > -----------------------------------------------------------
> > > > > ------
> > > > > ---------
> > > > > + *    0   |   0   |   0   |   0   |   0   |  NONE         |
> > > > > NONE
> > > > > + *    0   |   0   |   0   |   0   |   1   |   64 KB       |
> > > > > Upper
> > > > > 1/1024
> > > > > + *    0   |   0   |   0   |   1   |   0   |  128 KB       |
> > > > > Upper
> > > > > 1/512
> > > > > + *    0   |   0   |   0   |   1   |   1   |  256 KB       |
> > > > > Upper
> > > > > 1/256
> > > > > + *   ...
> > > > > + *    0   |   1   |   0   |   0   |   1   |  16 MB        |
> > > > > Upper
> > > > > 1/4
> > > > > + *    0   |   1   |   0   |   1   |   0   |  32 MB        |
> > > > > Upper
> > > > > 1/2
> > > > > + *    0   |   1   |   0   |   1   |   1   |  64 MB        |
> > > > > ALL
> > > > > + *    0   |   1   |   1   |   0   |   0   |  64 MB        |
> > > > > ALL
> > > > > + *   ...
> > > > > + *
> > > > > ------|-------|-------|-------|-------|---------------|----
> > > > > ------
> > > > > ---------
> > > > > + *    1   |   0   |   0   |   0   |   0   |   NONE        |
> > > > > NONE
> > > > > + *    1   |   0   |   0   |   0   |   1   |   64 KB       |
> > > > > Lower
> > > > > 1/1024
> > > > > + *    1   |   0   |   0   |   1   |   0   |  128 KB       |
> > > > > Lower
> > > > > 1/512
> > > > > + *    1   |   0   |   0   |   1   |   1   |  256 KB       |
> > > > > Lower
> > > > > 1/256
> > > > > + *   ...
> > > > > + *    1   |   1   |   0   |   0   |   1   |  16 MB        |
> > > > > Lower
> > > > > 1/4
> > > > > + *    1   |   1   |   0   |   1   |   0   |  32 MB        |
> > > > > Lower
> > > > > 1/2
> > > > > + *    1   |   1   |   0   |   1   |   1   |  64 MB        |
> > > > > ALL
> > > > > + *    1   |   1   |   1   |   0   |   0   |  64 MB        |
> > > > > ALL
> > > > > + *   ...
> > > > > + *
> > > > >   * Returns negative on errors, 0 on success.
> > > > >   */
> > > > >  static int stm_lock(struct spi_nor *nor, loff_t ofs,
> > > > > uint64_t
> > > > > len)
> > > > > @@ -1960,6 +2016,9 @@ static int stm_lock(struct spi_nor
> > > > > *nor,
> > > > > loff_t
> > > > > ofs, uint64_t len)
> > > > >  		min_prot_len = stm_get_min_prot_length(nor);
> > > > >  		pow = ilog2(lock_len) - ilog2(min_prot_len) +
> > > > > 1;
> > > > >  		val = pow << SR_BP_SHIFT;
> > > > > +
> > > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > > > +			val = (val & ~BIT(5)) | BIT(6);
> > > > 
> > > > .. and the use just the following here:
> > > > 
> > > > if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> > > > 	val = (val & ~SR_BP3) | SR_BP3_BIT6;
> > > > 
> > > > Ie. just use the "normal case" where all BP bits are next to
> > > > each
> > > > other
> > > > and then fixup the resulting value and shift the SR3 bit if
> > > > necessary.
> > > > This will be much easier to read.
> > > > 
> > > 
> > > Yes, I agree. It would be better to minimize this kind of
> > > conversion
> > > in
> > > one place.
> > > 
> > > > >  	}
> > > > > 
> > > > >  	if (val & ~mask)
> > > > > @@ -2042,6 +2101,9 @@ static int stm_unlock(struct spi_nor
> > > > > *nor,
> > > > > loff_t ofs, uint64_t len)
> > > > >  		pow = ilog2(lock_len) - ilog2(min_prot_len) +
> > > > > 1;
> > > > >  		val = pow << SR_BP_SHIFT;
> > > > > 
> > > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > > > +			val = (val & ~BIT(5)) | BIT(6);
> > > > > +
> > > > 
> > > > here would be the other way around:
> > > > 
> > > > if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
> > > > 	val = (val & ~SR_BP3_BIT6) | SR_BP3;
> > > > 
> > > > 
> > > > >  		/* Some power-of-two sizes are not supported */
> > > > >  		if (val & ~mask)
> > > > >  			return -EINVAL;
> > > > > @@ -5244,6 +5306,12 @@ int spi_nor_scan(struct spi_nor *nor,
> > > > > const
> > > > > char
> > > > > *name,
> > > > >  	if (info->flags & USE_CLSR)
> > > > >  		nor->flags |= SNOR_F_USE_CLSR;
> > > > > 
> > > > > +	if (info->flags & SPI_NOR_4BIT_BP) {
> > > > > +		nor->flags |= SNOR_F_HAS_4BIT_BP;
> > > > > +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> > > > > +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> > > > > +	}
> > > > > +
> > > > >  	if (info->flags & SPI_NOR_NO_ERASE)
> > > > >  		mtd->flags |= MTD_NO_ERASE;
> > > > > 
> > > > > diff --git a/include/linux/mtd/spi-nor.h
> > > > > b/include/linux/mtd/spi-
> > > > > nor.h
> > > > > index de90724f62f1..0190ed21576a 100644
> > > > > --- a/include/linux/mtd/spi-nor.h
> > > > > +++ b/include/linux/mtd/spi-nor.h
> > > > > @@ -129,7 +129,9 @@
> > > > >  #define SR_BP1			BIT(3)	/* Block
> > > > > protect
> > > > > 1
> > > > > */
> > > > >  #define SR_BP2			BIT(4)	/* Block
> > > > > protect
> > > > > 2
> > > > > */
> > > > >  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom
> > > > > protect */
> > > > > +#define SR_BP3_BIT5		BIT(5)	/* Block protect
> > > > > 3
> > > > > */
> > > > 
> > > > IMHO just SR_BP3. but that is a matter of taste. But it is
> > > > easier
> > > > on
> > > > the eye in the mask = SR_BP3 | SR_BP2 etc case.
> > > > 
> > > 
> > > SR_BP3 would be a more appropriate name if we could set the case
> > > with
> > > all BP bits next to each other as the "normal case."
> > > 
> > > I'm going to write patches based on latest spi-nor/next including
> > > what
> > > you mentioned.
> > > 
> > > Thanks,
> > > 
> > > > -michael
> > > > 
> > > > >  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom
> > > > > protect */
> > > > > +#define SR_BP3_BIT6		BIT(6)	/* Block protect
> > > > > 3
> > > > > */
> > > > >  #define SR_SRWD			BIT(7)	/* SR write
> > > > > protect
> > > > > */
> > > > >  /* Spansion/Cypress specific status bits */
> > > > >  #define SR_E_ERR		BIT(5)
> > > > > @@ -240,6 +242,8 @@ enum spi_nor_option_flags {
> > > > >  	SNOR_F_HAS_16BIT_SR	= BIT(9),
> > > > >  	SNOR_F_NO_READ_CR	= BIT(10),
> > > > >  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> > > > > +	SNOR_F_HAS_4BIT_BP	= BIT(12),
> > > > > +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
> > > > > 
> > > > >  };
> > > 
> > > 
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
