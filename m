Return-Path: <SRS0=nDBX=5X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B5CC2D0EC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 20:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D953E20730
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 20:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RV3kuzoL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="VeQFszYj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D953E20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0ysw2YdXgQPoPQuBYvUSj5hLkfrkyG2nmUqvSD6cXw=; b=RV3kuzoLby2jt6
	9bExEkH4u06nbB4TrxvOv7rcmqUUaRZOlST+shkknJHeuXnCjr9hFJHNn1X+BHO49ak37Po4A48D/
	at6XpUkMQd/At0HVd1u+rAZgou0+IOMcd2awZXgnkEaumKremOvttdRylO77DtYbi+Q+CND4CFBjs
	DuVBupQTrKDsfPVxdwlOCBJQct39bCa/6oYbWvb5D7mUAd2hnnhvi19m/8b9awlFBqUik9mSAB6Rf
	wCp1oJNgYJ6LYEIJWbMUoE4P5qEul61lbL3BlTFvrgS+6kV7Yd35xa0xCXJo5lCqaURq5758z8dYu
	b07LbRya0JpbPC8w8bTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLv7S-0002Ch-G8; Tue, 07 Apr 2020 20:46:50 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLv7Q-00027D-EO
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2020 20:46:49 +0000
Received: by mail-lf1-x142.google.com with SMTP id s13so3446644lfb.9
 for <linux-mtd@lists.infradead.org>; Tue, 07 Apr 2020 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYeiaFW0jIRycL7RzJEl7jSHt9ArlYmLXlUeJtp1xyE=;
 b=VeQFszYjlAYkSbkwbmGXG2ViWWGTIz59qB+AnhU1NbNvVQhAWNSiJu3jTG4XNkN0l0
 76/lxBrNfDgPrj86JrH0PErarm8piU5W4P6LXKQKYUnYoPtR8+HzTo+5TEJGoEUZnt3S
 Tg90+EDFhpKoqiuBQsDm78olxusZ7bZSpoAfV7oaOzGgE0CodytfLIaue6nqoavOTusi
 Ap4sMxlnSH0la7o/78QSLwPaGhgePvfJacIIdug6sViDqxG6Dthz+6m6KQRV/FCI273Q
 T4q/DW+CPqOrlW7IFin15fmb/EXUoG67rKNcpPXiU8M5dM2uptFIPxQFFWOgQTFi0ka7
 sjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gYeiaFW0jIRycL7RzJEl7jSHt9ArlYmLXlUeJtp1xyE=;
 b=b3xPUrOD9n6mkuVJ25UOglfQSMBri3drsAr4N21ngo+lV4E/9eC98vID99ct+1e+TL
 tL/u2PfOJyUA/DXZxmelw5OpIfKoZaOqnPF2vMG2/SDGSCPmGhLyMjhgrryTrZ35PA5h
 B8SN2bgQVe8Jq04c4bPd8aN0349m1AFXSNbn1PL5VherCc6Adib7eI6nZkrGPLJBopmU
 V+4T3xMlv7ZUAvXe/v8OfWJdSH9EKtkjl+d8tdC0NH1Pq4C5Fv2YDE1SqChY2ZWuivOC
 15ZP448MEtnlsqugBg2Bu396UpFzQXwgSs56m7JZE5RnjiF9W3bP1Kd2lNiPBEY3frLH
 w+kw==
X-Gm-Message-State: AGi0PubThTp3GKOpJWg8au3Lc6WfUTmEaZmOOF8lac1iNYRtIQaW+iKp
 RkY7Mky65Rpl2KVf7Qud+pwE2RCcYJo=
X-Google-Smtp-Source: APiQypIpoJbbrddWATqqsHoGmJBejuWrU/BQXTOli87I+xPRU3dE131wWyfKdKPErk9DrE3U9jlrtg==
X-Received: by 2002:ac2:4342:: with SMTP id o2mr2460512lfl.195.1586292404842; 
 Tue, 07 Apr 2020 13:46:44 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44c8:4ead:6627:2c4b:d1ac:b6e2])
 by smtp.gmail.com with ESMTPSA id a6sm13924512lfl.5.2020.04.07.13.46.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 13:46:44 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: move #define SPINOR_OP_WRDI
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
References: <a191e8f4-6953-4c84-6e45-204dea079bd7@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <b49e9767-036d-e6b2-5bf9-986d7aa58fc1@cogentembedded.com>
Date: Tue, 7 Apr 2020 23:46:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a191e8f4-6953-4c84-6e45-204dea079bd7@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_134648_485443_57CAA7DA 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04/07/2020 11:39 PM, Sergei Shtylyov wrote:

> The write disable (WRDI) opcode is not really specific to the SST flashes
> (anymore?) -- move the #define to the main opcode group, just after WREN.

   Oops, I moved #define but forgot to update the description... :-/
   Will recast...

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
