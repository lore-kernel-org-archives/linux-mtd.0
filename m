Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFVph-0001u6-Hc
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 18:20:58 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: =?iso-8859-1?Q?'Bj=F8rn_Forsman'?= <bjorn.forsman@gmail.com>, Umar
	Qureshey <umar@janteq.com>
Date: Thu, 28 Apr 2011 14:21:24 -0400
Subject: RE: Discovering current MTD partition
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A694157B8@dekaexchange07.deka.local>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<BANLkTin+yKefqa8bKPnen1fsohevJohO+Q@mail.gmail.com>
In-Reply-To: <BANLkTin+yKefqa8bKPnen1fsohevJohO+Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bj=F8rn:

> $ busybox rdev
> /dev/sda1 /

  Just FYI: This doesn't work on my particular
  Embedded Linux system (running on UBIfs).
  That command produces no result.

                        Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Bj=F8rn Forsman
Sent: Thursday, April 28, 2011 14:08
To: Umar Qureshey
Cc: linux-mtd@lists.infradead.org
Subject: Re: Discovering current MTD partition

On 27 April 2011 01:43, Umar Qureshey <umar@janteq.com> wrote:
> [...]
> Aside from scanning /proc/cmdline, is there a way to
> programmatically ascertain which mtd partition is active *now*.
> I need to find this information within a Python script but really if it c=
an
> be done in C (perhaps a syscall?), it's all I need.

Busybox has a command called 'rdev' that looks up the block device
that is mounted on /.

$ busybox rdev
/dev/sda1 /

Look in busybox/util-linux/rdev.c and busybox/libbb/find_root_device.c
for the implementation details.

Best regards,
Bj=F8rn Forsman

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
