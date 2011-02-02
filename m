Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PkfR5-0000D4-4J
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 16:20:04 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: multipart/mixed; boundary=Apple-Mail-71-528866860
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
Date: Wed, 2 Feb 2011 11:20:46 -0500
Message-Id: <25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
To: linux-mtd@lists.infradead.org
Cc: Stefan Bigler <stefan.bigler@keymile.com>,
	Holger brunck <holger.brunck@keymile.com>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Apple-Mail-71-528866860
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

On Jan 25, 2011, at 6:09 PM, Joakim Tjernlund wrote:

> On Jan 25, 2011, at 1:14 PM, Michael Cashwell wrote:
>=20
>> With this new part I'm seeing MTD errors that I think I've traced to =
cfi_cmdset_0001.c that I'd like to ask about.
>>=20
>> The error manifests when I write hard to a UBIFS file system on this =
NOR flash. What I see is a "NOR Flash: buffer write error" and then =
either "(block locked)" or "(Bad VPP)"
>=20
> Just check that you didn't get some old samples. We did.

All I know is that the chips are marked with an '08 copyright. (The =
previous ones are '03.) So we are dealing with old(er) parts in any =
event. But from what I can tell, this particular part is the current one =
Numonyx/Micron are selling.

>> The fact that the errors stop if I comment out the chip->mutex calls =
while waiting [for command completion] suggests to me that there's a =
reentrancy problem. It doesn't mean the locks are wrong or that doing =
that is a real fix.
>=20
> Oh, I misread earlier. I figured you held the lock for all ops.

In the end I found a failure in the following scenario. A block erase is =
underway and a request is made to access the chip in order to write data =
elsewhere. The erase is suspended and the buffered write is performed. =
When the chip is released after the write operation the code notices the =
suspended erase and resumes it. But there seems to be a timing issue =
where the WSM ready bit SR.7 was checked "too soon" following issuing =
the resume command and it made the code think the erase was complete =
when it was not.

The normal code paths that *start* erase or program operations have an =
inherent delay of several =B5s between writing the command and the first =
read of the WSM status. This delay is a side effect of a kernel cache =
invalidate call. But the key issue is that when resuming an erase no =
such cache invalidation is done as it was already done when the erase =
originally began.

That difference means there's very little time between the resume =
command write and the status read. The apparent result is that the WSM =
is reported "not busy" when in fact the resumption is still being acted =
upon. The code misinterprets this to mean the resumed erase is complete =
when it is not and subsequent commands then go fully off the rails as a =
result.

I cannot find a corresponding timing constraint in the data sheet. By =
rights, the bus cycle time alone should be enough between the write and =
read. But in practice, for these parts, it is not. This may be an =
undocumented erratum for current parts or just an anomaly for this =
batch. I have no way to tell.

I found the addition of a 20=B5s delay immediately after the erase =
resume command avoids the failure. I also tested 10=B5s and found it to =
be insufficient. I did not bisect the time further. I have also not =
explored any similar issue for resumed write operations because it =
appears that only kernels doing XIP on MTD parts ever do that. I frankly =
expect the problem would occur then too but I'm not setup to do XIP and =
don't want to propose changes I cannot test.

I've included the patch that I am using. It also addresses a few other =
warts and errata I found while debugging this. If these changes are =
found to have merit after review I'd be happy for them to be included in =
mainline. Let me know if I can assist in any way.

Stephan, I hope this helps. Since yours is the only report at all =
similar to mine I'd be very interested in hearing about your progress.

Best regards,
-Mike Cashwell


--Apple-Mail-71-528866860
Content-Disposition: attachment;
	filename=linux-2.6.35.7-001-numonyx-errata.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="linux-2.6.35.7-001-numonyx-errata.patch"
Content-Transfer-Encoding: 7bit

diff -Nurp linux-2.6.35.7-arm-gum/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.6.35.7-arm-gum-mod/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.35.7-arm-gum/drivers/mtd/chips/cfi_cmdset_0001.c	2010-09-28 21:09:08.000000000 -0400
+++ linux-2.6.35.7-arm-gum-mod/drivers/mtd/chips/cfi_cmdset_0001.c	2011-01-27 16:11:27.000000000 -0500
@@ -1004,7 +1004,19 @@ static void put_chip(struct map_info *ma
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		/* numonyx data sheet clearly says to always reset the status bits
+		   before resuming a suspended erase. not doing so results in
+		   an ambiguous mixture of status bits once the command ends. */
+		map_write(map, CMD(0x50), adr);
 		map_write(map, CMD(0xd0), adr);
+		/* some numonyx P30 parts have an apparent delay after starting or
+		   resuming some commands. this is normally covered by the cache
+		   invalidation done between the command and the start of reading
+		   for the busy status bit to clear. but no such cache invalidation
+		   is done when resuming and this allows the status-reading thread
+		   awakened below to read the status too soon and think its operation
+		   has finished when it fact its resumption is still underway. */
+		udelay(20);
 		map_write(map, CMD(0x70), adr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
# Numonyx Axcell P33/P30 Spec Update - Nov 2009 - document 509003-04
# Erratum #2 - Flexlock Write Timing for stepping A1
@@ -2045,6 +2057,7 @@ static int __xipram do_xxlock_oneblock(s
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
+	int ofs_factor = cfi->interleave * cfi->device_type;
 	int udelay;
 	int ret;
 
@@ -2060,6 +2073,14 @@ static int __xipram do_xxlock_oneblock(s
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+	/* address numonyx errata regarding Flexlock Write Timing.
+	   before doing a 0x60 lock/unlock sequence on a sector
+	   its current lock state needs to be read and the result
+	   discarded. */
+	map_write(map, CMD(0x90), adr+(2*ofs_factor));
+	chip->state = FL_JEDEC_QUERY;
+	(void) cfi_read_query(map, adr+(2*ofs_factor));
+
 	map_write(map, CMD(0x60), adr);
 	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
 		map_write(map, CMD(0x01), adr);

--Apple-Mail-71-528866860--
