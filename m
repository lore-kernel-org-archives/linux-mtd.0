Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUKzP-0000f1-2W
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 13:39:15 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Fri, 24 Jul 2009 07:39:05 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB703C161A8@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1248436825.24676.70.camel@localhost>
References: <1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB703B47FC9@usw-am-xch-02.am.trimblecorp.net>
	<4A69596F.8070300@gmail.com> <1248436825.24676.70.camel@localhost>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind1@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> More testing of NOR flash against power cuts showed that sometimes
> eraseblocks may be unwritable, and we cannot really invalidate
> them before erasure. But in this case the eraseblock probably
> contains garbage anyway, and we do not have to invalidate the
> headers. This assumption might be not true, but this is at least
> what I have observed. So if we cannot invalidate the headers,
> we make sure that the PEB does not contain valid VID header.
> If this is true, everything is fine, otherwise we panic.

I haven't seen this case with my flash chips  and it seems like an odd
thing to happen, but it may be possible with other NOR chips.

I will apply your patches and run some more tests over the weekend.

Power Cycling Results
---------------------------
I just finished a cycle test using 2 boards and the latest patches from
2.6.27 and both boards were still running after a combined power-cycle
count of 11,178 while running a memory torture test - so the robustness
has been improved dramatically.

Random LEB 1 Corruption
--------------------------------
Out of the 11,178 power cycles, I received 12 random corruptions of LEB
1.  The file system recovers the block.  The offset into the LEB where
the error occurs changes.  This looks like it may be the remaining half
of the problem I used to have where I would get two LEB 1's and one
would be corrupt.  Artem's fix of corrupting the header may have solved
the fatal issue, but I would be interested as to what this is doing.

Kernel mounts the UBIFS system as read-only initially and then remounts
it for write access later in the boot process.  This is the initial scan
in read-only mode.

[42949375.180000] UBIFS error (pid 1): ubifs_check_node: bad CRC:
calculated 0xb6a46e9c, read 0xd46336ef
[42949375.190000] UBIFS error (pid 1): ubifs_check_node: bad node at LEB
1:72704
[42949375.200000] UBIFS error (pid 1): ubifs_scanned_corruption:
corruption at LEB 1:72704
[42949375.250000] UBIFS error (pid 1): ubifs_scan: LEB 1 scanning failed
[42949375.310000] UBIFS: recovery needed
[42949375.430000] UBIFS: recovery deferred
[42949375.440000] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[42949375.440000] UBIFS: mounted read-only
[42949375.450000] UBIFS: file system size:   27498240 bytes (26853 KiB,
26 MiB, 210 LEBs)
[42949375.450000] UBIFS: journal size:       1178497 bytes (1150 KiB, 1
MiB, 9 LEBs)
[42949375.460000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[42949375.470000] UBIFS: default compressor: lzo
[42949375.470000] UBIFS: reserved for root:  0 bytes (0 KiB)

Truncated Files
------------------
I keep a boot count in two separate files on the file system and update
them for every boot.  This count is getting reset when it gets up to 100
or so.  Here is a stripped down version of the boot count script.  Do
you see anything obvious?  I will do more analysis soon to determine the
exact cause, but just wanted to get everybody's opinion.

# set count =3D max(/var/boot_count_a, /var/boot_count_b)

count=3D$(($count+1))

# Write out the new boot count (do files that don't exist first)
if [ ! -e /var/boot_count_a ]; then
  # a doesn't exist, write it first
  echo $count > /var/boot_count_a
  sync
  echo $count > /var/boot_count_b
  sync
else
  echo $count > /var/boot_count_b
  sync
  echo $count > /var/boot_count_a
  sync
fi
=20

-Eric
