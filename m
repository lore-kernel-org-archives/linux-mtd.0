Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ur3j-0007ip-00
	for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2002 10:05:15 +0100
Date: Fri, 27 Sep 2002 11:05:15 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: free <dag4004@free.fr>
Cc: MTD mailing liste <linux-mtd@lists.infradead.org>
Subject: Re: [newbie] MTD and tiny RAM
Message-ID: <20020927090515.GB5144@wohnheim.fh-wedel.de>
References: <BNEJIGKFJNJLELKBCMDAMEJGCCAA.dag4004@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BNEJIGKFJNJLELKBCMDAMEJGCCAA.dag4004@free.fr>
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

On Thu, 26 September 2002 09:25:41 +0200, free wrote:
> I use a very tiny SRAM (128ko) battery backuped to save
> very important and changeable data.
> I have a char. driver for it (i know how to read/write it)
> I would like to mount it on Linux VFS but it seems that
> bloc drivers are RAM cached.
> Acces on this SRAM must be immediatly apply (if power goes
> down data must be safe)
> 
> Does MTD could help me :
> - is my SRAM not to tiny (128KO) for use with MTD ?
> - could i acces to my SRAM through MTD in block mode without caching ?
> - what king of file system could fit on such tiny RAM ?

(This assumes 128KO == 128 kilobyte)

You could use the slram driver for this and put a jffs2 on top of it.
But slram uses eraseblocks of 64kiB and jffs2 needs 5 of those free
for being operational. You should tweak the slram driver to use
something closer to 4kiB.

Jörn

-- 
There's nothing better for promoting creativity in a medium than
making an audience feel "Hmm ­ I could do better than that!"
-- Douglas Adams in a slashdot interview
