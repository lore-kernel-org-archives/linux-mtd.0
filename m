Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1cbi-0003eV-NV
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2011 11:17:23 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Stelling Carsten' <Carsten.Stelling@goerlitz.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 8 Sep 2011 07:18:31 -0400
Subject: RE: Security enhancement for UBIFS with secure erase feature
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32FD0A8986E@dekaexchange07.deka.local>
References: <02855DE82B1CA94A9115CCD637A1325643CBFDDD88@goemail-server.goerlitz.int>
In-Reply-To: <02855DE82B1CA94A9115CCD637A1325643CBFDDD88@goemail-server.goerlitz.int>
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

Carsten:

  Unfortunately, the data sheets for many Flash parts
  specifically prohibit re-writing a page, even if
  you're driving the bits towards more zeroes. I
  think you'll find this is especially true for MLC
  devices.

                                 Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Stelling Carsten
Sent: Monday, September 05, 2011 12:01
To: linux-mtd@lists.infradead.org
Subject: Security enhancement for UBIFS with secure erase feature

Hi everybody,

When building security relevant (embedded) applications, personal privacy
is of major importance.

Therefore it would be nice to have a configuration option to invalidate the
content of a deleted file in UBIFS. This feature shall allow an application=
 to
ensure that, when a file is deleted, its contents are fully erased from the=
 flash.
I.e. that each time a block is marked for erase, this block is written all =
zeros.
Writing zeros without erasing an entire page should be possible by design.

Giving such an option on a file by file basis (ioctl) would be optimal, bec=
ause
wiping out the content of a deleted file is time and resource consuming and
not acceptable for all kinds of applications using UBIFS.

Are there any plans for such a security enhancement in UBIFS?

Regards

Carsten




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


 Click https://www.mailcontrol.com/sr/FcTd+AJENrvTndxI!oX7UsdpzMR7Bo2KZ8LAR=
fqDk+yP+UC7hxpimCzUyXYqwgiFbrCRFdjEt0Ad5rLFZ!o!pA=3D=3D  to report this ema=
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
