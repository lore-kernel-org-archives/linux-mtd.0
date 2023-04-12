Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42CEC77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PiombK9PGCzj5IWtH9bPSrEP1goQX5TWNjle5+ZbMIQ=; b=YcWk+6Ipq3iSdI
	EqBd9hJqHP04HrtWWqJSN7J1ThgQlETHUJ2A9rsPiOAg4JaTzNO6dsOH8JKJ+u153wmYI24ZRkJMC
	0xfpK9Z+yMRM1Xrcdm6+rgdq5Ed2MgpS9etW0+09fPF/DWbKwETwzyEPn69NHISEdIeJOkt1BOsyM
	7VB8ZNGwXQBP7YL1cdPfxa0rWEGLoMhoI1VqPDGDAsyo+rrOUykUKeVnd9LmPtBh0TcKLDSZMioKb
	f/F93NJgSKbti5p64/6eT2yzTCmdEQPT4l0GPmImOXyBQQQOJ+nqFXueR1gpQrVVXTTk6hSWaXH1l
	FbHUeIk+NoeBPhXxIW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmfww-0049Av-0i;
	Wed, 12 Apr 2023 19:16:10 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmfwn-004994-0Y;
	Wed, 12 Apr 2023 19:16:06 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 00FC85FD5F;
	Wed, 12 Apr 2023 22:15:56 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681326956;
	bh=wtIEom52Yj/1Ygk28yDTJOojNFXqb88feXNZw288y6M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=UR1wrNcSTLIuqzA2F/CioB6H6QGx6971gZmeAuA3L4HeqmPg6xCQcHBDUCkgt6QN+
	 AKS2NgUfzUoEsd5lDXnSACQmvMUwaHZ/DDGT3cIZ3w0H8dVsLmRwHdYYHdrv0+DkZk
	 MzvwQDsClfWsDe/fR50h2z4PkSrQdvpIXhhDeGyjT8lxqwTtM+oadH4zDQvGoWas8s
	 CUsj79G2RaTKNoqCOrkEk5Vllvq8XlooceF6nh1J0peIbthNN/0Kb5YGOG3NtrW26d
	 NJWGop76smDhwy2jakSvEbdfaoRiN6rBnkdkbrjlmM+toeYEo7A9drdrIG7njiFPSe
	 g71GKqKtI2vbA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 22:15:54 +0300 (MSK)
Date: Wed, 12 Apr 2023 22:15:48 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Arseniy Krasnov
	<avkrasnov@sberdevices.ru>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Message-ID: <20230412191548.ov5fufxkwqvdgrz2@CAB-WSD-L081021>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 16:14:00 #21093740
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_121601_907271_DD9B12EF 
X-CRM114-Status: GOOD (  48.24  )
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

On Wed, Apr 12, 2023 at 10:04:28PM +0800, Liang Yang wrote:
> Hi Miquel and Arseniy,
> 
> On 2023/4/12 20:57, Miquel Raynal wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > Hi Arseniy,
> > 
> > avkrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 15:22:26 +0300:
> > 
> > > On 12.04.2023 15:18, Miquel Raynal wrote:
> > > > Hi Arseniy,
> > > > 
> > > > avkrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 13:14:52 +0300:
> > > > > On 12.04.2023 12:36, Miquel Raynal wrote:
> > > > > > Hi Arseniy,
> > > > > > 
> > > > > > avkrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 12:20:55 +0300:
> > > > > > > On 12.04.2023 10:44, Miquel Raynal wrote:
> > > > > > > > Hi Arseniy,
> > > > > > > > 
> > > > > > > > AVKrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 09:16:58 +0300:
> > > > > > > > > This NAND reads only few user's bytes in ECC mode (not full OOB), so
> > > > > > > > 
> > > > > > > > "This NAND reads" does not look right, do you mean "Subpage reads do
> > > > > > > > not retrieve all the OOB bytes,"?
> > > > > > > > > fill OOB buffer with zeroes to not return garbage from previous reads
> > > > > > > > > to user.
> > > > > > > > > Otherwise 'nanddump' utility prints something like this for just erased
> > > > > > > > > page:
> > > > > > > > > 
> > > > > > > > > ...
> > > > > > > > > 0x000007f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > > > > > > > >    OOB Data: ff ff ff ff 00 00 ff ff 80 cf 22 99 cb ad d3 be
> > > > > > > > >    OOB Data: 63 27 ae 06 16 0a 2f eb bb dd 46 74 41 8e 88 6e
> > > > > > > > >    OOB Data: 38 a1 2d e6 77 d4 05 06 f2 a5 7e 25 eb 34 7c ff
> > > > > > > > >    OOB Data: 38 ea de 14 10 de 9b 40 33 16 6a cc 9d aa 2f 5e
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> > > > > > > > > ---
> > > > > > > > >   drivers/mtd/nand/raw/meson_nand.c | 5 +++++
> > > > > > > > >   1 file changed, 5 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> > > > > > > > > index f84a10238e4d..f2f2472cb511 100644
> > > > > > > > > --- a/drivers/mtd/nand/raw/meson_nand.c
> > > > > > > > > +++ b/drivers/mtd/nand/raw/meson_nand.c
> > > > > > > > > @@ -858,9 +858,12 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
> > > > > > > > >   static int meson_nfc_read_page_raw(struct nand_chip *nand, u8 *buf,
> > > > > > > > >   				   int oob_required, int page)
> > > > > > > > >   {
> > > > > > > > > +	struct mtd_info *mtd = nand_to_mtd(nand);
> > > > > > > > >   	u8 *oob_buf = nand->oob_poi;
> > > > > > > > >   	int ret;
> > > > > > > > > +	memset(oob_buf, 0, mtd->oobsize);
> > > > > > > > 
> > > > > > > > I'm surprised raw reads do not read the entire OOB?
> > > > > > > 
> > > > > > > Yes! Seems in case of raw access (what i see in this driver) number of OOB bytes read
> > > > > > > still depends on ECC parameters: for each portion of data covered with ECC code we can
> > > > > > > read it's ECC code and "user bytes" from OOB - it is what i see by dumping DMA buffer by
> > > > > > > printk(). For example I'm working with 2K NAND pages, each page has 2 x 1K ECC blocks.
> > > > > > > For each ECC block I have 16 OOB bytes which I can access by read/write. Each 16 bytes
> > > > > > > contains 2 bytes of user's data and 14 bytes ECC codes. So when I read page in raw mode
> > > > > > > controller returns 32 bytes (2 x (2 + 14)) of OOB. While OOB is reported as 64 bytes.
> > > > > > 
> > > > > > In all modes, when you read OOB, you should get the full OOB. The fact
> > > > > > that ECC correction is enabled or disabled does not matter. If the NAND
> > > > > > features OOB sections of 64 bytes, you should get the 64 bytes.
> > > > > > 
> > > > > > What happens sometimes, is that some of the bytes are not protected
> > > > > > against bitflips, but the policy is to return the full buffer.
> > > > > 
> > > > > Ok, so to clarify case for this NAND controller:
> > > > > 1) In both ECC and raw modes i need to return the same raw OOB data (e.g. user bytes
> > > > >     + ECC codes)?
> > > > 
> > > > Well, you need to cover the same amount of data, yes. But in the ECC
> > > > case the data won't be raw (at least not all of it).
> > > 
> > > So "same amount of data", in ECC mode current implementation returns only user OOB bytes (e.g.
> > > OOB data excluding ECC codes), in raw it returns user bytes + ECC codes. IIUC correct
> > > behaviour is to always return user bytes + ECC codes as OOB data even in ECC mode ?
> > 
> > If the page are 2k+64B you should read 2k+64B when OOB are requested.
> > 
> > If the controller only returns 2k+32B, then perform a random read to
> > just move the read pointer to mtd->size + mtd->oobsize - 32 and
> > retrieve the missing 32 bytes?
> 
> 1) raw read can read out the whole page data 2k+64B, decided by the len in
> the controller raw read command:
> 	cmd = (len & GENMASK(5, 0)) | scrambler | DMA_DIR(dir);
> after that, the missing oob bytes(not used) can be copied from
> meson_chip->data_buf. so the implementation of meson_nfc_read_page_raw() is
> like this if need.
> 	{
> 		......
> 		meson_nfc_read_page_sub(nand, page, 1);
> 		meson_nfc_get_data_oob(nand, buf, oob_buf);
> 		oob_len = (nand->ecc.bytes + 2) * nand->ecc.steps;
> 		memcpy(oob_buf + oob_len, meson_chip->data_buf + oob_len, mtd->oobsize -
> oob_len);
> 
> 	}
> 2) In ECC mode, the controller can't bring back the missing OOB bytes. it
> can read out the user bytes and ecc bytes per meson_ooblayout_ops define.
> 

How does the Meson controller know the actual NAND flash layout when the
OOB is split into protected and unprotected areas, such as Free and ECC
areas? If the controller has a static OOB layout, where is the mapping
located?

> > 
> > This applies to the two modes, the only difference is:
> > - with correction (commonly named "ECC mode"): the user bytes and ECC
> >    bytes should be fixed if there are any bitflips
> > - without correction (commonly referred as "raw mode"): no correction
> >    applies, if there are bitflips, give them
> > 
> > Please mind the raw mode can be slow, it's meant for debugging and
> > testing, mainly. Page reads however should be fast, so if just moving
> > the column pointer works, then do it, otherwise we'll consider
> > returning FFs.

-- 
Thank you,
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
