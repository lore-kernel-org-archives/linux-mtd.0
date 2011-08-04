Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qp6X9-0005iF-5H
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2011 22:36:56 +0000
Received: by fxd20 with SMTP id 20so3223939fxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Aug 2011 15:36:50 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1312480051-19208-1-git-send-email-computersforpeace@gmail.com>
References: <1312480051-19208-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 4 Aug 2011 15:36:30 -0700
Message-ID: <CAMjpGUdMFCTD2tt5G-kiyJY9gqFvp3dANz93ZbLSfzSm2UoU9w@mail.gmail.com>
Subject: Re: [PATCH] mtdinfo: don't open NULL pointer when getting region_info
	with `-a'
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: brian.foster@maxim-ic.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 4, 2011 at 10:47, Brian Norris wrote:
> This "fixes" a regression found in:
> =C2=A0commit 266061ebd5d72391f0a0e831b018e8fc7fea68a1
> =C2=A0mtdinfo: add regioninfo/eraseblock map display
>
> On certain flash (NOR flash that have eraseblock region info),
> `mtdinfo -a' tries to open the MTD node file, for use with the ioctl
> MEMGETREGIONINFO; however, we didn't supply a device node path to
> `mtdinfo -a', so it's using NULL, resulting in errors like:
>
> =C2=A0mtdinfo: error!: couldn't open MTD dev: (null)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error 14 (Bad address)
>
> For now, we can just skip dumping region_info with the `-a' flag. If
> we find a better way to do this (e.g., export via sysfs, find device
> nodes via automatic routines, etc.), then we can kill the workaround
> and this FIXME should be removed.

the plan was to fixup the -a behavior once -m was punted.  we need to
rewrite it so that the main logic loops when all is being used and
takes care of constructing the device names via translate_dev.
-mike
