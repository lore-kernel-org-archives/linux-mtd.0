Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm8bJ-00022O-5T
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 17:40:41 +0000
Received: by eyd9 with SMTP id 9so1832749eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 09:40:30 -0800 (PST)
Subject: Re: JFFS2: truncated files after power loss scenario
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Albrecht =?ISO-8859-1?Q?Dre=DF?= <albrecht.dress@arcor.de>
In-Reply-To: <1297012353.1854.1@antares>
References: <1297012353.1854.1@antares>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 19:39:37 +0200
Message-ID: <1297013977.4460.78.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sven <svenjaborek@gmx.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-02-06 at 18:12 +0100, Albrecht Dreß wrote:
> Am 06.02.11 17:03 schrieb(en) Artem Bityutskiy:
> > The bottom line is that it is difficult to fix broken applications
> by
> > changing JFFS2. The right way to update configuration files is
> described
> > here:
> > http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atomic_change
> 
> Dumb question: isn't it necessary to also run sync() after the fsync()
> - close() - rename() sequence, as to ensure that the directory entries
> are actually flushed to the flash?  Or does a call to
> 
> 	rename("configfile.tmp", "configfile");
> 
> *ensure* that after a crash during this call either the entry of the
> old file (configfile) or of the newly written contents
> (configfile.tmp) is accessible, independent of the moment when the
> crash happens?

Well, there was a huge debate about this. Rename does not ensure sync in
many file-systems, and posix does not require this. But user-spaces
relies on this and many people believe this should obviously be
guaranteed. So ext4 and may be some other FSes adjusted accordingly. I
wrote about this in UBIFS FAQ:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_exceptions

You'll find all the relevant links there.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
