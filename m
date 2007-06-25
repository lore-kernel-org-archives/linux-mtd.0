Received: from [65.205.214.20] (helo=delivery.neuropace.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2tAb-0006zv-Rl
	for linux-mtd@lists.infradead.org; Mon, 25 Jun 2007 14:20:15 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: CRAMFS and checksum.
Date: Mon, 25 Jun 2007 11:20:12 -0700
Message-ID: <895730900BBE6943B639D089EC50B1140416D1@bodega.neuropace.com>
From: "Janesh Ramakrishnan" <jramakrishnan@neuropace.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Is there a cramfs based checksum on the data that is being stored on the =
MTD where the cramfs mounts ? Say, there is some data on MTD device 2 =
and the kernel mounts the cramfs image on MTD device 2 and is there any =
mechanism to verify that the data on the cramfs image hasn't been =
compromised?

thanks
Janesh
