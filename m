Received: from moat.murgatroid.com ([69.17.55.116] helo=mail.murgatroid.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CKQ3M-0000rU-LR
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 19:39:37 -0400
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Scott Wood'" <scott@timesys.com>,
	<linux-mtd@lists.infradead.org>
Date: Wed, 20 Oct 2004 16:39:14 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041019210333.GA15953@yoda.timesys>
Message-Id: <20041020233921.62536A00099@mail.murgatroid.com>
Cc: 
Subject: RE: [PATCH] Interleave order while probing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I don't think there are any situations
> where that would produce a false positive (short of having QRY as the
> actual flash data at the relevant addresses).

That would be a problem.  It's a block device: you can store whatever you
want, wherever you want.

-ch
