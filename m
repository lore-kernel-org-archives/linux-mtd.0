Received: from mail-oa0-f41.google.com ([209.85.219.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCZ79-0005cM-5R
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 17:23:55 +0000
Received: by mail-oa0-f41.google.com with SMTP id i10so9431132oag.28
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 09:23:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E99B6E6@DBDE01.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73E99B6E6@DBDE01.ent.ti.com>
Date: Mon, 4 Mar 2013 09:23:49 -0800
Message-ID: <CAHeJuP8NdMKQmj0cPio69fJz4zV7HOkFU8K5n+rRxGuJ14Lpog@mail.gmail.com>
Subject: Re: [UBIFS][CRC Mismatch]
From: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good Morning All,

I would like to start off thanking everyone for their suggestions.  I
appreciate it.

I have been digging in the code as well as running tests and have a
little more information to provide.

1.) The devices that we initial shipped did NOT include the patch that
Pekon Gupta suggested.
(http://arago-project.org/git/projects/?p=3Dlinux-am33x.git;a=3Dcommit;h=3D=
ee166b845a04dc4a744ee6790e4e20a2b7a98788)

2.) The devices also had the subpage incorrectly configured.  The
minimum I/O size is now set at the NAND page size.
(http://arago-project.org/git/projects/?p=3Dlinux-am33x.git;a=3Dcommit;h=3D=
c2bcebaee40b74981aa090dad1b524d00ccf28f0)

After I brought in both of those changes, we pushed out a kernel
upgrade to a couple devices.  Sadly, at least two of the devices that
were using the updated Kernel proceeded to become read only.  I am not
convinced that this is a fair test though. It is possible that the
file system crc damage had already been done when running without the
patch.  So I performed the following test,

Test-
1.) I started a four sample test in the office:
	a.) Board A- Running the initial Kernel and RFS that does NOT have
the patches to fix the subpage size and the OOB ecc errors.  The RFS
was re-flashed into NAND using ubiformat so there should be no
lingering CRC errors.
	b.) Board B- Running a Kernel that incorporates the subpage and ecc
patches.  The RFS was re-flashed into NAND using ubiformat so there
should be no lingering CRC errors.
	c.) Board C- Running a Kernel that incorporates the subpage and ecc
patches as well as runs check_node after each ubifs node write.  The
RFS was re-flashed into NAND using ubiformat so there should be no
lingering CRC errors.  So if an error is seen, the image will
immediately go read only.
	d.) Board D- Running a Kernel that incorporates the subpage and ecc
patches as well as runs check_node after each ubifs node write.  The
RFS on this device had previously gone read only when running the same
image a Board A.  For this test I only changed the Kernel and left the
file system alone.

2.) All four boards were running "while [ 1 ]; do dd if=3D/dev/urandom
of=3D/home/root/trash.txt bs=3D495 count=3D1; sync; sleep 3; done" in
screen.

Results -

3.) Board A went read only after 9 days of running.

4.) No other board has gone read only and the test has been running for 12 =
days.

Conclusions-

I think it is too early to make a definitive decision.  But the
results are promising=85  The baseline image has failed and no other
configuration has shown any issues.  I am a little intrigued by
configuration D.  My expectation is that it would eventually go read
only as well.

Mattheiu,

Were there any patches that came out of the ubi scrubbing corruption?

Pekon,

Thanks for the patch reference.

Artem,

Thanks for all your UBI related work.  And for your suggestions.  I am
still trying to find a quicker method to reliably reproduce the issue.

-Colin

On Mon, Mar 4, 2013 at 2:44 AM, Gupta, Pekon <pekon@ti.com> wrote:
>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
>> Of Artem Bityutskiy
>> Sent: Saturday, March 02, 2013 8:35 PM
>> To: Colin Foe-Parker
>> Cc: linux-mtd@lists.infradead.org
>> Subject: Re: [UBIFS][CRC Mismatch]
>>
>> On Tue, 2013-02-19 at 10:44 -0800, Colin Foe-Parker wrote:
>> > Hi All,
>> >
>> > I am seeing an issue that I would love some outside help on.
>> >
>> > I am running UBIFS on TI's latest Linux 3.2.0 PSP (5.06.00.09) and
>> > their AM3352 ARMv7a processor.  We are using a Micron
>> MT29F2G08ABBEAHC
>> > 2 Gb SLC NAND chip.  (w/ a BCH8 ECC)
>> >
>> > We have 50+ devices deployed and over the deployment (40 days) we
>> have
>> > seen ~10 of the devices go read only.  The devices are slowly going
>> > read only with no apparent correlation with uptime.  And the devices
>> > are running in inside environments.  Because the devices are deployed,
>> > we do not have easy or quick access to the kernel logs.  But I was
>> > able to capture one instance where the device went from RW to RO.  See
>> > the bottom for the dump.  (1)  The message seems pretty straight
>> > forward; there is a CRC mismatch between what was stored in NAND and
>> > what was calculated.  But I am a little stuck on why.
>> >
>> > So far it seems that the options are:
>> >
>> > 1.) Unstable bits: Our device has a 1 Ah back up battery and should
>> > have had very very few (< 3 ) bad power off events after it had the
>> > RFS put in NAND with ubiformat to its present state.   Additionally,
>> > the devices should have stayed on for the entire time they have been
>> > deployed.  (We are logging that from now on)
>> >
>> > 2.) NAND/Driver Corruption: I have run the MTD oobtest and read test
>> > to near ad nauseum with almost perfect passing results.  In 500+
>> > iterations of each test, split on multiple devices, I saw one OOB
>> > verify error.  And since I enabled further debugging, I have not been
>> > able to reproduce it.  Additionally, I have gone through and verified
>> > that the GPMC (General Purpose Memory Controller) bus that connects
>> > the AM335x to the NAND chip is within the chip's timing requirements.
>> >
>> > 3.) Memory Corruption: Is it possible the the write buffer can be
>> > corrupted before it is written to NAND?  Hence having a bad CRC value
>> > in NAND?
>>
>> Well, the only obvious suggestion that I could get is that you should
>> find a way to reproduce the issue. Then you can try enabling I/O
>> debugging in UBI. And then adding various hacks around to narrow down
>> the problem. Depending on how quickly this is can bereproduced, you can
>> go as far as duplicating all the NAND writes to a file and comparing the
>> contents of NAND with the contents of file and finding when something
>> becomes corrupted... just a crazy idea.
>>
>> You probably can check version 3 rather easily by reading the data from
>> your flash a different way and verifying the CRC.
>>
>> --
>> Best Regards,
>> Artem Bityutskiy
>>
>
> I think this is due to bit-flips in OOB region, which earlier AM335x rele=
ase was not catching.
> http://arago-project.org/git/projects/?p=3Dlinux-am33x.git;a=3Dcommit;h=
=3Dee166b845a04dc4a744ee6790e4e20a2b7a98788
>
> This has already been pushed as part of:
> http://lists.infradead.org/pipermail/linux-mtd/2013-January/045376.html
> +                               if (err_loc[j] < BCH8_ECC_MAX) {
> +                                       /*
> +                                        * Check bit flip error reported =
in data
> +                                        * area, if yes correct bit flip,=
 else
> +                                        * bit flip in OOB area.
> +                                        */
> +                                       if (byte_pos < 512)
> +                                               dat[byte_pos] ^=3D 1 << b=
it_pos;
> +                                       else
> +                                               read_ecc[byte_pos - 512] =
^=3D
>                                                         1 << bit_pos;
> +                               }
>
>
> with regards, pekon



--=20


Colin Foe-Parker
Software Engineer

ACLIMA INC
Direct 415 735 5062  |  Email colin.foeparker@aclimalabs.com
10 Lombard St. Suite 210  |  San Francisco, CA 94111

This email and any attachments may contain private, confidential and
privileged material for the sole use of the intended recipient. If you
are not the intended recipient, please immediately delete this email
and any attachments.
