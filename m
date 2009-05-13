Received: from fk-out-0910.google.com ([209.85.128.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4Fzy-0000FW-9s
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 15:04:05 +0000
Received: by fk-out-0910.google.com with SMTP id z22so324025fkz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 May 2009 08:03:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241674092.27549.16.camel@localhost.localdomain>
References: <72795ccb0905060026q7dcb45c0u15c35943374fcc78@mail.gmail.com>
	<1241673722.27549.14.camel@localhost.localdomain>
	<1241674092.27549.16.camel@localhost.localdomain>
Date: Wed, 13 May 2009 17:03:55 +0200
Message-ID: <72795ccb0905130803y25acae9bwde94ed86d0dbb4f2@mail.gmail.com>
Subject: Re: Load UBI faster
From: simon polette <spolette@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, spolette@adetelgroup.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My NAND is 256MB but I use only a 130MB partition for UBI/UBIFS.
So I implemented the on-flash BBT, that made me save 120ms which is a
sizeable improvement.
On the other hand, skipping crc calculation for header doesn't seem to
save much time (perhaps ~10ms so it's difficult to measure the
difference).

Best regards,

Simon Polette
ADENEO

2009/5/7 Artem Bityutskiy <dedekind@infradead.org>:
> On Thu, 2009-05-07 at 08:22 +0300, Artem Bityutskiy wrote:
>> On Wed, 2009-05-06 at 09:26 +0200, simon polette wrote:
>> > I'm trying to improve boot time on a at91sam9261ek board. I boot on
>> > nand flash with ubifs. It take about 400ms to load ubi and ubifs.
>> > Do you know if fastboot technology, which consist in loading drivers
>> > asynchronously, is conceivable with UBI ?
>> > Thanks for your help.
>>
>> Fastbood is applicable in the situation when initialization
>> is mostly about sleeping and waiting for hw. In case of UBI,
>> it reads from flash and calculates CRC. The reading from NAND
>> is usuall synchronous, so this process takes 100% of your CPU.
>>
>> One way to optimize this a little would be to use on-flash
>> BBT. Usually the nand core scans full NAND to find bad blocks.
>> With on-flash BBT this could be avoided. But probably this
>> would not give you much.
>
> You could also play with CRC. ATM we use CRC32 for UBI headers.
> This is rather expensive if you CPU is slow. I'd try to hack
> UBI and see what changes if it does not calculate it. If it
> helps, you could try to consider CRC16 or adler32 instead of
> CRC32.
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
