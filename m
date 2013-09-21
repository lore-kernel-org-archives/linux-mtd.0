Received: from sh16-54.1blu.de ([178.254.0.106])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNKtX-0005gV-7J
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2013 10:58:36 +0000
Received: from top by sh16-54.1blu.de with local (Exim 4.69)
 (envelope-from <gutemine@oozoon.de>) id 1VNKt9-00023L-JM
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2013 12:58:11 +0200
To: <linux-mtd@lists.infradead.org>
Subject: Patching mkfs.ubifs.c for running under Windows =?UTF-8?Q?=3F?=
MIME-Version: 1.0
Date: Sat, 21 Sep 2013 12:58:11 +0200
From: gutemine <gutemine@oozoon.de>
In-Reply-To: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
Message-ID: <7c74c0d714e8e87daebbfd0163642d71@localhost>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I'm the author of ubidump, the first real ubifs image extract tool.
ubidump allows to extract ubifs images created by mkfs.ubifs and also ubifs
volumes created by ubinize. 

ubidump works without any nandsim, block2mtd or mtdram modules and doesn't
mount the image at all. Therefore it runs nicely on both Linux and Windows
as it is written in pure C and doesn't use any mtd-utils code or includes.

Live under Linux was easy, but I took the challange to make it run under
Windows too, because there it was not possible to mount and extract an
ubifs image until now.

ubidump under Windows supports Hard and Symlinks by using the native NTFS
functionality. Only device files and pipes are written as simple text files
containing the needed information for a re-pack (eg. char or block device
and major and minor number). 

As users of ubidump under Windows now asked me for getting also the
possibility to re-pack their extracted ubifs images, I'm considering to
patch mkfs.ubifs.c, so that it handles also the Windows hard and softlinks
and my dummy device files correctly. 

My question is now, if it would be OK to add these changes to the standard
mkfs.ubifs.c (off cource nicely wrapped in #ifdef WINDOWS statements so
that these changes don't do any harm when compiled on other plattforms) and
send you the diff, or if I should create an extra open source tool based on
the existing mkfs.ubifs.c code.

BTW I'm ware of the mkfs.ubifs cygwin implementation, but as explained
above I would prefere to make mkfs.ubifs run in native Windows as my
ubidump does.

Please advice on your preferences and in what direction I should proceede
with this project!

Kind regards,
gutemine
