Received: from mail013.syd.optusnet.com.au ([210.49.20.171])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HgEO-0007Zg-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 08:38:20 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail013.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g5B7cFM20331
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 17:38:15 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=bigpond.com)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17HgEI-0003K4-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 17:38:14 +1000
Message-ID: <3D05A8E5.9040808@bigpond.com>
Date: Tue, 11 Jun 2002 17:38:13 +1000
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC2000 partitiioning question
References: <3D057440.5000104@bigpond.com> <20449.1023779170@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Thanks for the feedback.  I think it answers all my questions (except 
the one below).

>The above layout hasn't been tested much but should work OK. You can give 
>both offset and size arguments to the 'nftl_format' program. When using the 
>nftl_format program, ensure that the NFTL driver module is not loaded into 
>the kernel -- any time the module is loaded (or support is built-in), 
>that's like having the NFTL 'mounted', and you shouldn't reformat a mounted 
>file system.
>

HUH ???
If I read this correctly, this means one can NEVER reformat a NFTL 
device with kernel that boots from a DOC (since the driver must be built 
in to the kernel).  Is this correct ?

This is obviously different for EXT2 and other filesystems, as they can 
be reformatted anytime with the driver module loaded or built in to the 
kernel.  Is there a technical reason why NFTL is not the same ???

Thanks,
Brendan Simon.
