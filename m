Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H6idH-0001OL-Uh
	for linux-mtd@lists.infradead.org; Tue, 16 Jan 2007 02:21:26 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l0G7KtII016093
	for <linux-mtd@lists.infradead.org>; Tue, 16 Jan 2007 08:20:55 +0100
Date: Tue, 16 Jan 2007 08:21:51 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: __user removed from mtd-abi.h
Message-ID: <Pine.LNX.4.64.0701160805030.11369@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I noticed that

#ifndef __KERNEL__
#define __user
#endif

has been removed from mtd-abi.h . I appreciate the reason, but I'm not=20
sure how to include this file in userspace now and get it to compile=20
properly.

The commitlog from dmwm2 says 'Now that we have headers_install, we don't=
=20
need this crap.'. Makes sense, but where is __user supposed to be defined=
=20
now - it is used as an identifier further down in the file, and userspace=
=20
programs that include mtd-abi.h therefore break during compilation.=20
mtd-abi.h doesn't appear to simply be a userspace version of a kernel=20
include file.

Is the above fix in fact broken for this particular file or should be=20
done in another way? I've had a look at the headers_install target in the=
=20
top level kernel makefile as well as the scripts/unifdef.c program, but I=
=20
seem to be going in circles. Could someone please enlighten me?

(As a side note, I've noticed that uClibc's include/features.h defines=20
__user to cope with such issues, but glibc's doesn't. So it might not be=20
appearant unless userspace code is built with glibc).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
