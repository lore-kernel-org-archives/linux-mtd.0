Received: from mta-blr2.sasken.com ([164.164.56.19])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kn5Kn-0001Tv-UG
	for linux-mtd@lists.infradead.org; Tue, 07 Oct 2008 05:42:15 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: RE: MTD How-to?
Date: Tue, 7 Oct 2008 09:35:01 +0530
Message-ID: <4F3EFCBE1C926F48A576A096FE1D0E176A0BCD@EXGZ02.sasken.com>
References: <b816c8220810060859x2af5178dnc23c6cca72a5a17d@mail.gmail.com>
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: "Steve Hurst" <creepingmalaise@gmail.com>, <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Please check with weather given flash chip is supports the jedec probe
and command sets. Since it quite older probe and command set method, now
the most of the chip sets supports the CFI probe and cfi command sets 1,
2 or 3.
 Please write the simple probe functions which consist of probe and
device add api and see the proc entry or konsole message for that. And
also please verify weather it driver registered or not. If have any
problem please provide the details of chip set and the flow of the code
so that can understand the problem easily.

Regards,
Ravi

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Steve Hurst
Sent: Monday, October 06, 2008 9:30 PM
To: linux-mtd@lists.infradead.org
Subject: MTD How-to?

Hi All,

I'm an MTD noob trying to gain read/write access to a chip that appears
to be supported in jedec_probe.c (49LF008A), using a mostly unchanged
debian 2.6.24 kernel.  I've enabled everything I think I need to in the
kernel, but can't seem to get things to recognize the chip.

I've reviewed a couple of pretty old how-to's (2.2/2.4 days old), and
visited the available pages at
http://www.linux-mtd.infradead.org/doc/general.html, but can't find
anything modern that lays out the steps for getting a device up and
going.

Can anyone point me at relevant documentation or a how-to?

TIA!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
SASKEN BUSINESS DISCLAIMER
-------------------------
This message may contain confidential, proprietary or legally privileged in=
formation. In=20
case you are not the original intended Recipient of the message, you must n=
ot, directly or=20
indirectly, use, Disclose, distribute, print, or copy any part of this mess=
age and you are=20
requested to delete it and inform the sender. Any views expressed in this m=
essage are=20
those of the individual sender unless otherwise stated. Nothing contained i=
n this message=20
shall be construed as an offer or acceptance of any offer by Sasken Communi=
cation=20
Technologies Limited ("Sasken") unless sent with that express intent and wi=
th due=20
authority of Sasken. Sasken has taken enough precautions to prevent the spr=
ead of=20
viruses. However the company accepts no liability for any damage caused by =
any virus=20
transmitted by this email
