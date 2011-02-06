Received: from mailout-de.gmx.net ([213.165.64.23])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm6pm-0000yZ-LI
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 15:47:31 +0000
Subject: Re: JFFS2: truncated files after power loss scenario
From: Sven <svenjaborek@gmx.de>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1297005925.4460.41.camel@localhost>
References: <1297004384.2084.9.camel@hbox> <1297005925.4460.41.camel@localhost>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Sun, 06 Feb 2011 16:47:27 +0100
Message-ID: <1297007247.2084.36.camel@hbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

> > I took a look at this, because we have seen a truncated configuration file once. I'm not sure what caused this. Perhaps a power loss during write.
> 
> How big was this file?

9445 bytes.

> > I wonder about the Inode #42 Version 5 to 9 and about why two Dirent exist(ed) for #ino 42.
> > Do you think this was caused by a power loss scenario?

> Please, give more information:
> 
> 1. Your flash type, if NAND - page size.

Need to check this. Page size is 128k i think.

> 2. What do you do to the file in your test - how exactly you change it.

I did two tests.
First one is a bash script running an endless loop. It creates new files
over and over by copying the 9445 bytes size file every time with a new
filename.
A power loss with this script running always produced the truncated last
file. It had the size of 4k or 8k then.

The second test reflects more our simple use case. A C-program which
uses fopen with "w+", and then uses GLib GKeyFile operations to modify a
key and then store the file again. An fclose follows of course.

> 3. How big is the file?
9445 bytes


Please, could you say something general about what the journaling in
jffs2+nand should be able to do about power loss scenarios? I could not
find specs about that.

br, Sven
