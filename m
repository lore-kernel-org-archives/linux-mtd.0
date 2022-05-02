Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A0BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 23:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/+fl74dZAqMQ7rmeTmjVB9octHvwPCFZdIk5DEPo78=; b=j6IRxLjkFuWGS1
	iD1DlA2XeD7noWRxGQlRsxHtm2ufDEm1d8bMsnHOYVo43KoC0FjQjDkyanjPFMBJgz0nz9fL+7ovD
	QzFi7BRp9ov+oTwcWdMiZ+4bXGRuDYxmD/IID+dpbcGybcsN/K+6TagEbRsS9uhr9dTEvgsR/uBxK
	ZYowuwRXRTJvV3UXKH6O7p2nn44wv7RErwQHr8aTRDNx3E+Kwy+1fPP3guEZITV7DItKYRNLgi1NH
	oKbIVplc0Seo4tsHTr3cgBzNPsVMXs3hDW6UUgaCWO8KHL9YX1Lqhc+FL6GSxsZ1cD0fNGvwddo8b
	sJYGoQDZCJsWIxCjtRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlfYA-0036j3-1S; Mon, 02 May 2022 23:33:54 +0000
Received: from smtp5.goneo.de ([85.220.129.30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlfY6-0036iV-5w
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 23:33:52 +0000
Received: from hub1.goneo.de (hub1.goneo.de [IPv6:2001:1640:5::8:52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp5.goneo.de (Postfix) with ESMTPS id 1ACB310A1EAA;
 Tue,  3 May 2022 01:33:43 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPS id 6704810A32F4;
 Tue,  3 May 2022 01:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=georgemail.eu;
 s=DKIM001; t=1651534421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eD3IJmtjRnnvs3/Tsqg+HNWlBYtzaJ2YlpvPvtyVYLg=;
 b=lBEEhsYp1mAyq4mPThwfFWfPrPL+447zluFOMmgHTFwldbvz/C23kMtt5DBV/UZE5brRcY
 q5fHvQjVhE2PnXvqRYd5WyOpTT5aeQciz12BiR1ekeM/MymuYCEWvn04aVbHe1Sgaqpuxc
 KBivW+wdAjagtq40e456wjV0I/4LTYfPTVUhwI5dt21/barTj5P3m3kmaWiGGMHDQmGd+R
 7ev7juvvgGqoEPy9cqbjZqAu3zbYucu72I1ssPjrLnXrOOS1+I2i4+st7IyN35hJV6FpfG
 FI2HQOQCnc4bkyqwkabBeUkV/AQRSyV3UUGAiUOE4dnpkMVUOfcD1f02Mm8JUA==
Received: from brot.fritz.box (ip-178-201-230-219.um46.pools.vodafone-ip.de
 [178.201.230.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPSA id B77D610A330F;
 Tue,  3 May 2022 01:33:40 +0200 (CEST)
From: "Leon M. George" <leon@georgemail.eu>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 p.yadav@ti.com
Subject: Re: [PATCH] mtd: spi-nor: support eon en25qh256a variant
Date: Tue,  3 May 2022 01:33:09 +0200
Message-Id: <20220502233310.791565-1-leon@georgemail.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502115227.2435850-1-michael@walle.cc>
References: <20220502115227.2435850-1-michael@walle.cc>
MIME-Version: 1.0
X-Rspamd-UID: 86e12b
X-Rspamd-UID: abfa01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_163350_994421_6433BDB0 
X-CRM114-Status: GOOD (  17.53  )
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

Hello Michael and thanks for your reply :-)

I hope I'm doing this right (replying with send-email).

On Mon,  2 May 2022 13:52:27 +0200
Michael Walle <michael@walle.cc> wrote:

> 8m? It's a 32MiB flash right? So it should be the upper 16MiB?

You're absolutely right. The datasheet calls it the 'higher 128M bank' and
I mixed up the divisors 8 and 16 in my head - glorious!

> So the upper 16MiB never really worked, correct?

Correct. At least for the A variant.
I'm unsure about the no-A variant but I don't have one of those to test.
The information about accessing the higher bank is included in the commit
message just in case anyone wants to work on that.

I could imagine doing an attempt getting the EAR to work but I presume it
makes more sense if somebody with access to the hardware does it properly.

> Do you have the A variant only? Where did you get the SFDP from the
> non-A variant? datasheet?

I only have the A variant - yes - and the part about the datasheet is also
correct.
Sadly, the layout of the SFDP tables is different between the datasheets
but I went through them manually and most of the fields have identical
values.

These are the differences I can spot with my eyes:

        Value          |  address  |   A   |  no-A
-----------------------+-----------+-------+-------
 SFDP and table minor  |    0x04   | 0x06  | 0x00
   revision number     |  / 0x09   |       |
-----------------------+-----------+-------+-------
  param table length   |   0x0b    | 0x10  | 0x09
-----------------------+-----------+-------+-------
 supports 1-1-4 opcode |  0x32@7   |   1   |   0
-----------------------+-----------+-------+-------
  1-1-4 dummy clocks   |  0x3a@0:5 |  0x4  | 0x0
-----------------------+-----------+-------+-------
   1-1-4 read opcode   |   0x3b    | 0x6b  | 0xFF
-----------------------+-----------+-------+-------
  sector type 2 size   |   0x4e    | 0x0f  | 0x00
-----------------------+-----------+-------+-------
 sector type 2 opcode  |   0x4f    | 0x52  | 0xff
-----------------------+-----------+-------+-------


The no-A variant datasheet doesn't list the following address ranges:

  0x10 - 0x1f
  0x54 - 0x63

I guess they'll read as 0xff.


> No need for the Tested-by:. That is already implied by the SoB (unless
> noted otherwise).

I will remove it then.

> Please also submit a SFDP dump, see [1].

Again, I hope I'm doing this right..

Thank you for your valued feedback :-)


kind regards,
Leon

---

$ xxd -p sfdp
53464450060102ff00060110300000ff1c000104100100ff84000102c000
00ffffffffffffffffffffffffffffffffffe520f3ffffffff0f44eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ff353aa50082ea
14d34c6f76b3fffffffff7bdd55c299689ffe850c081ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffff0ef0ff215cdcffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffff003600279f49fffffcebffffffffffff
$ md5sum sfdp
e4078f17a495a38c657f4f39f8851080  sfdp
$ cat jedec_id
1c7019
$ cat partname
en25qh256
$ cat manufacturer
eon


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
