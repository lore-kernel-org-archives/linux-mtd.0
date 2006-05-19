Received: from mail.auerswald.de ([212.185.163.229])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgzMB-0003CO-9a
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 03:25:12 -0400
From: Wolfgang =?utf-8?q?M=C3=BCes?= <wolfgang.mues@auerswald.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 19 May 2006 09:24:49 +0200
References: <446C4265.8090108@lios-tech.com>
In-Reply-To: <446C4265.8090108@lios-tech.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200605190924.49734.wolfgang.mues@auerswald.de>
Subject: Re: [OT?] File system recommendation for SD cards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Albrecht,

Am Donnerstag, 18. Mai 2006 12:15 schrieb Albrecht Dre=C3=9F:
> After reading a Sandisk whitepaper about wear levelling [1] I thought
> about using a standard vfat file system on it (mainly to have the
> ability to remove the sd card and to read it on a Winbloze pc).
> However, I read a report that using a sync vfat fs could lead to fast
> corruption of the SD card [2].

Why don't you use async vfat (standard up to 2.6.13(?)), because vfat has
not implemented the sync option until then.

I've had no problems with it - dirty data is written to sd very fast.

regards
Wolfgang

=2D-=20
Wolfgang Muees                    Vor den Grashoefen 1
Auerswald GmbH & Co. KG       	  D-38162 Cremlingen
Hardware Development              Germany
Tel +49 5306 9219 0               Fax +49 5306 9219 94
