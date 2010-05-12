Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCAxE-0000to-Vc
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 12:22:26 +0000
Date: Wed, 12 May 2010 14:22:19 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?iso-8859-1?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>
Subject: Re: Some questions on bit-flips and JFFS2
In-Reply-To: <201005121321.07822.muehlfelder@enertex.de>
Message-ID: <Pine.LNX.4.64.1005121416040.9058@lnxricardw.se.axis.com>
References: <201005031505.18604.muehlfelder@enertex.de>
	<201005110959.36213.muehlfelder@enertex.de>
	<Pine.LNX.4.64.1005111131220.15631@lnxricardw.se.axis.com>
	<201005121321.07822.muehlfelder@enertex.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 12 May 2010, Thorsten M=FChlfelder wrote:

>> I don't know if this is a good way, but you could patch your kernel so i=
t
>> doesn't stop you from erasing/writing badblocks.
>
> So the only way to get bad blocks erased (scrubbed) in Linux is to have a
> patched kernel? This would be a problem, because I don't know any way of
> getting a new kernel to already deployed systems without deleting the Sam=
-ba
> bad blocks before.

Another option would be to write a kernel module that bypasses mtd. But=20
the mtd write routine is very adament about not erasing bad blocks.

> So IMHO there are only 2 options:
> - Within a running Linux remove/erase all bad blocks from beginning of ke=
rnel
> image to end of the partition, test the erased area with nandtest and mar=
k
> real bad blocks as bad, write the new kernel image to the right address a=
gain

Testing for bad blocks is something you can't do in practice on a device.=
=20
At the factory, AFAIK, they perform bad blocks tests while operating the=20
chip at the limits of its specification, to try and catch all blocks which=
=20
are marginal. Testing if such a block is 'bad' in an existing system most=
=20
often doesn't give the expected result. On our development boards, it=20
happens sometimes that someone manages to erase the whole flash including=
=20
bad block markers, we then routinely just assume all blocks are good which=
=20
works well enough in the lab, although I would never sell a product with a=
=20
flash that had been erased that way.

> - Or write some tool, that can distinguish between real bad blocks and th=
e
> Sam-ba 2.5 created bad blocks, unmark the false bad blocks. But perhaps t=
his
> is not possible at all.

It depends on how exactly Sam-ba 2.5 overwrites the existing bad block=20
markers.

> Perhaps somebody knows where I can find detailed information about
> these "spare area bytes reserved to tag bad blocks"? As far as I understa=
nd

The nand flash data sheets from the manufacturers have information both on=
=20
the memory array layout and how the bad blocks are marked.

> Is the OOB part of a page or does each page have an extra OOB (2048+64 by=
tes)?

The OOB (in this case) is an 'extra' 64 bytes per 2048 byte page.

> Is the OOB located at the beginning or at the end of each page?

Conceptually it is at the end, although it is normally accessed and read=20
in a separate read operation. I think you can perform a sequential read on=
=20
a nand flash which will read the page + oob in succession.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
