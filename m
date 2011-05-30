Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QR555-0001pQ-QW
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 16:12:40 +0000
Received: by eyh6 with SMTP id 6so1540285eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 09:12:35 -0700 (PDT)
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rick Johnson <rick22@wi.rr.com>
In-Reply-To: <4DE00913.4060709@wi.rr.com>
References: <4DADF9E6.9010709@wi.rr.com>
	<1303392001.2757.16.camel@localhost>  <4DC31183.8060807@wi.rr.com>
	<1304706750.7222.95.camel@localhost>  <4DD6DA14.9050402@wi.rr.com>
	<1306226504.2785.68.camel@localhost>
	<1306237382.2785.96.camel@localhost> <4DE00913.4060709@wi.rr.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 May 2011 19:07:58 +0300
Message-ID: <1306771678.4405.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-27 at 15:26 -0500, Rick Johnson wrote:
> I had some other observations that I might as well note too.
> 
> We had added code to constantly check the value of pnode->num versus the 
>   num returned from calc_pnode_num_from_parent().  We noticed errors 
> mainly in two places: ubifs_pack_pnode() and ubifs_get_pnode().
> 
> The ubifs_get_pnode() was more interesting though.  We only got a 
> corrupted 'num' value when the function returned the pnode from memory 
> and not from flash.  In other words, when ubifs_get_pnode() followed 
> this path:
> 
> branch = &parent->nbranch[iip];
> pnode = branch->pnode;
> if (pnode)
>    return pnode;
> 
> So it seems like 'num' is getting corrupted or changed while the pnode 
> is in memory.  If it being corrupted in memory, it's strange that 'num' 
> is so consistently targeted and that the corruption is not more random.

Well, there is some bug somewhere which corrupts memory, or this field,
I guess. I guess. I'd started putting more and more "targeted" checks at
different places and tried to narrow down the point when it gets
corrupted.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
