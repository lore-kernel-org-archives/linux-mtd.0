Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NrX1c-0005Fz-Ho
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 13:41:41 +0000
Received: by qyk11 with SMTP id 11so3071915qyk.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Mar 2010 06:41:34 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 16 Mar 2010 09:41:32 -0400
Message-ID: <dbdb2ea61003160641s5b083daepf6fa726908ffc5f9@mail.gmail.com>
Subject: umount of ubifs
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am seeing behavior related to my filesystem that I don't understand.
 I'm running 2.6.29 and using UBIFS.  The root filesystem is a
ramdisk.  Code manually mounts 4 UBI volumes at startup (not
automatically through an fstab file).  One of the volumes, "system",
is mounted RO (though the underlying UBI volume is dynamic).  On
system shutdown, code umounts all the mounted volumes, and often the
umount of "system" fails.  Can someone explain how umounting a RO
filesystem could fail?  (I don't think this is a UBIFS issue - I'm
guessing it may be common to all filesystems.)

Thanks,
twebb
