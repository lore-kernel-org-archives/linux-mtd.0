Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SMik-0005N2-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 17:25:02 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SMii-0005Ms-00
	for mtd@infradead.org; Mon, 12 Feb 2001 17:25:01 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <020701c09517$48fc61e0$0a070d0a@axis.se> 
References: <020701c09517$48fc61e0$0a070d0a@axis.se>  <151F3D2AE9F0D3119E480004ACB8EA3701DEC941@cluster01.axis.se> <14127.981995794@redhat.com> 
To: "Johan Adolfsson" <johan.adolfsson@axis.com>
Cc: "Jonas Holmberg" <jonas.holmberg@axis.com>, mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Feb 2001 17:24:19 +0000
Message-ID: <21475.981998659@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


johan.adolfsson@axis.com said:
> Wouldn't it be possible to check both the bootloc and the erase
> regions and do something like this? :

Would that help? I thought that _all_ the AMD chips had the smallest 
regions listed first - that's the whole problem. But the top-boot chips you 
have don't have bootloc == CFI_BOTTOM_BOOT. Or am I misunderstanding?

If the erase regions are listed the wrong way round _and_ the byte in the 
extended header isn't set appropriately to tell you so, these AMD chips 
really are broken. We need to work round them explicitly with a table of 
JEDEC IDs for the broken chips, or just reject them and buy Intel chips 
instead.
--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
