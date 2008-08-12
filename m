Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KT3Nu-0001Xp-Mo
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 23:34:39 +0000
In-Reply-To: <48A14CAA.6030808@nokia.com>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: Problem mounting a UBIFS volume
MIME-Version: 1.0
Message-ID: <OF9C1AB2CA.0CC161A2-ON882574A3.00816BD1-882574A3.00817E33@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 12 Aug 2008 16:34:35 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> I found an endian bug in mkfs.ubifs.  A patch has been added to 
> mkfs.ubifs git tree.
> 
> Please try it.
> 
> 

Adrian,

That seems to have fixed it.  I'm able to mount just fine now.  Thanks for 
all the help.

Bruce
