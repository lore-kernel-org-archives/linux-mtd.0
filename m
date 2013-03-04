Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCP8X-0001lS-9J
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 06:44:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, Colin Foe-Parker
 <colin.foeparker@aclimalabs.com>
Subject: RE: [UBIFS][CRC Mismatch]
Date: Mon, 4 Mar 2013 06:44:27 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E99B5DF@DBDE01.ent.ti.com>
References: <CAHeJuP946AQD2FOp1f=y_AKxXbLGYhTe1TZGOAtpNVoPbE5JEA@mail.gmail.com>
 <1362236681.2745.19.camel@sauron>
In-Reply-To: <1362236681.2745.19.camel@sauron>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Artem Bityutskiy
> Sent: Saturday, March 02, 2013 8:35 PM
> To: Colin Foe-Parker
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: [UBIFS][CRC Mismatch]
>=20
> On Tue, 2013-02-19 at 10:44 -0800, Colin Foe-Parker wrote:
> > Hi All,
> >
> > I am seeing an issue that I would love some outside help on.
> >
> > I am running UBIFS on TI's latest Linux 3.2.0 PSP (5.06.00.09) and
> > their AM3352 ARMv7a processor.  We are using a Micron
> MT29F2G08ABBEAHC
> > 2 Gb SLC NAND chip.  (w/ a BCH8 ECC)
> >
> > We have 50+ devices deployed and over the deployment (40 days) we
> have
> > seen ~10 of the devices go read only.  The devices are slowly going
> > read only with no apparent correlation with uptime.  And the devices
> > are running in inside environments.  Because the devices are deployed,
> > we do not have easy or quick access to the kernel logs.  But I was
> > able to capture one instance where the device went from RW to RO.  See
> > the bottom for the dump.  (1)  The message seems pretty straight
> > forward; there is a CRC mismatch between what was stored in NAND and
> > what was calculated.  But I am a little stuck on why.
> >
> > So far it seems that the options are:
> >
> > 1.) Unstable bits: Our device has a 1 Ah back up battery and should
> > have had very very few (< 3 ) bad power off events after it had the
> > RFS put in NAND with ubiformat to its present state.   Additionally,
> > the devices should have stayed on for the entire time they have been
> > deployed.  (We are logging that from now on)
> >
> > 2.) NAND/Driver Corruption: I have run the MTD oobtest and read test
> > to near ad nauseum with almost perfect passing results.  In 500+
> > iterations of each test, split on multiple devices, I saw one OOB
> > verify error.  And since I enabled further debugging, I have not been
> > able to reproduce it.  Additionally, I have gone through and verified
> > that the GPMC (General Purpose Memory Controller) bus that connects
> > the AM335x to the NAND chip is within the chip's timing requirements.
> >
> > 3.) Memory Corruption: Is it possible the the write buffer can be
> > corrupted before it is written to NAND?  Hence having a bad CRC value
> > in NAND?
>=20
> Well, the only obvious suggestion that I could get is that you should
> find a way to reproduce the issue. Then you can try enabling I/O
> debugging in UBI. And then adding various hacks around to narrow down
> the problem. Depending on how quickly this is can bereproduced, you can
> go as far as duplicating all the NAND writes to a file and comparing the
> contents of NAND with the contents of file and finding when something
> becomes corrupted... just a crazy idea.
>=20
> You probably can check version 3 rather easily by reading the data from
> your flash a different way and verifying the CRC.
>=20
> --
> Best Regards,
> Artem Bityutskiy
>=20

I think this is due to bit-flips in OOB region, which earlier AM335x releas=
e was not catching.=20
http://arago-project.org/git/projects/?p=3Dlinux-am33x.git;a=3Dcommit;h=3De=
e166b845a04dc4a744ee6790e4e20a2b7a98788

This has already been pushed as part of:
http://lists.infradead.org/pipermail/linux-mtd/2013-January/045376.html
+                               if (err_loc[j] < BCH8_ECC_MAX) {
+                                       /*
+                                        * Check bit flip error reported in=
 data
+                                        * area, if yes correct bit flip, e=
lse
+                                        * bit flip in OOB area.
+                                        */
+                                       if (byte_pos < 512)
+                                               dat[byte_pos] ^=3D 1 << bit=
_pos;
+                                       else
+                                               read_ecc[byte_pos - 512] ^=
=3D
                                                        1 << bit_pos;
+                               }


with regards, pekon
