Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731D4C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2123F6112F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2123F6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8a6ZWXK5dshenmH7kNv6OR/w8W3hqlDJABz7DOgLc9A=; b=h+Bt32/TiYZYNk
	Q1MaYvnx9onDwcz0yXpnA+K6mYpBdjIDUbZemMcW76wL1ymx1u+xr2i10tPGiK67+8iXhAZjTEMKc
	xrfwNOnuXMOtzlnjPzydHz0uZI7gBlbWiQcPjjurW98WFqVYR5TAU3Aa4cYH6VUUAL4aTx4YgtzjQ
	3SkDR/HrsV3HcIKwmQFXKslqlYflphWU3fSlH+QduKnJhSPSCVSiaoB9fNnuaJn92urL+mEc3szPE
	6yDV9T6sY5fSRQj9BnUcop5yRjZFS1A2bxjXEwur4os2aN7vnDDQ4JDD/G87ofqtrSMsqC7PhGaP5
	hvx7Ea+pq3B5O4jPkrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIBIn-00HJ2H-IM; Mon, 23 Aug 2021 14:51:53 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIBIh-00HJ0l-NC
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 14:51:51 +0000
Received: by mail-qv1-xf34.google.com with SMTP id z2so5226032qvl.10
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QRsqCUdecIQyDUmdzjm00knX5936yTUE08R3WGJ50zU=;
 b=gE3OLw/FMkFXWrFW7TDrZ+BRstLICt7d2B7vDHSSmf1v59iAIPWcMq7tOS2CcLZhPr
 BFaKRhzxHcs7Jl101MQY2WAl2h3kOQJmk+mMy3Deo9q32iPKhswhomaeGnPg3ChDozKq
 F+ktlwZn8TpcpnGLdFwxcrUCLGiNuDmsKwOZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRsqCUdecIQyDUmdzjm00knX5936yTUE08R3WGJ50zU=;
 b=sHwcA5cDeEEB1Mz61wB2nJilU6OdrGgF4kOH3nPxhcBMYkF0GAOKjvVCUMZNigswmg
 UeP8i3KT7CJzpwAMtTI2jQ5FPsfZHG0KJP89fZ+V8RWE5WhErHGALBZpTbj8vi6Wy1QT
 3YbpoK5ByFMAEXR5W2pjPryvtiAkY/HYA1JhdNVE6tPwjsgRF0/XOF6Io8cTpL6Mub9P
 IEHtZCP27TDvO8vvDoyuGpPGCTSuVAPrIo4LGe8F2d0BEI8q9cKxoB6yQgR6fyEev8tT
 IyxKNyCrsdoEZOjF6rVGBkhb5JRHcgAgQbVfJv7fLguzzqrTIVdjbJm5zKXjhnZ//tIF
 /ZtA==
X-Gm-Message-State: AOAM533JnwqyNwcqJjLWtAlRdPYgDxpj/slXQUhSmSTJYOyKAjCl0aBO
 4lga5LFnz2qd2cxitqvaedsXEAelm5tmMWxXivluPlmkl314YQ==
X-Google-Smtp-Source: ABdhPJxlM0VZ2mC4VVh00cv0DNfEU3OMam7snlCLcUNb96LkMW8rxChlx6xv5sNnsnZdUonPKtqaPTjeHYyYBmFa8QU=
X-Received: by 2002:ad4:4533:: with SMTP id l19mr14988168qvu.55.1629730306163; 
 Mon, 23 Aug 2021 07:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210811084924.52293-1-daniel@0x0f.com>
 <20210816101143.2a64d7b9@xps13>
 <CAFr9PXnna+b3ChVUftT7YbU1kYR=5JDcik3bMNqzKK-LW=GQzw@mail.gmail.com>
 <20210823162148.35a24183@xps13>
In-Reply-To: <20210823162148.35a24183@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 23 Aug 2021 23:54:20 +0900
Message-ID: <CAFr9PXkSeeHNn-KVyrVxp6RRdLYExTgWpheWKLLSZqEo_EHvRg@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spinand: add support for Foresee FS35ND0*G parts
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_075147_831108_E4D35495 
X-CRM114-Status: GOOD (  15.89  )
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

Hi Miquel,

On Mon, 23 Aug 2021 at 23:21, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> I am not sure to follow, above the software says "3 corrected bf" while

Due to the status being "between 0 and 3 bitflips" I think it'll
basically report 3 most of the time.
As a refresher we seem to have a status for 0 - 3 flips but ok, 4 bit
flips but ok, and >4 flips no go.
In most cases (0 - 3) the driver is reporting 3.

> I thought the problem was when getting 4 bf, but the dump show many
> more. Can you show me how it behaves:
> * erase (like you did)
> * insert {1, 2, 3, 4, 5} bf and show the dump each time?

Here's a complete log of erasing the page then flipping all the bits
in the first byte.

# flash_erase /dev/mtd0 0x8000000 1
Erasing 128 Kibyte @ 8000000 -- 100 % complete
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6249
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 0@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6252
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: fe ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 1@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6255
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: fc ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 2@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6258
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: f8 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 3@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6261
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: f0 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 4@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6264
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: e0 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 5@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6267
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: c0 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 6@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6270
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: 80 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandflipbits /dev/mtd0 7@0x8000000
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6273
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
#

For completeness logs of what nandbiterrs does:

# flash_erase /dev/mtd0 0x8000000 1
Erasing 128 Kibyte @ 8000000 -- 100 % complete
# nandbiterrs -i ^C 1024 /dev/mtd0
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6478
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandbiterrs -i -b 1024 /dev/mtd0
incremental biterrors test
Read reported 3 corrected bit errors
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/5
Read reported 4 corrected bit errors
ECC failure, invalid data despite read success
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6488
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 4 corrected bitflip(s) at offset 0x08000000
0x08000000: 05 a5 65 e5 05 85 45 c5 b5 35 f5 75 95 15 d5 55  |..e...E..5.u...U|
0x08000010: 6d ed 2d ad 4d cd 0d 8d fd 7d bd 3d dd 5d 9d 1d  |m.-.M....}.=.]..|
0x08000020: 81 01 c1 41 a1 21 e1 61 11 91 51 d1 31 b1 71 f1  |...A.!.a..Q.1.q.|
0x08000030: c9 49 89 09 e9 69 a9 29 59 d9 19 99 79 f9 39 b9  |.I...i.)Y...y.9.|
0x08000040: 77 d7 37 b7 57 d7 17 97 e7 67 a7 27 c7 47 87 07  |w.7.W....g.'.G..|
0x08000050: 3f bf 7f ff 1f 9f 5f df af 2f ef 6f 8f 0f cf 4f  |?....._../.o...O|
0x08000060: d3 53 93 13 f3 73 b3 33 43 c3 03 83 63 e3 23 a3  |.S...s.3C...c.#.|
0x08000070: 9b 1b db 5b bb 3b fb 7b 0b 8b 4b cb 2b ab 6b eb  |...[.;.{..K.+.k.|
0x08000080: 0c 8c 4c cc 2c ac 6c ec 9c 1c dc 5c bc 3c fc 7c  |..L.,.l....\.<.||
0x08000090: 44 c4 04 84 64 e4 24 a4 d4 54 94 14 f4 74 b4 34  |D...d.$..T...t.4|
#

# flash_erase /dev/mtd0 0x8000000 1
Erasing 128 Kibyte @ 8000000 -- 100 % complete
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 0
ECC corrected: 6492
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
# nandbiterrs -o -b 1024 /dev/mtd0
overwrite biterrors test
Read reported 3 corrected bit errors
Read reported 4 corrected bit errors
Failed to recover 1 bitflips
Bit error histogram (873 operations total):
Page reads with   0 corrected bit errors: 0
Page reads with   1 corrected bit errors: 0
Page reads with   2 corrected bit errors: 0
Page reads with   3 corrected bit errors: 785
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0 | head -n 10
ECC failed: 1
ECC corrected: 9202
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|

Cheers,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
