Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DBCC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 07:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEBFF2070A
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 07:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdrDAp6y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="ccGam3ep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEBFF2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8VFdXNYcc5gjvm0f9o2IcQ8zE2G++xT8qw3Yaz7WC4=; b=NdrDAp6ykuPz5H
	Z2qnAL6y+dagg9x4Xrvo/QlyCMWlCyLnUC/d6iVV6eQx4eB312TqDV5MKnA2D9HyeIH3wxL8PSkWZ
	CXlZ48aL5ecnBznovsQrqJHH/XTtz0Jaai9+iJ3SzUTtX2TxgVMKPHazH+eWeGuvPR+7yqovnNH0G
	KTihzg/Rn1umeq51SFyraVT9Mu+6LBeQdoMiVQJ+n3+A1HiF74DARAVIO0SR7K/arb6fQM+Ee2WDv
	bQn+2hO8nG5Kjsfdksqwu/jidvuvL/tV1FlA6Tj6dul3VniVzSItO8Sfs274EyWBn0M7oarUIOJcc
	wrQanglVF3LMbCC4te7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdU77-0002iY-EP; Tue, 26 May 2020 07:35:05 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdU6x-0001z9-Ox
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 07:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=750; q=dns/txt; s=axis-central1;
 t=1590478494; x=1622014494;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hnzThvsVYYdIiLIG2rvlOfVsIHVa0axGoloaRq7hIDg=;
 b=ccGam3ep6ztsJPLr2YwbuEAV1yYQimv0zaWXmsKorIb5PIoSZuQioxMQ
 AzDpdsdd8N1FqJcHqM3lJgkdX29FAzHySdz7apKnSb3oPNGNkbO+sYdRd
 MnzsQTXSkytcUeGG2m4hEi8BGJQD8dvEi+KfUlapM0CFI24MGi/x/ulPm
 RGUec2CjbYNuGI81uv0/xwvfZV68n6t8O0AAC79HfqExBNe4s8QiWjrAA
 SCkr7n7NDYCN+kqjsNz9gGC0Ywws55QXuSWIpahoy1mh2SmiHNPrsOmJS
 3veelzP9gix83o2FHXf2jl6nGtf2lSo2kqcGTyGVcc/+foZPggMTy4MTE A==;
IronPort-SDR: HoilhBUOV4t+w2tEmzPqL7ZvQyoaANeKCM+iwXPi8iFJ8Ea2fnEaOc+8Q8zmJe+2Du48LRU+8A
 raVdQ8DSdWhVnXJTMZplvoMbCefQuY6fSEAB4/hsSxcuPmF+Pq2tnDnJJsOc2MnT8Zn8VCtp+D
 Ly+1lbEbhupY4phKuMF2N5WS+2VsT2oshZw2KOtM/ucKOEiiUh7I7Ze57lUNp+Fe/IF6CSzWvp
 1pxMPVTqiGG57cGA1xLxYAzcZVkElCQLZl9gD+loc6i+t9Ji8KcZom3+APTT8TzirTe/ER01Hn
 fvo=
X-IronPort-AV: E=Sophos;i="5.73,436,1583190000"; 
   d="scan'208";a="8849935"
From: Rickard X Andersson <Rickard.Andersson@axis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: SV: [PATCH v3 1/2] mtd: rawnand: Add and use helper for testing data
 interface
Thread-Topic: [PATCH v3 1/2] mtd: rawnand: Add and use helper for testing data
 interface
Thread-Index: AQHWMqQEy0sjg1hbPEOvI3O4S/DT0Ki45cOAgAEUV2U=
Date: Tue, 26 May 2020 07:34:48 +0000
Message-ID: <1590478488685.19291@axis.com>
References: <20200525145133.8298-1-rickaran@axis.com>,
 <20200525190235.785cee08@xps13>
In-Reply-To: <20200525190235.785cee08@xps13>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_003457_106962_D42E785B 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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
Cc: "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> Actually I think what Boris had in mind was a little bit different. As
> the "preparation series" has not been sent over the mailing list yet,
> if you don't mind, I will drop patch 1/2 which is not needed after my
> latest changes and take your second patch, adapted to the latest
> changes too. I am not taking the ownership of your series, just
> proposing the big picture and provide a more usual way to review the
> patches than a Github branch. Then, I'll might ask you to respin the
> entire series as well if needed.
>
>
> Thanks,
> Miqu=E8l

Sounds good! I just wanted to update my patches as much as possible with th=
e information I had.

BR,
Rickard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
