Received: from wx-out-0506.google.com ([66.249.82.228])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JwLVU-0008JB-6u
	for linux-mtd@lists.infradead.org; Wed, 14 May 2008 18:15:16 +0000
Received: by wx-out-0506.google.com with SMTP id h28so6928wxd.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 May 2008 11:15:15 -0700 (PDT)
Message-ID: <c260b4940805141115i3d634049u27749042f61c99f9@mail.gmail.com>
Date: Wed, 14 May 2008 11:15:14 -0700
From: "N Cheung" <brjerome.1@gmail.com>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
In-Reply-To: <bae050c10805130631g7de2a4b0x1d67ddd3b84511bc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<bae050c10803040140q2d4801d5m4271cadcaa55579@mail.gmail.com>
	<1204623622.23706.22.camel@sauron>
	<bae050c10803040154t2f635dfewe1221c18255f7bda@mail.gmail.com>
	<1204624414.23706.26.camel@sauron>
	<bae050c10803040207odbaebe5vd85b619b370a16cd@mail.gmail.com>
	<bae050c10803040555y3a398fla89fe54c01908838@mail.gmail.com>
	<bae050c10805122116g4295f202j40e1a8528be5220@mail.gmail.com>
	<1210672391.5708.15.camel@sauron>
	<bae050c10805130631g7de2a4b0x1d67ddd3b84511bc@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 13, 2008 at 6:31 AM, Nancy <nancydreaming@gmail.com> wrote:

> .. But none! UBI complete
> the main part of the NFTL job and done well. In fact I want to ask you
> why do not go further to make it a good NFTL, not just for UBIFS use,
> but other filesystem based on block device layer.
..
>   Also, some customer like to use Reiserfs. As a BSP Nand flash
> driver supporter, I have to meet there need. That's why I add this
> "generic" ubi block layer.
>

Nancy and Artem,

I want to run cramfs or squashfs on NAND. It looks like this ubiblock
may be the solution to my search.  Or perhaps there is a NFTL layer
that manages bad blocks.  Any suggestions?

Thanks,
Norman
