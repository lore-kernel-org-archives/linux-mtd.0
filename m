Received: from rproxy.gmail.com ([64.233.170.193])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTwIt-000694-Ej
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 02:27:16 -0400
Received: by rproxy.gmail.com with SMTP id y7so521921rne
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 May 2005 23:27:19 -0700 (PDT)
Message-ID: <f6d0cd0605050523271574d91c@mail.gmail.com>
Date: Fri, 6 May 2005 11:57:19 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Warning during GC, resulting in to Magic Bitmask Error for JFFS2.
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using Linux 2.6.10 kernel and  mounting the JFFS2 partition from
Intel NOR flash after booting the system. These error doesn't appear
always, it only comes
if we follow the steps explained below.

1. Boot the system and mount the JFFS2 partition. It happens without
any error at the first time.
2. Copy enough data to JFFS2 mounted directory so it becomes full.
3. Once the mounted partition is full, we delete few files from the partiti=
on.
    We get following warning when we do that.
    "jffs2_reserve_space(): Low on dirty space to GC, but it's a
deletion. Allowing.."
4. Now again reboot the system now we get below errors while mounting the=
=20
   JFFS2 partition.

  jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
0x0013cad4: 0xa6fc   instead
  jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
0x0013cad8: 0x6e03 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0013cadc: 0x70=
cd in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0013cae0: 0x0e=
5f in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0013cae4: 0x75=
aa in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0013cae8: 0xca=
04 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0013caec: 0x5a=
ec in
stead

It would be really great if you can help me out to fix this problem.=20
Pl. note that i am only using the JFFS2 support which has come along
with the 2.6.10 Kernel.

Pl. help me out to fix this problem.

Thanks
Niraj
