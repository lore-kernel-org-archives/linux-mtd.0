Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R3oA3-0000hv-LF
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2011 12:01:52 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Kevin Paul Herbert' <kevin.herbert@meraki.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 14 Sep 2011 08:01:47 -0400
Subject: RE: Request for comments: UBI PEBs as a multiple of erase size
Message-ID: <0A40042D85E7C84DB443060EC44B3FD33001C1D6BE@dekaexchange07.deka.local>
References: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
In-Reply-To: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
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

Kevin:

  I would support this change.

  Today, do we allow "mixed" NAND Flash device with the
  possibility of multiple Erase Block sizes? It seems to
  me that your patch, fully-fleshed-out, would allow this
  and that also seems like a good thing.

                                Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Kevin Paul Herbert
Sent: Tuesday, September 13, 2011 15:37
To: linux-mtd@lists.infradead.org
Subject: Request for comments: UBI PEBs as a multiple of erase size

I came across a situation where I wanted to be able to use the same pre-bui=
lt (with UBI) image on two different FLASH devices, one of which having a l=
arger erase size than the other. I actually did not notice that the device =
I was using had a different erase size, which caused UBI to quietly corrupt=
 my FLASH.

I have a patch to UBI (kernel and ubinize) to store the size of a PEB in th=
e EC header, reject attaching if the PEB size is not equal to or an integer=
 multiple of the erase size, and treat multiple erase blocks as a "cluster"=
 for I/O operations.

I looked through a few months of archives to see if this is a common proble=
m, and I don't see this as being discussed. Is there interest in me publish=
ing this patch for inclusion in the kernel. The only downside I can see of =
my change is that it adds an additional 32 bit quantity to struct ubi_ec_hd=
r, reducing the available free header byets from 35 to 31. For backwards co=
mpatibility, if this field is zero, I treat it as PEB size =3D=3D erase siz=
e.

It seems to me that having the PEB size in the header, regardless of suppor=
ting multiple erase blocks as a single PEB, is a useful consistency check.

Comments please?

Thanks,
Kevin Paul Herbert
Meraki, Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/1VFWYhVYdxnTndxI!oX7Ulvwl1GqFAPrK44Jb=
cO+1AA0rpc5OYymogGZMwDw3dul6eIk5VgOkcDieLvRJKIvyA=3D=3D  to report this ema=
il as spam.

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
