Received: from [203.199.83.142] (helo=mailweb18.rediffmail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Wa1Y-0006oj-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 09:30:24 +0000
Date: 1 Feb 2002 08:25:28 -0000
Message-ID: <20020201082528.15474.qmail@mailweb18.rediffmail.com>
MIME-Version: 1.0
From: "maharajan  veerabahu" <mahadoc@rediffmail.com>
Reply-To: "maharajan  veerabahu" <mahadoc@rediffmail.com>
To: linux-mtd@lists.infradead.org
Subject: DOC  formatting/BIOS  recognition problems
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Dear sir,=0A       I tried to format a DOC (DIskOnChip 2000)using the firmw=
are version 5.04(doc504.exb)and i got this result.=0A=0A 1. I formatted the=
 DOC using the firmware version504=0A    the=0A=0A   dformat /win:d000 /s:d=
oc504.exb /y=0A=0A   returns=0A=0A   formatting=0A   2041 of 2041=0A   stat=
uscode is 26(flUnknownMedia)received from=0A   flmountVolume.=0A   Format f=
ailed=0A=0A  once this is done the dinfo returns=0A=0A    No driver found.T=
rying with direct access=0A=0A  and the software version is quoted to be=0A=
=0A    Software version  : 255.255=0A=0ANext I tried dformat /win:c800 /s:!=
 =0AThis time it says=0Aformatting 2048 of 2048 =0Astatuscode is 26(flUnkno=
wnMedia)received from=0A   flmountVolume.=0A   Format failed.=0A=0A=0A  2 .=
 i tried formatting the same DOC with doc121.exb=0A=0Aand this time it got =
formatted well.and my Dinfo said the =0A       Software version : 1.21=0A=
=0A  * But , my BIOS is not recognizing the DOC.Why is this ?=0AI have a fo=
rmatted DOC(1.21) and why does not my bios recognize it?=0A=0A  * If , iam =
able to format the DOC with 1.21 then why am i not able to format it with 5=
.04 ?=0A=0ACan you give suggestions ,please .=0AThanks a lot.=0Aregards , m=
aha=0A=0A=0A =0A
