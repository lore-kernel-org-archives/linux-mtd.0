Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sg0A-00072D-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 14:00:18 +0000
Message-ID: <3A893578.DB8FA7B4@mobach.nl>
Date: Tue, 13 Feb 2001 14:24:08 +0100
From: Mendel Mobach <mendel@mobach.nl>
Reply-To: mendel@mobach.nl
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Errors with M-Systems' DOC v MD2200 D16 and ext2
References: <3A86F72B.A1971413@mobach.nl> <19636.981968145@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> mendel@mobach.nl said:
> >  With the 2800 I've got no problems but with the  2200 I've got
> > problems and get some very strange kernel messages
> 
> Running out of free blocks to write to - again. This has happened to a few
> people. I'm confused. I put a change into the CVS tree to attempt to fix
> this - can you try it? Just drop nftl.c and nftlmount.c from CVS on top of
> the versions in your kernel tree.
I trid this from the latest version of the CVS tree..
($Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $)
But I'v got still the same errors
(I build from a clean kernel source tree)

Regards

Mendel Mobach
> 
> --
> dwmw2

-- 
Mendel Mobach aka BugBlue - mendel@mobach.nl - bugblue@dds.nl
ICQ: 40200278 - IRC: BugBlue (ircnet:#ne2000 undernet:#groningen)
/"\                        |   [Student]           
\ /                        |   [IPv6 tester]
 X  ASCII RIBBON CAMPAIGN  |   [coder]
/ \ AGAINST HTML MAIL      |   [Possible security tester]


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
