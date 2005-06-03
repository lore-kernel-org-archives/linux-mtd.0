Received: from fmr16.intel.com ([192.55.52.70] helo=fmsfmr006.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1De13Z-0007W8-Qf
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 21:33:07 -0400
Received: from fmsfmr100.fm.intel.com (fmsfmr100.fm.intel.com [10.1.192.58])
	by fmsfmr006.fm.intel.com (8.12.10/8.12.10/d: major-outer.mc,
	v 1.1 2004/09/17 17:50:56 root Exp $) with ESMTP id j531X4eE019388
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2005 01:33:04 GMT
Received: from fmsmsxvs042.fm.intel.com (fmsmsxvs042.fm.intel.com
	[132.233.42.128])
	by fmsfmr100.fm.intel.com (8.12.10/8.12.10/d: major-inner.mc,
	v 1.2 2004/09/17 18:05:01 root Exp $) with SMTP id j531WYvO032244
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2005 01:33:04 GMT
Received: from fmsmsx332.amr.corp.intel.com ([132.233.42.148])
	by fmsmsxvs042.fm.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005060218330417413
	for <linux-mtd@lists.infradead.org>; Thu, 02 Jun 2005 18:33:04 -0700
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Jun 2005 18:33:02 -0700
Message-ID: <80C38847588CEF4EB97210D53B752C5D0BE3F253@fmsmsx402.amr.corp.intel.com>
From: "Benavides, Tony" <tony.benavides@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: Adding a latest snapshot to a 2.6.9 kernel base
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to add the latest MTD snapshot to my 2.6.9 kernel base.
After running the patchkernel.sh command I am assuming that my 2.6.9
kernel is patched.

Is this all I need to do to guarantee that the kernel is patched with
the new MTD?
I found that some files such as makefile.common and makefile.inc were
not added and I had to manually add them.

Is it common to have to go through every file and manually add source or
am I missing a flag passed to patchkernel.sh

It would be nice to streamline this?

Thanks/Tony =20
