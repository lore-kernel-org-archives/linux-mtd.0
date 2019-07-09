Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7617BC606B0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 07:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FDA21537
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 07:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UgLOnpCb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="P+nWViIi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FDA21537
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XAkVgotkt4aAzq0N0MDPeONK67+QypPvs1KBly4bD2U=; b=UgLOnpCbx29CO7V8emZ8/OqbW
	O7qr9haqLxXaWD66BSqsO+978HHubos01dDYxMwC0WoO0CH/+3xxXxHY3T3Es8+pyXMkwnuLVYhwM
	aW1TR6OsRVQFLbfToa1Rc3YoSTFOkWdJPVxcxy7S/aVpM2MtFEDraUZDeQW/O0F03Fb6A6+ovZIHl
	5W4MiueH9HiRA328+E0/TeBxdA4OnI9fOh+rT9AqIYbj3YbKs6ij4qwCom32nCT28tEPGx2kChXFn
	d4ecGaFXDtCuKNrfYwYyZm2P2HRIk8fZsis0vAeoQEPYRNe08mQPB+FI9FfFnW+wKzPQ92QhxIEl6
	VtpTd0lig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkktm-0000iP-5k; Tue, 09 Jul 2019 07:50:50 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkktj-0000hr-38
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 07:50:48 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x697fIMC005989; Tue, 9 Jul 2019 09:50:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=/DmdBFluf3TNNYk0EQ5Y03piO+O0zI/xncWXtOGKcac=;
 b=P+nWViIidUmuppObGmoj4H4VowV9mJSROGx0hIanQdkFgY9X/9Q4mNFhKSYMf129WOWg
 BUnGr/00pT5Q8nB2AfajhXVLGc41p5UNbuDGArY3UWqg6E/rxIDuZFRyKiiars0JUQ05
 Fpd/mYHI/4OrsAdGMX6uEAO04FGUNlXbvJZF1Iu4UHOGorgaBmPf2nZ8aPcRANomMvc1
 l8xRc7P+xfONcOulMYA8ww5z9yNu+jvJ5Lzk4tvP0pDT66y/xZs84Q6nzcJnYSRCxuS4
 RI+cg9ipLGn6KJcwsKFpAY4epJrvhq/247/r7iD6yRkkATQQD3LNI9VMAcwmdnQ6FPR4 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh511qy7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 09 Jul 2019 09:50:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E23D34;
 Tue,  9 Jul 2019 07:50:28 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDEC228B4;
 Tue,  9 Jul 2019 07:50:25 +0000 (GMT)
Received: from [10.201.23.29] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 9 Jul
 2019 09:50:24 +0200
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: avoid warnings when building
 with W=1 option
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
 <20190701091128.4e67f1de@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <13d30ef8-b649-6416-3814-35a53c5c09ce@st.com>
Date: Tue, 9 Jul 2019 09:50:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701091128.4e67f1de@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_03:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_005047_612292_6012DF22 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzEvMTkgOToxMSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBDaHJpc3RvcGhl
LAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3Jv
dGUgb24gRnJpLCAyMSBKdW4KPiAyMDE5IDE2OjQzOjA5ICswMjAwOgo+IAo+PiBUaGlzIHBhdGNo
IHNvbHZlcyB3YXJuaW5ncyBkZXRlY3RlZCBieSBzZXR0aW5nIFc9MSB3aGVuIGJ1aWxkaW5nLgo+
Pgo+PiBXYXJuaW5ncyB0eXBlIGRldGVjdGVkOgo+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0z
Ml9mbWMyX25hbmQuYzogSW4gZnVuY3Rpb24g4oCYc3RtMzJfZm1jMl9jYWxjX3RpbWluZ3PigJk6
Cj4+IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jOjE0MTc6MjM6IHdhcm5p
bmc6IGNvbXBhcmlzb24gaXMKPj4gYWx3YXlzIGZhbHNlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9m
IGRhdGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KPj4gICAgZWxzZSBpZiAodGltcy0+dHdhaXQgPiBG
TUMyX1BNRU1fUEFUVF9USU1JTkdfTUFTSykKPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
ZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+PiAtLS0KPiAKPiBBcHBsaWVk
IHRvIG5hbmQvbmV4dCwgdGhhbmtzLgoKSGkgTWlxdWVsLAoKQWZ0ZXIgZmV0Y2hpbmcgbmFuZC9u
ZXh0LCBJIGRvIG5vdCBzZWUgdGhpcyBwYXRjaCBhcHBsaWVkLgoKUmVnYXJkcywKQ2hyaXN0b3Bo
ZSBLZXJlbGxvLgoKPiAKPiBNaXF1w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
