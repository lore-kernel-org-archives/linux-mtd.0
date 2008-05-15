Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JwWPu-0000YQ-CG
	for linux-mtd@lists.infradead.org; Thu, 15 May 2008 05:54:15 +0000
Received: by wf-out-1314.google.com with SMTP id 28so253254wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 May 2008 22:54:12 -0700 (PDT)
Message-ID: <bae050c10805142254n40dbd8e7jebc2c6103df1d306@mail.gmail.com>
Date: Thu, 15 May 2008 13:54:12 +0800
From: Nancy <nancydreaming@gmail.com>
To: "N Cheung" <brjerome.1@gmail.com>
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
In-Reply-To: <c260b4940805141115i3d634049u27749042f61c99f9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<1204623622.23706.22.camel@sauron>
	<bae050c10803040154t2f635dfewe1221c18255f7bda@mail.gmail.com>
	<1204624414.23706.26.camel@sauron>
	<bae050c10803040207odbaebe5vd85b619b370a16cd@mail.gmail.com>
	<bae050c10803040555y3a398fla89fe54c01908838@mail.gmail.com>
	<bae050c10805122116g4295f202j40e1a8528be5220@mail.gmail.com>
	<1210672391.5708.15.camel@sauron>
	<bae050c10805130631g7de2a4b0x1d67ddd3b84511bc@mail.gmail.com>
	<c260b4940805141115i3d634049u27749042f61c99f9@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Norman

On 5/15/08, N Cheung <brjerome.1@gmail.com> wrote:
> Nancy and Artem,
>
> I want to run cramfs or squashfs on NAND. It looks like this ubiblock
> may be the solution to my search.  Or perhaps there is a NFTL layer
> that manages bad blocks.  Any suggestions?

       In my opinion, the Nand awared filesystem is the best choice
for you. JFFS2, YAFFS2, UBIFS are all Nand awared filesystem. They are
all run on Character device layer.
       UBI block device layer is creating for the traditional
filesystem based on block device layer, such as FAT. Although UBI
tolerant power failure, but that was not mean completely safe for FAT.
Sometimes, FAT will turn to readonly if it detect an file EOF missing.
In that case, you should use tool "dosfsck" to fix this problem.
       Maybe cramfs or squashfs may have the same problem like FAT has
or other problem. To be safe, please use Nand awared filesystem
instead. Use ubi block device layer when you have no other choices.


-- 
Best wishes,
Nancy
