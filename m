Received: from mail.mnementh.co.uk ([173.45.232.4] helo=mnementh.co.uk)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVnmE-00012f-MW
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 14:35:43 +0000
Message-ID: <4A6F0CA7.70006@mnementh.co.uk>
Date: Tue, 28 Jul 2009 15:35:19 +0100
From: Ian Molton <ian@mnementh.co.uk>
MIME-Version: 1.0
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
References: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>	<20090719001127.GA6449@doriath.ww600.siemens.net>	<4A6F03B1.6090200@f2s.com>
	<20090728.231156.126763891.anemo@mba.ocn.ne.jp>
In-Reply-To: <20090728.231156.126763891.anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dbaryshkov@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Atsushi Nemoto wrote:
> On Tue, 28 Jul 2009 14:57:05 +0100, Ian molton <spyro@f2s.com> wrote:
>>>> The current nand_correct_data() can be used for ecc.bytes = 3 case
>>>> only.  The tmio_nand driver uses ecc.bytes = 6.
>>> IIRC, tmio_nand driver accesses two ecc "sectors" at once, so this is
>>> most probably ok. I'll look into it though, when I have some time.
>> Are we really the only chip that does this?
> 
> TXx9 NDFMC can read 6 byte ECC (for two 256 byte sectors) at a time.
> I will try to see if doing it increase performance or not.

Cool,

If theres more than one chip that can do this, I think the change should 
go in the core mmc code.
