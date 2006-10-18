Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga7UZ-0008ET-CY
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 05:13:54 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9I9DaP1030616
	for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2006 11:13:36 +0200
Date: Wed, 18 Oct 2006 11:14:51 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_flash_writev(): Non-contiguous write to
In-Reply-To: <4535EDD2.8060407@psolv.hu>
Message-ID: <Pine.LNX.4.64.0610181112180.25906@lnxricardw.se.axis.com>
References: <4535EDD2.8060407@psolv.hu>
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


On Wed, 18 Oct 2006, D=E9mi Zsolt wrote:

> at91rm9200 based -own designed- board with 2.6.18 linux kernel. I have
> patched it from mtd csv (http://sourceware.org/jffs2/), and I'm using
> mtd-utils 1.0.0 (http://www.linux-mtd.infradead.org/) and compiled with

While I don't think this is the solution to your problem, note that there=
=20
there now is an mtd-utils 1.0.1 from the same place. I know at least some=
=20
of the applications in 1.0.0 don't work properly with 2.6.18 due to mtd=20
changes.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
