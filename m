Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WLxx-0001DC-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 18:57:29 +0100
Message-ID: <30724FF712DFD2119E6200104B244892011974CA@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'Patrick Allaire' <pallaire@gameloft.com>,
	linux-mtd@lists.infradead.org
Subject: RE: Applying MTD to 2.2.x kernel
Date: Mon, 13 Aug 2001 12:47:46 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

>I have tried to apply some snapshot of the MTD to kernels 2.2.17 2.2.18
>without any success. If I only apply the mtd-2.2.17.patch, I dont have any
>problems with patch, but then it wont compile. 

I believe that mtd does not compile as modules in the 2.2.x series. You must
build the stuff into the kernel. If you are not using modules, then it may
help if you post an example of your compilation issues.

Vipin
