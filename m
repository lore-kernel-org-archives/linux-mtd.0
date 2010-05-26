Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OHJ7d-0002Tc-Hx
	for linux-mtd@lists.infradead.org; Wed, 26 May 2010 16:06:22 +0000
Received: by pvg2 with SMTP id 2so1545806pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 May 2010 09:06:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1274763914.2106.1.camel@localhost>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763914.2106.1.camel@localhost>
Date: Wed, 26 May 2010 12:06:15 -0400
Message-ID: <AANLkTincmuzSyvBHO6JSsV4aJjht_JXPId58Tk-bzHIJ@mail.gmail.com>
Subject: Re: UBIFS failed to recover master node
From: twebb <taliaferro62@gmail.com>
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

>> I've had several cases where our MLC NAND flash appears corrupted in
>> such a way that one of three UBIFS volumes can not be mounted due to
>> "failed to recover master node". =C2=A0I haven't been able to reproduce =
the
>> problem, but we've had at least 5 incidents where this has occurred.
>> (A partial capture from one of the failures is below.)
>>
>> I'm starting to investigate this problem and don't know if this is a
>> UBIFS/UBI problem or a NAND driver problem. =C2=A0I'm starting the proce=
ss
>> of back-porting the latest UBIFS code to our 2.6.29 kernel - hoping
>> that new UBIFS code will solve the problem. =C2=A0However, this may also=
 be
>> a driver problem and I wonder if I also need to update that driver
>> (pxa3xx_nand). =C2=A0Any suggestions for debugging this problem?
>>
>> Thanks,
>> twebb
>>
>>
>> capture:
>> [root@ESIedge mtd-utils]# mount -t ubifs ubi0_0 /mnt/
>> [ =C2=A0239.605869] UBI error: ubi_io_read: error -74 while reading 5160=
96
>> bytes from PEB 4:8192, read 516096 bytes
>> [ =C2=A0239.616317] UBIFS error (pid 676): ubifs_scan: corrupt empty spa=
ce
>> at LEB 2:268135
>> [ =C2=A0239.623996] UBIFS error (pid 676): ubifs_scanned_corruption:
>> corruption at LEB 2:268135
>> [ =C2=A0239.642101] UBIFS error (pid 676): ubifs_scan: LEB 2 scanning fa=
iled
>> [ =C2=A0239.976396] UBI error: ubi_io_read: error -74 while reading 5160=
96
>> bytes from PEB 4:8192, read 516096 bytes
>> [ =C2=A0239.986742] UBIFS error (pid 676): ubifs_recover_master_node:
>> failed to recover master node
>> mount: mounting ubi0_0 on /mnt/ failed: Invalid argument
>
> Please, enable all debugging messages, mount this flash again, and send
> the messages.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>

I have enabled...
CONFIG_MTD_UBI_DEBUG=3Dy
CONFIG_UBIFS_FS_DEBUG=3Dy

Should I enable CONFIG_UBIFS_FS_DEBUG_CHKS ?
