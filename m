Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MSYwf-0003FJ-Kn
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 16:09:06 +0000
Received: by fxm11 with SMTP id 11so1572357fxm.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Jul 2009 09:09:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090720.001426.102579925.anemo@mba.ocn.ne.jp>
References: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
	<20090719001127.GA6449@doriath.ww600.siemens.net>
	<20090720.001426.102579925.anemo@mba.ocn.ne.jp>
Date: Sun, 19 Jul 2009 20:08:59 +0400
Message-ID: <bc64b4640907190908m209572e8od16ac648f19503e@mail.gmail.com>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/7/19, Atsushi Nemoto <anemo@mba.ocn.ne.jp>:
> On Sun, 19 Jul 2009 04:11:27 +0400, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
>> > The current nand_correct_data() can be used for ecc.bytes = 3 case
>> > only.  The tmio_nand driver uses ecc.bytes = 6.
>>
>> IIRC, tmio_nand driver accesses two ecc "sectors" at once, so this is
>> most probably ok. I'll look into it though, when I have some time.
>
> Yes, tmio_nand driver read 512 byte data and calculate 6 byte ecc at
> once, but nand_correct_data only references first 3 byte of ecc.
>
> I doubt the driver cannot detect errors in the second 256 byte sector
> of the 512 byte block.

Hmm. That's strange: nand_correct_data() seems to support 512-byte sectors,
however it assumes that ECC is still 3 bytes. I'll have to check specs to see
who is wrong...

-- 
With best wishes
Dmitry
