Received: from [208.201.248.136] (helo=nt.Broadlink.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ZJsP-0007CP-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2001 23:20:01 +0100
Message-ID: <216CFCF61FEAD311AE64009027E23B7CC06E6B@mail.broadlink.com>
From: Rob McPeak <RMcPeak@BroadLink.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Compiling LILO 21.7.5
Date: Tue, 21 Aug 2001 15:25:06 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi - 

I've gotten the latest version of MTD from CVS, and sources for lilo 21.7.5
from brun.dyndns.org.  I attempted to patch the sources using
lilo21-mtd-patch, whcih failed 4 of 5 chunks.  Am I missing something here?
When I patched the sources by hand, I got errors compiling temp2.s...I read
the README.common.problems file from the lilo tarball, which said that the
most common problem was that the version of as86 was wrong, that I need 0.15
or later.  I have 0.15.4-1(debian package).  Suggestions?  I do need to be
able to compile the sources...

Thanks!
Rob McPeak
