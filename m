Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Co3hn-0003EK-3T
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 12:51:56 -0500
Received: from [10.1.1.155] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	10 Jan 2005 12:50:58 -0500
Date: Mon, 10 Jan 2005 12:49:33 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0501101246150.20261@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: how to loopback mount a JFFS2 filesystem on my linux box?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  i swear i once knew how to do this, but it's lost in the mists of
time.  i used "mkfs.jffs2" to create a simple JFFS2 image, and now i
just want to mount it on my fedora core 3 system using a loopback
mount.

  i have the jffs2 and mtdcore modules currently loaded, and normally,
what i would try is:

  # mkdir m
  # mount -o loop -t jffs2 <jffs2.img file> m

but what i get is:

# mount -o loop -t jffs2 hello.img m
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems
       (could this be the IDE device where you in fact use
       ide-scsi so that sr0 or sda or so is needed?)

  i *vaguely* recall needing to do a bit more work, like loading
another module or two.  any pointers to a URL for this?  thanks.

rday
