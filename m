Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QrvUk-0004kK-Lm
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 17:26:07 +0000
Received: by wwf10 with SMTP id 10so2254344wwf.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Aug 2011 10:26:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110812093429.GS26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
	<20110805160325.GM26160@logfs.org>
	<CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
	<20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
	<20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
	<20110812093429.GS26160@logfs.org>
Date: Fri, 12 Aug 2011 22:56:02 +0530
Message-ID: <CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I wouldn't suspect any code changes to cause the different behaviour.
> Kernel config and test machine (memsize, etc.) would be more likely
> candidates. =A0So if you could try the patch and send me the output,
> that would be useful.

I tried your patches and I also tried on official kernel release 3.0.1.
I have shared the bonnie output and logs in  the below link:

https://docs.google.com/leaf?id=3D0BycgLWCW61phNjY0ZDg4ZjUtYzAyMy00YTgwLWFl=
MmItNjlmZWIzMWFlNGUy&hl=3Den_US

Basically the bonnie test gets stuck , when it does "Create files in
sequential order...".
I did all my tests with nandsim. Are there any problems using logfs
with nandsim?
I hit on another  bug(segment.c:782) by running the following script.
-
#!/bin/bash
for i in $(seq 1 10)
do
	sudo mount -t logfs /dev/mtdblock0 /mnt/flash_drive/ ;
	cd /mnt/flash_drive/ ;
	sudo mkdir dir$i ;
	cd ;
	sudo umount /mnt/flash_drive/ ;
done
-
I did a partial analysis. It happens when we do the remount and it
follows the code path "Possibly incomplete write" in check_area()
function.(the area is open and memchr_inv returns non-null pointer).
It tries to do "logfs_rewrite_block", but since the free list is not
filled during this time, it says "LOGFS: ran out of free segments"
bug.
Hope you are able to reproduce this problem.
thanks,
mugunthan
