Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D2AZ2-0000m0-VE
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 11:01:09 -0500
Date: Fri, 18 Feb 2005 17:01:09 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050218160108.GC5926@synertronixx3>
References: <20050218154216.GA5926@synertronixx3>
	<1108741733.13420.20.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1108741733.13420.20.camel@sauron.oktetlabs.ru>
Subject: Re: freeze when mounting fs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-18 18:48 +0300 schrieb Artem B. Bityuckiy:
> On Fri, 2005-02-18 at 16:42 +0100, Konstantin Kletschke wrote:
> > But got no info.
> Because you just mesages. You need to use synchronous output to capture
> messages. 

You mean synchronous logging of syslogd/klogd?
Busybox's can't.
It seems adding some scripts to /home into the rootfs breaks things.
I removed /home before mkfs.jffs2, left the other stuff like it was,
voily, mounts, runs, works with no error.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
