Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEVwC-0001Jn-E1
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2006 18:20:37 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 1 Mar 2006 21:20:08 +0300
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A01A420F2@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: "Korolev, Alexey" <alexey.korolev@intel.com>,
	<linux-mtd@lists.infradead.org>, "David Woodhouse" <dwmw2@infradead.org>,
	"Nicolas Pitre" <nico@cam.org>
Cc: 
Subject: RE: [PATCH] cfi: Fixup of write errors on XIP 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Several days ago I sent this patch to the list. I wonder are there any
objections to it?
I guess this patch shouldn't break anything. It just fixes write errors
I saw in our tests. The patch has been verified on several
configurations.=20
If you don't mind I will commit it by the end of this week.

Thanks,
Alexey=20

=20
> Here is fixup of issue I have seen on XIP configuration.=20
> Sometimes I received write errors with message "buffer write error
> (status timeout)" on test  which did read write and erase on several
> volumes at the same time.
>=20
> I investigated the issue.=20
> The scenario of the issue is following:
=20
> 1. do_write_buffer=20
> 2. Waiting for write complete in xip_udelay
> 3. System Interrupt
> 4. Write suspend
> 5. Rescheduling
> 6. Block erasing by other process. ( This operation typically took
> rather long time )
> 7. Complete, rescheduling=20
> 8. Return to write (write is not complete due to suspend ).=20
> 9. Check timeout. Time is up.
> 10. Error.
> =20
> I made small fixup for these issue. Please see patch below.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- c/drivers/mtd/chips/cfi_cmdset_0001.c	2006-02-22
20:58:05.869203280 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-02-22
20:55:42.272033368 +0300
@@ -1571,6 +1571,7 @@
 	/* GO GO GO */
 	map_write(map, CMD(0xd0), cmd_adr);
 	chip->state =3D FL_WRITING;
+	chip->write_suspended =3D 0;
=20
 	INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
 				adr, len,
@@ -1592,6 +1593,12 @@
 			continue;
 		}
=20
+		/* Somebody suspended write. We should reset timeo. */
+		if (chip->write_suspended) {
+			chip->write_suspended =3D 0;
+			timeo =3D jiffies + (HZ/2);
+		}
+	=09
 		status =3D map_read(map, cmd_adr);
 		if (map_word_andequal(map, status, status_OK,
status_OK))
 			break;
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
