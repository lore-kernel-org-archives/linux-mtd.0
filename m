Received: from fmfdns01.fm.intel.com ([132.233.247.10] helo=calliope1.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y7RO-0007R7-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 15:23:26 +0000
Received: from fmsmsxvs041.fm.intel.com (fmsmsxv041-1.fm.intel.com [132.233.48.109])
	by calliope1.fm.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.49 2002/01/25 02:16:58 root Exp $) with SMTP id PAA14547
	for <linux-mtd@lists.infradead.org>; Tue, 5 Feb 2002 15:34:34 GMT
Received: from fmsmsx29.FM.INTEL.COM ([132.233.42.29])
 by fmsmsxvs041.fm.intel.com (NAVGW 2.5.1.16) with SMTP id M2002020507352520114
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 07:35:25 -0800
Message-ID: <413FBB0BA5AED1119122000083234B1A01DD2973@alpha.igk.intel.com>
From: "Kolakowski, Mikolaj" <Mikolaj.Kolakowski@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Problem with files removing
Date: Tue, 5 Feb 2002 16:34:03 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

After short investigation I have noticed that jffs2_unlink function is
called and jffs2_clear_inode is not.
I think that this is problem with kernel version that I use 2.3.99. 

I have put there d_delete but it cause GPF in clear_inode:
if(inode->i_data.nrpages) 
	BUG();

Anybody could direct me how jffs2_clear_inode should be called from
jffs2_unlink?
Mikolaj
