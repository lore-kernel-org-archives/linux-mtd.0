Received: from spiresoftware.com
	([64.170.143.214] helo=aillas.spiresoftware.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175KFo-0005ax-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 06:44:44 +0100
Received: from shimrod.spiresoftware.com (adsl-64-170-143-212.spiresoftware.com [64.170.143.212])
	by aillas.spiresoftware.com (8.11.0/8.11.0) with ESMTP id g484knh11446
	for <linux-mtd@lists.infradead.org>; Tue, 7 May 2002 21:46:49 -0700
Date: Tue, 7 May 2002 22:43:52 -0700 (Pacific Daylight Time)
From: Glenn Serre <gaserre@spiresoftware.com>
To: linux-mtd@lists.infradead.org
Subject: Status of XIP for userspace programs?  
Message-ID: <Pine.WNT.4.44.0205072239040.1020-100000@shimrod.spiresoftware.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Good evening,

What is the status of XIP for userspace programs?  Is anyone working on
this for a recent kernel?  A quick grep through the mailing list archive
seems to indicate that

1. The consensus is that it's better to have compression than XIP.
2. XIP work for userspace programs has never progressed to the point of
being able to actually run programs.

Does this seem correct?

Thanks in advance,
--Glenn Serre
