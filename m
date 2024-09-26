Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEEACCFA13
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8s3g7pK4BIYzp49HhoQGSAHVeXyiV34REozi5OXEC/M=; b=fERayJib7enV4s
	VUzXYfPH+OU7ABAbvh4+sZAWbYuKAfitonntUqzM2t+6k8LEA5+eGmaz8FVqVIt/8nYAN/e0RUHB+
	Z0Rao1MYPlBqeDcDZyFqRwS8sMVO3qJoLu3j9FCYQwDZmHI5G1ww+ZCASGyC8GTMWU5MWlhwl7qTm
	p6w96phLZhNz+0MIg3tQ/4Vc3DiNbmri7nFN5M0d49Q0nMcG4T4E6Bl/SrROcNNWcJV0zb+clJaMb
	7dbAuSR25r58fQWEyNbmH8Vid3YawiXPLdamJRAtigbrsh40A9En/K9lxo25ReDceSXBO8YKZ1UNx
	IxfqzdOyJb9GOraaIdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmoB-00000008Ftb-48WQ;
	Thu, 26 Sep 2024 11:37:19 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stmo9-00000008Fsg-11U7
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 11:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=27So1y0Tw3n5pcBmG73qYguDZqInIea/FrfW7bNIYYQ=; b=0lMH6yYGufwT291GnfQL9ss0KO
	Ko9M/L3VppDmvWSJOCi6U0wb0t/4WtNModopiUMIuylJdZZsuI+5Bz5P08MqU9ik4s8L3sEf0ql5B
	PymFOYnc+XoVRI3s7KvGaEvItySpmBkHSjA62c/O7TIVRBrmOdwQL/gUKcbqUW5vYlxopfhH8vwvn
	SEsAloNZWjj8HIsNV0fCwcTIbFLHVPDxjbFND8HdsSjUh73d0bbvAiP3aY+wH8zaJck4HN9vDv+fE
	UdamI+O2YqEoyB12DV2+e0M5hrdQiseBSLdjVcjlYdTc2+T6LefCwMUhIy36PGowOidog3nNADZpC
	5cddSqyg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1stmnz-000AQH-NR; Thu, 26 Sep 2024 13:37:07 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1stmnz-0005VT-1r;
	Thu, 26 Sep 2024 13:37:06 +0200
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
In-Reply-To: <CANeKEMMcZ+Y-f8Kty_4Nk-kRu+F7ZXBbxpAG1Bd_P1vcju1mUA@mail.gmail.com>
	(Erez's message of "Thu, 26 Sep 2024 13:08:59 +0200")
References: <20240920181231.20542-1-erezgeva@nwtime.org>
	<20240920181231.20542-2-erezgeva@nwtime.org>
	<4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
	<CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
	<D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
	<CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
	<D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org>
	<CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
	<87y13ehn6y.fsf@geanix.com>
	<CANeKEMMcZ+Y-f8Kty_4Nk-kRu+F7ZXBbxpAG1Bd_P1vcju1mUA@mail.gmail.com>
Date: Thu, 26 Sep 2024 13:37:06 +0200
Message-ID: <8734lmhcil.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27410/Thu Sep 26 11:30:46 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_043717_306191_74040ED3 
X-CRM114-Status: GOOD (  18.42  )
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

> On Thu, 26 Sept 2024 at 09:46, Esben Haabendal <esben@geanix.com> wrote:
>>
>> Erez <erezgeva2@gmail.com> writes:
>>
>> > On Mon, 23 Sept 2024 at 18:19, Michael Walle <mwalle@kernel.org> wrote:
>> >>
>> >> > > > I would gladly remove the obsolete mx25l12805d.
>> >> > > Why? I don't see any need for that.
>> >> > Maybe because we do not want compatibility table?
>> >>
>> >> I don't get this? Anyway, we do not remove support for older
>> >> flashes for no reason.
>> >
>> > I did not insist, you asked.
>> > Macronix stopped selling these chips 15 year ago.
>> > How long do you want to support old chips?
>>
>> It is not unusual for embedded products to have a support span of more
>> than 20 years. And chips such as these flashes might not be entirely new
>> when the product is introduced. So dropping support for SPI-NOR flashes
>> that are newer than 25-30 years is definitely a risk. Somebody out there
>> might not be able to upgrade to latest kernel versions anymore, which is
>> not a position we should put anyone in. With the increasing pressure to
>> upgrade product for better security, we definitely should not make it
>> more difficult to run newer kernel versions than absolutely necessary.
>
> I do not insist. Nor send any patch in this direction.

I did not say or imply that you did any such thing.

You asked an open question, and I gave my response. Nothing more,
nothing less.

> Each project can define the extent of backward compatibility.
> In terms of compilers, linkers and tools, i.e. build environment.
> In terms of standards like the C standard we use.
> In terms of network protocols.
> And also what Hardware do we support.
>
> There is no harm in asking where the boundaries are.
> All projects move their boundaries all the time.
> The Linux kernel is no exception.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
