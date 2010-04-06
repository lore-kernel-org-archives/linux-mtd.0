Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nz4HJ-00016u-4v
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2010 08:36:58 +0000
Subject: Re: mkfs.ubifs: double free or corruption, while trying to create
	bigger image than -c allow
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20100302141158.GE3206@jama>
References: <20100302141158.GE3206@jama>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Apr 2010 11:35:14 +0300
Message-ID: <1270542914.6754.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-02 at 15:11 +0100, Martin Jansa wrote:
> Hi,
> 
> when I run mkfs.ubifs and the rootfs directory is bigger and needs more
> LEBs than -c parameter, then it says right message, but then fails with
> "double free or corruption" and shows backtrace.
> 
> But the backtrace is shown only for some bigger counts (or so it seems), 
> in some cases is only the Error about LEBs count shown and no backtrace.
> 
> But those error messages also doesn't seem right:
> 
> (gdb) set args  -r /home/projects/OE/tmpdir-dev-shr/rootfs/shr-lite-image/ -o image.ubifs -m 2048 -e 126976 -c 2
> Error: too low max. count of LEBs, minimum is 17
> (gdb) set args  -r /home/projects/OE/tmpdir-dev-shr/rootfs/shr-lite-image/ -o image.ubifs -m 2048 -e 126976 -c 17
> Error: too many log LEBs, maximum is 0
> (gdb) set args  -r /home/projects/OE/tmpdir-dev-shr/rootfs/shr-lite-image/ -o image.ubifs -m 2048 -e 126976 -c 18
> Error: too many log LEBs, maximum is 1
> 
> Build arch is x86_64, gcc-4.4.3, glibc-2.11, latest gentoo.

Hi, yes, I saw this problem, but never had time to fix it. Would be nice
to have a patch from someone :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
