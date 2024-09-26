Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F7CCF9E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 07:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV2E9/+4zTp/5d1vPDz8BLBBnsgGzgcVquwz+Cl4Y2c=; b=dZwwdZlQwGD/o0
	2EqrNn4Jc9zaZQMMu7fsGMSZuhyh4ihCx8z2VM0gi0f2qUJfNTPsnFQHnxezpS3WgIgXQgz5qZGeA
	lxtYUhaIIIIOqAaXTNguu1KsI4fyf4NrFDZROSW1Dpsq8Tv8gWtqjp1prthoJ6xmXwkFeEral0J//
	G9wz3D7cYBe2Je1puyvZbpXMm0T64qLInRl/vkoNYRo/lM0aXHF23cuVUrrrYHU+umD1dvGALBQMI
	k8q3O1eTf3VjiqnIsGQ2DAtMwU0Y6B8eHw1jIQinNPr7U/nnlLBvwbmECHeoMzlck9VO4VnHSRbPI
	q609dJO87lUkzZ4miSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjJu-00000007b1t-2xLv;
	Thu, 26 Sep 2024 07:53:50 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjCw-00000007Z2N-40Bt
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 07:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=k5daxyw5dgBcLX3lcS28REaQRjV+ba1N+8xCEP6hh7U=; b=qJ1T80ooP1ors58dxzYmUWDqVU
	+BgnE9C3YJP5aeFtokGXmaaiSUMxx4p2hycsji/zKjwvXpCvCmpMcWNFAS40k/Ler5dgdKfOx7WS1
	0exRRVt+O0O44XCxY4llRJwjaD2PiPlB04FE9BXQO1CyWzTNgDSjHKY82rzI4LyleTrCnvu2fhOfm
	28FaLj8Nv3xcuct4jRHOrWy69vuWiMy3p4Y0QdSl+gP2isAMVrl4pcBLZ1NrWqm463139oLVWRUqI
	0Y/TmERury7vcQ6EdNiHt+IiNbJeHBFLO03RZaL4AgduMjP71MNd7PGFfMcQDWZEnOsc6OBqx7m0B
	tg1BQO3g==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1stjCo-000Kzy-Tl; Thu, 26 Sep 2024 09:46:30 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1stjCn-0001Ra-2f;
	Thu, 26 Sep 2024 09:46:30 +0200
From: Esben Haabendal <esben@geanix.com>
To: Erez <erezgeva2@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Erez Geva <erezgeva@nwtime.org>,
  linux-mtd@lists.infradead.org,  Pratyush Yadav <pratyush@kernel.org>,
  linux-kernel@vger.kernel.org,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  devicetree@vger.kernel.org,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
In-Reply-To: <CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
	(Erez's message of "Mon, 23 Sep 2024 18:31:04 +0200")
References: <20240920181231.20542-1-erezgeva@nwtime.org>
	<20240920181231.20542-2-erezgeva@nwtime.org>
	<4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
	<CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
	<D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
	<CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
	<D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org>
	<CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
Date: Thu, 26 Sep 2024 09:46:29 +0200
Message-ID: <87y13ehn6y.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27409/Wed Sep 25 11:17:07 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_004639_050874_710F23EF 
X-CRM114-Status: GOOD (  13.48  )
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

Erez <erezgeva2@gmail.com> writes:

> On Mon, 23 Sept 2024 at 18:19, Michael Walle <mwalle@kernel.org> wrote:
>>
>> > > > I would gladly remove the obsolete mx25l12805d.
>> > > Why? I don't see any need for that.
>> > Maybe because we do not want compatibility table?
>>
>> I don't get this? Anyway, we do not remove support for older
>> flashes for no reason.
>
> I did not insist, you asked.
> Macronix stopped selling these chips 15 year ago.
> How long do you want to support old chips?

It is not unusual for embedded products to have a support span of more
than 20 years. And chips such as these flashes might not be entirely new
when the product is introduced. So dropping support for SPI-NOR flashes
that are newer than 25-30 years is definitely a risk. Somebody out there
might not be able to upgrade to latest kernel versions anymore, which is
not a position we should put anyone in. With the increasing pressure to
upgrade product for better security, we definitely should not make it
more difficult to run newer kernel versions than absolutely necessary.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
