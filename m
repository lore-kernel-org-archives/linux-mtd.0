Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaoRl-0000jl-DU
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 10:51:33 +0000
Date: Fri, 29 Jan 2010 11:51:06 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Marco Donadio <mdonadio@gmv.com>
Subject: Re: JFFS2 error messages
In-Reply-To: <7FAAF01335A90841B8C1098FB08222A6908DFCB01F@GMVMAIL6.gmv.es>
Message-ID: <Pine.LNX.4.64.1001291147400.32263@lnxricardw.se.axis.com>
References: <7FAAF01335A90841B8C1098FB08222A6908DFCB01F@GMVMAIL6.gmv.es>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 29 Jan 2010, Marco Donadio wrote:

> Hi,
>
> I'm designing a board based on MPC5121 PowerPc.
>
> I have some problems about linux start-up:
>
> an error messages appears and sometimes Linux starts and sometimes not (I=
 attached capture of errors).

The 'Empty flash at ... ends at ...' usually indicates some sort of=20
mismatch between the sector or block size of the flash and the erasesize=20
used when making the image. It could be harmless, or could indicate a more=
=20
serious configuration problem.

> I read FAQ about JFFS2 error messages and I have a question:
>
> There is some trick to distinguish between node corruptions cause by=20
> unclean reboots and by real media corruptions?

Experience perhaps? I think the thing is that JFFS2 doesn't know how=20
serious it is, all it can do is log the errors it finds.

The 'Truncating ...' messages in your dump look severe to me. Actually,=20
I've never seen those warnings produced (but then again my experience=20
across various Linux platforms is limited).

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
