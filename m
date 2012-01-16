Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rms4L-0003It-PO
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 19:18:14 +0000
Received: by wibhq15 with SMTP id hq15so2905985wib.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 11:18:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1326715636.14299.66.camel@sauron.fi.intel.com>
References: <1326507110-10893-1-git-send-email-computersforpeace@gmail.com>
 <1326715636.14299.66.camel@sauron.fi.intel.com>
Date: Mon, 16 Jan 2012 11:18:09 -0800
Message-ID: <CAN8TOE92_AgqnDf4OOd46eSwux9_SHMMn-S1WK1DY720wtrr9g@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: nand: erase block before marking bad
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 16, 2012 at 4:07 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-01-13 at 18:11 -0800, Brian Norris wrote:
>> Many NAND flash systems (especially those with MLC NAND) cannot be
>> reliably written twice in a row. For instance, when marking a bad block,
>> the block may already have data written to it, and so we should attempt
>> to erase the block before writing a bad block marker to its OOB region.
>
> All four look good, pushed to l2-mtd.git, thanks.

Sorry, but actually this "erase block before marking bad" patch is
incorrect. I didn't test this particular revision, and so I forgot
that the erase fails because the block is already marked as bad:

  nand_erase_nand: attempt to erase a bad block at page 0x...

I'll send a fixup patch on top of l2-mtd-2.6.

> What are your plans WRT marking blocks as bad both in the OOB and the
> table?

I don't have a 100% definite plan, but I've been trying to track the
comments/suggestions in the other thread. I'll reply to that thread so
we have the right reply-chain and CC list for discussion.

Brian
