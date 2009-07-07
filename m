Received: from mail-qy0-f200.google.com ([209.85.221.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MO995-0002jm-VF
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 11:47:42 +0000
Received: by qyk38 with SMTP id 38so4767277qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jul 2009 04:47:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A52C62F.2060408@call-direct.com.au>
References: <6d53329e0907060413h4a2a1d64nddc8e066f2e3c2d@mail.gmail.com>
	<4A52C62F.2060408@call-direct.com.au>
Date: Tue, 7 Jul 2009 17:17:34 +0530
Message-ID: <6d53329e0907070447o763f214dy2e1b179674cd26f5@mail.gmail.com>
Subject: Re: kernel crashing with jffs2 (32MB NAND Flash and 32MB SDRAM )
From: venki kaps <venkiece2005@gmail.com>
To: Iwo Mergler <iwo@call-direct.com.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the reply.
It's a new hardware i.e, ATMEL AT91SAM9G20 Board
and at the same first time we are using.

Did *this* board ever work correctly?
No.

But At mem=3D8M and mem=3D16M the Linux is coming up
but after the kernel prompt it is crashing in between.

At mem=3D32M the Linux is not coming up over board.
Before kernel prompt it=92s crashing.

If SDRAM is problem, Linux itself is not coming up over board.
am i right?

is it u-boot problem?
i.e  number of column & row address bits and the number of banks is
set correctly to match the installed SDRAM

is it required to change u-boot or SDRAM or 2.6.27 kernel?

Could you suggest something?

Thanks & Regards,
Venkappa


On Tue, Jul 7, 2009 at 9:21 AM, Iwo Mergler<iwo@call-direct.com.au> wrote:
> venki kaps wrote:
>> Hi,
>>
>> =A0We are facing some memory issues with ATMEL AT91SAM9G20 Board.
>> =A0By changing the uboot environment variable =96bootargs
>> setenv bootargs console=3DttyS0,115200 root=3D/dev/mtdblock2 rootfstype=
=3Djffs2 mem=3D8M
>> mem=3D8M
>> mem=3D16M
>> mem=3D24M
>> mem=3D32M
>> On changing the value of mem variable the boards behaves in different wa=
y.
>>
>> At 8M,16M the Linux is coming up but after the kernel prompt it is
>> crashing in between.
>> At 32M-the Linux is not coming up over board. Before kernel prompt
>> it=92s crashing.
>> The size of SDRAM is 32MB.but we are not able to utilize it fully.
>>
>> Is it u-boot or Kernel or jffs2 or SDRAM problem?
>>
>
> There could be many possible explanations, including electrical board fau=
lts
> (shorted address lines), bad SDRAM, unsupported SDRAM chips, etc. Is it a=
 new
> board design? Did *this* board ever work correctly? You didn't give enoug=
h
> detail to comment on these things.
>
> As for the software side, incorrectly programming the SDRAM controller ca=
n
> cause the symptoms you described.
>
> The SDRAM controller is programmed by the bootstrap code, as U-Boot needs
> the SDRAM already operational to run.
>
> Add some code to U-Boot to print out the contents of the SDRAMC Configura=
tion
> Register (see the data sheet). Make sure the number of column & row addre=
ss
> bits and the number of banks is set correctly to match the installed SDRA=
M.
>
> Best regards,
>
> Iwo
>
>
