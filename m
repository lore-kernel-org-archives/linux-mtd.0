Received: from smtp3.infineon.com ([203.126.106.229])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gl0FZ-00073i-UB
	for linux-mtd@lists.infradead.org; Fri, 17 Nov 2006 04:43:21 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Linux-atm-2.4.1 build error
Date: Fri, 17 Nov 2006 17:43:06 +0800
Message-ID: <5049F8BE55F36348A315EFBE6CF34386A14E15@sinse301.ap.infineon.com>
In-Reply-To: <5049F8BE55F36348A315EFBE6CF34386A14DA7@sinse301.ap.infineon.com>
From: <KokHow.Teh@infineon.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi;
	Sorry. I sent to the wrong list.

Best Regards,
KH=20

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Teh Kok How
(IFAP DC COM SD)
Sent: Friday, November 17, 2006 5:29 PM
To: linux-mtd@lists.infradead.org
Subject: Linux-atm-2.4.1 build error

Hi;
	I am trying to build linux-atm-2.4.1 with a mips cross compiler
and I stumble into `make` error below:

<snip>
Making all in qgen
make[3]: Entering directory `/misc/tehkok/linux-atm-2.4.1/src/qgen'
/opt/uclibc-toolchain/ifx-lxdb-1-1/gcc-3.3.6/toolchain-mips/bin/mips-lin
ux-cc -E -DHAVE_CONFIG_H -I.
 -I. -I../.. - <msg.fmt | ./qgen -D
<stdin>:93:54: pasting "}" and "fw_pcr_0" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "bw_pcr_0" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "fw_pcr_01" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "bw_pcr_01" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "fw_scr_0" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "bw_scr_0" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "fw_scr_01" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "bw_scr_01" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "fw_mbs_0" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "bw_mbs_0" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "fw_mbs_01" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "bw_mbs_01" does not give a valid
preprocessing token
<stdin>:93:54: pasting "}" and "best_effort" does not give a valid
preprocessing token
<stdin>:138:3: invalid preprocessing directive #Note
<stdin>:139:9: invalid preprocessing directive #to
/bin/sh: line 1: ./qgen: cannot execute binary file
make[3]: *** [qd.dump.c] Error 126
make[3]: Leaving directory `/misc/tehkok/linux-atm-2.4.1/src/qgen'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/misc/tehkok/linux-atm-2.4.1/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/misc/tehkok/linux-atm-2.4.1'
make: *** [all-recursive-am] Error 2
[tehkok@linux01 linux-atm-2.4.1 3]$

	I run `configure` with options as follows:

./configure  --target=3Dmips-linux --host=3Di386-redhat-linux
--build=3Di386-pc-linux-gnu
--prefix=3D/misc/tehkok/danube_build/root_filesystem
--exec-prefix=3D/misc/tehkok/danube_build/root_filesystem --no-create
--no-recursion

	The problem is that the build process tries to execute qgen in
src/qgen which has been compiled with the cross-compiler and therefore,
it is for MIPS arch and not executable on my host. What's wrong with my
build process?
	Any insight is appreciated.

Thanks & Regards,
KH

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
