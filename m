Received: from mail.elutions.com ([64.31.159.3])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QXzjd-0007YK-3l
	for linux-mtd@lists.infradead.org; Sat, 18 Jun 2011 17:55:05 +0000
Received: from mail.elutions.com (127.0.0.1) by mail.elutions.com (MlfMTA
	v3.2r9) id hvjal00171sp for <linux-mtd@lists.infradead.org>;
	Sat, 18 Jun 2011 12:41:49 -0400 (envelope-from
	<prvs=11509943cb=mhench@elutions.com>)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: NAND BBT corruption on MPC83xx
Date: Sat, 18 Jun 2011 13:55:01 -0400
Message-ID: <F87D23B7E1F84E4AB52E4FA4A55F85DC0259E343@tpamail.elutions.com>
In-Reply-To: <20110617163442.204348a0@schlenkerla.am.freescale.net>
From: "Mike Hench" <mhench@elutions.com>
To: "Scott Wood" <scottwood@freescale.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Scott Wood wrote:
> As for the corruption, could it be degradation from repeated reads of
that
> one page?

Read Disturb. I Did not know SLC did that.
It just takes 10x as long as MLC, on the order of a million reads.
Supposedly erasing the block fixes it.
It is not a permanent damage thing.
I was seeing ~9 hours before failure with heavy writes.
~4GByte/hour =3D 2M pages, total ~18 million reads before errors in that
last block showed up.

Cool. Now we know.
Thanks.

Mike Hench
