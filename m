Received: from mail.ebertech.ca ([184.107.149.130] helo=EberbachAndrew2.tmp)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4gXs-00012V-TI
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 23:10:37 +0000
From: Andrew Eberbach <andrew@ebertech.ca>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: Slow Linear Flash write speeds
Date: Thu, 23 Aug 2012 19:03:54 -0400
Message-Id: <8A2833CE-CBA8-4B68-B8DB-D6AA72A147DB@ebertech.ca>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0 (Apple Message framework v1278)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'm trying to figure out why I'm getting really slow (0.1 kB/sec) write =
speeds using kernel 3.0.28 and the pcmciamtd driver on a 20MB Series 2 =
Intel card. The reader/writer is an Elan P423 PCI card. I've had to set =
the VPP voltage to 12 to get it to write. The read speeds are very quick =
(can copy out 20mb in less than a minute) but the writes are taking way =
too long. I've tried both with dd and with the flashcp utility. Any =
insights would be appreciated.=20

Best Regards,

Andrew Eberbach
EberTech Inc.
