Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CU3CE-0007rp-PL
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 08:16:36 -0500
Date: Tue, 16 Nov 2004 14:16:33 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: "Artem B. Bityuckiy" <dedekind@phoenix.infradead.org>
Message-ID: <20041116131632.GD15759@synertronixx3>
References: <20041116124403.GC15759@synertronixx3>
	<Pine.LNX.4.58.0411161258350.25950@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0411161258350.25950@phoenix.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc1-mm5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2004-11-16 13:00 +0000 schrieb Artem B. Bityuckiy:
> Hello,
> 
> is it possible to somehow describe how to reproduce this? How to create 
> such JFFS2 image?

What do you mean other than:

> > I created the jffs2 filestem that way:
> > 
> > mkfs.jffs2 -q --eraseblock=128KiB -o
> > /home/konsti/svn/ptxdist-0.5.2-trunk/root_scb9328 -D
> > /home/konsti/svn/ptxdist-0.5.2-trunk/src/device_table.txt
> > --root=/home/konsti/svn/ptxdist-0.5.2-trunk/root
> > 
> > with mkfs.jffs2: revision 1.42

:)
/home/konsti/svn/ptxdist-0.5.2-trunk/root_scb9328

Is the root filesystem copyied together by ptxdist-0.5.2,
device_table.txt comntains some device nodes and file perission things,
is its content importand? I will put it onto a download location, if.

Also, if somebody want's to, I could put the rootfs image under a
download location for you.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
