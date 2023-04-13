Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBE8C77B6C
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Apr 2023 09:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIzbDpmxJ2VFsj5CUf4ZQTWLraIKyV7m5a7X20DT6nM=; b=CZ0YmLaIQF6zN0
	zIOqctsGaXy6Yh5S6NZGfW0fGk9H2X1LQzI0IJbvd22koiBzz/t+IsXICP57WgWhoWtSqlqFHM7+1
	i7NGHpyNTKhVD09zfbgUXASEcmvrxq5f00VTOPy2HvnWsRMCsx8qiMw67pHxKjfdbj98xOGvkFsNE
	pvuHKDt+07upVGLjVAR64zrvK1daZUXtjnCBcmMTXjO8+tgHW/m5oJMZ6nheVo9uaWV2vYC0gV4Ws
	q7ENLpcWux++cHsbqiMb+3aQKTCbi9w/Vyn5IPuTAgR4zPapkG+55xgJFG8C2brCct6XLgzBycTA3
	rSzaDijcxwqseSyGE7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtEe-005cSX-1U;
	Thu, 13 Apr 2023 09:27:20 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtEZ-005cPd-1r;
	Thu, 13 Apr 2023 09:27:17 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 29ED85FD08;
	Thu, 13 Apr 2023 12:27:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681378027;
	bh=UPszp2OFslVfFwAvzppwKty8Ue+mKSOF7e8ZAshB5Po=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=sHqHMmIj7lSBOCLj5u2JmiqPTfQ5hL8vVVjVkoEp+f2+Viw46+yc0CWLoFnZKho+v
	 ToB8ZA8kNgJjATvS6gbe2JZQ2xnmd6s099W7B9PN+GN3FncW+q1pQTuqwDsQtO+T+Y
	 6Jyho/giCySUB7XfF4PyEwxeMVeKgB5a4aCGm2zKtUKjI5YacQmKJvrFN4DFtrqwIL
	 +uUk4ptfMNDfuQO/q6jyzMkVt4p6/d6Z+valLgjLi8gInqzHVzGc1VYcjVrsxYcOY5
	 nMsJMjQ1ad3CQlAUWaDIJ9oehI+biHYHIjipfmTjrMJBOq/WbEGmMWaEh8NwdL3rAv
	 VHgjuacUe0tPQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 13 Apr 2023 12:27:06 +0300 (MSK)
Date: Thu, 13 Apr 2023 12:27:06 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Arseniy Krasnov
	<avkrasnov@sberdevices.ru>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Message-ID: <20230413092706.mzopdszyirnwnjnl@CAB-WSD-L081021>
References: <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412191548.ov5fufxkwqvdgrz2@CAB-WSD-L081021>
 <20230412225603.5fba1a9e@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412225603.5fba1a9e@xps-13>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 22:40:00 #21096401
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_022715_963876_6A361F6A 
X-CRM114-Status: GOOD (  53.86  )
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

On Wed, Apr 12, 2023 at 10:56:03PM +0200, Miquel Raynal wrote:
> Hi Dmitry,
> 
> ddrokosov@sberdevices.ru wrote on Wed, 12 Apr 2023 22:15:48 +0300:
> 
> > On Wed, Apr 12, 2023 at 10:04:28PM +0800, Liang Yang wrote:
> > > Hi Miquel and Arseniy,
> > > 
> > > On 2023/4/12 20:57, Miquel Raynal wrote:  
> > > > [ EXTERNAL EMAIL ]
> > > > 
> > > > Hi Arseniy,
> > > > 
> > > > avkrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 15:22:26 +0300:
> > > >   
> > > > > On 12.04.2023 15:18, Miquel Raynal wrote:  
> > > > > > Hi Arseniy,
> > > > > > 
> > > > > > avkrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 13:14:52 +0300:  
> > > > > > > On 12.04.2023 12:36, Miquel Raynal wrote:  
> > > > > > > > Hi Arseniy,
> > > > > > > > 
> > > > > > > > avkrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 12:20:55 +0300:  
> > > > > > > > > On 12.04.2023 10:44, Miquel Raynal wrote:  
> > > > > > > > > > Hi Arseniy,
> > > > > > > > > > 
> > > > > > > > > > AVKrasnov@sberdevices.ru wrote on Wed, 12 Apr 2023 09:16:58 +0300:  
> > > > > > > > > > > This NAND reads only few user's bytes in ECC mode (not full OOB), so  
> > > > > > > > > > 
> > > > > > > > > > "This NAND reads" does not look right, do you mean "Subpage reads do
> > > > > > > > > > not retrieve all the OOB bytes,"?  
> > > > > > > > > > > fill OOB buffer with zeroes to not return garbage from previous reads
> > > > > > > > > > > to user.
> > > > > > > > > > > Otherwise 'nanddump' utility prints something like this for just erased
> > > > > > > > > > > page:
> > > > > > > > > > > 
> > > > > > > > > > > ...
> > > > > > > > > > > 0x000007f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > > > > > > > > > >    OOB Data: ff ff ff ff 00 00 ff ff 80 cf 22 99 cb ad d3 be
> > > > > > > > > > >    OOB Data: 63 27 ae 06 16 0a 2f eb bb dd 46 74 41 8e 88 6e
> > > > > > > > > > >    OOB Data: 38 a1 2d e6 77 d4 05 06 f2 a5 7e 25 eb 34 7c ff
> > > > > > > > > > >    OOB Data: 38 ea de 14 10 de 9b 40 33 16 6a cc 9d aa 2f 5e
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> > > > > > > > > > > ---
> > > > > > > > > > >   drivers/mtd/nand/raw/meson_nand.c | 5 +++++
> > > > > > > > > > >   1 file changed, 5 insertions(+)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> > > > > > > > > > > index f84a10238e4d..f2f2472cb511 100644
> > > > > > > > > > > --- a/drivers/mtd/nand/raw/meson_nand.c
> > > > > > > > > > > +++ b/drivers/mtd/nand/raw/meson_nand.c
> > > > > > > > > > > @@ -858,9 +858,12 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
> > > > > > > > > > >   static int meson_nfc_read_page_raw(struct nand_chip *nand, u8 *buf,
> > > > > > > > > > >   				   int oob_required, int page)
> > > > > > > > > > >   {
> > > > > > > > > > > +	struct mtd_info *mtd = nand_to_mtd(nand);
> > > > > > > > > > >   	u8 *oob_buf = nand->oob_poi;
> > > > > > > > > > >   	int ret;
> > > > > > > > > > > +	memset(oob_buf, 0, mtd->oobsize);  
> > > > > > > > > > 
> > > > > > > > > > I'm surprised raw reads do not read the entire OOB?  
> > > > > > > > > 
> > > > > > > > > Yes! Seems in case of raw access (what i see in this driver) number of OOB bytes read
> > > > > > > > > still depends on ECC parameters: for each portion of data covered with ECC code we can
> > > > > > > > > read it's ECC code and "user bytes" from OOB - it is what i see by dumping DMA buffer by
> > > > > > > > > printk(). For example I'm working with 2K NAND pages, each page has 2 x 1K ECC blocks.
> > > > > > > > > For each ECC block I have 16 OOB bytes which I can access by read/write. Each 16 bytes
> > > > > > > > > contains 2 bytes of user's data and 14 bytes ECC codes. So when I read page in raw mode
> > > > > > > > > controller returns 32 bytes (2 x (2 + 14)) of OOB. While OOB is reported as 64 bytes.  
> > > > > > > > 
> > > > > > > > In all modes, when you read OOB, you should get the full OOB. The fact
> > > > > > > > that ECC correction is enabled or disabled does not matter. If the NAND
> > > > > > > > features OOB sections of 64 bytes, you should get the 64 bytes.
> > > > > > > > 
> > > > > > > > What happens sometimes, is that some of the bytes are not protected
> > > > > > > > against bitflips, but the policy is to return the full buffer.  
> > > > > > > 
> > > > > > > Ok, so to clarify case for this NAND controller:
> > > > > > > 1) In both ECC and raw modes i need to return the same raw OOB data (e.g. user bytes
> > > > > > >     + ECC codes)?  
> > > > > > 
> > > > > > Well, you need to cover the same amount of data, yes. But in the ECC
> > > > > > case the data won't be raw (at least not all of it).  
> > > > > 
> > > > > So "same amount of data", in ECC mode current implementation returns only user OOB bytes (e.g.
> > > > > OOB data excluding ECC codes), in raw it returns user bytes + ECC codes. IIUC correct
> > > > > behaviour is to always return user bytes + ECC codes as OOB data even in ECC mode ?  
> > > > 
> > > > If the page are 2k+64B you should read 2k+64B when OOB are requested.
> > > > 
> > > > If the controller only returns 2k+32B, then perform a random read to
> > > > just move the read pointer to mtd->size + mtd->oobsize - 32 and
> > > > retrieve the missing 32 bytes?  
> > > 
> > > 1) raw read can read out the whole page data 2k+64B, decided by the len in
> > > the controller raw read command:
> > > 	cmd = (len & GENMASK(5, 0)) | scrambler | DMA_DIR(dir);
> > > after that, the missing oob bytes(not used) can be copied from
> > > meson_chip->data_buf. so the implementation of meson_nfc_read_page_raw() is
> > > like this if need.
> > > 	{
> > > 		......
> > > 		meson_nfc_read_page_sub(nand, page, 1);
> > > 		meson_nfc_get_data_oob(nand, buf, oob_buf);
> > > 		oob_len = (nand->ecc.bytes + 2) * nand->ecc.steps;
> > > 		memcpy(oob_buf + oob_len, meson_chip->data_buf + oob_len, mtd->oobsize -
> > > oob_len);
> > > 
> > > 	}
> > > 2) In ECC mode, the controller can't bring back the missing OOB bytes. it
> > > can read out the user bytes and ecc bytes per meson_ooblayout_ops define.
> > >   
> > 
> > How does the Meson controller know the actual NAND flash layout when the
> > OOB is split into protected and unprotected areas, such as Free and ECC
> > areas? If the controller has a static OOB layout, where is the mapping
> > located?
> 
> It's usually a set of values hardcoded in the driver. It's a per
> geometry set.
> 

Sorry, I'm still confused. Before I developed spinand drivers, the OOB layout
was located on the flash driver side.
Do you mean if the OOB geometry in the rawnand subsystem is under the
responsibility of the controller driver?

> > 
> > > > 
> > > > This applies to the two modes, the only difference is:
> > > > - with correction (commonly named "ECC mode"): the user bytes and ECC
> > > >    bytes should be fixed if there are any bitflips
> > > > - without correction (commonly referred as "raw mode"): no correction
> > > >    applies, if there are bitflips, give them
> > > > 
> > > > Please mind the raw mode can be slow, it's meant for debugging and
> > > > testing, mainly. Page reads however should be fast, so if just moving
> > > > the column pointer works, then do it, otherwise we'll consider
> > > > returning FFs.  
> > 

-- 
Thank you,
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
