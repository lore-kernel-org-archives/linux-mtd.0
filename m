Received: from c214.h061013191.is.net.tw
	([61.13.191.214] helo=Thunder.arbor.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195c23-0002yx-8D
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 02:48:15 +0100
From: Daniel Toussaint <daniel@arbor.com.tw>
To: Jeremy Bowen <Jeremy.Bowen@opennw.com>
Message-ID: <3E9D27DE.4040801@arbor.com.tw>
Date: Wed, 16 Apr 2003 17:52:30 +0800
MIME-Version: 1.0
References: <DEA23DB61B62D4118B5900508B323B8401055531@OPENMAIL>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: mtd devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Jeremy,

1.) /dev/mtd/x

.. is what you get when you use devfs (device filesystem). In this case
your is configured with option CONFIG_DEVFS_FS=y.
Using devfs is generally better(and sometimes even a must) for embedded
systems - documentation about this is in
/kernelsource/Documentation/filesystems/devfs/
All device nodes are created on the fly, ONLY for devices that were
configured in the kernel and/or available on your system.
The naming scheme is a little different than the traditional one, but
make a lot more sense really.


2.) /dev/mtdx
....is a node that was created manually by someone with the command
"mknod" , and is what you see on most desktop/server linux distributions.
It's the way thing are done in unix in general. The drawback with this,
is that it takes up "real " space on your disk (or flash ... ) as
~ opposed to devfs, which
is only virtual, just like /proc.

By the way, I believe that Mandrake Linux is an exception to this, I've
noticed that they use (1) , in combination with devfs daemon.
devfsd daemon is a userspace program that makes a system based on devfs
compatible with the "old"  way.  

~From the userspace point of view , both formats are the same of course,
they still keep the same major/minor numbers.

Hope this could help you in some way , (I am really not an expert on this)

Greetings,
Daniel

Jeremy Bowen wrote:

|Hi
|
|I've seen various references to both
|1) "/dev/mtd/x" and
|2) "/dev/mtdx".
|
|My system uses the 1st format. Could someone please help me understand the
|differences between these two formats and where they come from.
|
|Thanks
|
|Jeremy
|
|______________________________________________________
|Linux MTD discussion mailing list
|http://lists.infradead.org/mailman/listinfo/linux-mtd/

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Using GnuPG with Netscape - http://enigmail.mozdev.org

iD8DBQE+nSfdoYsGjpwDV+QRAizEAJ9Zm09p2TD2+x6p/DRfnkwtj0P8swCfQVPA
C3O2Wt2nwNZ4vBEI0mlG138=
=0tl9
-----END PGP SIGNATURE-----
