Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE9C54EED
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmDSypIacQpUZuIi54lCNmjdf3PXrmsOWCP6/L7k8pU=; b=mbXNsWH89Xdbwi
	WStORDNCUX6CP8VPsZ+US9EnPEQz7t+zGAfT6RzpEjGMhO9Msxe+tIvpHMt4v3tWHAqyf4bl8e0Zg
	yLb5wOXG86RSiVm2ozoV3PandjuS52zhAGBe/lNzR2wd6fXymc2IELy4kCvXprRbuTUUd7UYf5lKk
	BkoMiK36rnO5slk3XWSAMYKr95T5me34tgKy+fMbG+f3NXOs83urDsj2NN+g8Eg3NjswUECgUer/w
	7UQY3SJ5if7Xq6ro5aoBpOAm4oHruw3uSt+EkdNqqyYkxgGUlf2xH26K1mWe3Wg1ETwtrOXu4iJZe
	qO765Tlys4LthqTdInhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIhS-003mrk-J2; Tue, 24 Jan 2023 12:46:54 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIhP-003mqM-Bx
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 12:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1674564411; x=1706100411;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=MLPk8wEYjQyqQkXiifuaSZSLGPgO0rBpXws0XqJrbNI=;
  b=Hri1czElHnjzq4jopuiFZiX8vOORilZ5H1uK0lSytHFlKaKSGr2fOKeO
   QT9uxl6+p809dgTuBproZ5AMcjr+O3LVFzqIp7wDrkDmNGiQOm6of/La5
   cVzsrbSALH/ZyjP7Q1uOVZ0q/vkJ/6s/XH4uvJVtowfEtlEPVzrAO/EEL
   s=;
X-IronPort-AV: E=Sophos;i="5.97,242,1669075200"; 
   d="scan'208";a="303657576"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 12:38:47 +0000
Received: from EX13MTAUEB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com (Postfix) with ESMTPS id 7DADD4133C;
	Tue, 24 Jan 2023 12:38:45 +0000 (UTC)
Received: from EX13D34UEB002.ant.amazon.com (10.43.60.92) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Tue, 24 Jan 2023 12:38:45 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D34UEB002.ant.amazon.com (10.43.60.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Tue, 24 Jan 2023 12:38:44 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.45 via Frontend Transport; Tue, 24 Jan 2023 12:38:43 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id C99CD20CD7; Tue, 24 Jan 2023 13:38:42 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Mike Williamson <michael.williamson@criticallink.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: Question about SPI-NOR micron-st.c driver and OSPI devices.
References: <CAHEoWwuK_rZfka+skd=CTBf2mjAFL71HX_qC77rCWcaO+qy-vg@mail.gmail.com>
Date: Tue, 24 Jan 2023 13:38:42 +0100
In-Reply-To: <CAHEoWwuK_rZfka+skd=CTBf2mjAFL71HX_qC77rCWcaO+qy-vg@mail.gmail.com> (Mike
	Williamson's message of "Mon, 16 Jan 2023 08:44:20 -0500")
Message-ID: <mafs0lelsf6p9.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_044651_512603_52CB375A 
X-CRM114-Status: GOOD (  18.62  )
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

On Mon, Jan 16 2023, Mike Williamson wrote:

> Hello,
>
> I am looking at the drivers/mtd/spi-not/micron-st.c file.
>
> I was wondering why the mt35xu512aba_fixups, and in general the patch below,
> were not also applied to the mt35xu02g device entry?  Best I can tell, the
> datasheets for the two parts (same family, different densities) look nearly
> identical and the
>
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2333941.html
>
> I ask because we are having some troubles with the mt35xu02g and I am
> wondering if we need these fixups to run reliably in octal mode.

When I wrote the patches for Octal DTR support on MT35 flash family, I
only had the mt35xu512aba flash on me. And it was a new feature so I did
not want to add it to a flash I could not test, and risk breaking it. I
figured if someone really wanted Octal DTR support on the 02G part, they
can populate the fixups and test it themselves.

So this is what I suggest you do as well. Add the fixups, test it out,
and if it works, upstream the patch. While you are at it, perhaps also
convert it to use the PARSE_SFDP flag. See db391efe765c ("mtd: spi-nor:
spansion: Remove NO_SFDP_FLAGS from s28hs512t info") or a30f53d8bc0f
("mtd: spi-nor: issi: is25wp256: Init flash based on SFDP") for example.

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
