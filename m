Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KNDp-00052m-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 18:56:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200206181253609.SM02488@there> 
References: <200206181253609.SM02488@there> 
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millennium/2000 - Instructions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jun 2002 18:56:51 +0100
Message-ID: <24299.1024423011@redhat.com>
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

Mark, that's excellent documentation -- thanks. Is it OK for me to put that 
on the web site?

I have only one suggestion -- rather than using fdisk to create a single 
partition and then formatting that as ext2, we might as well just put the 
ext2 file system on /dev/nftla (i.e. the whole device), and use (dc0) in 
Grub instead.

BTW, did your 'factory marked' bad blocks in step 10 really match the ones 
from step 2? I'm still suspicious of nftl_format. It would be _really_ nice 
if we could use DFORMAT -- either a Linux port of DFORMAT to replace 
nftl_format and/or working out how to turn our Grub image into a .EXB file 
so it can be loaded directly by DFORMAT.

--
dwmw2
