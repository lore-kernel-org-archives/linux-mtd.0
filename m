Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTFWp-0007b0-1S
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 06:55:59 -0400
Message-ID: <45FE6C2D.40509@inf.u-szeged.hu>
Date: Mon, 19 Mar 2007 11:55:41 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH] Obsolete nodes that are unlinked when possible
References: <006e01c767ed$30828a40$0667a8c0@Jocke>
In-Reply-To: <006e01c767ed$30828a40$0667a8c0@Jocke>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund =EDrta:
> Would bad things happen if an unclean reboot happens or will
> you just loose some performance?
>  =20
There were many reason to set jffs2_can_mark_obsolete(c) to 0.

As Artem wrote if we would like to enable we have to mark not only the=20
node as obsolete but also the summary entry.

It is not too easy because of the followings:
- If you would like to modify the summary node on the flash it breaks=20
the CRC of the summary node. A solutions can be: the ACCURATE bit should=20
not included in the CRC. An other (worse) solution can be: when we=20
obsolate a node we overwrite the summary magic with 0, and at the next=20
mount the system will scan the erase block instead of using the summary=20
(peformance penalty).
- We also have to take care about not only the already written out=20
summary. The summary is written out when the jffs2 close an erase block.=20
If you want to mark obsolete a node in the unclosed eraseblock=20
(nextblock) you should obsolate it in the collected summary, too.=20
However it is not a big task, but also needs code modification and testin=
g.

Ferenc
