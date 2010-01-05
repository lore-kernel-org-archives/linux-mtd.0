Received: from mail-px0-f200.google.com ([209.85.216.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NS4Y2-00078y-HA
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 08:13:54 +0000
Received: by pxi38 with SMTP id 38so5279568pxi.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jan 2010 00:13:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
	<Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
Date: Tue, 5 Jan 2010 19:13:48 +1100
Message-ID: <a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>
Subject: Re: JFFS2 - speed up while booting
From: linux newbie <linux.newbie79@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

It is slow during every boot. Seems it is scanning for bad blocks (If
I enable the debug message. Usually debug is OFF).

Thanks

On Tue, Jan 5, 2010 at 7:06 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Tue, 5 Jan 2010, linux newbie wrote:
>
>> Hi,
>>
>> I am using linux version (linux.2.6.31) on my embedded ARM based target.
>>
>> We are using JFFS2 filesystem to read/write data to NAND flash
>> (32MBytes) and our root file system resides in it.
>>
>> It takes long time during kernel booting, if we have root file system
>> in NAND, but its very fast if we place our file system in SDRAM.
>>
>> Is there any way to speed up the booting process?
>>
>> Eagerly waiting for your valuable suggestion.
>
> Is it slow during every boot or just the first after you've written your
> file system image to the flash?
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.com
> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 Fax +46 46 13 61 30
>
