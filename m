Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dXvU-0004WS-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2003 15:45:28 +0000
Subject: Re: JFFS2 Format Documentation?
From: Henrik Nordstrom <hno@marasystems.com>
To: Phil Thompson <phil@river-bank.demon.co.uk>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <200301281411.46041.phil@river-bank.demon.co.uk>
References: <20030128132344.GA7618@wohnheim.fh-wedel.de>
	 <200301281235.27066.phil@river-bank.demon.co.uk>
	 <9649.1043761486@passion.cambridge.redhat.com>
	 <200301281411.46041.phil@river-bank.demon.co.uk>
Content-Type: text/plain
Message-Id: <1043770425.5203.8.camel@henrik.marasystems.com>
Mime-Version: 1.0
Date: 28 Jan 2003 17:13:45 +0100
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

tis 2003-01-28 klockan 15.11 skrev Phil Thompson:

> I need to modify a bootloader to load the kernel from a JFFS2 filesystem - so 
> a simple read is all that is needed. Unfortunately the bootloader doesn't 
> have a license that is compatible with the GPL.

Another idea: You could do a two stage boot loader process.. the
(non-GPL) bootloader just loads another bootloader which knows how to
read JFFS2, or replace the bootloader entirely..

-- 
Henrik Nordstrom <hno@marasystems.com>
MARA Systems AB
