Received: from [2001:a60:0:488::2] (helo=mail-out.m-online.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BrgP3-0007k2-G7
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2004 13:15:14 -0400
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 02 Aug 2004 19:08:24 +0200."
	<20040802170824.GC26115@wohnheim.fh-wedel.de>
Date: Mon, 02 Aug 2004 19:14:57 +0200
Sender: wd@denx.de
Message-Id: <20040802171502.4DCB1C109F@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Volatile data device vor jffs2 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <20040802170824.GC26115@wohnheim.fh-wedel.de> you wrote:
>
> Your approach doesn't always work for me because sometimes people care
> a lot about the last log entries.  They need to be inside a
> non-volatile medium, either nvram or flash.  Unless you want to move
> the page cache to nvram... ;)

Did you consider using oramfs? See http://pramfs.sourceforge.net/


Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
Of all the things I've lost, I miss my mind the most.
