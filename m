Received: from localhost.localdomain ([127.0.0.1] helo=localhost)
	by baythorne.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DKB3b-0007Gx-Lv
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2005 09:11:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Jesse Keating <jkeating@j2solutions.net>
In-Reply-To: <1113013385.11363.2.camel@jkeating2.hq.pogolinux.com>
References: <33462c0e0504081849492288f4@mail.gmail.com>
	<1113013385.11363.2.camel@jkeating2.hq.pogolinux.com>
Content-Type: text/plain
Message-Id: <1113033760.12012.30.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Sat, 09 Apr 2005 09:08:21 +0100
Content-Transfer-Encoding: 7bit
ReSent-Message-ID: <Pine.LNX.4.58.0504090910580.27926@baythorne.infradead.org>
Cc: fedora-ppc@lists.infradead.org
Subject: Re: FC3 hangs on ibook G4
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-04-08 at 19:23 -0700, Jesse Keating wrote:
> Make sure that it isn't trying to run rhgb.  Try forcing it to run level
> 3 w/out rhgb so that you can configure X by hand.  Take out 'quiet' too
> so that you can see whats going on.

And make sure you're using the initrd.

-- 
dwmw2
