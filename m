Received: from modemcable061.45-202-24.mtl.mc.videotron.ca
	([24.202.45.61] helo=mygale.ds9.ufp ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16IViB-0005ax-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Dec 2001 14:04:16 +0000
From: "Stéphane Doyon" <s.doyon@videotron.ca>
Date: Mon, 24 Dec 2001 09:15:22 -0500 (EST)
To: <linux-mtd@lists.infradead.org>
cc: =?ISO-8859-1?Q?St=E9phane_Doyon?= <s.doyon@videotron.ca>
Subject: Truncated symlink on jffs2
Message-ID: <Pine.LNX.4.33.0112240846510.15627-100000@odo.ds9.ufp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
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

Hi,

I'm not subscribed, so please Cc me.

I must be missing something, I find it hard to believe that no one would=20
have noticed this before... but I couldn't find any reference to this.

I wanted to backup my Compaq iPaq's flash. Using kernel 2.4.16-rmk1-hh5,=20
but also happens on earlier versions. I used tar version 1.13.19 to backup =
to=20
NFS.

Many (but not all) of my symlinks ended up with the target truncated to=20
one character. For instance the symlinks in /lib would all point to "l".=20
Absolute symlinks would point to "/".

It seems this happens only with symlinks I created on the iPaq using ln,=20
while those that were created by mkfs.jffs2 are OK.

Calling readlink on the link yields the correct response. Using cp -a does=
=20
the right thing.

Strac'ing tar, I see that it does an lstat of the symlink, and gets an=20
st_size of 0. It then calls readlink with a buffer of size 1.

I was able to reproduce this on x86, kernel 2.4.17, with mtdram:
modprobe mtdram
modprobe mtdblock
mount -t jffs2 /dev/mtdblock0 /mnt
cd /mnt
ln -s abcdef ghi
/home/some_user/lstat ghi

where lstat is a tiny program that does lstat(argv[1], &st) and=20
printf("size: %lu\n", st.st_size);. It outputs 0, but it should say 6=20
(which it does on a symlink created on another fs).

Is this a bug or a known limitation? The fact that tar relies on lstat was=
=20
a problem for me as I had to recreate tens of symlinks before my backup=20
worked again.

Thanks for any explanation!

--=20
St=E9phane Doyon
<s.doyon@videotron.ca>
http://pages.infinit.net/sdoyon/
