Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rdMw-0003Wi-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 11:14:58 +0100
Date: Mon, 23 Apr 2001 12:14:01 +0200
From: Fabrice Gautier <gautier@email.enst.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: STPC and Macronix Flash.
Cc: mtd@infradead.org
In-Reply-To: <6117.988017638@redhat.com>
References: <20010423030902.1FEC.GAUTIER@email.enst.fr> <6117.988017638@redhat.com>
Message-Id: <20010423121151.1909.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 23 Apr 2001 10:20:38 +0100
David Woodhouse <dwmw2@infradead.org> wrote:
> 
> gautier@email.enst.fr said:
> >  Then the flash should be mapped to 0x2a00000 so i'm doing an ioremap
> > and using the return value to access the flash. Just like it is done
> > in physmap.c and oher.
> 
> Do what I say, not what I do :)
> 
> Try ioremap_nocache and __raw_{read,write}[bwl].

No success either. :-(

Thanks,

-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
