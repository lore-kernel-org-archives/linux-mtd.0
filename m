Received: from [2001:838:3de:1000::2] (helo=fserver.unsec.nl)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwGSN-000531-VE
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 04:05:53 -0500
From: "Rudi Engelbertink" <rudi@unsec.nl>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Wed, 2 Feb 2005 10:05:15 +0100
Message-Id: <20050202085600.M52308@unsec.nl>
In-Reply-To: <Pine.LNX.4.58.0502011601470.23856@phoenix.infradead.org>
References: <20050201150810.M93647@unsec.nl>
	<Pine.LNX.4.58.0502011601470.23856@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=iso-8859-1
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes() very very slow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 Feb 2005 16:03:31 +0000 (GMT), Artem B. Bityuckiy wrote
> On Tue, 1 Feb 2005, Rudi Engelbertink wrote:
> 
> > Hello,
> > 
> > On a 64 MiB NAND Flash I created a jffs2 file system. After several tests
> > especially power fail tests resulting in a lot off CRC and Data CRC errors.
> How do you do your power-fail tests?
The powerfail tests are done by:
A. a clock. Just turn off and on the power every 15 minutes and start the
an application which logs 2 40-60 byte events every second.
B. an internal (hardware) watchdog which reboots the system when the
'application' appears to be dead for 10 minutes.

> 
> > This appears not to be a problem except it takes a very long time to check
> > the file system.
> > The initial check (scanning for erased blocks) is done in aproximatly 10
> > seconds, but after that the jffs2_get_inode_nodes check is running. 
> > This process takes up to 8 minutes.
> Do you mean this happens every time or in case of "powerfails"?
Yes it happens every time the system reboots or when the (nand) filesystem
is mounted.
> 
> > During this time the file-system is inaccessible which in oure case a
> > watchdog decides to reboot the system, making it even worse.
> > It appears that the check is done with a stepsize of 16 bytes. On an 64MiB
> > NAND flash it does this check +/- 4 million times.
> That's strange. JFFS2 should share processor's cycles.
Yes, the root is accessable but the directory where the logging is stored,
is unavailable for several minutes.
> 
> > 
> > Is there a way to reduce the time to check the file-system and/or how 
> > can I recover from these errors.
> > 
> > Kind Regards,
> > Rudi.
> > -- 
> > They that can give up essential liberty to obtain a little temporary
> > safety deserve neither liberty nor safety.
> >    Benjamin Franklin (1706-1790), Letter to Josiah Quincy, Sept. 11, 1773.
> > GnuPG Key fingerprint = 706C E2AC 7AE2 BCEE 04EB  A962 0A75 7F9B 07A1 83E8
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.


RGDS Rudi.

-- 
They that can give up essential liberty to obtain a little temporary
safety deserve neither liberty nor safety.
   Benjamin Franklin (1706-1790), Letter to Josiah Quincy, Sept. 11, 1773.
GnuPG Key fingerprint = 706C E2AC 7AE2 BCEE 04EB  A962 0A75 7F9B 07A1 83E8
