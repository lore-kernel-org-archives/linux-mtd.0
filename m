Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm6VH-0000mD-GU
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 15:26:20 +0000
Received: by eyd9 with SMTP id 9so1808749eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 07:26:17 -0800 (PST)
Subject: Re: JFFS2: truncated files after power loss scenario
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sven <svenjaborek@gmx.de>
In-Reply-To: <1297004384.2084.9.camel@hbox>
References: <1297004384.2084.9.camel@hbox>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 17:25:25 +0200
Message-ID: <1297005925.4460.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-02-06 at 15:59 +0100, Sven wrote:
> Hi mtd list,
> 
> What is the expected behavior for files beeing written on a jffs2 (on
> nand) during a power loss? Would an incomplete file exist, or would the journaling do a roll back
> because of an incomplete transaction?
> Is there a difference with new files created, or existing files beeing modified?
> 
> My tests show that on next bootup the file exists, but is truncated. I have not seen any journaling related roll backs.
> 
> I took a look at this, because we have seen a truncated configuration file once. I'm not sure what caused this. Perhaps a power loss during write.

How big was this file?

> I wonder about the Inode #42 Version 5 to 9 and about why two Dirent exist(ed) for #ino 42.
> Do you think this was caused by a power loss scenario?

No, this is how JFFS2 works, this is related to the design. In short,
only v9 is valid, other versions are invalid, you can ignore them.

> The truncated file error happened on a 2.6.18 based kernel.
> I have done power loss tests on 2.6.34, which showed truncated files as well.

Please, give more information:

1. Your flash type, if NAND - page size.
2. What do you do to the file in your test - how exactly you change it.
3. How big is the file?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
