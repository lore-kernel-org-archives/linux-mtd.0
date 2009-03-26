Received: from yx-out-1718.google.com ([74.125.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmhqQ-0005IN-N3
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 05:09:42 +0000
Received: by yx-out-1718.google.com with SMTP id 34so258675yxf.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Mar 2009 22:09:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49CA9899.30604@grandegger.com>
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>
	<1237975701-23201-2-git-send-email-wg@grandegger.com>
	<1237975701-23201-3-git-send-email-wg@grandegger.com>
	<1237975701-23201-4-git-send-email-wg@grandegger.com>
	<fa686aa40903251048g479d63f8i5a715defdbfc33d4@mail.gmail.com>
	<49CA9899.30604@grandegger.com>
Date: Wed, 25 Mar 2009 23:09:33 -0600
Message-ID: <fa686aa40903252209r52a1bc1cn995a7da16bc3527f@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] powerpc: NAND: FSL UPM: document new bindings
From: Grant Likely <grant.likely@secretlab.ca>
To: Wolfgang Grandegger <wg@grandegger.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org,
	devicetree-discuss list <devicetree-discuss@ozlabs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 25, 2009 at 2:48 PM, Wolfgang Grandegger <wg@grandegger.com> wr=
ote:
> Grant Likely wrote:
>> For the chip offset, it's not clear what the meaning is. =A0First, does
>> the UPM controller support access of multiple chips simultaneously?
>
> The offset drives the corresponding address lines, which are used to
> select the chip. That's how it's done on the TQM8548 board. In
> principle, the chips could also be selected through dedicated GPIO pins.
> Well, I'm not a hardware guy.

Heh.  I mean elaborate in the binding documentation.  :-)

>> If so, then can you elaborate in the description on how board design
>> translates to a chip-offset value. =A0If it cannot, then it might be
>> better to have multiple tuples in the 'reg' property for each discrete
>> chip. =A0Multiple reg tuples would also remove the need for the
>> num-chips property.
>
> The node still describes one device mapping all relevant control
> registers. How about using fsl,upm-chip-offsets =3D <0x200 0x400>. It
> would be more generic and makes num-chips obsolete as well. And the
> property would be reserved for that way of implementing the chip select
> in hardware.

It really sounds like this binding is describing multiple NAND chips
mapped to different base addresses (and looking at the fsm_upm.c
driver appears to confirm it).  So, does this work?  reg =3D <3 0x200 4
 3 0x400 4>;

It is true that other methods could be used for implementing the chip
select, but that is *not* what the proposed binding describes.  This
proposed binding describes NAND chips selected by address lines
(particular addresses), and in this case I think using reg is the
natural description.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
