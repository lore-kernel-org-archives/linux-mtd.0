From: ch@murgatroid.com (Christopher Hoover)
Date: Thu, 6 Mar 2003 17:30:50 -0800
Subject: Another mmap / jffs2 problem (was RE: 2.5.59-rmk1: unmap_vmas: VMA list is not sorted correctly!)
In-Reply-To: <20030306232854.F982@flint.arm.linux.org.uk>
Message-ID: <003501c2e449$2fc65db0$e55f040f@bergamot>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This is a multi-part message in MIME format.

------=_NextPart_000_0036_01C2E406.21A31DB0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit


> This is a long standing problem - and, has been reported many times
> here.  I don't remember the details, but I seem to remember that
> pppd is buggy.

Ah.  I looked at the code -- it seems that someone thought that mmap(2)
returns 0 on error.  A couple of checks for -1 fixed it.  I'll forward a
patch to the maintainers (attached here for anyone encountering this
problem who finds this note).

Incidentally why does the mmap fail with EINVAL against a jffs2 file and
succeed against a tmpfs file?  Is that by design?


> As far as the unmap_vmas message, if you could get a copy of the
> /proc/<pid>/maps file while pppd is running, it might provide some
> clues.

I'm still getting the occasion unmap_vmas message; I'll grab that info
next time I see it.

Thanks again.

Cheers,
-ch

------=_NextPart_000_0036_01C2E406.21A31DB0
Content-Type: application/octet-stream;
	name="ppp-2.4.1-mmap.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="ppp-2.4.1-mmap.diff"

--- ppp-2.4.1.orig/pppd/tdb.c	2000-04-03 23:27:13.000000000 -0700=0A=
+++ ppp-2.4.1/pppd/tdb.c	2003-03-06 17:11:51.000000000 -0800=0A=
@@ -210,6 +210,8 @@=0A=
 	tdb->map_ptr =3D (void *)mmap(NULL, tdb->map_size, =0A=
 				    tdb->read_only?PROT_READ:PROT_READ|PROT_WRITE,=0A=
 				    MAP_SHARED | MAP_FILE, tdb->fd, 0);=0A=
+	if (tdb->map_ptr =3D=3D (void *) -1)=0A=
+		tdb->map_ptr =3D 0;=0A=
 #endif	=0A=
 	return 0;=0A=
 }=0A=
@@ -373,6 +375,8 @@=0A=
             tdb->map_ptr =3D (void *)mmap(NULL, tdb->map_size, =0A=
                                         PROT_READ|PROT_WRITE,=0A=
                                         MAP_SHARED | MAP_FILE, tdb->fd, =
0);=0A=
+	    if (tdb->map_ptr =3D=3D (void *) -1)=0A=
+		tdb->map_ptr =3D 0;=0A=
         }=0A=
 #endif=0A=
 =0A=
@@ -1180,6 +1184,8 @@=0A=
             tdb.map_ptr =3D (void *)mmap(NULL, st.st_size, =0A=
                                        tdb.read_only? PROT_READ : =
PROT_READ|PROT_WRITE,=0A=
                                        MAP_SHARED | MAP_FILE, tdb.fd, =
0);=0A=
+	    if (tdb.map_ptr =3D=3D (void *) -1)=0A=
+		tdb.map_ptr =3D 0;=0A=
         }=0A=
 #endif=0A=
 =0A=

------=_NextPart_000_0036_01C2E406.21A31DB0--
