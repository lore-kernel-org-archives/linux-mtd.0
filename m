Received: from fmr20.intel.com ([134.134.136.19] helo=orsfmr005.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6Y3N-0001OD-RE
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 12:54:34 -0500
Received: from orsfmr101.jf.intel.com (orsfmr101.jf.intel.com [10.7.209.17])
	by orsfmr005.jf.intel.com (8.12.10/8.12.10/d: major-outer.mc,
	v 1.1 2004/09/17 17:50:56 root Exp $) with ESMTP id j22HsWok017356
	for <linux-mtd@lists.infradead.org>; Wed, 2 Mar 2005 17:54:32 GMT
Received: from orsmsxvs040.jf.intel.com (orsmsxvs040.jf.intel.com
	[192.168.65.206])
	by orsfmr101.jf.intel.com (8.12.10/8.12.10/d: major-inner.mc,
	v 1.2 2004/09/17 18:05:01 root Exp $) with SMTP id j22HsWd7005963
	for <linux-mtd@lists.infradead.org>; Wed, 2 Mar 2005 17:54:32 GMT
Received: from orsmsx331.amr.corp.intel.com ([192.168.65.56])
	by orsmsxvs040.jf.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005030209543224892
	for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2005 09:54:32 -0800
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Mar 2005 09:54:32 -0800
Message-ID: <44BDAFB888F59F408FAE3CC35AB470410153FFCB@orsmsx409>
From: "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: unable to boot JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
	I am trying to boot JFFS3 after applying the latest patches from
the CVS and I am not able to boot. I am seeing

Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(32,2).

Do I need to do any thing special or am I missing any thing here?
However I am able to boot jffs2 from the same CVS tarball.

Any help is appreciated.

Thanks,

-Anil Keshavamurthy
Sr. Software Engineer
Open Source Technology Center/SSG
Intel Corp.
(w) 503-712-4476
