Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ocaY-0003Ab-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2001 04:20:50 +0100
Received: from 198.142.103.111.optusnet.com.au ([198.142.103.111] helo=max.ctam.local)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15ocjJ-00010c-00
	for linux-mtd@lists.infradead.org; Wed, 03 Oct 2001 04:29:56 +0100
Received: from k9.ctam.local ([192.168.0.55] helo=bigpond.com)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 15ocie-0004W0-00
	for <mtd@infradead.org>; Wed, 03 Oct 2001 13:29:12 +1000
Message-ID: <3BBA8605.2040301@bigpond.com>
Date: Wed, 03 Oct 2001 13:29:09 +1000
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: mtd: looking for serial flash storage
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

I'm looking for flash storage to put Linux and a root filesystem on.  My 
embedded system is tiny (credit card size) so space is an issue.  I can 
not easily use a DiskOnChip as there are only 12 address lines from the 
CPU board connector available to me.  I am investigating serial flash 
devices.  Are there any that MTD or Linux supports ???

I know about the Atmel data flash devices.  Are they supported by Linux 
or MTD ???

I am interested in investigating the chipsets that the key ring type USB 
hard drives use.  Does anyone know what chipsets these are ?  Does MTD 
or Linux support them ???

Thanks for any advise, suggestion or pointers,
Brendan Simon.
