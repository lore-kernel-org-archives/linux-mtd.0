Received: from tiku.hut.fi ([130.233.228.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15k0Cr-0004ak-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2001 10:33:17 +0100
Date: Thu, 20 Sep 2001 12:39:22 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Preparation for sync with Linus.
Message-ID: <20010920123922.A8940@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <16166.1000939762@redhat.com>; from dwmw2@infradead.org on Wed, Sep 19, 2001 at 11:49:22PM +0100
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

> In the meantime, if there's anything you don't like about the current set 
> of changes, now would be a good time to shout.

Hi David,

if the chip has sectors locked after cold boot, currently I have to either 
run unlock command or add a call to unlock function into the map driver.

Should chip driver unlock sectors if chip is detected and the sectors are 
suspected to be locked?

Jarkko Lavinen
