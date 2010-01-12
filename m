Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUfX8-0000EO-VU
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 12:07:43 +0000
Received: by ewy23 with SMTP id 23so19854ewy.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 04:07:37 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1263271808.30988.38.camel@localhost.localdomain>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
Date: Tue, 12 Jan 2010 07:07:36 -0500
Message-ID: <152584231001120407m6fc901edrd6584f55edc04341@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, Jan 11, 2010 at 11:50 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> Hi,
>
> On Mon, 2010-01-11 at 19:20 -0500, Jon Ringle wrote:
>> I should be able to mount an empty ubi volume as ubifs right?
>> But I get this on a freshly made volume:
>> UBIFS error (pid 1493): check_lpt_crc: invalid crc in LPT node: crc
>> cbcb calc cbfb
>>
>> I'm not sure what to try now...
>
> As this entry suggests:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>
> - validate your flash/driver with the MTD tests - looks like you have a
> problem there.

I will try the tests today and report back.

>> (initramfs) ubinfo -a
>> UBI version: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01
>> Count of UBI devices: =A0 =A0 =A0 =A0 =A0 1
>> UBI control device major/minor: 10:60
>> Present UBI devices: =A0 =A0 =A0 =A0 =A0 =A0ubi0
>>
>> ubi0
>> Volumes count: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 2
>> Logical eraseblock size: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 130944 bytes, f=
 KiB
>
> Hmm, this f KiB looks weird.

Why is it weird? It is 128 bytes less than my PEB size of 0x20000.

Jon
