Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9R3G-0003p1-EN
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 12:02:23 -0500
Date: Thu, 10 Mar 2005 18:02:23 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310170223.GC7018@synertronixx3>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310154640.GC4910@synertronixx3>
	<Pine.LNX.4.58.0503101621110.5506@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0503101621110.5506@phoenix.infradead.org>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 16:21 +0000 schrieb Artem B. Bityuckiy:

> Looks like JFFS2 really reads messed data from flash and I think this 
> isn't JFFS2'd failure.

So it reads wrong length of name (always too less)
and wrong data which always is one byte 
located somewhere before the name itself in flash.

When Hardware is broken, why does it not read name lengths too long
sometimes or reads data which is not found in the image a couple of
bytes before the filename? Is this possible? 

Well, may be... hence my question. But I have no clue anymore where to
search. I hacked onto this burst mode for weeks and only jffs2 is not
working in always a similair pattern.
Thats why I show up here, may be burst mode is broken for this system
and that only for jffs2. But I don't know how this filesystems works
exactly when reading and I am trying to find out which fucking bug in
hardware it could trigger, all other tests run fine.

Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
