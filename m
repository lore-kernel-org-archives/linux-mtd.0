Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39B2C27C54
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+Fd/fr53ZC32I2uavQfvR7xMCO40edrpacflvOl7JU=; b=zP0/I3c6thfrWB
	COZ8N1oFWX5HX8sgifOfI7TsR6RxRS/fw3luA2yg1VvxtBjnkMOFGp0cRxHqjIke9Kpt1G7M56LhE
	aE571F+1CHWS7ODfPlsvwoFwoNcJfiFwtectdPVgKICvEvvqUGdQtqmL8mRs8PKNiJmRRUAcKqczB
	jw19yOcjnAqd745bSDChASZ5ibOc8Kpl+Mal+YZR5PKItyFySikb37fI0YWo2OPkfOMJirzlUdFo0
	kvBOAdThORRB4mcf8xytAE1mXlabaiXP+kpmwAfY8d+jOZDLjsadfci61NfiS554klch/s9jW7IBH
	zzKh8DBv3LqT8tZTSLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGnR-0000000AhMl-437R;
	Thu, 06 Jun 2024 17:21:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGnP-0000000AhM4-3aCR
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Jun 2024 17:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uh6hmNB3/hOoQGCh2kYcY8ljw2iK4guW9QdsRKpcjAk=; b=P3MusxBFvxoJhYphupInX8/Pas
	FGurU8jmcHX3AkC0s3+wo4SoJs9MUP7PlDoyDTLbVeH39GmmzaegTz+/KlN1S5XKjj8tKqZXkvQiz
	OL5/4tjPRwXY+4oPbpEnqUQ+ftGNtJpP2P6FeqSYItQCpK+42GsyyNWZIHy2XM9DWlh4Lw+SCvOzt
	5wzOk40uJJ5/0IjzAQaMIQsRFpaTCQgrg9H1fevUhsWYE8qasvRPDGp/LHokILbbIbEHWjkpWF0Ed
	JqDB01uQnptwOthQ1Aal40n6+/BlfYYkVJuFOFKSPiysyxCiM9VgCnGsZc5SMfFTOZ2EysKGOtVrE
	p0Xbg7xQ==;
Received: from www530.your-server.de ([188.40.30.78])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGnN-00000001ff1-09lA
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 17:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uh6hmNB3/hOoQGCh2kYcY8ljw2iK4guW9QdsRKpcjAk=; b=G6JZwJS//bgOQ0onfnj9tl/maL
	Tjc/+1Q2C/xDcPsW4uHMsBPZF6Gtmf/T8YnmluG1Im5xep2rTE3d0vKQbNp+6V5OAlzgA7r0qMFQB
	hRMEHyGmMyYaHHMExZ026+t+kmybyRuQcgb+q2pXD2n/5Am7LahPuf6rWAwXXcb93jRPZfM9H8bt3
	M8RqCFfK3m/cXS7XnpskiFR8/yz2HQpDUn6YrqbG1RY8uL7IP0d40jcTRKVSbFE/HkQwxjkATd8Yz
	m+6FxijHUNXJJBUfSHv8Fjmy5rXaO7FmFFXAyyrKdOf2xwrnXHtkkEPIH6sDjHj+pCLWfxW8eikXC
	+yYH94KQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sFGnJ-0002at-BP; Thu, 06 Jun 2024 19:20:53 +0200
Received: from [80.62.117.184] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sFGnF-000484-1p;
	Thu, 06 Jun 2024 19:20:53 +0200
From: Esben Haabendal <esben@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
In-Reply-To: <48719b0f-1a7f-47f9-948a-c981a0a29b41@linaro.org> (Tudor
	Ambarus's message of "Thu, 6 Jun 2024 15:52:35 +0100")
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
	<20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
	<a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
	<D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org>
	<48719b0f-1a7f-47f9-948a-c981a0a29b41@linaro.org>
Date: Thu, 06 Jun 2024 19:20:52 +0200
Message-ID: <87zfry9edn.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27298/Thu Jun  6 10:30:08 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_182101_092340_2B6A94A6 
X-CRM114-Status: GOOD (  17.91  )
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

Tudor Ambarus <tudor.ambarus@linaro.org> writes:

> On 6/6/24 14:59, Michael Walle wrote:
>> On Thu Jun 6, 2024 at 3:31 PM CEST, Tudor Ambarus wrote:
>>> On 6/3/24 14:09, Esben Haabendal wrote:
>>>> A dedicated flag for triggering call to
>>>> spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP read
>>>> and parse, with fallback to legacy flash parameters, without having dual,
>>>> quad or octal parameters set in the legacy flash parameters.
>>>>
>>>> With this, spi-nor flash parts without SFDP that is replaced with a
>>>> different flash NOR flash part that does have SFDP, but shares the same
>>>> manufacturer and device ID is easily handled.
>>>>
>>>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/core.c | 3 ++-
>>>>  drivers/mtd/spi-nor/core.h | 1 +
>>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index 3e1f1913536b..1c4d66fc993b 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
>>>>  
>>>>  	spi_nor_manufacturer_init_params(nor);
>>>>  
>>>> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
>>>> +	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |
>>>
>>> I don't like that we update deprecated methods. The solution though is
>>> elegant.
>> 
>> I actually had the same concern. But currently there is no
>> non-deprecated way to handle this case, right?
>> 
>> Right now we have the following cases:
>>  (1) pure SFDP parsing
>>  (2) non-SFDP flashes with static configuration only
>>  (3) legacy implementation, where the magic flags decide whether we
>>      use SFDP
>> 
>> Which case is eventually used depends on the ID of the flash -
>> assuming there will only be IDs which either fall into (1) *or* (2).
>> That assumption is clearly wrong :)
>> 
>> I'd propose a new case in spi_nor_init_params()
>>  (4) try SFDP with a fallback to the static flags from the
>>      flash_info db.
>> 
>
> that's not that bad, but I would avoid doing it if it's not common. You
> also have to update the core a bit, you can't use no_sfdp_flags &
> TRY_SFDP, it's misleading. Does it worth it?
>
> I won't oppose too much, but to me it feels that we're trying to keep
> alive a dead man.

Which dead man are you referring to? The legacy implementation or the
old non-SFDP Macronix part?

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
