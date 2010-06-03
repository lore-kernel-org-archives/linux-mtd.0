Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKC7R-0004ha-1T
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2010 15:14:05 +0000
Received: by bwz5 with SMTP id 5so70880bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Jun 2010 08:14:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1275575118.9729.2.camel@localhost.localdomain>
References: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
	<1275575118.9729.2.camel@localhost.localdomain>
Date: Thu, 3 Jun 2010 17:14:00 +0200
Message-ID: <AANLkTim4K_-kJc4x7mlgyXG3DPgcWUR5-nb46SEpn3pG@mail.gmail.com>
Subject: Re: CRC error when mounting UBIFS
From: Leo Barnes <barnes.leo@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hmm, ok. I would have thought the paranoid UBI checks would be able to
find driver related problems. I have however now tried creating and
mounting ubi/ubifs through nandsim on the device, so ubifs seems to be
working well.

I have tried mtd_readtest on the driver which fails when I allow
OOB-reads. Since the driver handles ECC in hardware and I dont need to
read the OOB-data for the sake of UBI/UBIFS, this should be no
problem. When removing the oob-reads from the test, it works
perfectly.

You are probably right that what fails is unaligned/short reads, since
this is exactly the functionality that I had to add to the driver.
Does any of the mtd-tests test these kinds of reads? Might be a good
addition if not.

Will perform some more debugging. Thanks for very fast replies!
//Leo


On Thu, Jun 3, 2010 at 4:25 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Thu, 2010-06-03 at 16:02 +0200, Leo Barnes wrote:
>> Hello!
>>
>> I am trying to create and mount an UBIFS partition and get the
>> following error when trying to mount it:
>> <7>[ =C2=A0397.117065] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 4=
90:0
>> <7>[ =C2=A0397.117218] UBIFS DBG (pid 438): ubifs_scan: look at LEB 490:=
0
>> (126976 bytes left)
>> <7>[ =C2=A0397.117401] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty=
 space
>> <7>[ =C2=A0397.117614] UBIFS DBG (pid 438): ubifs_end_scan: stop scannin=
g
>> LEB 490 at offset 0
>> <3>[ =C2=A0397.119598] UBIFS error (pid 438): check_lpt_crc: invalid crc=
 in
>> LPT node: crc 0 calc 90d1
>
> Most of the time errors like this are because of problems in the driver
> level, e.g., when the driver does not handle small or unaligned length
> reads. Did you validate your MTD driver with MTD tests?
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
