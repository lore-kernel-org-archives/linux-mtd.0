Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465E8C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023EA2072C
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ue4hbAvZ";
	dkim=fail reason="length tag value exceeds body size" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="dPjGZdud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023EA2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvVWaS6hgYXQ6aIZnC/GH0TDLQBvm1wRkwwNU7WFME0=; b=ue4hbAvZR+mwgb
	Wt27G6DaM0uwgBCjf2Wj6SS4DSDNfpdWRUfdlaVkyxa52mxPJrHAuyfrbieJgetCMXSgjJ+vmhG9K
	fyPodXWX1IJN69ga4WJ6yZK7MXC6sp9HSA4MW74t4MjS8LrAAlVULgRnzbjmjBHY3pq5jUyF7AA9e
	WOjvoBYQFZHpzYKvIh/grBFIruWiKMdgolTnDpdQe0yKM12d5TFdDhlhjrrXIpIWmf3bQLjJOUGyp
	r1pa8Zy1Fz2xiJ+oh4JGwOD5Eo31imjyIExQpq9w5mpv6meBlHlIHoFixPWKASh0elFTonPgkxees
	Qq7GKok7jU0W3UVmBC5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbPvY-00064n-L1; Wed, 20 May 2020 14:42:36 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbPvV-00061R-PP
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 14:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=4369; q=dns/txt; s=axis-central1;
 t=1589985754; x=1621521754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P+gGX+ZfA6c9K6SNWniWdTnBPcCX3Xk3XLmcSJe4ch8=;
 b=dPjGZdud5OIWmi0lkgrlrUgf8T+XPGq39ReFNtp+oSwuQbjDP9ZYvVYl
 vB4Au848s3fvxdeeLJyJ8gBThW4q3GqU6/V2y1Md7prNA5KpsN+CcOqcT
 gcZieLBr9/Z3tFmF81QPgP939sySQgoAAeO9OTjnBrBdTK9K9q9RdUWjJ
 igsphcFA8T5WwR/5jEnZeMuhNvWc8kw0mDCj/9h4JMzz11FXx7D4WvB2D
 tPfr42b7ZK0uhXr0OqZ0H/1PPJZAtL6vsp+eDpIP/6EnwnC32NNElUkIp
 YhEUIN/EuDgDFWU/9s+VpCs+fId75UgN8pfnNvBAlyixDIqGUysqw05q0 w==;
IronPort-SDR: bWjZAbWaZd7aunW6QYWuVUsIWA02EQ3A+nuzjIa2leeMmvzk7YDKNmcGR5fcBMqnPR0CIlZmxZ
 7F7xkhQFHYugJ1uJqDHGLRhtJMFxCUHBM3gEHaJxy8sygT1hd+Iwx8RWtGT+95RulU9+jO2zNS
 wMZ5sfDNZwstyJ2DrjQkE6H3vEexOvnljcunYot1XJqEDgLXN1usqfhglmNycd4hUCL0ESUNs8
 h5nIvYlMzf/+vNxiCbAqWxr5SaDfTWdamHcV6glweUam2BVBzKJpxsqiUBJSa20WPvvPCKEU6j
 Ibs=
X-IronPort-AV: E=Sophos;i="5.73,414,1583190000"; 
   d="scan'208";a="8680759"
From: Rickard X Andersson <Rickard.Andersson@axis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: SV: [PATCH 2/2] mtd: rawnand: Add timings for Kioxia TH58NVG2S3HBAI4
Thread-Topic: [PATCH 2/2] mtd: rawnand: Add timings for Kioxia TH58NVG2S3HBAI4
Thread-Index: AQHWLqsSzDPRS0hiIEqCKjujGCWzMKiw2n2AgAAlfmj//+dUAIAAI9sH
Date: Wed, 20 May 2020 14:42:31 +0000
Message-ID: <1589985750394.77181@axis.com>
References: <1589981533129.2663@axis.com>	<20200520154343.2ce58cc6@xps13>
 <1589984216684.8771@axis.com>,<20200520162936.6eb499fb@xps13>
In-Reply-To: <20200520162936.6eb499fb@xps13>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_074234_174860_20D25DA8 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Boris
 Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> > If I understand you correctly you want me to use onfi_find_equivalent_s=
dr_mode in order to find the corresponding onfi mode. Then you want me to u=
se onfi_fill_data_interface and loop towards mode 0 checking which mode the=
 controller accepts? I just thought it was a "messy" to duplicate this code=
 in all vendor drivers.
> > Or do you mean that I should just use onfi_find_equivalent_sdr_mode to =
set ."timings.mode" and let nand_base to do the looping in case error is re=
turned from th58nvg2s3hbai4_choose_data_interface (i.e specialized timings =
not accepted by the controller).
>
> Sorry for the misunderstanding. What I think you should try is:
> 1/ call onfi_find_equivalent_sdr_mode() to set the timings.mode field.
> 2/ call nand_controller_supports_data_interface()
> 3/ if the controller supports the timings, set
> chip->default_timing_mode accordingly and return 0.
> 4/ if the controller does not support the timings, you may want to
> propose other standard timings to test by setting
> chip->default_timing_mode anyway but returning an error which means
> "best interface has not been found yet" so the rest of the
> choose_data_interface() helper will try the remaining ONFI modes
> automatically (fallbacks to 0 anyway).

Thanks! Now I understand, will fix this on monday.

BR
Rickard
________________________________________
Fr=E5n: Miquel Raynal <miquel.raynal@bootlin.com>
Skickat: den 20 maj 2020 16:29
Till: Rickard X Andersson
Kopia: linux-mtd@lists.infradead.org; Boris Brezillon
=C4mne: Re: [PATCH 2/2] mtd: rawnand: Add timings for Kioxia TH58NVG2S3HBAI4

Hi Rickard,

Rickard X Andersson <Rickard.Andersson@axis.com> wrote on Wed, 20 May
2020 14:16:57 +0000:

> > > I have created a new patchset that I will send shortly. This patchset=
 does however not use onfi_find_equivalent_sdr_mode(..), that could be a fu=
ture improvment. My patchset falls back to mode 0 if the specialized timing=
s does not work for the controller.
> >
> > Thanks for updating!
> >
> > Actually I wrote it because of a previous discussion with Boris who
> > told me that this mode field would be badly understood and he actually
> > got it right as in your previous submission this field was set to 0
> > while, IIRC, you told me it was close to mode 3. This is important to
> > controllers that cannot tweak the parameters but just pick an ONFI
> > mode. So the timings they choose must fit the slowest mins and fastest
> > maxs of your new set of timings. Hence the use of the helper which
> > seems needed. It is actually pretty straightforward so I don't
> > understand your choice of not making use of it?
> >
> > As this is the primary contribution of this type, I would like to get
> > it right so that other contributors can refer to it :)
>
> If I understand you correctly you want me to use onfi_find_equivalent_sdr=
_mode in order to find the corresponding onfi mode. Then you want me to use=
 onfi_fill_data_interface and loop towards mode 0 checking which mode the c=
ontroller accepts? I just thought it was a "messy" to duplicate this code i=
n all vendor drivers.
> Or do you mean that I should just use onfi_find_equivalent_sdr_mode to se=
t ."timings.mode" and let nand_base to do the looping in case error is retu=
rned from th58nvg2s3hbai4_choose_data_interface (i.e specialized timings no=
t accepted by the controller).

Sorry for the misunderstanding. What I think you should try is:
1/ call onfi_find_equivalent_sdr_mode() to set the timings.mode field.
2/ call nand_controller_supports_data_interface()
3/ if the controller supports the timings, set
chip->default_timing_mode accordingly and return 0.
4/ if the controller does not support the timings, you may want to
propose other standard timings to test by setting
chip->default_timing_mode anyway but returning an error which means
"best interface has not been found yet" so the rest of the
choose_data_interface() helper will try the remaining ONFI modes
automatically (fallbacks to 0 anyway).

Thanks,
Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
