Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvFQM-00065F-F1
	for linux-mtd@lists.infradead.org; Sun, 21 Aug 2011 21:19:19 +0000
Received: by wyh11 with SMTP id 11so3844795wyh.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 Aug 2011 14:19:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110816171707.GU26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
	<20110805160325.GM26160@logfs.org>
	<CAMjNe_c0qZ+opwHtO3AhD60v1p8-gpDLVykJoKo8oD4zNGk9kA@mail.gmail.com>
	<20110808083107.GN26160@logfs.org>
	<CAMjNe_c3J6UNi5LGmraD+CcbP9yGOOzepy=JFVy3wYx15hs55w@mail.gmail.com>
	<20110809145812.GR26160@logfs.org>
	<CAMjNe_f_364ir1iNgFFgh71GP-T_6vroMHFC1R7eazkhcR8c2g@mail.gmail.com>
	<20110812093429.GS26160@logfs.org>
	<CAMjNe_eCqe1kVH-GLb6uo1gVCkH2r49w2Xdws6=jFMOaQRU=mw@mail.gmail.com>
	<20110816171707.GU26160@logfs.org>
Date: Mon, 22 Aug 2011 02:49:14 +0530
Message-ID: <CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
Subject: Re: logfs unmount bug
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
>> I tried your patches and I also tried on official kernel release 3.0.1.
>> I have shared the bonnie output and logs in =A0the below link:
>>
>> https://docs.google.com/leaf?id=3D0BycgLWCW61phNjY0ZDg4ZjUtYzAyMy00YTgwL=
WFlMmItNjlmZWIzMWFlNGUy&hl=3Den_US

In the shared collection,the files corresponding to first patch are
2_bonnie_out.txt (the patch used and the bonnie output),
2_patch1_first50mb_log.txt (head of the log,first 50MB)
,2_patch1_last50mb_log.txt(tail of the log, last 50MB)

Other files correspond to other kernel versions i tried

> Are you sure you tried the first patch? =A0When I grep for
> "logfs_invalidatepage", I only find the oopses, not my debug output.

I had a printk("PATCH1") that gets printed in the log.
I dont know why your "logfs_invalidatepage" debug print does not appear.

Thanks,
Mugunthan
