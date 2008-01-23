Received: from mail0.lsil.com ([147.145.40.20])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHVtp-0005v9-SS
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 03:03:45 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Slow mount of JFFS2 root file system
Date: Tue, 22 Jan 2008 22:03:29 -0500
Message-ID: <BBF94D674CC54C48B62BD0667061E84901A07FF3@PAUMAILU02.ags.agere.com>
In-Reply-To: <20080115154831.GB22338@lazybastard.org>
References: <BBF94D674CC54C48B62BD0667061E8490199FA73@PAUMAILU02.ags.agere.com>
	<20080115154831.GB22338@lazybastard.org>
From: "Lin, Bin (Bin)" <Bin.Lin@lsi.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was able to trace down to the location in the code that causes slow =
root files system mount. When the code scans through medium, most of =
unused area in the flash (30M of 60M bytes) is scanned as obsolete =
nodes:

                if (!(je16_to_cpu(node->nodetype) & =
JFFS2_NODE_ACCURATE)) {
                        /* Wheee. This is an obsoleted node */
                        D2(printk(KERN_DEBUG "Node at 0x%08x is =
obsolete. Skipping\n", ofs));
                        DIRTY_SPACE(PAD(je32_to_cpu(node->totlen)));
                        ofs +=3D PAD(je32_to_cpu(node->totlen));
                        continue;
                }=20

It takes very long time to scan through all the obsolete 128 byte nodes.
The question is what causes the unused sectors being marked as obsolete? =


Thanks a lot for your reply.
Ben

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of J?rn Engel
Sent: Tuesday, January 15, 2008 10:49 AM
To: Lin, Bin (Bin)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Slow mount of JFFS2 root file system

On Tue, 15 January 2008 09:22:04 -0500, Lin, Bin (Bin) wrote:
>=20
> I have ARM9 systems with JFFS2 root file system. For some reasons, =
e.g.
> system crash or power failure, when system boots up next time, it=20
> takes much longer time than usual to mount jffs2 root file system. It=20
> can hang at following message for 3-10 min. Once this happens, the=20
> mount will take the same long time in every reboot later on. Even=20
> though it take long time to mount root file system, the system can=20
> still come up and function well. This problem occurred in less than=20
> 10% of boards in the field, but can not be reproduced in the lab. I=20
> have been struggling with this is issue for weeks.

What stops you from retrieving one such board from the field?  Should be =
easy to debug once you have it on your desk.

J=F6rn

--
Prosperity makes friends, adversity tries them.
-- Publilius Syrus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
