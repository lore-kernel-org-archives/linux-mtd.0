Received: from mail131.messagelabs.com ([216.82.242.99])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrcCO-00031O-JQ
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 21:54:26 +0000
From: Joel Futterman <joel.futterman@iphotonix.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 18 Jul 2012 16:54:14 -0500
Subject: NAND Flash Programming for Production
Message-ID: <076270803FD11A42A33057E83F7C81390220DFC08FA5@AUSP01VMBX07.collaborationhost.net>
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

We have implemented a UBIFS in our embedded MIPS system. We need to deliver=
 our code to a vendor that performs the gang programming prior to productio=
n. They use a BP Microsystems model 2800 Flash programmer. What format are =
the files that we deliver in order for the programmer to create the UBI lay=
er. They are unable to produce a part with our UBI system properly in place=
. Is there a function within the BP Microsystems programmer that they are m=
issing?

Thanks,
Joel


 The information contained in this message may be confidential, privileged =
or protected from disclosure. If you have received it by mistake, please le=
t us know by e-mail reply and delete it from your system; you may not copy,=
 disseminate or disclose the contents of this message to anyone
