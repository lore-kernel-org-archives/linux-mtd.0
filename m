Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWsaD-0007RV-7q
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 15:00:13 +0000
From: Eric Millbrandt <emillbrandt@dekaresearch.com>
To: "'Paulraj, Sandeep'" <s-paulraj@ti.com>, 'Sean Preston' <seanp@pfk.co.za>,
	Linux-MTD List <linux-mtd@lists.infradead.org>
Date: Thu, 8 Jul 2010 11:02:00 -0400
Subject: RE: New NAND Help
Message-ID: <0A40042D85E7C84DB443060EC44B3FD325405DE5AF@dekaexchange07.deka.local>
References: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>
	<0A40042D85E7C84DB443060EC44B3FD325405DE5AE@dekaexchange07.deka.local>
	<0554BEF07D437848AF01B9C9B5F0BC5D9F13518B@dlee01.ent.ti.com>
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9F13518B@dlee01.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Paulraj, Sandeep [mailto:s-paulraj@ti.com]
> Sent: Thursday, July 08, 2010 10:54
> To: Eric Millbrandt; 'Sean Preston'; Linux-MTD List
> Subject: RE: New NAND Help

<snip>

> This device is probably a ONFI device. Thus the fourth ID byte might not
> be properly interpreted.
>

That is correct.  Micron used to support both the ID byte and the parameter=
 page in their ONFO 1.0 compliant parts, but seems to have dropped support =
in their newer ONFI 2.1 compliant parts.  I found out the hard way when swi=
tching from an mlc part to an slc part.

Eric

-DISCLAIMER: an automatically appended disclaimer may follow. By posting-
-to a public e-mail mailing list I hereby grant permission to distribute-
-and copy this message.-

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
