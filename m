Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gsJJ-0002rM-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 19:03:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0203011346350.795-100000@ba.devicemonsters.com> 
References: <Pine.LNX.4.21.0203011346350.795-100000@ba.devicemonsters.com> 
To: "Brian P. Austin" <baustin@codemonsters.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Reproduction of NFTL Bug with DOC 2000 288MB FULL DEBUG 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Mar 2002 19:14:06 +0000
Message-ID: <10097.1015010046@redhat.com>
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

Hmm. Did you do this from scratch, starting by reformatting the NFTL again? 
It doesn't look like it.

Use the M-Systems DFORMAT (version 4.2) if you can, rather than nftl_format.
If you do use nftl_format, make sure the NFTL kernel module isn't loaded 
while you do so.

Then get logs again, preferably over a serial console, because syslog is 
lossy.

I may have a 288MiB unit here, in fact - I'll see if I can reproduce it 
myself.

--
dwmw2
