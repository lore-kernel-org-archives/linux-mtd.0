Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cr0C-0007Ht-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 16:50:56 +0000
Date: Mon, 18 Feb 2002 18:01:57 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: "Brian J. Fox" <bfox@ua.com>
cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
   joern@wohnheim.fh-wedel.de
Subject: Re: MTD concat layer
In-Reply-To: <E16cq6b-0004Hq-00@speedy.datawave.net>
Message-ID: <Pine.LNX.4.21.0202181800360.20027-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Mon, 18 Feb 2002, Brian J. Fox wrote:
> 
> BUG() is completely acceptable.  It allows the driver to be fixed.
> It's also orthogonal to the original question.  Erasing blocks is
> simply a way to guarantee that data has been irrevocably lost.

OK, so we all finally agree that BUG() is the way to go (rather than
returning -EINVAL. Right ?

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
