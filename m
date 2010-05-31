Received: from moutng.kundenserver.de ([212.227.17.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJ6kG-00069e-MN
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 15:17:41 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: How stable is jffs2 summarize option?
Date: Mon, 31 May 2010 17:17:37 +0200
References: <201005311503.42629.muehlfelder@enertex.de>
In-Reply-To: <201005311503.42629.muehlfelder@enertex.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201005311717.38056.muehlfelder@enertex.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

And is this an error, a warning or just debug output:
jffs2_sum_write_sumnode: Not enough space for summary, padsize -45


Am Monday 31 May 2010 15:03:42 schrieb Thorsten M=FChlfelder:
> Hi,
>
> to reduce boot time of a device I want to use the jffs2 summarize option =
on
> my root file system. Currently 'm using Linux 2.6.24 on that specific
> device and the summarize option is marked as "experimental", so I wonder =
if
> it is stable enough for a productive system?
> Are there any well known devices that use this option, too?
> Do I have to use a newer kernel version?
>
> Thanks for any information
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



=2D-=20
=2D-
____________________________________________________
Dipl.-Ing. (FH) Thorsten M=FChlfelder
Hard- und Softwareentwicklung

Enertex Bayern GmbH
Innovative Systeml=F6sungen der Energie- und Elektrotechnik
www.enertex.de =A0 =A0 =A0 =A0 =A0=20

Erlachstra=DFe 13 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 91301 Forchheim
St.-Nr. 9216/125/50473 =A0 =A0 =A0UST-ID DE 216 837 306
Registergericht Bamberg =A0 HRB 4569
Volksbank Forchheim eG, BLZ 763 910 00, Kto.-Nr. 7200480 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0

Tel: 0049 9191 974637 Fax: 0049 9191 974687 =A0Mob:0175 5151913
