Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175MXf-0005iq-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 09:11:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.WNT.4.44.0205072239040.1020-100000@shimrod.spiresoftware.com> 
References: <Pine.WNT.4.44.0205072239040.1020-100000@shimrod.spiresoftware.com> 
To: Glenn Serre <gaserre@spiresoftware.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Status of XIP for userspace programs? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 May 2002 09:11:15 +0100
Message-ID: <619.1020845475@redhat.com>
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

There are hacks which give you XIP as long as you never write to the flash 
chip. Doing XIP properly requires some work, and the rmap VM. Doing a 
writable XIP file system requires even more work.

--
dwmw2
