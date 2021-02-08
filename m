Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAFFC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 00:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FDD64E32
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 00:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FDD64E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:
	From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qYrNXR3RGpmR85rqBdtOnqIDdU33qzWwoZrxDyYqHKA=; b=KecOyUSRy0cFKKolBxqQhEsFNH
	pP2+yaO5jU1kmF0kP4iXqrHgkO1ic9Dw/mw+eSprz2/IEe6xJt5GxpizSR4WyRb0DLyLEkE/eFRdy
	X3ezF6RT9+jsf9Q7D4LohFcXHqoJbHZAcDY9P1hygAeMlo4YucvqD4lIpvQSPm+bMFfq/C1O7iFRa
	PWn4nQPRqLTORID7z4wLCr6zA22XrkfmPlcgWPU6W8Co5g0eYI+/iCDKtDeF8JpU5H+faU0E1FPMb
	JoLneHn5f5iOSTXNYHa8e+cnzgsl3SpIMe/yx71jpktptdqPsa0lz3915BoECAZ1xmjH1Wjqbft9r
	kIcd/aeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8uNF-0001z9-0z; Mon, 08 Feb 2021 00:25:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8uNA-0001yx-1C
 for linux-mtd@merlin.infradead.org; Mon, 08 Feb 2021 00:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Date:Reply-To:Content-Type:To:Subject:
 From:Sender:Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=22PjdP3HY0tZzoW6pHULZs18Ep/qcWy+gXqf0IurJHM=; b=c6LUX4zaSFVOlnv24f2fAPyZRp
 AlkOJ37618J04Ej4DAC8i4tUUrMOBz6vXsOE3ABEZllnrxgceH7DO/t12YW3+NUtcRg2Bun5Q/vyN
 75e3W/nSJDXWHvEWo7kzi4p/kvD2xb6jGXo9wCk3h6uyhfRp97CmGkPJiWePWpMP412KvepttdbK4
 gRRsqlghV8rLGBcmUHW6NSsoqJTSYj6mk28BlbFsitbFvcUItUN9G9rQNFe2wuan/Cg+smWV98IVM
 GMpD92Q8B2wt8R2XEaLR2Or8CeW/aUbw8s5QimGKikS2vfBG0ApAaFA5ccBOzuvx4EPn5NQYFY6eT
 +/RJx2gw==;
Received: from [209.141.46.27] (helo=50uj302.com)
 by casper.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1l8uN7-005Hwf-9E
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 00:25:46 +0000
From: "Ms. Kim Chan" <mskmchanouk@gmail.com>
Subject: Investment research about your country
To: linux-mtd@lists.infradead.org
Date: Mon, 8 Feb 2021 07:25:45 +0700
X-Priority: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_002546_746000_00DEEF53 
X-CRM114-Status: UNSURE (  -4.78  )
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
Reply-To: "Ms. Kim Chan" <mskmchanouk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Message-ID: <E1l8uNF-0001z9-0z@merlin.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

My name is Ms. Kim Chan Ouk, A Thai citizen in Asian Continent but currently
residing in abroad, I trust this email meets you in good health, I just got
your contact today during a research about your country and I will say that
I foresee success of my future investment ventures in your country. I want
to invest in your country and I would like you to assist me in my investment
my investment Please do reply me as soon as possible so
we can discuss more.

I look forward to hear from you soon
mskmchanouk@gmail.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
