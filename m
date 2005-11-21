Received: from zproxy.gmail.com ([64.233.162.207])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ee5gh-0004eO-Cs
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 02:02:05 -0500
Received: by zproxy.gmail.com with SMTP id l8so675989nzf
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Nov 2005 23:01:43 -0800 (PST)
Message-ID: <29f916510511202301j77983cedh7fd9392df018806a@mail.gmail.com>
Date: Mon, 21 Nov 2005 02:01:43 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: files getting corrupted ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Need suggestions on a problem we are facing after a lot of usage and reboot=
s.

( Very basic questions )

On the jffs2 (rw) partition, with MTD layer used to acceess it.
We are observing executable file corruptions.
If we jtag again, things are ok:
 -> Meaning flash isn't corrupted (?)

 -> It's an executable, so will adding sync anyways make a difference
to reboot we have (not normal reboot command), but will it make any
difference as it's to clear file i/o buffer s ?

 Read on an article on net that in basics of embedded design:
( http://www.linuxdevices.com/articles/AT2055943458.html )

 -> Wear levelling should always been considered, wont MTD serve purpose he=
re ?

 -> What will be a good strategy for read / write of
/var/log/messages, if writting in delayed / buffer forms isnt
acceptable ?

-> jffs rw partition can affect due to frequent  write's
executables(read only) in partition also
 Executable in question happened to be sh(shell) !  a diff shows
certain from middle of file were lost !

 From net:
 Imagine a swap-partition on flash or the system logfiles with syslogs
parameters not adopted; such a flash device could run into problems
within as little as three months!

 What syslogs parameters could be in question are ??

 Regards,
 Alfred
