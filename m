Received: from wproxy.gmail.com ([64.233.184.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EwYwL-0000qL-8Q
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 00:54:39 -0500
Received: by wproxy.gmail.com with SMTP id 67so67576wri
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Jan 2006 21:54:32 -0800 (PST)
Message-ID: <29f916510601102154i4935a716g7ee1751465e21c3d@mail.gmail.com>
Date: Wed, 11 Jan 2006 00:54:32 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: sector locks handling for J3 flashes?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to understand how it works for flash'es which have
Hardware flash protection.
Bootloader say locks say 1 partition, then linux kernel / MTD while coming =
up
reads / probes flash (sector by sector) for locked sectors ?
If yes, and it maintain this in an internal software structure. Using
it when writes to partitions is done ?

I hope linux kernel arm-linux2.4.25-x (snapgear 3.1) has support for
ixdp425 and Intel J3 Strata flash for automatic detection and working
with locked flashes ?

Any one already tried this ?

Regards,
Alfred
