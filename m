Received: from dc-mxdb05.hsacorp.net ([209.225.8.79] helo=dc-mxdb05.cluster1.charter.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jVRx-0001gW-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 01:42:49 +0100
Received: from [206.190.89.51] (account <thepond@charter.net>)
  by dc-mxdb05.cluster1.charter.net (CommuniGate Pro WebUser 3.4.8)
  with HTTP id 1051373 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 20:53:46 -0400
From: "Gerald Walden" <thepond@charter.net>
Subject: Can't get Linux on SSTI DOC 
To: linux-mtd@lists.infradead.org
Date: Tue, 18 Sep 2001 20:53:46 -0400
Message-ID: <web-1051373@dc-mxdb05.cluster1.charter.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
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

Greetings:

I have an 8MB Disk-On-Chip Device made by SSTI.  From what I
am told I do not need any special drivers to use this from
Linux.

However - even before I get to that stage - I cannot even
get the DOC to event try to boot linux.

I followed all the step one would normally take to make a
bootable Hard Drive, and I keep getting the error "Invalid
or Damaged Bootable partition".

Basically, 

1) I made a filesystem for the device.

2) Then I Fdisk'ed the device, setting the one and only
partition to be bootable.

2) Then I formatted the device (and hence the entire
partition) as ext2.

3) and then I mounted the device as a secondary IDE device
on my Linux Box as ext2.

4) I copied the filesystem files to the device.

5) I ran LILO with a configuration file that pointed to the
appropriate locations on my device.  In verbose mode it
looked like everything went okay.

When I try to boot from the device as a master I get the
error:

"Invalid or Damaged Bootable partition".

Does anyone have any ideas?

Please respond to this email address (thepond@charter.net)
'cause I am only receiving a daily digest.

Kindest Regards,

Jerry
