Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SMvI-0005ZN-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 17:38:00 +0000
Message-ID: <024701c09519$db036e10$0a070d0a@axis.se>
Reply-To: "Johan Adolfsson" <johan.adolfsson@axis.com>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
        "Johan Adolfsson" <johan.adolfsson@axis.com>
Cc: "Jonas Holmberg" <jonas.holmberg@axis.com>, <mtd@infradead.org>
References: <020701c09517$48fc61e0$0a070d0a@axis.se>  <151F3D2AE9F0D3119E480004ACB8EA3701DEC941@cluster01.axis.se> <14127.981995794@redhat.com>  <21475.981998659@redhat.com>
Subject: Re: Problems with cfi_cmdset_0002.c 
Date: Mon, 12 Feb 2001 18:33:04 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
To: Johan Adolfsson <johana@axis.com>
Cc: Jonas Holmberg <jonashg@axis.com>; <mtd@infradead.org>
Sent: Monday, February 12, 2001 18:24
Subject: Re: Problems with cfi_cmdset_0002.c


>
> johan.adolfsson@axis.com said:
> > Wouldn't it be possible to check both the bootloc and the erase
> > regions and do something like this? :
>
> Would that help? I thought that _all_ the AMD chips had the smallest
> regions listed first - that's the whole problem. But the top-boot chips
you
> have don't have bootloc == CFI_BOTTOM_BOOT. Or am I misunderstanding?

It's probably mee...:-)
Jonas has those flash chips, I dont.
What does the bootloc say? Does it says something other the 2 and 3?

> If the erase regions are listed the wrong way round _and_ the byte in the
> extended header isn't set appropriately to tell you so, these AMD chips
> really are broken. We need to work round them explicitly with a table of
> JEDEC IDs for the broken chips, or just reject them and buy Intel chips
> instead.

We need a table like that for other AMD compatible non CFI chips as well
(e.g. Toshiba).
Jonas has a solution that seems to work here, I guess it should go into the
mtd tree soner or later?
We probably want the check against the list before doing the CFI probe.

> --
> dwmw2

/Johan




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
