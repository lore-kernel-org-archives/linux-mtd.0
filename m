Received: from sky.skycomputers.com ([198.4.246.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Iukb-0003WB-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 17:52:57 +0000
Received: from dayton (dayton [192.9.200.220])
	by sky.skycomputers.com (Postfix) with ESMTP id 458627C03F
	for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2002 13:23:30 -0500 (EST)
Content-Type: text/plain;
  charset="us-ascii"
From: Brian Waite <waite@skycomputers.com>
To: linux-mtd@lists.infradead.org
Subject: Newbie question
Date: Mon, 2 Dec 2002 13:23:28 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200212021323.28860.waite@skycomputers.com>
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

Hi,=20
I am very new to the MTD world and I had a quick question that may rank i=
n the=20
RTFM land, but I am doing that and not finding an answer. I have a board =
that=20
has 2-2x16 128 Mbit Intel StrataFLASHes side by side that I want to run w=
ith=20
the MTD layer. It looks like the cfi_cmdset_001.c will work except I have=
 to=20
issue commands to both FLASH chips at the same time. Has anyone impliment=
ed=20
something like this? Is there some documentation other than the infradead=
=20
site? As long as this is up to date I am happy, but I wasn't convinced it=
 is=20
fully up-to-date. I am coming the archives so even a quick subject line=20
pointer would be great.=20
Thanks=20
Brian Waite
