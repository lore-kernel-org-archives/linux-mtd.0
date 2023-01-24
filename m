Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EECC25B4E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFyeSZELBGJppQNkqgCh/mbilfv062gGjRQf3X8dZJ4=; b=WmDZmnDj7fojii
	h2LaVulhHiewI6CcWJ2kT+uKtixDxnu5qaNYOI2IHy3tDtiReWzZ8N/lH5MhusvxkcIG0Pgj/f9Ia
	FrA8OyAlfgAbvWa+HF7QlP/SADaG0c73tpT11CCrZtwwKWLHDSeZEfmCopqMmqH0jja9SFRjSuqrS
	sSLy3rmTxlH5PL3/tw1/gH0HjWRQekx4fNvTF2thywV+QDyfL9f8Fei9PHVcMDGUDuR3LZj/znpn9
	Za/nikQHdS9+O/leglcPx/QuFj587C7SL5we7HC5vBsdzDEGB2jgJqXaVoxhAPpP1FL1GO1RS+ZV0
	dLrlJLRik7ulnJb7q95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJx6-004CUY-Ul; Tue, 24 Jan 2023 14:07:09 +0000
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJrw-0049q2-IW
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 14:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1674568908; x=1706104908;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=4AvKOIRzPhLbzhXbhPzpLZQ31L3Np9S6BHPnavRXgEg=;
  b=BGSfYumOyjxLMj4uo1cpIjpAW7kn4SOlYdtoHV8jDvgUsmvv0smi9xW4
   r1C7lt9gT+JFR3VV5/a6v3XiZkq29+DRjZT4wQPkRWTWKqJquErEtbYHc
   DQ2WCk94xmxiUJ5lIqEMc769snu/N9CTdua6kUwr0i4YhxJujWDba7XKt
   k=;
X-IronPort-AV: E=Sophos;i="5.97,242,1669075200"; 
   d="scan'208";a="174521123"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 14:01:39 +0000
Received: from EX13MTAUEB002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2a-m6i4x-21d8d9f4.us-west-2.amazon.com (Postfix) with ESMTPS id 1EA4B81A27;
	Tue, 24 Jan 2023 14:01:39 +0000 (UTC)
Received: from EX19D011UEB002.ant.amazon.com (10.252.135.4) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Tue, 24 Jan 2023 14:01:37 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D011UEB002.ant.amazon.com (10.252.135.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.7; Tue, 24 Jan 2023 14:01:37 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.45 via Frontend Transport; Tue, 24 Jan 2023 14:01:37 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 48AA920CF6; Tue, 24 Jan 2023 15:01:36 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Mike Williamson <michael.williamson@criticallink.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: Question about SPI-NOR micron-st.c driver and OSPI devices.
References: <CAHEoWwuK_rZfka+skd=CTBf2mjAFL71HX_qC77rCWcaO+qy-vg@mail.gmail.com>
	<mafs0lelsf6p9.fsf@amazon.de>
	<CAHEoWwu+x6jhbZF301HALL9dTAh6-N7u-or8YNQ8_z5q3TLWzg@mail.gmail.com>
Date: Tue, 24 Jan 2023 15:01:36 +0100
In-Reply-To: <CAHEoWwu+x6jhbZF301HALL9dTAh6-N7u-or8YNQ8_z5q3TLWzg@mail.gmail.com> (Mike
	Williamson's message of "Tue, 24 Jan 2023 08:48:00 -0500")
Message-ID: <mafs0h6wgf2v3.fsf_-_@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_060148_749042_88008229 
X-CRM114-Status: GOOD (  35.45  )
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

Hi Mike,

On Tue, Jan 24 2023, Mike Williamson wrote:

> Hi Pratyush,
>
> On Tue, Jan 24, 2023 at 7:46 AM Pratyush Yadav <ptyadav@amazon.de> wrote:
>>
>> Hi Mike,
>>
>> On Mon, Jan 16 2023, Mike Williamson wrote:
>>
>> > Hello,
>> >
>> > I am looking at the drivers/mtd/spi-not/micron-st.c file.
>> >
>> > I was wondering why the mt35xu512aba_fixups, and in general the patch below,
>> > were not also applied to the mt35xu02g device entry?  Best I can tell, the
>> > datasheets for the two parts (same family, different densities) look nearly
>> > identical and the
>> >
>> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2333941.html
>> >
>> > I ask because we are having some troubles with the mt35xu02g and I am
>> > wondering if we need these fixups to run reliably in octal mode.
>>
>> When I wrote the patches for Octal DTR support on MT35 flash family, I
>> only had the mt35xu512aba flash on me. And it was a new feature so I did
>> not want to add it to a flash I could not test, and risk breaking it. I
>> figured if someone really wanted Octal DTR support on the 02G part, they
>> can populate the fixups and test it themselves.
>>
>> So this is what I suggest you do as well. Add the fixups, test it out,
>> and if it works, upstream the patch.
>
> I have tested using the fixups on the 02G part successfully, but we are
> working out of a 5.10 branch TI is providing for a new SOC.  I'm not sure
> when I will be able to test against mainline/next as I don't know the state
> of the SOC drivers (for TI's AM62x).  I know they are working to get them
> in, but I don't think they are there yet.

I think base support for AM62x has been in mainline since a033588ec66b
("arm64: dts: ti: Add support for AM62-SK"), which landed in v5.18. It
might not have all the devices/drivers supported yet but I think SPI NOR
should at least work. So you _should_ be able to boot mainline kernel on
AM62x SK, and you should be able to develop patches for mainline.

But if you only want support for this device on TI's tree then you need to
contact TI for that.

>
> Knowing the motivation for leaving the fixups out is helpful. I have a bit of
> confidence that the patch is likely the right fix for Octal DTR support.
>
>> ... While you are at it, perhaps also
>> convert it to use the PARSE_SFDP flag. See db391efe765c ("mtd: spi-nor:
>> spansion: Remove NO_SFDP_FLAGS from s28hs512t info") or a30f53d8bc0f
>> ("mtd: spi-nor: issi: is25wp256: Init flash based on SFDP") for example.
>>
>
> I will have a look.

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
