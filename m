Received: from mail-am1ln0122.outbound.protection.outlook.com
 ([2a01:111:f400:7e00::122]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRz0N-0005ix-IB
 for linux-mtd@lists.infradead.org; Mon, 24 Mar 2014 07:09:11 +0000
From: Karsten Jeppesen <kjp@skov.dk>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Near full problem (old version)
Date: Mon, 24 Mar 2014 07:08:17 +0000
Message-ID: <558570e7e38747ba93d4e2617feb14cd@SERVER75.skov.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guys,

I've been using UBIFS for a long time now. Needless to say it works very we=
ll.
However as every corner of such embedded solutions tend to fill up I am fac=
ed with a grave problem that I don't know how to get around:

We are talking about the 2.6.32 kernel backport but the problem may be gene=
ral anyway.
I am formatting the NOR FLASH, then populating it.
At the end of populating the FLASH I am reaching 100% fill and I can actual=
ly see UBIFS packing the file system, in the end reaching 93%.
"umount" and "detach" both returns ok, but once the target has been powered=
 off and then powers on again, the UBIFS suddenly reports errors where none=
 were before:

 [   38.100000] UBIFS error (pid 1935): ubifs_read_node: bad node type (255=
 but expected 1)
[   38.140000] UBIFS error (pid 1935): ubifs_read_node: bad node at LEB 410=
:96096, LEB mapping status 0
[   38.140000] UBIFS error (pid 1935): do_readpage: cannot read page 0 of i=
node 3090, error -22
 [   46.670000] UBIFS error (pid 2575): ubifs_read_node: bad node type (255=
 but expected 1)
[   46.700000] UBIFS error (pid 2575): ubifs_read_node: bad node at LEB 410=
:96096, LEB mapping status 0
[   46.700000] UBIFS error (pid 2575): do_readpage: cannot read page 0 of i=
node 3090, error -22
[   52.370000] UBIFS error (pid 2686): ubifs_read_node: bad node type (255 =
but expected 1)
[   52.410000] UBIFS error (pid 2686): ubifs_read_node: bad node at LEB 410=
:96096, LEB mapping status 0
[   52.410000] UBIFS error (pid 2686): do_readpage: cannot read page 0 of i=
node 3090, error -22

It looks like inserting delays after population does influence the problem,=
 but as of now I have no real solution.
Can I somehow tell when UBI has ended repacking and is in a safe-to-powerof=
f state? (as detach is not the answer)


Med venlig hilsen / Sincerely yours,

Karsten Jeppesen, D.D.S;=A0 Bsc. CS
Senior Software Engineer
Ext.: +45 72 17 56 69
Mobile phone: +45 25 66 00 23
______________________________________
SKOV A/S
Hedelund 4, Glyngoere, 7870 Roslev, Denmark
Tel.: +45 72 17 55 55 - Fax: +45 72 17 59 59
www.skov.com
