Received: from mail1.bemta5.messagelabs.com ([195.245.231.130])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sf542-0003mR-2I
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 08:05:58 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Overrule mtd "ro" ?
Date: Thu, 14 Jun 2012 10:05:33 +0200
Message-ID: <1531E53627F1F749B4FE809BF2A4EB670345A94E@WETMEX10.loepfe.com>
From: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I've a rather simple question, don't know if it is the good place to
ask, but I'll give it a go.


If I have a mtd device that has been mounted ad READ-only.
For example because I've injected kernel command line parameters
mtdparts=3Datmel_nand:4M(BOOT)ro,16M(l1)ro.

Is there any way on the kernel "prompt" to over-rule this "ro" behavior
and to make it writable.


Regards,
Noel
