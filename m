Received: from wr-out-0506.google.com ([64.233.184.235])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHKRG-00044a-LJ
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 14:49:28 +0000
Received: by wr-out-0506.google.com with SMTP id 50so920838wra.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 06:49:20 -0800 (PST)
Date: Tue, 22 Jan 2008 08:49:10 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: "Adams Richard-W36112" <rgadams@motorola.com>
Subject: Re: problem with 2k page NAND with squashfs
Message-ID: <20080122084910.2939d94a@weaponx>
In-Reply-To: <A2EC06CB0E393B4C8EB220B286B7083E05897213@ct11exm60.ds.mot.com>
References: <A2EC06CB0E393B4C8EB220B286B7083E05897213@ct11exm60.ds.mot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 Jan 2008 09:15:29 -0500
"Adams Richard-W36112" <rgadams@motorola.com> wrote:

>  I have an arm-based embedded system running a 2.6.10 kernel. I'm using
> a squashfs file system (read only) on the Flash device. The system was
> working fine with a 512 byte page Flash part. I started having problems
> when I upgraded to a 2048 byte page Flash part. When I mount the squash
> file system, it can successfully find the super block, but squashfs
> fails (unable to read inode [5ff3:120]) when it try's to finish the
> mount. My suspicions are that with the older kernel (2.6.10) it may not
> fully support the larger page devices. Is there an achieve of patches
> that are applicable for a 2.6.10 kernel? I tried to look through the
> mailing list archive, but without a search tool and not knowing what
> month I'm looking for the task became tedious.

http://linux-mtd.infradead.org/source.html#kernelversions

2.6.10 pre-dates git even, so you are likely stuck doing diffs from
kernel tarballs.

josh
