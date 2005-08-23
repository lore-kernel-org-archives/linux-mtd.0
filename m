Received: from wproxy.gmail.com ([64.233.184.199])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7hYa-00087f-9N
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 18:47:50 -0400
Received: by wproxy.gmail.com with SMTP id 37so1688077wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2005 15:47:41 -0700 (PDT)
Message-ID: <f9d2a5e1050823154740e66385@mail.gmail.com>
Date: Tue, 23 Aug 2005 15:47:41 -0700
From: Russ Dill <russ.dill@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: RedBoot FIS Directory parsing bails out early
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Deleted partitions cause the FIS directory parsing to bail out early,
this is because in redboot, deleting a partition causes the first byte
in the entry to be set to 0xff. The kernel is currently looking for
0xff as an end of table marker.

This means that if you create two partitions, ie, test1 and test2, and
then delete test1, the kernel will no longer detect test1.

redboot.c should instead scan every entry in the FIS table, and throw
out any entries that begin with 0xff, ie, change the break to a
continue. The checksum check should also be changed  from a break to a
continue (even though checksums in fis tables were never implemented
anyway).

pseudo patch:

 struct fis_list *new_fl, **prev
=20
 if (buf[i].name[0] =3D=3D 0xff)
-       break;
+       continue;
 if (!redboot_checksum(&buf[i]))
-       break;
+       continue;
