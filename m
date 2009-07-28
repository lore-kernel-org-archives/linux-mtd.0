Received: from mail.mnementh.co.uk ([173.45.232.4] helo=mnementh.co.uk)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVnB7-0004EC-VU
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 13:57:18 +0000
Message-ID: <4A6F03B1.6090200@f2s.com>
Date: Tue, 28 Jul 2009 14:57:05 +0100
From: Ian molton <spyro@f2s.com>
MIME-Version: 1.0
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
References: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
	<20090719001127.GA6449@doriath.ww600.siemens.net>
In-Reply-To: <20090719001127.GA6449@doriath.ww600.siemens.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org
Reply-To: ian@mnementh.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry Eremin-Solenikov wrote:
> Hi,
> 
> On Tue, Jul 14, 2009 at 11:05:03PM +0900, Atsushi Nemoto wrote:
>> Hi.  I found tmio_nand driver abuses nand_correct_data.
>>
>> The current nand_correct_data() can be used for ecc.bytes = 3 case
>> only.  The tmio_nand driver uses ecc.bytes = 6.
> 
> IIRC, tmio_nand driver accesses two ecc "sectors" at once, so this is
> most probably ok. I'll look into it though, when I have some time.

Are we really the only chip that does this?
