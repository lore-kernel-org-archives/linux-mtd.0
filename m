Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3536EC433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 07:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF5D72087F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 07:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j5kSvJV+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF5D72087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=etictelecom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZypjZ1aMO6S16paxGcYfaVqFTjr9tcL3TVgXOFyPIA=; b=j5kSvJV+x9QQPX
	wc8uBqugTnd6O+X/h1R935Nzo12C2Up7Uu3myWYDzeGojJ7FKtLJq28UxMFcKb6OaKw0VBoSixW/v
	PBSABIxTe9WFCmRtvOj+WngaTvY95osZbwPMGpu3OxCRjrtga+L8zP1A+PZUxdcd0kdBfD5xR4dAJ
	P8gkEiTJgBBIwi1wvaYla4cBCtds09cMt/OSC5i4VqnYnRbg2gFYKELlIHpw3fvMnLm8NpotHtHP3
	MGdVWzIIkkREjRrLN6L6lfc94ueLctNuK55owHUAMALr8q1a1PTPegbnpLz5T9sV+1uR8t8REFdP4
	IfGUMSwP/iDqMCbm9wtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsMZ6-0006QR-Gb; Tue, 30 Jul 2019 07:28:56 +0000
Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsMZ0-0006Q6-G3
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 07:28:54 +0000
Received: from player797.ha.ovh.net (unknown [10.108.54.156])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id D6E651F9FCB
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2019 09:28:46 +0200 (CEST)
Received: from etictelecom.com (130.9.1.81.rev.sfr.net [81.1.9.130])
 (Authenticated sender: mickael.chazaux@etictelecom.com)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id 68070888F866;
 Tue, 30 Jul 2019 07:28:45 +0000 (UTC)
Message-ID: <5D3FF1A6.7050407@etictelecom.com>
Date: Tue, 30 Jul 2019 09:28:38 +0200
From: Mickael Chazaux <mickael.chazaux@etictelecom.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
 rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: ubifs_check_node: bad CRC
References: <5D3EF488.6010307@etictelecom.com>
 <CAFLxGvyicArpTC_VmE8GPXeHwXVT3CV-Z_5v-+qo=MB9i_-6-w@mail.gmail.com>
In-Reply-To: <CAFLxGvyicArpTC_VmE8GPXeHwXVT3CV-Z_5v-+qo=MB9i_-6-w@mail.gmail.com>
X-Enigmail-Version: 1.6
X-Ovh-Tracer-Id: 17414856810716894060
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrledvgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_002850_837800_A2D4D99F 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard, =


>>
>> I imaged the NAND and can reproduce the error like this :
>>
>> flash_eraseall /dev/mtd8
>> nandwrite -no /dev/mtd8 nand-image.img
>> ubiattach /dev/ubi_ctrl -m 8
>> mount -t ubifs ubi0:userdata /mnt/
>> echo "azer" > /mnt/azer
> =

> That easy?
> Hmm, sounds a bit like a bug in your NAND driver. Did you test it?
> =


Sorry, I meant : the "nand-image.img" file is coming from a corrupted devic=
e.
I ran the mtd_* kernel module tests yesterday. All seems good, but the tort=
ure test
is not yet finished (see below).

The problem occured in the field on several devices, and I cannot reproduce=
 it =

in the lab.

> Please also disable compression in UBIFS, then the read back data maybe g=
ives
> you a hint what went wrong.

In the corrupted node I see data from syslog. This system is a bit differen=
t =

than the others we usually make, as there are more power cuts and more log =
writes.

Thank you,

Mickael


[ 5413.404322] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 5413.410491] mtd_oobtest: MTD device: 8
[ 5413.414474] mtd_oobtest: MTD device size 514850816, eraseblock size 1310=
72, page size 2048, count of eraseblocks 3928, pages per eraseblock 64, OOB=
 size 64
[ 5413.429413] mtd_test: scanning for bad eraseblocks
[ 5413.575972] mtd_test: block 1340 is bad
[ 5413.851910] mtd_test: scanned 3928 eraseblocks, 1 are bad
[ 5413.857626] mtd_oobtest: test 1 of 5
[ 5418.697456] mtd_oobtest: writing OOBs of whole device
[ 5418.720169] mtd_oobtest: written up to eraseblock 0
[ 5423.162434] mtd_oobtest: written up to eraseblock 256
[ 5427.602317] mtd_oobtest: written up to eraseblock 512
[ 5432.040495] mtd_oobtest: written up to eraseblock 768
[ 5436.482085] mtd_oobtest: written up to eraseblock 1024
[ 5440.921463] mtd_oobtest: written up to eraseblock 1280
[ 5445.342351] mtd_oobtest: written up to eraseblock 1536
[ 5449.780333] mtd_oobtest: written up to eraseblock 1792
[ 5454.219675] mtd_oobtest: written up to eraseblock 2048
[ 5458.665451] mtd_oobtest: written up to eraseblock 2304
[ 5463.104220] mtd_oobtest: written up to eraseblock 2560
[ 5467.545202] mtd_oobtest: written up to eraseblock 2816
[ 5471.986045] mtd_oobtest: written up to eraseblock 3072
[ 5476.426066] mtd_oobtest: written up to eraseblock 3328
[ 5480.867515] mtd_oobtest: written up to eraseblock 3584
[ 5485.309581] mtd_oobtest: written up to eraseblock 3840
[ 5486.823072] mtd_oobtest: written 3928 eraseblocks
[ 5486.828061] mtd_oobtest: verifying all eraseblocks
[ 5486.837360] mtd_oobtest: verified up to eraseblock 0
[ 5487.918137] mtd_oobtest: verified up to eraseblock 256
[ 5488.998900] mtd_oobtest: verified up to eraseblock 512
[ 5490.080089] mtd_oobtest: verified up to eraseblock 768
[ 5491.161260] mtd_oobtest: verified up to eraseblock 1024
[ 5492.241854] mtd_oobtest: verified up to eraseblock 1280
[ 5493.318356] mtd_oobtest: verified up to eraseblock 1536
[ 5494.398855] mtd_oobtest: verified up to eraseblock 1792
[ 5495.479755] mtd_oobtest: verified up to eraseblock 2048
[ 5496.560331] mtd_oobtest: verified up to eraseblock 2304
[ 5497.641029] mtd_oobtest: verified up to eraseblock 2560
[ 5498.721400] mtd_oobtest: verified up to eraseblock 2816
[ 5499.802138] mtd_oobtest: verified up to eraseblock 3072
[ 5500.882520] mtd_oobtest: verified up to eraseblock 3328
[ 5501.963106] mtd_oobtest: verified up to eraseblock 3584
[ 5503.043905] mtd_oobtest: verified up to eraseblock 3840
[ 5503.414587] mtd_oobtest: verified 3928 eraseblocks
[ 5503.419657] mtd_oobtest: test 2 of 5
[ 5508.257289] mtd_oobtest: writing OOBs of whole device
[ 5508.279972] mtd_oobtest: written up to eraseblock 0
[ 5512.716652] mtd_oobtest: written up to eraseblock 256
[ 5517.153175] mtd_oobtest: written up to eraseblock 512
[ 5521.588800] mtd_oobtest: written up to eraseblock 768
[ 5526.025484] mtd_oobtest: written up to eraseblock 1024
[ 5530.463071] mtd_oobtest: written up to eraseblock 1280
[ 5534.883615] mtd_oobtest: written up to eraseblock 1536
[ 5539.319681] mtd_oobtest: written up to eraseblock 1792
[ 5543.756419] mtd_oobtest: written up to eraseblock 2048
[ 5548.193159] mtd_oobtest: written up to eraseblock 2304
[ 5552.629020] mtd_oobtest: written up to eraseblock 2560
[ 5557.065773] mtd_oobtest: written up to eraseblock 2816
[ 5561.502801] mtd_oobtest: written up to eraseblock 3072
[ 5565.940317] mtd_oobtest: written up to eraseblock 3328
[ 5570.379654] mtd_oobtest: written up to eraseblock 3584
[ 5574.818812] mtd_oobtest: written up to eraseblock 3840
[ 5576.331667] mtd_oobtest: written 3928 eraseblocks
[ 5576.336649] mtd_oobtest: verifying all eraseblocks
[ 5576.345902] mtd_oobtest: verified up to eraseblock 0
[ 5577.409516] mtd_oobtest: verified up to eraseblock 256
[ 5578.472968] mtd_oobtest: verified up to eraseblock 512
[ 5579.536875] mtd_oobtest: verified up to eraseblock 768
[ 5580.600794] mtd_oobtest: verified up to eraseblock 1024
[ 5581.665090] mtd_oobtest: verified up to eraseblock 1280
[ 5582.724904] mtd_oobtest: verified up to eraseblock 1536
[ 5583.789025] mtd_oobtest: verified up to eraseblock 1792
[ 5584.853233] mtd_oobtest: verified up to eraseblock 2048
[ 5585.917338] mtd_oobtest: verified up to eraseblock 2304
[ 5586.981018] mtd_oobtest: verified up to eraseblock 2560
[ 5588.045023] mtd_oobtest: verified up to eraseblock 2816
[ 5589.108721] mtd_oobtest: verified up to eraseblock 3072
[ 5590.172486] mtd_oobtest: verified up to eraseblock 3328
[ 5591.236304] mtd_oobtest: verified up to eraseblock 3584
[ 5592.299835] mtd_oobtest: verified up to eraseblock 3840
[ 5592.664836] mtd_oobtest: verified 3928 eraseblocks
[ 5592.669904] mtd_oobtest: test 3 of 5
[ 5597.507429] mtd_oobtest: writing OOBs of whole device
[ 5597.530046] mtd_oobtest: written up to eraseblock 0
[ 5601.892389] mtd_oobtest: written up to eraseblock 256
[ 5606.253684] mtd_oobtest: written up to eraseblock 512
[ 5610.616762] mtd_oobtest: written up to eraseblock 768
[ 5614.982534] mtd_oobtest: written up to eraseblock 1024
[ 5619.347226] mtd_oobtest: written up to eraseblock 1280
[ 5623.695084] mtd_oobtest: written up to eraseblock 1536
[ 5628.056769] mtd_oobtest: written up to eraseblock 1792
[ 5632.415995] mtd_oobtest: written up to eraseblock 2048
[ 5636.778889] mtd_oobtest: written up to eraseblock 2304
[ 5641.142626] mtd_oobtest: written up to eraseblock 2560
[ 5645.507464] mtd_oobtest: written up to eraseblock 2816
[ 5649.878307] mtd_oobtest: written up to eraseblock 3072
[ 5654.246151] mtd_oobtest: written up to eraseblock 3328
[ 5658.618988] mtd_oobtest: written up to eraseblock 3584
[ 5662.997712] mtd_oobtest: written up to eraseblock 3840
[ 5664.487326] mtd_oobtest: written 3928 eraseblocks
[ 5664.492328] mtd_oobtest: verifying all eraseblocks
[ 5664.505684] mtd_oobtest: verified up to eraseblock 0
[ 5666.637997] mtd_oobtest: verified up to eraseblock 256
[ 5668.770111] mtd_oobtest: verified up to eraseblock 512
[ 5670.902296] mtd_oobtest: verified up to eraseblock 768
[ 5673.034654] mtd_oobtest: verified up to eraseblock 1024
[ 5675.167603] mtd_oobtest: verified up to eraseblock 1280
[ 5677.292282] mtd_oobtest: verified up to eraseblock 1536
[ 5679.424938] mtd_oobtest: verified up to eraseblock 1792
[ 5681.557466] mtd_oobtest: verified up to eraseblock 2048
[ 5683.689666] mtd_oobtest: verified up to eraseblock 2304
[ 5685.821972] mtd_oobtest: verified up to eraseblock 2560
[ 5687.953818] mtd_oobtest: verified up to eraseblock 2816
[ 5690.086286] mtd_oobtest: verified up to eraseblock 3072
[ 5692.218900] mtd_oobtest: verified up to eraseblock 3328
[ 5694.350754] mtd_oobtest: verified up to eraseblock 3584
[ 5696.482561] mtd_oobtest: verified up to eraseblock 3840
[ 5697.210533] mtd_oobtest: verified 3928 eraseblocks
[ 5697.215607] mtd_oobtest: test 4 of 5
[ 5702.053539] mtd_oobtest: attempting to start write past end of OOB
[ 5702.060099] mtd_oobtest: an error is expected...
[ 5702.065001] mtd_oobtest: error occurred as expected
[ 5702.070160] mtd_oobtest: attempting to start read past end of OOB
[ 5702.076618] mtd_oobtest: an error is expected...
[ 5702.081518] mtd_oobtest: error occurred as expected
[ 5702.086677] mtd_oobtest: attempting to write past end of device
[ 5702.092949] mtd_oobtest: an error is expected...
[ 5702.097831] mtd_oobtest: error occurred as expected
[ 5702.103003] mtd_oobtest: attempting to read past end of device
[ 5702.109170] mtd_oobtest: an error is expected...
[ 5702.114066] mtd_oobtest: error occurred as expected
[ 5702.120459] mtd_oobtest: attempting to write past end of device
[ 5702.126719] mtd_oobtest: an error is expected...
[ 5702.131680] mtd_oobtest: error occurred as expected
[ 5702.136843] mtd_oobtest: attempting to read past end of device
[ 5702.143075] mtd_oobtest: an error is expected...
[ 5702.147960] mtd_oobtest: error occurred as expected
[ 5702.153139] mtd_oobtest: test 5 of 5
[ 5706.990511] mtd_oobtest: writing OOBs of whole device
[ 5706.996169] mtd_oobtest: written up to eraseblock 0
[ 5707.001889] mtd_oobtest: written up to eraseblock 0
[ 5707.147066] mtd_oobtest: written up to eraseblock 256
[ 5707.152701] mtd_oobtest: written up to eraseblock 256
[ 5707.298183] mtd_oobtest: written up to eraseblock 512
[ 5707.303865] mtd_oobtest: written up to eraseblock 512
[ 5707.449384] mtd_oobtest: written up to eraseblock 768
[ 5707.455063] mtd_oobtest: written up to eraseblock 768
[ 5707.600910] mtd_oobtest: written up to eraseblock 1024
[ 5707.606662] mtd_oobtest: written up to eraseblock 1024
[ 5707.752264] mtd_oobtest: written up to eraseblock 1280
[ 5707.757970] mtd_oobtest: written up to eraseblock 1280
[ 5707.902742] mtd_oobtest: written up to eraseblock 1536
[ 5707.908449] mtd_oobtest: written up to eraseblock 1536
[ 5708.053945] mtd_oobtest: written up to eraseblock 1792
[ 5708.059701] mtd_oobtest: written up to eraseblock 1792
[ 5708.204961] mtd_oobtest: written up to eraseblock 2048
[ 5708.210732] mtd_oobtest: written up to eraseblock 2048
[ 5708.356839] mtd_oobtest: written up to eraseblock 2304
[ 5708.362612] mtd_oobtest: written up to eraseblock 2304
[ 5708.507666] mtd_oobtest: written up to eraseblock 2560
[ 5708.513390] mtd_oobtest: written up to eraseblock 2560
[ 5708.659872] mtd_oobtest: written up to eraseblock 2816
[ 5708.665596] mtd_oobtest: written up to eraseblock 2816
[ 5708.811630] mtd_oobtest: written up to eraseblock 3072
[ 5708.817337] mtd_oobtest: written up to eraseblock 3072
[ 5708.963204] mtd_oobtest: written up to eraseblock 3328
[ 5708.968912] mtd_oobtest: written up to eraseblock 3328
[ 5709.115684] mtd_oobtest: written up to eraseblock 3584
[ 5709.121412] mtd_oobtest: written up to eraseblock 3584
[ 5709.268444] mtd_oobtest: written up to eraseblock 3840
[ 5709.274170] mtd_oobtest: written up to eraseblock 3840
[ 5709.327163] mtd_oobtest: written 3927 eraseblocks
[ 5709.332154] mtd_oobtest: verifying all eraseblocks
[ 5709.337362] mtd_oobtest: verified up to eraseblock 0
[ 5709.375982] mtd_oobtest: verified up to eraseblock 256
[ 5709.414809] mtd_oobtest: verified up to eraseblock 512
[ 5709.453600] mtd_oobtest: verified up to eraseblock 768
[ 5709.492392] mtd_oobtest: verified up to eraseblock 1024
[ 5709.531275] mtd_oobtest: verified up to eraseblock 1280
[ 5709.569885] mtd_oobtest: verified up to eraseblock 1536
[ 5709.608768] mtd_oobtest: verified up to eraseblock 1792
[ 5709.647651] mtd_oobtest: verified up to eraseblock 2048
[ 5709.686563] mtd_oobtest: verified up to eraseblock 2304
[ 5709.725454] mtd_oobtest: verified up to eraseblock 2560
[ 5709.764332] mtd_oobtest: verified up to eraseblock 2816
[ 5709.803232] mtd_oobtest: verified up to eraseblock 3072
[ 5709.842266] mtd_oobtest: verified up to eraseblock 3328
[ 5709.881215] mtd_oobtest: verified up to eraseblock 3584
[ 5709.920091] mtd_oobtest: verified up to eraseblock 3840
[ 5709.936870] mtd_oobtest: verified 3927 eraseblocks
[ 5709.941956] mtd_oobtest: finished with 0 errors
[ 5709.946753] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 5814.956006] =

[ 5814.957619] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 5814.963790] mtd_stresstest: MTD device: 8
[ 5814.968050] mtd_stresstest: MTD device size 514850816, eraseblock size 1=
31072, page size 2048, count of eraseblocks 3928, pages per eraseblock 64, =
OOB size 64
[ 5814.988256] mtd_test: scanning for bad eraseblocks
[ 5815.135242] mtd_test: block 1340 is bad
[ 5815.411649] mtd_test: scanned 3928 eraseblocks, 1 are bad
[ 5815.417371] mtd_stresstest: doing operations
[ 5815.421904] mtd_stresstest: 0 operations done
[ 5836.025793] mtd_stresstest: 1024 operations done
[ 5856.228779] mtd_stresstest: 2048 operations done
[ 5876.470081] mtd_stresstest: 3072 operations done
[ 5896.150716] mtd_stresstest: 4096 operations done
[ 5915.446882] mtd_stresstest: 5120 operations done
[ 5934.046827] mtd_stresstest: 6144 operations done
[ 5952.001219] mtd_stresstest: 7168 operations done
[ 5970.345806] mtd_stresstest: 8192 operations done
[ 5988.697141] mtd_stresstest: 9216 operations done
[ 6003.348364] mtd_stresstest: finished, 10000 operations done
[ 6003.354570] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 6076.943773] =

[ 6076.945387] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[ 6076.951671] mtd_nandbiterrs: MTD device: 8
[ 6076.956017] mtd_nandbiterrs: MTD device size 514850816, eraseblock=3D131=
072, page=3D2048, oob=3D64
[ 6076.964968] mtd_nandbiterrs: Device uses 4 subpages of 512 bytes
[ 6076.971347] mtd_nandbiterrs: Using page=3D0, offset=3D0, eraseblock=3D0
[ 6076.979051] mtd_nandbiterrs: incremental biterrors test
[ 6076.984731] mtd_nandbiterrs: write_page
[ 6076.989258] mtd_nandbiterrs: rewrite page
[ 6076.993892] mtd_nandbiterrs: read_page
[ 6076.998177] mtd_nandbiterrs: verify_page
[ 6077.002516] mtd_nandbiterrs: Successfully corrected 0 bit errors per sub=
page
[ 6077.009974] mtd_nandbiterrs: Inserted biterror @ 0/5
[ 6077.015247] mtd_nandbiterrs: Inserted biterror @ 512/6
[ 6077.020699] mtd_nandbiterrs: Inserted biterror @ 1025/7
[ 6077.026226] mtd_nandbiterrs: Inserted biterror @ 1536/6
[ 6077.031775] mtd_nandbiterrs: rewrite page
[ 6077.036797] mtd_nandbiterrs: read_page
[ 6077.041136] mtd_nandbiterrs: Read reported 4 corrected bit errors
[ 6077.047584] mtd_nandbiterrs: verify_page
[ 6077.051888] mtd_nandbiterrs: Successfully corrected 1 bit errors per sub=
page
[ 6077.059345] mtd_nandbiterrs: Inserted biterror @ 0/2
[ 6077.064612] mtd_nandbiterrs: Inserted biterror @ 512/5
[ 6077.070047] mtd_nandbiterrs: Inserted biterror @ 1026/6
[ 6077.075589] mtd_nandbiterrs: Inserted biterror @ 1536/3
[ 6077.081130] mtd_nandbiterrs: rewrite page
[ 6077.085743] mtd_nandbiterrs: read_page
[ 6077.090004] __nand_correct_data: uncorrectable ECC error
[ 6077.095463] __nand_correct_data: uncorrectable ECC error__nand_correct_d=
ata: uncorrectable ECC error
[ 6077.105155] __nand_correct_data: uncorrectable ECC error<3>[ 6077.110795=
] mtd_nandbiterrs: error: read failed at 0x0
[ 6077.116232] mtd_nandbiterrs: After 2 biterrors per subpage, read reporte=
d error -74
[ 6077.125586] mtd_nandbiterrs: finished successfully.
[ 6077.130762] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[ 6116.618198] mtd_nandecctest: unknown parameter 'dev' ignored
[ 6116.624730] mtd_nandecctest: ok - no-bit-error-256
[ 6116.629820] mtd_nandecctest: ok - single-bit-error-in-data-correct-256
[ 6116.636780] mtd_nandecctest: ok - single-bit-error-in-ecc-correct-256
[ 6116.643625] __nand_correct_data: uncorrectable ECC error
[ 6116.649065] mtd_nandecctest: ok - double-bit-error-in-data-detect-256
[ 6116.656094] __nand_correct_data: uncorrectable ECC error
[ 6116.661548] mtd_nandecctest: ok - single-bit-error-in-data-and-ecc-detec=
t-256
[ 6116.669286] __nand_correct_data: uncorrectable ECC error
[ 6116.674737] mtd_nandecctest: ok - double-bit-error-in-ecc-detect-256
[ 6116.681701] mtd_nandecctest: ok - no-bit-error-512
[ 6116.686781] mtd_nandecctest: ok - single-bit-error-in-data-correct-512
[ 6116.693716] mtd_nandecctest: ok - single-bit-error-in-ecc-correct-512
[ 6116.700548] __nand_correct_data: uncorrectable ECC error
[ 6116.705983] mtd_nandecctest: ok - double-bit-error-in-data-detect-512
[ 6116.713031] __nand_correct_data: uncorrectable ECC error
[ 6116.718469] mtd_nandecctest: ok - single-bit-error-in-data-and-ecc-detec=
t-512
[ 6116.726229] __nand_correct_data: uncorrectable ECC error
[ 6116.731685] mtd_nandecctest: ok - double-bit-error-in-ecc-detect-512
[ 6210.317171] mtd_pagetest: `' invalid for parameter `dev'
[ 6214.160109] =

[ 6214.161844] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 6214.167928] mtd_pagetest: MTD device: 8
[ 6214.172034] mtd_pagetest: MTD device size 514850816, eraseblock size 131=
072, page size 2048, count of eraseblocks 3928, pages per eraseblock 64, OO=
B size 64
[ 6214.186906] mtd_test: scanning for bad eraseblocks
[ 6214.333227] mtd_test: block 1340 is bad
[ 6214.609094] mtd_test: scanned 3928 eraseblocks, 1 are bad
[ 6214.614831] mtd_pagetest: erasing whole device
[ 6219.455151] mtd_pagetest: erased 3928 eraseblocks
[ 6219.460149] mtd_pagetest: writing whole device
[ 6219.495395] mtd_pagetest: written up to eraseblock 0
[ 6227.299119] mtd_pagetest: written up to eraseblock 256
[ 6235.107834] mtd_pagetest: written up to eraseblock 512
[ 6242.857609] mtd_pagetest: written up to eraseblock 768
[ 6250.614131] mtd_pagetest: written up to eraseblock 1024
[ 6258.347823] mtd_pagetest: written up to eraseblock 1280
[ 6266.053320] mtd_pagetest: written up to eraseblock 1536
[ 6273.783338] mtd_pagetest: written up to eraseblock 1792
[ 6281.511652] mtd_pagetest: written up to eraseblock 2048
[ 6289.251850] mtd_pagetest: written up to eraseblock 2304
[ 6296.998599] mtd_pagetest: written up to eraseblock 2560
[ 6304.752642] mtd_pagetest: written up to eraseblock 2816
[ 6312.514425] mtd_pagetest: written up to eraseblock 3072
[ 6320.237306] mtd_pagetest: written up to eraseblock 3328
[ 6327.978076] mtd_pagetest: written up to eraseblock 3584
[ 6335.736566] mtd_pagetest: written up to eraseblock 3840
[ 6338.378819] mtd_pagetest: written 3928 eraseblocks
[ 6338.383949] mtd_pagetest: verifying all eraseblocks
[ 6338.507400] mtd_pagetest: verified up to eraseblock 0
[ 6368.823427] mtd_pagetest: verified up to eraseblock 256
[ 6399.128609] mtd_pagetest: verified up to eraseblock 512
[ 6429.425984] mtd_pagetest: verified up to eraseblock 768
[ 6459.724052] mtd_pagetest: verified up to eraseblock 1024
[ 6490.025215] mtd_pagetest: verified up to eraseblock 1280
[ 6520.225621] mtd_pagetest: verified up to eraseblock 1536
[ 6550.535370] mtd_pagetest: verified up to eraseblock 1792
[ 6580.835068] mtd_pagetest: verified up to eraseblock 2048
[ 6611.150737] mtd_pagetest: verified up to eraseblock 2304
[ 6641.449877] mtd_pagetest: verified up to eraseblock 2560
[ 6671.757231] mtd_pagetest: verified up to eraseblock 2816
[ 6702.057533] mtd_pagetest: verified up to eraseblock 3072
[ 6732.365896] mtd_pagetest: verified up to eraseblock 3328
[ 6762.662085] mtd_pagetest: verified up to eraseblock 3584
[ 6792.961595] mtd_pagetest: verified up to eraseblock 3840
[ 6803.260899] mtd_pagetest: verified 3928 eraseblocks
[ 6803.266092] mtd_pagetest: crosstest
[ 6803.270468] mtd_pagetest: reading page at 0x0
[ 6803.275385] mtd_pagetest: reading page at 0x1eaff800
[ 6803.280962] mtd_pagetest: reading page at 0x0
[ 6803.285876] mtd_pagetest: verifying pages read at 0x0 match
[ 6803.291823] mtd_pagetest: crosstest ok
[ 6803.295789] mtd_pagetest: erasecrosstest
[ 6803.299936] mtd_pagetest: erasing block 0
[ 6803.305439] mtd_pagetest: writing 1st page of block 0
[ 6803.311289] mtd_pagetest: reading 1st page of block 0
[ 6803.316928] mtd_pagetest: verifying 1st page of block 0
[ 6803.322504] mtd_pagetest: erasing block 0
[ 6803.327977] mtd_pagetest: writing 1st page of block 0
[ 6803.333808] mtd_pagetest: erasing block 3927
[ 6803.339556] mtd_pagetest: reading 1st page of block 0
[ 6803.345220] mtd_pagetest: verifying 1st page of block 0
[ 6803.350795] mtd_pagetest: erasecrosstest ok
[ 6803.355217] mtd_pagetest: erasetest
[ 6803.358903] mtd_pagetest: erasing block 0
[ 6803.364391] mtd_pagetest: writing 1st page of block 0
[ 6803.370203] mtd_pagetest: erasing block 0
[ 6803.375694] mtd_pagetest: reading 1st page of block 0
[ 6803.381346] mtd_pagetest: verifying 1st page of block 0 is all 0xff
[ 6803.387990] mtd_pagetest: erasetest ok
[ 6803.391969] mtd_pagetest: finished with 0 errors
[ 6803.396856] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 6877.130696] =

[ 6877.132306] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 6877.138384] mtd_readtest: MTD device: 8
[ 6877.142498] mtd_readtest: MTD device size 514850816, eraseblock size 131=
072, page size 2048, count of eraseblocks 3928, pages per eraseblock 64, OO=
B size 64
[ 6877.157359] mtd_test: scanning for bad eraseblocks
[ 6877.303751] mtd_test: block 1340 is bad
[ 6877.580143] mtd_test: scanned 3928 eraseblocks, 1 are bad
[ 6877.585874] mtd_readtest: testing page read
[ 6967.883287] mtd_readtest: finished
[ 6967.886943] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 7025.195054] =

[ 7025.196667] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 7025.202864] mtd_speedtest: MTD device: 8
[ 7025.207034] mtd_speedtest: MTD device size 514850816, eraseblock size 13=
1072, page size 2048, count of eraseblocks 3928, pages per eraseblock 64, O=
OB size 64
[ 7025.224291] mtd_test: scanning for bad eraseblocks
[ 7025.370595] mtd_test: block 1340 is bad
[ 7025.646751] mtd_test: scanned 3928 eraseblocks, 1 are bad
[ 7030.488338] mtd_speedtest: testing eraseblock write speed
[ 7140.166002] mtd_speedtest: eraseblock write speed is 4583 KiB/s
[ 7140.172475] mtd_speedtest: testing eraseblock read speed
[ 7213.757488] mtd_speedtest: eraseblock read speed is 6831 KiB/s
[ 7218.597280] mtd_speedtest: testing page write speed
[ 7328.597748] mtd_speedtest: page write speed is 4569 KiB/s
[ 7328.603517] mtd_speedtest: testing page read speed
[ 7402.403578] mtd_speedtest: page read speed is 6811 KiB/s
[ 7407.243084] mtd_speedtest: testing 2 page write speed
[ 7516.946841] mtd_speedtest: 2 page write speed is 4582 KiB/s
[ 7516.952792] mtd_speedtest: testing 2 page read speed
[ 7590.637384] mtd_speedtest: 2 page read speed is 6822 KiB/s
[ 7590.643247] mtd_speedtest: Testing erase speed
[ 7595.481133] mtd_speedtest: erase speed is 103983 KiB/s
[ 7595.486589] mtd_speedtest: Testing 2x multi-block erase speed
[ 7600.321512] mtd_speedtest: 2x multi-block erase speed is 104091 KiB/s
[ 7600.328339] mtd_speedtest: Testing 4x multi-block erase speed
[ 7605.160845] mtd_speedtest: 4x multi-block erase speed is 104155 KiB/s
[ 7605.167677] mtd_speedtest: Testing 8x multi-block erase speed
[ 7609.999327] mtd_speedtest: 8x multi-block erase speed is 104155 KiB/s
[ 7610.006178] mtd_speedtest: Testing 16x multi-block erase speed
[ 7614.837265] mtd_speedtest: 16x multi-block erase speed is 104177 KiB/s
[ 7614.844204] mtd_speedtest: Testing 32x multi-block erase speed
[ 7619.674561] mtd_speedtest: 32x multi-block erase speed is 104177 KiB/s
[ 7619.681524] mtd_speedtest: Testing 64x multi-block erase speed
[ 7624.511623] mtd_speedtest: 64x multi-block erase speed is 104199 KiB/s
[ 7624.518543] mtd_speedtest: finished
[ 7624.522255] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 7798.745134] =

[ 7798.746746] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 7798.752942] mtd_subpagetest: MTD device: 8
[ 7798.757295] mtd_subpagetest: MTD device size 514850816, eraseblock size =
131072, page size 2048, subpage size 512, count of eraseblocks 3928, pages =
per eraseblock 64, OOB size 64
[ 7798.774100] mtd_test: scanning for bad eraseblocks
[ 7798.920247] mtd_test: block 1340 is bad
[ 7799.197142] mtd_test: scanned 3928 eraseblocks, 1 are bad
[ 7804.038474] mtd_subpagetest: writing whole device
[ 7804.044445] mtd_subpagetest: written up to eraseblock 0
[ 7804.291304] mtd_subpagetest: written up to eraseblock 256
[ 7804.537626] mtd_subpagetest: written up to eraseblock 512
[ 7804.783240] mtd_subpagetest: written up to eraseblock 768
[ 7805.031443] mtd_subpagetest: written up to eraseblock 1024
[ 7805.276172] mtd_subpagetest: written up to eraseblock 1280
[ 7805.519250] mtd_subpagetest: written up to eraseblock 1536
[ 7805.763137] mtd_subpagetest: written up to eraseblock 1792
[ 7806.006097] mtd_subpagetest: written up to eraseblock 2048
[ 7806.250634] mtd_subpagetest: written up to eraseblock 2304
[ 7806.495727] mtd_subpagetest: written up to eraseblock 2560
[ 7806.742410] mtd_subpagetest: written up to eraseblock 2816
[ 7806.989389] mtd_subpagetest: written up to eraseblock 3072
[ 7807.233751] mtd_subpagetest: written up to eraseblock 3328
[ 7807.479879] mtd_subpagetest: written up to eraseblock 3584
[ 7807.727727] mtd_subpagetest: written up to eraseblock 3840
[ 7807.814984] mtd_subpagetest: written 3928 eraseblocks
[ 7807.820326] mtd_subpagetest: verifying all eraseblocks
[ 7807.826078] mtd_subpagetest: verified up to eraseblock 0
[ 7807.902016] mtd_subpagetest: verified up to eraseblock 256
[ 7807.978402] mtd_subpagetest: verified up to eraseblock 512
[ 7808.054947] mtd_subpagetest: verified up to eraseblock 768
[ 7808.131268] mtd_subpagetest: verified up to eraseblock 1024
[ 7808.207516] mtd_subpagetest: verified up to eraseblock 1280
[ 7808.283511] mtd_subpagetest: verified up to eraseblock 1536
[ 7808.359755] mtd_subpagetest: verified up to eraseblock 1792
[ 7808.436017] mtd_subpagetest: verified up to eraseblock 2048
[ 7808.512282] mtd_subpagetest: verified up to eraseblock 2304
[ 7808.588528] mtd_subpagetest: verified up to eraseblock 2560
[ 7808.664823] mtd_subpagetest: verified up to eraseblock 2816
[ 7808.741110] mtd_subpagetest: verified up to eraseblock 3072
[ 7808.817332] mtd_subpagetest: verified up to eraseblock 3328
[ 7808.893566] mtd_subpagetest: verified up to eraseblock 3584
[ 7808.970056] mtd_subpagetest: verified up to eraseblock 3840
[ 7808.999924] mtd_subpagetest: verified 3928 eraseblocks
[ 7813.839104] mtd_subpagetest: verifying all eraseblocks for 0xff
[ 7813.878309] mtd_subpagetest: verified up to eraseblock 0
[ 7822.305635] mtd_subpagetest: verified up to eraseblock 256
[ 7830.727880] mtd_subpagetest: verified up to eraseblock 512
[ 7839.150819] mtd_subpagetest: verified up to eraseblock 768
[ 7847.572884] mtd_subpagetest: verified up to eraseblock 1024
[ 7855.998248] mtd_subpagetest: verified up to eraseblock 1280
[ 7864.389149] mtd_subpagetest: verified up to eraseblock 1536
[ 7872.811599] mtd_subpagetest: verified up to eraseblock 1792
[ 7881.235908] mtd_subpagetest: verified up to eraseblock 2048
[ 7889.659544] mtd_subpagetest: verified up to eraseblock 2304
[ 7898.083098] mtd_subpagetest: verified up to eraseblock 2560
[ 7906.505817] mtd_subpagetest: verified up to eraseblock 2816
[ 7914.934661] mtd_subpagetest: verified up to eraseblock 3072
[ 7923.361696] mtd_subpagetest: verified up to eraseblock 3328
[ 7931.786842] mtd_subpagetest: verified up to eraseblock 3584
[ 7940.210948] mtd_subpagetest: verified up to eraseblock 3840
[ 7943.077673] mtd_subpagetest: verified 3928 eraseblocks
[ 7943.083140] mtd_subpagetest: writing whole device
[ 7943.125404] mtd_subpagetest: written up to eraseblock 0
[ 7952.796846] mtd_subpagetest: written up to eraseblock 256
[ 7962.470818] mtd_subpagetest: written up to eraseblock 512
[ 7972.098018] mtd_subpagetest: written up to eraseblock 768
[ 7981.750299] mtd_subpagetest: written up to eraseblock 1024
[ 7991.369980] mtd_subpagetest: written up to eraseblock 1280
[ 8000.954801] mtd_subpagetest: written up to eraseblock 1536
[ 8010.565700] mtd_subpagetest: written up to eraseblock 1792
[ 8020.179393] mtd_subpagetest: written up to eraseblock 2048
[ 8029.801553] mtd_subpagetest: written up to eraseblock 2304
[ 8039.430975] mtd_subpagetest: written up to eraseblock 2560
[ 8049.077093] mtd_subpagetest: written up to eraseblock 2816
[ 8058.733850] mtd_subpagetest: written up to eraseblock 3072
[ 8068.346029] mtd_subpagetest: written up to eraseblock 3328
[ 8077.978313] mtd_subpagetest: written up to eraseblock 3584
[ 8087.635786] mtd_subpagetest: written up to eraseblock 3840
[ 8090.920974] mtd_subpagetest: written 3928 eraseblocks
[ 8090.926339] mtd_subpagetest: verifying all eraseblocks
[ 8090.955668] mtd_subpagetest: verified up to eraseblock 0
[ 8097.052051] mtd_subpagetest: verified up to eraseblock 256
[ 8103.149545] mtd_subpagetest: verified up to eraseblock 512
[ 8109.246688] mtd_subpagetest: verified up to eraseblock 768
[ 8115.343641] mtd_subpagetest: verified up to eraseblock 1024
[ 8121.440893] mtd_subpagetest: verified up to eraseblock 1280
[ 8127.514642] mtd_subpagetest: verified up to eraseblock 1536
[ 8133.612168] mtd_subpagetest: verified up to eraseblock 1792
[ 8139.708696] mtd_subpagetest: verified up to eraseblock 2048
[ 8145.805417] mtd_subpagetest: verified up to eraseblock 2304
[ 8151.902275] mtd_subpagetest: verified up to eraseblock 2560
[ 8157.999851] mtd_subpagetest: verified up to eraseblock 2816
[ 8164.099112] mtd_subpagetest: verified up to eraseblock 3072
[ 8170.197316] mtd_subpagetest: verified up to eraseblock 3328
[ 8176.294134] mtd_subpagetest: verified up to eraseblock 3584
[ 8182.391904] mtd_subpagetest: verified up to eraseblock 3840
[ 8184.467940] mtd_subpagetest: verified 3928 eraseblocks
[ 8189.306951] mtd_subpagetest: verifying all eraseblocks for 0xff
[ 8189.346161] mtd_subpagetest: verified up to eraseblock 0
[ 8197.770209] mtd_subpagetest: verified up to eraseblock 256
[ 8206.193309] mtd_subpagetest: verified up to eraseblock 512
[ 8214.616663] mtd_subpagetest: verified up to eraseblock 768
[ 8223.040804] mtd_subpagetest: verified up to eraseblock 1024
[ 8231.464029] mtd_subpagetest: verified up to eraseblock 1280
[ 8239.853503] mtd_subpagetest: verified up to eraseblock 1536
[ 8248.277585] mtd_subpagetest: verified up to eraseblock 1792
[ 8256.700477] mtd_subpagetest: verified up to eraseblock 2048
[ 8265.124269] mtd_subpagetest: verified up to eraseblock 2304
[ 8273.549314] mtd_subpagetest: verified up to eraseblock 2560
[ 8281.971823] mtd_subpagetest: verified up to eraseblock 2816
[ 8290.396009] mtd_subpagetest: verified up to eraseblock 3072
[ 8298.818985] mtd_subpagetest: verified up to eraseblock 3328
[ 8307.241174] mtd_subpagetest: verified up to eraseblock 3584
[ 8315.663750] mtd_subpagetest: verified up to eraseblock 3840
[ 8318.531406] mtd_subpagetest: verified 3928 eraseblocks
[ 8318.536862] mtd_subpagetest: finished with 0 errors
[ 8318.542045] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 8335.008839] =

[ 8335.010601] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 8335.016681] mtd_torturetest: Warning: this program is trying to wear out=
 your flash, stop it if this is not wanted.
[ 8335.027742] mtd_torturetest: MTD device: 8
[ 8335.032123] mtd_torturetest: torture 32 eraseblocks (8-39) of mtd8
[ 8335.038661] mtd_torturetest: write verify enabled
[ 8335.045299] mtd_test: scanning for bad eraseblocks
[ 8335.053827] mtd_test: scanned 32 eraseblocks, 0 are bad
[ 9502.026753] mtd_torturetest: 00000512 erase cycles done, took 1166968 mi=
lliseconds (1166 seconds)
[10668.222020] mtd_torturetest: 00001024 erase cycles done, took 1166185 mi=
lliseconds (1166 seconds)
[11834.145009] mtd_torturetest: 00001536 erase cycles done, took 1165914 mi=
lliseconds (1165 seconds)
[13000.026525] mtd_torturetest: 00002048 erase cycles done, took 1165872 mi=
lliseconds (1165 seconds)
[14165.809096] mtd_torturetest: 00002560 erase cycles done, took 1165774 mi=
lliseconds (1165 seconds)
[15331.465312] mtd_torturetest: 00003072 erase cycles done, took 1165647 mi=
lliseconds (1165 seconds)
[16497.275516] mtd_torturetest: 00003584 erase cycles done, took 1165801 mi=
lliseconds (1165 seconds)
[17663.120327] mtd_torturetest: 00004096 erase cycles done, took 1165835 mi=
lliseconds (1165 seconds)
[18829.000457] mtd_torturetest: 00004608 erase cycles done, took 1165871 mi=
lliseconds (1165 seconds)
[19994.773017] mtd_torturetest: 00005120 erase cycles done, took 1165764 mi=
lliseconds (1165 seconds)
[21160.463390] mtd_torturetest: 00005632 erase cycles done, took 1165681 mi=
lliseconds (1165 seconds)
[22325.979282] mtd_torturetest: 00006144 erase cycles done, took 1165506 mi=
lliseconds (1165 seconds)
[23491.261117] mtd_torturetest: 00006656 erase cycles done, took 1165273 mi=
lliseconds (1165 seconds)
[24656.408780] mtd_torturetest: 00007168 erase cycles done, took 1165138 mi=
lliseconds (1165 seconds)
[25821.714340] mtd_torturetest: 00007680 erase cycles done, took 1165296 mi=
lliseconds (1165 seconds)
[26986.890994] mtd_torturetest: 00008192 erase cycles done, took 1165167 mi=
lliseconds (1165 seconds)
[28151.902202] mtd_torturetest: 00008704 erase cycles done, took 1165001 mi=
lliseconds (1165 seconds)
[29316.726816] mtd_torturetest: 00009216 erase cycles done, took 1164816 mi=
lliseconds (1164 seconds)
[30481.418017] mtd_torturetest: 00009728 erase cycles done, took 1164682 mi=
lliseconds (1164 seconds)
[31645.981594] mtd_torturetest: 00010240 erase cycles done, took 1164554 mi=
lliseconds (1164 seconds)
[32810.300968] mtd_torturetest: 00010752 erase cycles done, took 1164310 mi=
lliseconds (1164 seconds)
[33974.410349] mtd_torturetest: 00011264 erase cycles done, took 1164099 mi=
lliseconds (1164 seconds)
[35139.050210] mtd_torturetest: 00011776 erase cycles done, took 1164630 mi=
lliseconds (1164 seconds)
[36303.022338] mtd_torturetest: 00012288 erase cycles done, took 1163963 mi=
lliseconds (1163 seconds)
[37466.787286] mtd_torturetest: 00012800 erase cycles done, took 1163756 mi=
lliseconds (1163 seconds)
[38630.303651] mtd_torturetest: 00013312 erase cycles done, took 1163507 mi=
lliseconds (1163 seconds)
[39793.428639] mtd_torturetest: 00013824 erase cycles done, took 1163115 mi=
lliseconds (1163 seconds)
[40956.256751] mtd_torturetest: 00014336 erase cycles done, took 1162818 mi=
lliseconds (1162 seconds)
[42118.613025] mtd_torturetest: 00014848 erase cycles done, took 1162346 mi=
lliseconds (1162 seconds)
[43280.857584] mtd_torturetest: 00015360 erase cycles done, took 1162235 mi=
lliseconds (1162 seconds)
[44442.698340] mtd_torturetest: 00015872 erase cycles done, took 1161832 mi=
lliseconds (1161 seconds)
[45603.874380] mtd_torturetest: 00016384 erase cycles done, took 1161166 mi=
lliseconds (1161 seconds)
[46764.711606] mtd_torturetest: 00016896 erase cycles done, took 1160828 mi=
lliseconds (1160 seconds)
[47925.129542] mtd_torturetest: 00017408 erase cycles done, took 1160408 mi=
lliseconds (1160 seconds)
[49085.138462] mtd_torturetest: 00017920 erase cycles done, took 1160000 mi=
lliseconds (1160 seconds)
[50244.865052] mtd_torturetest: 00018432 erase cycles done, took 1159718 mi=
lliseconds (1159 seconds)
[51404.290447] mtd_torturetest: 00018944 erase cycles done, took 1159416 mi=
lliseconds (1159 seconds)
[52563.613492] mtd_torturetest: 00019456 erase cycles done, took 1159313 mi=
lliseconds (1159 seconds)
[53722.606963] mtd_torturetest: 00019968 erase cycles done, took 1158984 mi=
lliseconds (1158 seconds)
[54881.250300] mtd_torturetest: 00020480 erase cycles done, took 1158633 mi=
lliseconds (1158 seconds)
[56039.484560] mtd_torturetest: 00020992 erase cycles done, took 1158224 mi=
lliseconds (1158 seconds)
[57197.368672] mtd_torturetest: 00021504 erase cycles done, took 1157875 mi=
lliseconds (1157 seconds)
[58354.655187] mtd_torturetest: 00022016 erase cycles done, took 1157276 mi=
lliseconds (1157 seconds)
[59511.394870] mtd_torturetest: 00022528 erase cycles done, took 1156730 mi=
lliseconds (1156 seconds)
[60667.796448] mtd_torturetest: 00023040 erase cycles done, took 1156392 mi=
lliseconds (1156 seconds)
[61823.590801] mtd_torturetest: 00023552 erase cycles done, took 1155785 mi=
lliseconds (1155 seconds)
[62979.570519] mtd_torturetest: 00024064 erase cycles done, took 1155971 mi=
lliseconds (1155 seconds)
[64134.611033] mtd_torturetest: 00024576 erase cycles done, took 1155031 mi=
lliseconds (1155 seconds)
[65287.943710] mtd_torturetest: 00025088 erase cycles done, took 1153323 mi=
lliseconds (1153 seconds)


-- =

Mickael Chazaux
Software Engineer
Tel : (33) 476 042 006
Fax : (33) 476 042 001

ETIC TELECOM
13, Chemin du Vieux Ch=EAne
38240 MEYLAN
Tel: 33 4 76 04 20 00
fax : 33 4 76 04 20 01

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
