Received: from n138.ols.wavesec.net ([209.151.19.138] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17NKLo-0002kg-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 22:29:21 +0100
Date: Wed, 26 Jun 2002 17:28:28 -0400 (EDT)
From: David Woodhouse <dwmw2@infradead.org>
To: David Cooper <david@forcedpotato.com>
cc: Ilguiz Latypov <ilatypov@superbt.com>,
    Linux MTD <linux-mtd@lists.infradead.org>
Subject: RE: X Windows Performance with DOC 2000 
In-Reply-To: <AIEOIMKIOAAJKHJOGAEFMEGFCEAA.david@forcedpotato.com>
Message-ID: <Pine.LNX.4.44.0206261727190.1643-100000@lapdancer.baythorne.internal>
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

On Wed, 26 Jun 2002, David Cooper wrote:

> I tried using SysRq-P (after attempting a "mount" of the DoC once X is
> running from the IDE) and it shows me the registers and so forth but I am
> yet to decipher this into which instructions are causing the problem (I need
> to work on it further).

You need to look up the PC in your System.map to see which function it's 
in. Is it always in roughly the same place?

> In the meantime, I tried using the latest M-Systems driver just for fun.
> This does allow X to run from the DoC.  Looks like there is some conflict
> (for me anyway) between X and the MTD driver.

Interesting. I wonder what it does differently,

-- 
dwmw2
