Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GpK7i-0007Vt-E7
	for linux-mtd@lists.infradead.org; Wed, 29 Nov 2006 02:44:57 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	kAT7ijju029307
	for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2006 08:44:45 +0100
Date: Wed, 29 Nov 2006 08:43:58 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Upgrading mtd-utils in uClinux.
In-Reply-To: <456C4306.8070205@valcom.com>
Message-ID: <Pine.LNX.4.64.0611290842530.5328@lnxricardw.se.axis.com>
References: <456C4306.8070205@valcom.com>
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


On Tue, 28 Nov 2006, Glen Johnson wrote:

> I am attempting to compile the latest mtd-utils into uClinux's=20
> distribution dated 2006-08-03.  After some unsuccessful attempts I found=
=20
> the new mtd-utils needed an updated zlib.  I successfully upgraded to=20
> zlib version 1.2.3 inside uClinux-dist/lib/zlib.  I now have that=20
> compiling and still am not getting anywhere with compiling the=20
> mtd-utils. I dropped the latest mtd-utils code into the directory=20
> uClinux-dist/user/mtd-utils.  I have observed the Makefiles between the=
=20
> new updated mtd-utils and the old uClinux-dist/user/mtd-utils/Makefile=20
> are VERY different.  I tried to use the old Makefile as a template to=20
> build the new code and it still is not compiling. What is the correct=20
> method of upgrading mtd-utils?  It shouldn't be as difficult to upgrade=
=20
> some code in user space as I am making it.  I feel like I must be going=
=20
> about this the wrong way.  Are there any pointers, tips, or=20
> recommendations to get me going in the right direction?

Unless someone here has had this specific problem, some form of output=20
from the compilation indicating what is going wrong would be helpful.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
