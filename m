Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kn3wu-0006JU-LF
	for linux-mtd@lists.infradead.org; Tue, 07 Oct 2008 04:13:29 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: RE: OOB questions
Date: Tue, 7 Oct 2008 09:41:01 +0530
Message-ID: <4F3EFCBE1C926F48A576A096FE1D0E176A0BD8@EXGZ02.sasken.com>
References: <747772.64619.qm@web81802.mail.mud.yahoo.com>
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: "Curt Scott" <curt_scott@yahoo.com>,
	<linux-mtd@lists.infradead.org>
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

Yes JAFFS2 or YAFFS2 will require the ability to read or write in OOB
bytes, refer also yaffs2 call flow for read and write operations. It is
upto the driver or file system how it is identifying the OOB area and
doing the operations so that file system should aware of actual read or
write size in NAND in below it is like 2048 byte + 16 Bytes of oob area.
 While doing the raw block device read or write operation, in that case
it is not required to send the OOB details. Also there is no such
requirement for OOB and non OOB happens independently.

Regards,
Ravi=20

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Curt Scott
Sent: Tuesday, October 07, 2008 12:11 AM
To: linux-mtd@lists.infradead.org
Subject: OOB questions

Hi,

I am writing a MTD NAND (2K page) driver module for Linux 2.6.23.=20
My NAND hardware controller performs all the ECC control under-the-hood.
Although is has OOB bytes available there are some limitaitions...

L1.) Page data and OOB data must be written at the same time.
L2.) OOB data is limited to 16 bytes / page (of a 2k page).

I have some questions about the OOB requirements for MTD/JFFS2 combo.

Q1.) Does MTD/JFFS2 require the ability to read/write OOB bytes? =20
     Or can the system be set up operate with no OOB available?
Q2.) Is it a requirement for OOB and non-OOB writes to happen
independently?

thank you for you help,
Curt

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
