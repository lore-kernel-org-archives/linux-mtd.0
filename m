Received: from ext-ch1gw-1.online-age.net ([216.34.191.35])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BT5qF-0008I6-EZ
	for linux-mtd@lists.infradead.org; Wed, 26 May 2004 17:21:43 -0400
Received: from int-ch1gw-4.online-age.net (int-ch1gw-4 [3.159.232.68])
	by ext-ch1gw-1.online-age.net (8.12.9/8.12.9/990426-RLH) with ESMTP id
	i4QLLSpU006493 for <linux-mtd@lists.infradead.org>;
	Wed, 26 May 2004 17:21:32 -0400 (EDT)
Received: from uswaumsxb4medge.am.med.ge.com (localhost [127.0.0.1])
	by int-ch1gw-4.online-age.net (8.12.9/8.12.3/990426-RLH) with ESMTP id
	i4QLLRjB002651 for <linux-mtd@lists.infradead.org>;
	Wed, 26 May 2004 17:21:28 -0400 (EDT)
Message-ID: <77FE4A1FA59FF947845A42194AD6676202E30F72@uswaumsx07medge.med.ge.com>
From: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 26 May 2004 16:21:20 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Accessing an MTD device from kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To list,

I've successfully setup MTD devices for our NOR flash chips and
everything is working great from userspace.  But I have a need to access
the NOR flash from within kernelspace, such as in a /proc entry.

What is the best way to access the flash from within the kernel?  The
only way I've be able to so far is to just dereference a pointer
pointing to the flash address.  But this creates two issues (that I know
about):

1. A race condition between my proc entry that reads the flash and
another process using the MTD device.

2. The MTD device does not always leave the flash chip in read mode.

Is there anything setup in the current MTD code to allow access from
within the kernel?

Thanks...
Dan
