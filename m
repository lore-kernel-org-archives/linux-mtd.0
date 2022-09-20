Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9940AC6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbxHTbzMdlXfmBuyzsu/SVL2+KqGglc86/fcndEH/ZE=; b=SORWjSOEy1TIvc
	14O/QnzBjlfLvgx6RLntJnzgZfjn441AEOAXd9jXPwF8HborucXhBJiKe/pMDos3WSTYY6NqQYZNM
	NjGhrvjGojGF2Lr80+wpWHH7SWP1GnOjhwufw8cMJsRKdEK7cwtKPLhK93YyxLdhjG+A/dPD6TnoQ
	PGo4G+8fJ465XF0/ZhTswwVZwHa9NiR/zuFM6sgu67VVkxmjikO84uzfhq15RtWyFll4JFd21n5dd
	hpD7+QQS5kwrfQHH93xqpLyiOJZecpo960ujiSpp2eX7fxucv69/OPfFcav4gXYVu3ENumo4ZLmT4
	tI0ACI2J7Jih0Jt4tKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiMy-005rZA-6B; Tue, 20 Sep 2022 18:53:20 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiMn-005rUc-KZ
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 18:53:11 +0000
Received: by mail-oi1-x236.google.com with SMTP id u131so4927283oie.5
        for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2022 11:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NQSp04YXkI8Lt5/3SrP2Re4/jE+TRLZY4RvOoW+1RS8=;
        b=PG/CqIvz8CUj25Csqo/zQ1Vw3RziRi6Mw9dmoSRn37M+03Oj9GZrd/CVOnioh9DFA5
         Y0Q1zG1l2rC9OVIVfoWaKV2tNR9x1U2L0q8PO91prw6t2BAAfXIcgssiZHI1mM1H6Qgi
         rJsFXFzw7uF6GMd1rNcC2KQDr5j9aWQPhfxtzxORZsXH0DLBjErBcEp1l4Yq8kqfvWED
         y1K5zeZPWb3VHniyvT/rp5ZQZVJOhL8UKRaS1Wx/3w6xcp5VoF0suIjmeWp9XI3WSH39
         r8UUDZhsX1rSdRr24u6s+C3Ecunb8ALKYwLizTZJJGr0i4LqLK8WI8bJYDSrojDlpsqb
         2RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NQSp04YXkI8Lt5/3SrP2Re4/jE+TRLZY4RvOoW+1RS8=;
        b=OiJdKQXcyDz85+5s+y+25X+T5X+mNUeDbBbH+jAKuAbkoR6iccYqgtafGC7LiflRDr
         w+eW5SpYEZV6ws0i+3aPE47NkphATf5cl+iZFreRDG8hJDNJL+fy8sf0GsvfmyKJRYN/
         UWl6u3tppFWjhDZmkKhsZKK3QY0IekQBQ0OtzWf8RK7oDVV+9rxlGDyUiCBe/Bgp6I7G
         B2MeYcBuG14z9/h38LKLAJxfUwEA/8ImLdgfi4uSMXf3oDOutpfV3JANlXSFm2Wf62q/
         kFyj+4tq9m1KOEA6f2c3NWiXkzFG76I7l5i0NfDEmzr6/D+oqUiIPPlR3vkXwEH/Sa4o
         h7KA==
X-Gm-Message-State: ACrzQf2jE6R5qxHL8UBg4ckKIIA1Cq/devywNA2W/suiGKzrZT/H8v88
	agGjp0uwu/FS0T61slUqgsbqEAQ8nPjwbL0rFRb6oQ==
X-Google-Smtp-Source: AMsMyM5zU9rZvOZ0lJNvR3G0TS5hmBY1MdBbNjW0HVale+YxMne+zYZy+LgmwoIa+yEamOKbcWKsAAZncI+d9m1lYpM=
X-Received: by 2002:aca:35d6:0:b0:34f:bb2a:4f5f with SMTP id
 c205-20020aca35d6000000b0034fbb2a4f5fmr2281456oia.54.1663699987658; Tue, 20
 Sep 2022 11:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com> <20220920184808.44876-2-sudip.mukherjee@sifive.com>
In-Reply-To: <20220920184808.44876-2-sudip.mukherjee@sifive.com>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Tue, 20 Sep 2022 19:52:56 +0100
Message-ID: <CAHyZL-ch=mr0x_19e6P9G+Z4sW2iJXW9nTnXUNAhn+pTptN2ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add SFDP fixups for Quad Page Program
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com, jude.onyenegecha@sifive.com, 
	william.salmon@sifive.com, adnan.chowdhury@sifive.com, ben.dooks@sifive.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115309_725046_5F03B3ED 
X-CRM114-Status: GOOD (  12.03  )
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

On Tue, Sep 20, 2022 at 7:48 PM Sudip Mukherjee
<sudip.mukherjee@sifive.com> wrote:
>
> SFDP table of some flash chips do not advertise support of Quad Input
> Page Program even though it has support. Use flags and add hardware
> cap for these chips.
>
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> ---
>
> Change from v2: SPI_NOR_QUAD_PP added to info->flags instead of
> info->fixup_flags.
> Link: https://lore.kernel.org/lkml/498c33a8-014f-e542-f143-cba5760fafdd@microchip.com/
>
> Results from the tests given by Tudor in the following mail.

Test result after this patch:

# dd if=/dev/urandom of=./qspi_test bs=1M count=6
6+0 records in
6+0 records out

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug erase /dev/mtd4 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# sha1sum qspi_test qspi_read
fefab5ffbc2ca7bed3b45732f2fe6a8139cd6248  qspi_test
fefab5ffbc2ca7bed3b45732f2fe6a8139cd6248  qspi_read

# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
is25wp256

# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
9d7019

# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
issi

# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff9d05010380000002ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0f44eb086b
083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
11cecccd68467a757a75f7aed55c4a422cfff030faa9ffffffffffffffff
ffffffffffffffff501950169ff9c0648fefffff

# md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
ba14818b9ec42713f24d94d66bb90ba0  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp


-- 
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
