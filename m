Return-Path: <SRS0=LI9S=HF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A79AC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:53:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED56664DF8
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED56664DF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=566bPWLfugFV39qrTCm5H7JtcWeo4LHQ1o6jdX0eewY=; b=hE9Wrde6UZDY+5OKNGsILK4lG
	UlrAaSJGZviqbRr3G5r+4OTuAyihoC0sP4uTQ/LxjfstbjvyiYk7X6lEDp650yatCDZuSYiqvpbMZ
	sGFc7ph+iDsRWzAFW7uhUfDHWsvId/u+i00+ngOoB9WNDN0KejgugYkguIXeugvfrtVMhicxWlxjs
	XOVa7EoBCqzsMpm5FG4p0oyHDogOwqDJ4p62nzWHf+wH3RQfvA/nL3i/eHowZmKh7ku5mgqPoPV7P
	VV8m9Z80uk2M24BaWSh4sItkFU6lcnu0HRo4Er0SLulctWDfI/y9r3BZfBEzOpWDixXOAA8dQNN8a
	LrhQPsYQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7FmI-0006y5-OY; Wed, 03 Feb 2021 10:52:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7FmF-0006xP-Lu
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2021 10:52:52 +0000
Received: by mail-pg1-x52a.google.com with SMTP id j2so15429338pgl.0
 for <linux-mtd@lists.infradead.org>; Wed, 03 Feb 2021 02:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=p3o0sLDAxz/W/SPP1XvuN5vOHHS8YIT9o0J8SbVCzPU=;
 b=W+4qYUqcIh38GzlEXekPSBK0jKJUGEAF+x3oEj1qvsDJyIdJCyVzcNlQ8qPkQZfa2f
 xsIU70exVuHxfOi+9bKpTjCutEsgBJx0yE9DHMt6PqDdAPO4ZytJQrHAq3/F3tlOJg7T
 mny54zCXL60z3U7jmXvxgA1TqpvVZeUJGNJX2b9Z+ZKGpyr0YQo0TZMir22j2UcPjFxI
 sTOHe8OC9dXMpZPCKVgEfoXWRyDgECs0by/ROKZFgrrOtBTa5yLVc8Nj+jEvxn2+QijJ
 DLF1g/Cg2OQxmYywTx0n/VxaOduTn92UMj1ZlHmrdaM0jh3Q+J41j9hT/KNVaP52bIEH
 HAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=p3o0sLDAxz/W/SPP1XvuN5vOHHS8YIT9o0J8SbVCzPU=;
 b=Scl9Z2s+U6V3sjv67MJwptX1WGP4SVgmCfi1XlD/CIptPqJU/sGodwZE/S1mqnJiqN
 y4axNoVbF7love/TzqPU1W2b0mzZbz40lFMLw1TrHRtdEr7+uTAGAzVmB1Ll+H3PLqOc
 fDcin3pARQKmzhOhrZB5ugXYTKJdfaDWFktb2gc+pgmQi+1jhgNW86LLIgr46HMs6hYd
 Nlh6OSdMCsVSYbyVC9qfoTqS5IFNAPVArFNja2pwh9DDRHFEV4TNE1X4T60pV+CSO3Yy
 U++Vb0O/YmBgymiAdz5xnD/J2r7yS/GF9O5g0d6ac2w/yDEVNvsGjZ6flb3+YaqPxTd3
 lT0Q==
X-Gm-Message-State: AOAM5337Tlq2vtBay+/0abNWbjTZI5osoIs+9qL0djEeTv4Xr3fsU0jT
 rkEucjpfL2MpsEUTfK/+Z7Tq
X-Google-Smtp-Source: ABdhPJzf5nDeWWg+gxoU7O5XqypjGXLwFZUdDgdnQHTCPf3Z/9XBQTN9ihVdCQS1qn8/Rf37ob5DhA==
X-Received: by 2002:a62:ae0c:0:b029:1bc:a0b9:f0aa with SMTP id
 q12-20020a62ae0c0000b02901bca0b9f0aamr2525847pff.78.1612349569452; 
 Wed, 03 Feb 2021 02:52:49 -0800 (PST)
Received: from ?IPv6:2409:4072:619f:ff99:700b:51f3:e28:b00?
 ([2409:4072:619f:ff99:700b:51f3:e28:b00])
 by smtp.gmail.com with ESMTPSA id a12sm1772842pjs.53.2021.02.03.02.52.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 02:52:48 -0800 (PST)
Date: Wed, 03 Feb 2021 16:22:42 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20210203111914.1c2f68f6@collabora.com>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work>
 <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
 <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
 <20210203111914.1c2f68f6@collabora.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
To: Boris Brezillon <boris.brezillon@collabora.com>
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_055251_839418_8F01C9F8 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: vigneshr@ti.com, richard@nod.at, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3 February 2021 3:49:14 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>On Wed, 03 Feb 2021 15:42:02 +0530
>Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
>
>> >> 
>> >> I got more information from the vendor, Telit. The access to the
>3rd  
>> >partition is protected by Trustzone and any access in non privileged
>> >mode (where Linux kernel runs) causes kernel panic and the device
>> >reboots. 
>
>Out of curiosity, is it a per-CS-line thing or is this section
>protected on all CS?
>

Sorry, I didn't get your question. 

>> >
>> >Ok, so this is not a chip feature but more a host constraint.
>> >
>> >In this case it would be a good idea to add a host DT property which
>> >describes the zone to avoid accessing it. Something like:
>> >
>> >	secure-area/secure-section = <start length>;
>> >
>> >From the core perspective, we should parse this property early
>enough
>> >and return -EIO when trying to access this area.
>
>FWIW, I'm not sure making it part of the core is a good idea, at least
>not until we have a different platform with a same needs. The
>controller driver can parse it and return -EACCESS (or -EIO) when this
>section is accessed.

Fine with me. 

Thanks, 
Mani

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
