Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWZW9-0003wf-7K
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 08:16:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by protonic.prtnl (Postfix) with ESMTP id 0227D29EBB
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2005 14:14:22 +0100 (CET)
Received: from protonic.prtnl ([127.0.0.1])
	by localhost (protonic [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27989-03 for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2005 14:14:21 +0100 (CET)
Received: from linux.local (linux.prtnl [192.168.1.97])
	by protonic.prtnl (Postfix) with ESMTP id 32A8328067
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2005 14:14:21 +0100 (CET)
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org
Date: Mon, 31 Oct 2005 15:15:54 +0200
References: <EF4121B4EBC4E045BDE1273F9D0A87FFCD410C@esealmw107.eemea.ericsson.se>
In-Reply-To: <EF4121B4EBC4E045BDE1273F9D0A87FFCD410C@esealmw107.eemea.ericsson.se>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200510311415.54208.david.jander@protonic.nl>
Subject: Re: The magic bitmask question - again
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 31 October 2005 13:31, Fredrik J=F6nsson B wrote:
>[...]
> We have a system with a 128Mb NOR-flash of which 3Mb is used as a keep-of=
f=20
> area for the kernel and the rest for a JFFS2 root file system. The system
> boots and mounts properly and everything seems fine, but during mounting a
> number of messages such as the one below are shown for each of the first
> four erase-blocks of the mtd partition.

How do you define your partition layout?
Are you sure that the beginning of the first jffs2 partition of MTD is not=
=20
overlapping with your "keep-off" region? Eventually you could be trying to=
=20
interpret parts of the kernel image as jffs2 filesystem. In that case you=20
will get such messages.

Greetings,

=2D-=20
David Jander
