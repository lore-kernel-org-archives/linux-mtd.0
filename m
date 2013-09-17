Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLivS-0004nc-Vu
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 00:13:55 +0000
Received: by mail-ob0-f177.google.com with SMTP id wp18so4524052obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 17:13:33 -0700 (PDT)
Date: Mon, 16 Sep 2013 17:13:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
Message-ID: <20130917001329.GH4550@ld-irv-0074.broadcom.com>
References: <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
 <521DA6B3.9080003@gmail.com> <20130829012403.GA4254@gmail.com>
 <521ED69F.5080203@gmail.com> <521EDD7F.2010103@freescale.com>
 <521EE131.8070105@freescale.com>
 <CAN8TOE9=D_WmFD4RBf1OihVHv_oacxWwTh2a4owSwYD5QNmfTA@mail.gmail.com>
 <52280278.6020007@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52280278.6020007@freescale.com>
Cc: Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

Sorry, I overlooked responding to this one.

On Thu, Sep 05, 2013 at 12:03:04PM +0800, Huang Shijie wrote:
> 于 2013年09月05日 02:51, Brian Norris 写道:
> 
>     You could precede this patch with one that prevents exporting
>     MTD_MLCNANDFLASH in mtd_type_show() and in ioctl(MEMGETINFO). I'm not
>     saying you *must* do this, but that this side effect must be
>     acknowledged and explained better, or else it seems that you don't
>     understand the ramifications of your proposed changes.
> 
> [1] If you think we should not _change_ any code of the application, such as
> the mtd-utils,

That's the true meaning of "we don't break ABI compatibility". mtd-utils
that work today on a given board with a given set of hardware (e.g., MLC
NAND flash) should not need modified to handle the same features on a
newer kernel.

However, I think it is safe to say that the MLC vs. SLC distinction
isn't made clear in mtd-abi.h (i.e., we already have MTD_MLCNANDFLASH),
and that this change is justified.

>     I can create a patch to prevents exporting the MTD_MLCNANDFLASH in
> mtd_type_show() and
>     in ioctrl(MEMGETINFO).

I don't think this is actually necessary. It is desirable that users can
see the difference between SLC and MLC, but this should be explained.

> [2] else, I prefer to explain better for this patch.

Yes, please explain it better (and reorder some patches, as I explained
previously) in order to

(1) show that you understand completely what your patches are doing and

(2) more clearly notify other developers of the modified ABI

Thanks,
Brian
