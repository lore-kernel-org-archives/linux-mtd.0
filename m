Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jq3l-0003bv-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 23:43:13 +0100
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 15jq9i-0004Cl-00
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2001 23:49:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: Preparation for sync with Linus.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Sep 2001 23:49:22 +0100
Message-ID: <16166.1000939762@redhat.com>
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

I'm preparing to send the latest code to Linus. I'm going to read through 
the patch for obvious bogosity, probably removing some of the changes which 
are only for portability, and do some basic testing tomorrow. 

In the meantime, if there's anything you don't like about the current set 
of changes, now would be a good time to shout.

ftp.uk.linux.org:/pub/people/dwmw2/mtd/mtd-diff-against-2.4.9-pre12-v9

--
dwmw2
