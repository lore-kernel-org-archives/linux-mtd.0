Date: Tue, 1 Feb 2005 16:03:31 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Rudi Engelbertink <rudi@unsec.nl>
In-Reply-To: <20050201150810.M93647@unsec.nl>
Message-ID: <Pine.LNX.4.58.0502011601470.23856@phoenix.infradead.org>
References: <20050201150810.M93647@unsec.nl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
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

On Tue, 1 Feb 2005, Rudi Engelbertink wrote:

> Hello,
> 
> On a 64 MiB NAND Flash I created a jffs2 file system. After several tests
> especially power fail tests resulting in a lot off CRC and Data CRC errors.
How do you do your power-fail tests?

> This appears not to be a problem except it takes a very long time to check
> the file system.
> The initial check (scanning for erased blocks) is done in aproximatly 10
> seconds, but after that the jffs2_get_inode_nodes check is running. 
> This process takes up to 8 minutes.
Do you mean this happens every time or in case of "powerfails"?

> During this time the file-system is inaccessible which in oure case a
> watchdog decides to reboot the system, making it even worse.
> It appears that the check is done with a stepsize of 16 bytes. On an 64MiB
> NAND flash it does this check +/- 4 million times.
That's strange. JFFS2 should share processor's cycles.

> 
> Is there a way to reduce the time to check the file-system and/or how 
> can I recover from these errors.
> 
> Kind Regards,
> Rudi.
> -- 
> They that can give up essential liberty to obtain a little temporary
> safety deserve neither liberty nor safety.
>    Benjamin Franklin (1706-1790), Letter to Josiah Quincy, Sept. 11, 1773.
> GnuPG Key fingerprint = 706C E2AC 7AE2 BCEE 04EB  A962 0A75 7F9B 07A1 83E8
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
