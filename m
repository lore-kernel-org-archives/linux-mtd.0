Received: from wproxy.gmail.com ([64.233.184.206])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw2Xr-0000pC-4K
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 13:14:38 -0500
Received: by wproxy.gmail.com with SMTP id 68so836739wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Feb 2005 10:14:24 -0800 (PST)
Message-ID: <6934efce0502011014a75e21b@mail.gmail.com>
Date: Tue, 1 Feb 2005 10:14:23 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20050201174419.GA32581@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <20050201153945.GA26068@synertronixx3>
	<Pine.LNX.4.61.0502011137020.31479@localhost.localdomain>
	<20050201172059.GB26068@synertronixx3>
	<Pine.LNX.4.61.0502011229310.31479@localhost.localdomain>
	<20050201174419.GA32581@synertronixx3>
Subject: Re: I need still help with XIP, kernel boots now :)
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I changed IMX_TCN(1) to IMX_TCN(0) because this is the system timer,
> damn! Oops is away then and booting an non xip uImage with
> CONFIG_XIP_MTD=y works very well! I could copy a file onto the extra
> partition mounted rw.
> 
> Running this xipuImage (/ mounted ro) allowed me to mount
> an extra jffs2 partition and ls on it, but writing on it freezes the
> system.

JTAG/BDM debug time?  I've had good luck with the Abatron BDI2000. ;)

If you look at cfi_cmdset_0001 you'll find some function use __xipram.
 This is intended to place them in RAM so when the flash goes into
status mode you can run these functions.  Make sure they are actually
in RAM.  Check your System.map.
