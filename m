Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5vQe-0006wh-Eu
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 04:25:53 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2470133wfc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Jun 2008 21:25:50 -0700 (PDT)
Message-ID: <bae050c10806092125l2d758980j29ba9153f165be56@mail.gmail.com>
Date: Tue, 10 Jun 2008 12:25:49 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Alaor Koppe" <alakoppe@gmail.com>
Subject: Re: NAND and vfat
In-Reply-To: <a791a2dc0806091855p5e35ae1biebdce6009795399e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
	<bae050c10806061841j27dab8cp48ac7b75dadf7cd1@mail.gmail.com>
	<a791a2dc0806071251v23b74c67ne160bebc5774374b@mail.gmail.com>
	<bae050c10806071804k7bddc290s8538ce55989118e0@mail.gmail.com>
	<a791a2dc0806081549g74f6af40yb91d3a5e1a6c31d@mail.gmail.com>
	<bae050c10806081958v5575545ay977877f3aaca7e1@mail.gmail.com>
	<a791a2dc0806091855p5e35ae1biebdce6009795399e@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alaor,
On 6/10/08, Alaor Koppe <alakoppe@gmail.com> wrote:
> Hi Nancy,
>
> What board are you using? What uclinux version?
   I use our own board Pavo (www.ingenic.cn). We use Linux-2.6.24.3.
The patches on website are not up to date. But that's fine with Jffs2.

> I tried a little bit with your tips, but I can't write correct and
> jffs2 returned these errors:
> Buffer I/O error on device loop0, logical block 19
> lost page write due to I/O error on loop0
   That seems driver problem.

> At windows we can format with FAT or FAT32, but whe we use the volume,
> all that we write generate an error at board and also we receive a
> message that is not possible to read. After that we umount and mount
> again at windows side and we can see the files that we tried to create
> with correct name but empty.
     Be sure /dev/loop0 device only mount once at one time. That mean
you can't mount /dev/loop0 on your board then modprobe g_file_storage
file=/dev/loop0. After that remember first remmod g_file_storage then
mount /dev/loop0 on board again.
     If still the same result, I don't know why : (

-- 
Best wishes,
Nancy
