Received: from securedesign.net ([216.99.200.242] helo=firewall.sdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CBTQ-0003BM-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 03:42:37 +0100
Message-ID: <005a01c0f86a$9abbe1c0$160aa8c0@gumby>
From: "Stephen Herzog" <mtd@sdesign.com>
To: <linux-mtd@lists.infradead.org>
Cc: "qwerty t" <qwerty172@yahoo.com>
References: <20010615115134.12572.qmail@web3203.mail.yahoo.com>
Subject: Re: Input/Output Errors
Date: Mon, 18 Jun 2001 19:50:29 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Greetings,

I tried using ext2 on an 8M DoC 2000  however had problems
related to corrupting the entire file system if the partition
was not unmounted correctly from read/write mode.=20

We switched to a minix file system from ext2 to save space=20
and make things a bit more stable, however the best thing
to do is keep the partition mounted read-only except=20
when doing os updates. =20

The problems we were having were not related to the MTD=20
layer however. =20

Steve


on Friday June 15, qwerty172@yahoo.com wrote:
> I have a 16 M DoC 2000. I have formated it as an ext2
> partition, and have copied 10M in various directories.
> During boot MTD support says that it found unformated
> sectors and formats them.=20
> ...
> Has anyone seen this before? Has anyone used ext2 as
> filesystem.
