Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC699C33CB2
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 11:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F11224685
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 11:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ea3Dmp82";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Xz1bKcKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F11224685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnJMugOphWsSUWJYvA/bWxSS2R+2790v9gc1MOOrBJY=; b=Ea3Dmp821uXWPI
	rFBYhrq6ajKp6+DoxNyVSXC/cLUu9xk0D1DzdMgOVPOQdJtGp/U50KCC8/MQOHGaVdPWnxdiyST0c
	b74AhQn7elxCLoMqP+F1KkYcfs78cHDx4HT3ZUC6LJxWcP75ZMAkRvQ8xEIbEAP99ORfKBI+0s2GE
	45vyc+8r/IehNEUALatDXMASQ+Y+riia9BiX2M5JR49U71cpQjw4/quiH/mbmREc5rDbRQ7K+uii1
	1kFlp+Q4QoSlvg+Bse9II6G8FpZn4c/Hu/p3/7kfjRvoBQ5Aaa/uBhkmZeXlu0CyXzxlIUm05q3hk
	02J46MhsEkQQGvsTUhhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwOea-0007tS-RV; Tue, 28 Jan 2020 11:03:33 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwOco-0006B6-Kt
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 11:01:46 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200128110138epoutp01e25a766f7942dc5319e800256cfc1022~uB-wont6q0382703827epoutp01d
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2020 11:01:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200128110138epoutp01e25a766f7942dc5319e800256cfc1022~uB-wont6q0382703827epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1580209298;
 bh=6++DXk3n/pgl5K8dOQKmdkicvv7C6wiZQgYtWIB/Ovg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Xz1bKcKic9u78XPsEoMPd4wj1i1PTyTvKY7qLdBOXWv+KAJc0xbUL/1dbSTxA4E+L
 eoa6nxno+EFt/JTdJ+NwLn33HYjUKGP7M0yYn434aoH/n2/AXhnX+xtZelTzEmPNTB
 sICz29YdIV1v4TXSYw3RnWS/HNkEhAmTe3/nmsOo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200128110138epcas1p1ce6a5fa838040c766866ebab98bbeb14~uB-wcDfts2127421274epcas1p1X;
 Tue, 28 Jan 2020 11:01:38 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.162]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 486NwK5GkXzMqYkZ; Tue, 28 Jan
 2020 11:01:37 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 FE.D5.48498.194103E5; Tue, 28 Jan 2020 20:01:37 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200128110136epcas1p2221846e1d5a37b355d95a2920ff06c83~uB-uuSnuI0875708757epcas1p2L;
 Tue, 28 Jan 2020 11:01:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200128110136epsmtrp1c08a463090741259fb476d2f83622e30~uB-utnGaV3013330133epsmtrp1M;
 Tue, 28 Jan 2020 11:01:36 +0000 (GMT)
X-AuditID: b6c32a36-a3dff7000001bd72-43-5e301491d57f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 76.5A.10238.094103E5; Tue, 28 Jan 2020 20:01:36 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200128110136epsmtip2fab780aa0ef6c31f1e14c2f63af33eeb~uB-uhd1nv0635806358epsmtip23;
 Tue, 28 Jan 2020 11:01:36 +0000 (GMT)
Message-ID: <4fd7374e9362895b5c80d7bfe8a05c6552572243.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>
Date: Tue, 28 Jan 2020 20:01:36 +0900
In-Reply-To: <0882ce3e8cf9de25681b475f10154cef@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju29nlKC1OR6sX/7SOBSnNzlzTU2hoiYzcD0n8kYJ20pOTdmtn
 WvbHKLNapY0gaipZWlIhmROdRaTTkm6SCWaQeSvJcFZ2wbJR287E/j3f+zzP97zv+304RlZL
 o/Bik42zmlgDJQ0Xt/fEKJWOSDqPbqvcyPhqZ0XM/WM3ZIz3WYuM+dqYwvx98UWWItF2Okdk
 Wldjufbt/HWk7RvuEGm7HlRIMyU5hiQ9xxZyVgVnKjAXFpuKkqmMrPyd+ZoEWqVUbWUSKYWJ
 NXLJVJouU5lebPBnU4pS1lDiL2WyPE9t3p5kNZfYOIXezNuSKc5SaLCoaEsczxr5ElNRXIHZ
 uE1F0/Eav3KvQT8+SlqmPeiwY6hGehR9OI7sKAwHYgssnP8staNwnCTcCHof9kgDBEnMIai7
 KxeInwj6f/WKFx09Xx6LBeIBgsbeAZlwmEHQ4uoO2uWEFq50XBIFcASRATVV3mBdSsTC8EKr
 JIAjifUw+e1lsA+M4GCwwhXEYmID1D8ZCuIwgoHuV98xIXkTeJ9W+ZNx//0rweeOEKxrocNb
 iwV6AKJLCv3j7pA+DS7PtYe6joBPfW0yAUfBdHVlCPPQedMhE8wVCCaaGkOEGma9zVggDCNi
 4M69zUJ5HXQu1IV6XgGzP85KAhIg5HCqkhQkFMyMVYRiAV5OnpMIWAuuqYuYsCsHBvaTF8Tn
 kcK5NI7zv3GcS8H1CLuFVnMW3ljE8SpL/P8v3IqCnzE2wY2u9es8iMARtVwOg3F5pIQt5cuM
 HgQ4RkXKT4voPFJeyJYd4azmfGuJgeM9SONftgOLWlVg9n9tky1fpYlXq9XMloTEBI2aWiMf
 3xOTRxJFrI07wHEWzrroE+FhUUdR9BFD9Puc/elGyVR5tDOx5vfe2+bDHfXfxy483z7pK3UP
 TGSrSu2JurYRPCn19T6fI+fNyNXmJt3H1IE9b/t0oztfZVx0NujdVT6X/Za1bv5Qcm71roaW
 33+0uU2ibPFB47J1WWdHmf3vSDouetUOuP+4uCZtN33mRO8jpefjGE6JeT2risWsPPsPYgTA
 86IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSvO4EEYM4g46PmhZ/57xjstjdtIzd
 4u3pDewWH5c4WPw/+4HdgdVj56y77B6bl9R73PmxlNHj+I3tTB4H9rawBbBGcdmkpOZklqUW
 6dslcGU8vC9U8PIQY8XEa7PZGhifNjN2MXJySAiYSBz+cIyli5GLQ0hgN6PEgs9/WSASEhKP
 dn4BsjmAbGGJw4eLIWpeMUqcubaOCaSGV8BDYv72GWC2sIC3xOy+t2wgNpuAlsSN35tYQWwR
 ARWJx58vgC1jFkiTWN+3lR3EZhFQlVhw8hpYnFPAQuLgpS/MEAumM0u8WbKAGaJBU6J1+292
 iIN0JN6e6gM7iFdAUOLvDmGIEnmJ7W/nME9gFJyFpGMWQtUsJFULGJlXMUqmFhTnpucWGxYY
 5qWW6xUn5haX5qXrJefnbmIEh7uW5g7Gy0viDzEKcDAq8fBKXNaLE2JNLCuuzD3EKMHBrCTC
 28lkECfEm5JYWZValB9fVJqTWnyIUZqDRUmc92nesUghgfTEktTs1NSC1CKYLBMHp1QDo1Dd
 phVMPLF5HNf4zAR2srBUb7hQ4Ne9fHfuA877nyL3Tv+rGWi858eUi647DnS8OL9fkKHkyknt
 wws5nObd+/vl4pQ+rXC+6zOO3nmRbmpx65mljF7i6/J7joH23uUM1Q1CO5+LZCYs1lu2KZmV
 UdlSUrp+nqHVTUNbh+23zl6btvLfNvn1/kosxRmJhlrMRcWJAKWHPm9zAgAA
X-CMS-MailID: 20200128110136epcas1p2221846e1d5a37b355d95a2920ff06c83
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <CGME20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef@epcas1p2.samsung.com>
 <20200122193608.3859-1-michael@walle.cc>
 <0c4e70fcf58c93f9b7375d83b50028df225aed82.camel@samsung.com>
 <f4581c4cb231cc4c61b9a146dda5fada@walle.cc>
 <7843bb76c9c3854a4b9fa4b2b69d760e965bbb22.camel@samsung.com>
 <0882ce3e8cf9de25681b475f10154cef@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_030143_149063_716169A2 
X-CRM114-Status: GOOD (  33.10  )
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
Cc: tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael

2020-01-23 (Thu), 10:31 +0100, Michael Walle:
> Am 2020-01-23 09:53, schrieb Jungseung Lee:
> > Hi, Michael
> > 
> > 2020-01-23 (Thu), 09:10 +0100, Michael Walle:
> > > Hi Jungseung,
> > > 
> > > Am 2020-01-23 07:22, schrieb Jungseung Lee:
> > > > Hi, Michael
> > > > 
> > > > 2020-01-22 (Wed), 20:36 +0100, Michael Walle:
> > > > > Hi,
> > > > > 
> > > > > > Currently, we are supporting block protection only for
> > > > > > flash chips with 3 block protection bits in the SR
> > > > > > register.
> > > > > > This patch enables block protection support for some flash
> > > > > > with
> > > > > > 4 block protection bits(bp0-3).
> > > > > > 
> > > > > > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > > > > > ---
> > > > > > v3 :
> > > > > >   Fix wrong ofs calculation on v2 patch
> > > > > > v2 :
> > > > > >   Add sample table portion about 4bit block protection on
> > > > > > the
> > > > > > comment
> > > > > >   Trivial coding style change
> > > > > > 
> > > > > >  drivers/mtd/spi-nor/spi-nor.c | 127
> > > > > > +++++++++++++++++++++++++++++-
> > > > > > ----
> > > > > >  include/linux/mtd/spi-nor.h   |   8 +++
> > > > > >  2 files changed, 119 insertions(+), 16 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > > > > > b/drivers/mtd/spi-
> > > > > > nor/spi-nor.c
> > > > > > index e3da6a8654a8..7e8af6c4fdfa 100644
> > > > > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > > > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > > > > @@ -238,6 +238,14 @@ struct flash_info {
> > > > > >  					 * status register.
> > > > > > Must be
> > > > > > used with
> > > > > >  					 * SPI_NOR_HAS_TB.
> > > > > >  					 */
> > > > > > +#define SPI_NOR_HAS_BP3		BIT(17)	/*
> > > > > > +					 * Flash SR has 4 bit
> > > > > > fields
> > > > > > (BP0-3)
> > > > > > +					 * for block
> > > > > > protection.
> > > > > > +					 */
> > > > > > +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> > > > > > +					 * BP3 is bit 6 of
> > > > > > status
> > > > > > register.
> > > > > > +					 * Must be used with
> > > > > > SPI_NOR_HAS_BP3.
> > > > > > +					 */
> > > > > > 
> > > > > >  	/* Part specific fixup hooks. */
> > > > > >  	const struct spi_nor_fixups *fixups;
> > > > > > @@ -1767,23 +1775,47 @@ static void
> > > > > > stm_get_locked_range(struct
> > > > > > spi_nor *nor, u8 sr, loff_t *ofs,
> > > > > >  	struct mtd_info *mtd = &nor->mtd;
> > > > > >  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > > > >  	u8 tb_mask = SR_TB_BIT5;
> > > > > > -	int pow;
> > > > > > +	u8 bp;
> > > > > > +	int pow = 0;
> > > > > > 
> > > > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> > > > > >  		tb_mask = SR_TB_BIT6;
> > > > > > 
> > > > > > -	if (!(sr & mask)) {
> > > > > > -		/* No protection */
> > > > > > -		*ofs = 0;
> > > > > > -		*len = 0;
> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > > > +		u8 tmp;
> > > > > > +
> > > > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > > > > +			tmp = sr & (mask | SR_BP3_BIT6);
> > > > > > +		else
> > > > > > +			tmp = sr & (mask | SR_BP3_BIT5);
> > > > > > +
> > > > > > +		if (tmp & SR_BP3_BIT6)
> > > > > > +			tmp = (tmp & ~BIT(6)) | BIT(5);
> > > > > > +
> > > > > > +		bp = tmp >> SR_BP_SHIFT;
> > > > > > +		if (!bp) {
> > > > > > +			*ofs = 0;
> > > > > > +			*len = 0;
> > > > > > +			return;
> > > > > > +		}
> > > > > > +		if (bp <= ilog2(nor->n_sectors))
> > > > > > +			pow = ilog2(nor->n_sectors) + 1 - bp;
> > > > > >  	} else {
> > > > > > -		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
> > > > > > -		*len = mtd->size >> pow;
> > > > > > -		if (nor->flags & SNOR_F_HAS_SR_TB && sr &
> > > > > > tb_mask)
> > > > > > +		bp = (sr & mask) >> SR_BP_SHIFT;
> > > > > > +		if (!bp) {
> > > > > >  			*ofs = 0;
> > > > > > -		else
> > > > > > -			*ofs = mtd->size - *len;
> > > > > > +			*len = 0;
> > > > > > +			return;
> > > > > > +		}
> > > > > > +		pow = bp ^ (mask >> SR_BP_SHIFT);
> > > > > >  	}
> > > > > > +
> > > > > > +	*len = mtd->size >> pow;
> > > > > > +
> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> > > > > > +		*ofs = 0;
> > > > > > +	else
> > > > > > +		*ofs = mtd->size - *len;
> > > > > >  }
> > > > > > 
> > > > > >  /*
> > > > > > @@ -1823,7 +1855,7 @@ static int stm_is_unlocked_sr(struct
> > > > > > spi_nor
> > > > > > *nor, loff_t ofs, uint64_t len,
> > > > > > 
> > > > > >  /*
> > > > > >   * Lock a region of the flash. Compatible with ST Micro
> > > > > > and
> > > > > > similar flash.
> > > > > > - * Supports the block protection bits BP{0,1,2} in the
> > > > > > status
> > > > > > register
> > > > > > + * Supports the block protection bits BP{0,1,2,3} in the
> > > > > > status
> > > > > > register
> > > > > >   * (SR). Does not support these features found in newer SR
> > > > > > bitfields:
> > > > > >   *   - SEC: sector/block protect - only handle SEC=0
> > > > > > (block
> > > > > > protect)
> > > > > >   *   - CMP: complement protect - only support CMP=0 (range
> > > > > > is
> > > > > > not
> > > > > > complemented)
> > > > > > @@ -1831,7 +1863,7 @@ static int stm_is_unlocked_sr(struct
> > > > > > spi_nor
> > > > > > *nor, loff_t ofs, uint64_t len,
> > > > > >   * Support for the following is provided conditionally for
> > > > > > some
> > > > > > flash:
> > > > > >   *   - TB: top/bottom protect
> > > > > >   *
> > > > > > - * Sample table portion for 8MB flash (Winbond w25q64fw):
> > > > > > + * Sample table portion for 8MB flash (Winbond w25q64fw /
> > > > > > BP0-
> > > > > > 2):
> > > > > >   *
> > > > > >   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot
> > > > > > Length  |
> > > > > > Protected Portion
> > > > > >   *  ----------------------------------------------------
> > > > > > ----
> > > > > > ----
> > > > > > --------------
> > > > > > @@ -1851,6 +1883,32 @@ static int stm_is_unlocked_sr(struct
> > > > > > spi_nor
> > > > > > *nor, loff_t ofs, uint64_t len,
> > > > > >   *    0   |   1   |   1   |   0   |   1   |  2
> > > > > > MB         |
> > > > > > Lower
> > > > > > 1/4
> > > > > >   *    0   |   1   |   1   |   1   |   0   |  4
> > > > > > MB         |
> > > > > > Lower
> > > > > > 1/2
> > > > > >   *
> > > > > > + * Sample table portion for 64MB flash (Micron n25q512ax3
> > > > > > /
> > > > > > BP0-
> > > > > > 3):
> > > > > > + *
> > > > > > + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot
> > > > > > Length  |
> > > > > > Protected Portion
> > > > > > + *  ----------------------------------------------------
> > > > > > ----
> > > > > > ----
> > > > > > --------------
> > > > > > +
> > > > > > *    0   |   0   |   0   |   0   |   0   |  NONE         |
> > > > > > NONE
> > > > > > + *    0   |   0   |   0   |   0   |   1   |   64
> > > > > > KB       |
> > > > > > Upper
> > > > > > 1/1024
> > > > > > + *    0   |   0   |   0   |   1   |   0   |  128
> > > > > > KB       |
> > > > > > Upper
> > > > > > 1/512
> > > > > > + *    0   |   0   |   0   |   1   |   1   |  256
> > > > > > KB       |
> > > > > > Upper
> > > > > > 1/256
> > > > > > + *   ...
> > > > > > + *    0   |   1   |   0   |   0   |   1   |  16
> > > > > > MB        |
> > > > > > Upper
> > > > > > 1/4
> > > > > > + *    0   |   1   |   0   |   1   |   0   |  32
> > > > > > MB        |
> > > > > > Upper
> > > > > > 1/2
> > > > > > + *    0   |   1   |   0   |   1   |   1   |  64
> > > > > > MB        |
> > > > > > ALL
> > > > > > + *    0   |   1   |   1   |   0   |   0   |  64
> > > > > > MB        |
> > > > > > ALL
> > > > > > + *   ...
> > > > > > + *  ------|-------|-------|-------|-------|---------------
> > > > > > |---
> > > > > > ----
> > > > > > ------------
> > > > > > +
> > > > > > *    1   |   0   |   0   |   0   |   0   |   NONE        |
> > > > > > NONE
> > > > > > + *    1   |   0   |   0   |   0   |   1   |   64
> > > > > > KB       |
> > > > > > Lower
> > > > > > 1/1024
> > > > > > + *    1   |   0   |   0   |   1   |   0   |  128
> > > > > > KB       |
> > > > > > Lower
> > > > > > 1/512
> > > > > > + *    1   |   0   |   0   |   1   |   1   |  256
> > > > > > KB       |
> > > > > > Lower
> > > > > > 1/256
> > > > > > + *   ...
> > > > > > + *    1   |   1   |   0   |   0   |   1   |  16
> > > > > > MB        |
> > > > > > Lower
> > > > > > 1/4
> > > > > > + *    1   |   1   |   0   |   1   |   0   |  32
> > > > > > MB        |
> > > > > > Lower
> > > > > > 1/2
> > > > > > + *    1   |   1   |   0   |   1   |   1   |  64
> > > > > > MB        |
> > > > > > ALL
> > > > > > + *    1   |   1   |   1   |   0   |   0   |  64
> > > > > > MB        |
> > > > > > ALL
> > > > > > + *   ...
> > > > > > + *
> > > > > >   * Returns negative on errors, 0 on success.
> > > > > >   */
> > > > > >  static int stm_lock(struct spi_nor *nor, loff_t ofs,
> > > > > > uint64_t
> > > > > > len)
> > > > > > @@ -1898,6 +1956,12 @@ static int stm_lock(struct spi_nor
> > > > > > *nor,
> > > > > > loff_t ofs, uint64_t len)
> > > > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> > > > > >  		tb_mask = SR_TB_BIT6;
> > > > > > 
> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > > > > +			mask = mask | SR_BP3_BIT6;
> > > > > > +		else
> > > > > > +			mask = mask | SR_BP3_BIT5;
> > > > > > +	}
> > > > > >  	/*
> > > > > >  	 * Need smallest pow such that:
> > > > > >  	 *
> > > > > > @@ -1908,7 +1972,17 @@ static int stm_lock(struct spi_nor
> > > > > > *nor,
> > > > > > loff_t ofs, uint64_t len)
> > > > > >  	 *   pow = ceil(log2(size / len)) = log2(size) -
> > > > > > floor(log2(len))
> > > > > >  	 */
> > > > > >  	pow = ilog2(mtd->size) - ilog2(lock_len);
> > > > > > -	val = mask - (pow << SR_BP_SHIFT);
> > > > > > +
> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > > > +		val = ilog2(nor->n_sectors) + 1 - pow;
> > > > > 
> > > > > Why do you use a new calculation here? As far as I can see,
> > > > > the
> > > > > method is
> > > > > the same except that is has one bit more. That also raises
> > > > > the
> > > > > question why
> > > > > n_sectors is now needed?
> > > > > 
> > > > > Can't we just initialize the mask with
> > > > > 
> > > > > mask = SR_BP2 | SR_BP1 | SR_BP0;
> > > > > if (nor->flags & SNOR_F_HAS_SR_BP3)
> > > > >     mask |= SR_BP3_BIT5;
> > > > > 
> > > > > do the calculation and checks and then move the SR_BP3_BIT5
> > > > > to
> > > > > SR_BP3_BIT6
> > > > > if SNOR_F_HAS_SR_BP3_BIT6 is set.
> > > > > 
> > > > 
> > > > For most of flashes that supporting BP0-2, the smallest
> > > > protected
> > > > portion is fixed as 1/64
> > > > and it can be properly handled by existing
> > > > calculation. (Actually it's not fully generic, see flashes like
> > > > w25q40bw or m25p80. Of course, it doesn't have SPI_NOR_HAS_LOCK
> > > > flag
> > > > even though it has BP0-2 bit in SR)
> > > 
> > > No. The rules are always the same wether there are three or four
> > > BP
> > > bits (the example in stm_lock() has not enough information on
> > > this):
> > > 
> > > (1) the first setting (besides 0) protects one sector. The second
> > >      protects 2, the third 4 and so on. eg 2^N
> > > (2) the last setting is _always_ protect all, just like the '0'
> > > setting
> > >      is always protect none.
> > > (3) if there is an overflow because there are no more free slots
> > > for
> > >      further settings (for 3 bits with flashes > 32MBit, for 4
> > >      bits if should be flashes > 16GBit), the first entry will be
> > >      discarded (eg the very first is the "just one sector"
> > > entry).
> > > 
> > > This is true for all flashes which uses this kind of setting,
> > > have a
> > > look at the m25p80 or w25q40bw, these are no exception. It is
> > > just
> > > the
> > > notation "lower 1/64" which is only true for flashes which either
> > > overflows in (3) or fill all entries (eg. with 3bits that would
> > > be
> > > the
> > > 32Mbit version).
> > > 
> > 
> > Looks like you noticed that we need new calculation method that
> > would
> > be based on n_sectors :).
> 
> No it will work without that (if I'm not mistaken). Give me some time
> and I'll post a patch.

No, it must be based on n_sectors. To make 4bit block protection more
generic, the lock sector size must NOT fixed as 64KB (as can be checked
from your patch). See "mt35xu02g" and check the protected area and
number of sectors from it's datasheet.

The rule you mentioned "the first setting (besides 0) protects one
sector" is alawys true for *4bit* block protection. That's why I choose
n_sectors for new calculation.

> 
> > Rule (1) is NOT true for some flashes
> > supporting BP0-2 and that's why I said that smallest protected
> > portion
> > is fixed as '1/64' for these flashes.
> 
> No, you have to apply rule (3). (1) is only the starting point. It
> is 
> kind
> of a sliding window.
> 
> > See this one.
> > 
> > W25Q20EW	256KB	1/4 ... = 64KB		BP2
> > W25Q128JV	16MB	1/64 ... = 256KB	BP2 <--
> > S25FL132K	4MB	1/64 ... = 64KB		BP2 <--
> > S25FL164K	8MB
> > 1/64 ... = 128KB	BP2 <--
> 
> All these flashes need (3) to be applied, thus (1) doesn't apply
> anymore.
> 
> Let me give you an example for the 64MBit case, the settings would
> be:
> 
> 0 sectors (corresponds to protect none)
> 1 sector
> 2 sectors
> 4 sectors
> 8 sectors
> 16 sectors
> 32 sectors
> 64 sectors
> 128 sectors (corresponds to protect all)
> 
> Unfortunately, we have only 8 slots (because 3 BP bits), therefore
> we 
> have
> to discard some setting. According to rule (2) 0 is always "protect 
> none"
> and 7 is always "protect all". Thus we have 6 settings left.
> According 
> to
> rule (3) we discard the first ones. In this case, this is the "1
> sector"
> setting. Thus we end up with the following possible settings:
> 
> 0 sectors (corresponds to protect none)
> 2 sectors
> 4 sectors
> 8 sectors
> 16 sectors
> 32 sectors
> 64 sectors
> 128 sectors (corresponds to protect all)
> 
> If you have a 128Mbit flash, the next setting that would be discarded
> is
> "2 sectors". Thus it would start with:
> 
> 0 sectors (corresponds to protect none)
> 4 sectors
> [..]
> 256 sectors (corresponds to protect all)
> 
> 
> Another example W25Q20EW, following possible settings:
> 
> 0 sectors (corresponds to protect none)
> 1 sector
> 2 sectors
> 4 sectors (corresponds to protect all)
> 
> We now have less settings then our 8 possible slots. So this is where
> rule (1) applies, because according to that the "1 sector" setting is
> the first possible setting besides 0.
> 
> And this also applies to the 4 bit protection bits.
> 
> 
> 
> > W25Q256JV	32MB	1/512 ... =
> > 64KB	BP3
> > S25FL128L	16MB	1/256 ... = 64KB	BP3
> > S25FL256L	32MB	1/512 ... = 64KB	BP3
> > 
> > In current BP implementation, block protection is just working for
> > some
> > flashes that has smallest protected portion as '1/64'.
> 
> No its currently working for all except flashes smaller than 32Mbit.

No. Not working for flashes supporting 4bit block protection.

> Applied to the 4 bits, this would mean "it works for all except
> flashes
> smaller than 8Gbit" which are practially all. As I said, this is a
> bug
> and once this bug is fixed, there should be no difference between 3
> and 4 bits.
> 
> -michael
> 

The exact fact is that locks operate in two different ways according to
flash model.

(1) the smallest protected portion is fixed.
	for BP0-2 : 1/64
	for BP0-1 : 1/4
(2) the smallest protected portion is inversely propotional with number
of sectors.

For the flashes supporting 3bit block protection, (1) and (2) are mixed
and used. But all the flashes supporting 4bit block protection listed
on spi-nor.c, only (2) is used.

Each method requires each formula. I have no idea how to handle it with
one formula (probably adding number of exceptional handling?) without
any sectional flag. "w25q128jv(bp0-2)" is following (1) and
"n25q128a(bp0-3)" is following (2).

> > 
> > We need new fomula based on n_sectors for BP3 at least.
> 
> No they are the same, but yes there is a bug in the current
> implementation.
> 
> -michael
> 
> > 
> > > So for the 3 bit case the following flashes are border cases:
> > >   - 16mbit (less settings than slots)
> > >   - 32mbit (number of settings and free slots match)
> > >   - 64mbit (more settings than slots, first setting is discarded)
> > > 
> > > That being said, I suspect all the 16mbit flashes (and below)
> > > which
> > > have
> > > the _LOCK bit set are broken, because the entries has to be
> > > shifted.
> > > I'll
> > > look into that later. This is the same "issue" you have with the
> > > 4
> > > bits.
> > > So if this is fixed, you should not need another formula for the
> > > 4
> > > bit
> > > case.
> > > 
> > > > We need new calculation method for 4bit block protection and
> > > > for
> > > > making
> > > > it more generic, I choose n_sectors.
> > > > 
> > > > On all the flashes I checked, n_sectors is proper value for
> > > > getting
> > > > block protected portion.
> > > > 
> > > > 		density	portion	n_sectors
> > > > W25M512JV	64MB	1/512	512
> > > > N25Q128A	16MB	1/256	256
> > > > N25Q512A	64MB	1/1024	1024
> > > > MT25QL02GCBB	256MB	1/4096	4096
> > > 
> > > The rules above apply to these flashes, too. Could you double
> > > check
> > > that?
> > > 
> > > -michael
> > > 
> > > > 
> > > > > > +		val = val << SR_BP_SHIFT;
> > > > > > +
> > > > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > > > > +			val = (val & ~BIT(5)) | BIT(6);
> > > > > > +	} else {
> > > > > > +		val = mask - (pow << SR_BP_SHIFT);
> > > > > > +	}
> > > > > > +
> > > > > >  	if (val & ~mask)
> > > > > >  		return -EINVAL;
> > > > > >  	/* Don't "lock" with no region! */
> > > > > > @@ -1983,6 +2057,13 @@ static int stm_unlock(struct spi_nor
> > > > > > *nor,
> > > > > > loff_t ofs, uint64_t len)
> > > > > > 
> > > > > >  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> > > > > >  		tb_mask = SR_TB_BIT6;
> > > > > > +
> > > > > > +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > > > +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> > > > > > +			mask = mask | SR_BP3_BIT6;
> > > > > > +		else
> > > > > > +			mask = mask | SR_BP3_BIT5;
> > > > > > +	}
> > > > > >  	/*
> > > > > >  	 * Need largest pow such that:
> > > > > >  	 *
> > > > > > @@ -1995,13 +2076,20 @@ static int stm_unlock(struct
> > > > > > spi_nor
> > > > > > *nor,
> > > > > > loff_t ofs, uint64_t len)
> > > > > >  	pow = ilog2(mtd->size) - order_base_2(lock_len);
> > > > > >  	if (lock_len == 0) {
> > > > > >  		val = 0; /* fully unlocked */
> > > > > > +	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
> > > > > > +		val = ilog2(nor->n_sectors) + 1 - pow;
> > > > > > +		val = val << SR_BP_SHIFT;
> > > > > > +
> > > > > > +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> > > > > > +			val = (val & ~BIT(5)) | BIT(6);
> > > > > >  	} else {
> > > > > >  		val = mask - (pow << SR_BP_SHIFT);
> > > > > > -		/* Some power-of-two sizes are not supported */
> > > > > > -		if (val & ~mask)
> > > > > > -			return -EINVAL;
> > > > > >  	}
> > > > > > 
> > > > > > +	/* Some power-of-two sizes are not supported */
> > > > > > +	if (val & ~mask)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > >  	status_new = (status_old & ~mask & ~tb_mask) | val;
> > > > > > 
> > > > > >  	/* Don't protect status register if we're fully
> > > > > > unlocked */
> > > > > > @@ -4736,6 +4824,7 @@ static void
> > > > > > spi_nor_info_init_params(struct
> > > > > > spi_nor *nor)
> > > > > >  	/* Set SPI NOR sizes. */
> > > > > >  	params->size = (u64)info->sector_size * info-
> > > > > > > n_sectors;
> > > > > > 
> > > > > >  	params->page_size = info->page_size;
> > > > > > +	params->n_sectors = info->n_sectors;
> > > > > > 
> > > > > >  	if (!(info->flags & SPI_NOR_NO_FR)) {
> > > > > >  		/* Default to Fast Read for DT and non-DT
> > > > > > platform
> > > > > > devices. */
> > > > > > @@ -5192,6 +5281,11 @@ int spi_nor_scan(struct spi_nor
> > > > > > *nor,
> > > > > > const
> > > > > > char *name,
> > > > > >  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> > > > > >  	if (info->flags & USE_CLSR)
> > > > > >  		nor->flags |= SNOR_F_USE_CLSR;
> > > > > > +	if (info->flags & SPI_NOR_HAS_BP3) {
> > > > > > +		nor->flags |= SNOR_F_HAS_SR_BP3;
> > > > > > +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> > > > > > +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> > > > > > +	}
> > > > > > 
> > > > > >  	if (info->flags & SPI_NOR_NO_ERASE)
> > > > > >  		mtd->flags |= MTD_NO_ERASE;
> > > > > > @@ -5199,6 +5293,7 @@ int spi_nor_scan(struct spi_nor *nor,
> > > > > > const
> > > > > > char *name,
> > > > > >  	mtd->dev.parent = dev;
> > > > > >  	nor->page_size = params->page_size;
> > > > > >  	mtd->writebufsize = nor->page_size;
> > > > > > +	nor->n_sectors = params->n_sectors;
> > > > > > 
> > > > > >  	if (of_property_read_bool(np, "broken-flash-reset"))
> > > > > >  		nor->flags |= SNOR_F_BROKEN_RESET;
> > > > > > diff --git a/include/linux/mtd/spi-nor.h
> > > > > > b/include/linux/mtd/spi-
> > > > > > nor.h
> > > > > > index 541c06d042e8..92d550501daf 100644
> > > > > > --- a/include/linux/mtd/spi-nor.h
> > > > > > +++ b/include/linux/mtd/spi-nor.h
> > > > > > @@ -129,7 +129,9 @@
> > > > > >  #define SR_BP1			BIT(3)	/* Block
> > > > > > protect 1
> > > > > > */
> > > > > >  #define SR_BP2			BIT(4)	/* Block
> > > > > > protect 2
> > > > > > */
> > > > > >  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom
> > > > > > protect
> > > > > > */
> > > > > > +#define SR_BP3_BIT5		BIT(5)	/* Block
> > > > > > protect 3
> > > > > > */
> > > > > 
> > > > > maybe just name it SR_BP3? would also be more consistent with
> > > > > the
> > > > > proposal
> > > > > above.
> > > > > 
> > > > > >  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom
> > > > > > protect
> > > > > > */
> > > > > > +#define SR_BP3_BIT6		BIT(6)	/* Block
> > > > > > protect 3
> > > > > > */
> > > > > >  #define SR_SRWD			BIT(7)	/* SR write
> > > > > > protect
> > > > > > */
> > > > > >  /* Spansion/Cypress specific status bits */
> > > > > >  #define SR_E_ERR		BIT(5)
> > > > > > @@ -248,6 +250,8 @@ enum spi_nor_option_flags {
> > > > > >  	SNOR_F_HAS_16BIT_SR	= BIT(9),
> > > > > >  	SNOR_F_NO_READ_CR	= BIT(10),
> > > > > >  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> > > > > > +	SNOR_F_HAS_SR_BP3	= BIT(12),
> > > > > > +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
> > > > > > 
> > > > > >  };
> > > > > > 
> > > > > > @@ -519,6 +523,7 @@ struct spi_nor_locking_ops {
> > > > > >   *
> > > > > >   * @size:		the flash memory density in bytes.
> > > > > >   * @page_size:		the page size of the SPI NOR
> > > > > > flash
> > > > > > memory.
> > > > > > + * @n_sectors:		number of sectors
> > > > > >   * @hwcaps:		describes the read and page
> > > > > > program
> > > > > > hardware
> > > > > >   *			capabilities.
> > > > > >   * @reads:		read capabilities ordered by priority:
> > > > > > the
> > > > > > higher index
> > > > > > @@ -541,6 +546,7 @@ struct spi_nor_locking_ops {
> > > > > >  struct spi_nor_flash_parameter {
> > > > > >  	u64				size;
> > > > > >  	u32				page_size;
> > > > > > +	u16				n_sectors;
> > > > > > 
> > > > > >  	struct spi_nor_hwcaps		hwcaps;
> > > > > >  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX
> > > > > > ];
> > > > > > @@ -573,6 +579,7 @@ struct flash_info;
> > > > > >   * @bouncebuf_size:	size of the bounce buffer
> > > > > >   * @info:		spi-nor part JDEC MFR id and other info
> > > > > >   * @page_size:		the page size of the SPI NOR
> > > > > > + * @n_sector:		number of sectors
> > > > > >   * @addr_width:		number of address bytes
> > > > > >   * @erase_opcode:	the opcode for erasing a sector
> > > > > >   * @read_opcode:	the read opcode
> > > > > > @@ -599,6 +606,7 @@ struct spi_nor {
> > > > > >  	size_t			bouncebuf_size;
> > > > > >  	const struct flash_info	*info;
> > > > > >  	u32			page_size;
> > > > > > +	u16			n_sectors;
> > > > > >  	u8			addr_width;
> > > > > >  	u8			erase_opcode;
> > > > > >  	u8			read_opcode;
> > > > > > --
> > > > > > 2.17.1
> > > > > > 
> > > > > > 
> > > > > > ______________________________________________________
> > > > > > Linux MTD discussion mailing list
> > > > > > 
> > > > 
> > > > 
> > 
> > 
https://protect2.fireeye.com/url?k=06b6dd5d-5b7d5a63-06b75612-0cc47a31309a-83164929001f7741&u=http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > > > > > 
> > > > > 
> > > > > 
> > > 
> > > 
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
