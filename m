Received: from oncidium.ireq.ca ([204.19.71.2] helo=caracas.ireq.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192w5i-0004jA-Px
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 17:37:00 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 8 Apr 2003 12:36:10 -0400
Message-ID: <C1641369CCE2784593A091F212BF90D202D54F@caracas.ireq.ca>
From: =?iso-8859-1?Q?=22Mercier=2C_Andr=E9=22?= <Mercier.Andre@ireq.ca>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Newbie questions: MTD vs M-Sys, ... RTLinuxPro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Before throwing myself in the MTD arena, I would like to know if it is =
possible
to boot from a DOC with RTLinux?

Platform: PC104, Ampro CMP5E (pentium MMX)
DOC 2000 (256MB, with TrueFSS 5.1.4)
Linux: Redhat (5.2, 6.2, 7.2, 7.3, ...)
RTLinux: version RTLinuxPro 1.1 or RTLinuxPro 1.2

I am able to boot from DOC with Redhat 6.2 installation and M-Sys =
drivers.
But now, I would like to use instead the MTD drivers and be able to boot =

RTLinux from my 256MB DOC (note: this DOC cannot use the older
version TrueFSS 4.2 from M-Sys). I have looked at the=20
http://www.gctglobal.com/Download/DiskOnChip/diskonchip.html
web site for some information, but there are still some questions to be =
answered:

1) Does MTD work with new DOC2000 release (256 MB with TrueFSS 5.1.4)?
2) Which Redhat distribution is the best choice for MTD (7.3, 8.0, =
...9.0) ?
3) What are the specific steps to include the MTD stuff with the =
RTLinuxPro
    distribution (note: RTLinux has been tested with Redhat 7.2, 7.3, =
...
    I did not buy the full kernel sources package, but I can make a =
bzImage
    and modules without problems) and be able to boot RTLinux from DOC?

Thanks for your help.

Andr=E9 Mercier
