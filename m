Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBmsl-0002M2-LO
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 11:44:48 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: 'Ricard Wanderlof' <ricard.wanderlof@axis.com>, Linux mtd
	<linux-mtd@lists.infradead.org>
Date: Mon, 18 Apr 2011 07:45:02 -0400
Subject: RE: UBI partitioning in embedded device?
Message-ID: <0A40042D85E7C84DB443060EC44B3FD32A6941578B@dekaexchange07.deka.local>
References: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Ricard:

One advantage of moving critical data (such as calibration
data) into its own partition is that because each partition
would absolutely positively *NOT* share its PEBs (Physical
Erase Blocks) with any other partition, data stored in
those partitions would then be better-insulated from
"disturb" effects (such as "program disturb" and "read
disturb") caused by the reading and writing of other data.

Generally, the "disturb" effects only take place within
Flash pages and from one Flash page to another.

                    Atlant

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists=
.infradead.org] On Behalf Of Ricard Wanderlof
Sent: Monday, April 18, 2011 02:44
To: Linux mtd
Subject: UBI partitioning in embedded device?


Are there any opinions here on the partitioning of a flash memory in an
embedded device when using UBI?

Principially, one could let UBI manage the whole flash as one mtd
partition, except possibly some boot area due to restriction in the boot
ROM of the system in question. But is it wise to do so, assuming for
instance there is data in part of the flash that you really want to avoid
loosing, such as calibration data? Of course, theoretically, once the
kernel has access to one part of the flash it could clobber anything,
still, the mtd code has been proven for years whereas UBI is relatively
young, so one idea would be to partition that flash into several mtd
partitions (e.g. boot, running system, and calibration data), and let UBI
handle these separately. That could minimize the risk of UBI clobbering
the calibration data when operating on the running system, for instance.

Any thoughts?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

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
