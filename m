Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17gwAb-0004r1-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 00:42:49 +0100
Date: Tue, 20 Aug 2002 01:42:39 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Conn Clark <clark@esteem.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How does one mount an existing jffs2 partition so it is writeable?
Message-ID: <20020819234239.GA6792@wohnheim.fh-wedel.de>
References: <3D612C1F.55297C10@esteem.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3D612C1F.55297C10@esteem.com>
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

On Mon, 19 August 2002 10:34:23 -0700, Conn Clark wrote:
> 	How does one mount an existing jffs2 partition so it is writeable?
> After a reboot I can mount my jffs2 and read from it, but not write to it
> I can erase it first and mount it then read and write to it , but then I
> lose my info on it which defeats the whole reason for having it.

1) Append "rw" to kernel command line.
2) mount / -o remount,rw

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
