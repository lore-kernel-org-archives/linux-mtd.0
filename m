Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQ3iW-000761-6z
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 20:33:08 +0000
Message-ID: <4DE00913.4060709@wi.rr.com>
Date: Fri, 27 May 2011 15:26:59 -0500
From: Rick Johnson <rick22@wi.rr.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
References: <4DADF9E6.9010709@wi.rr.com>	 <1303392001.2757.16.camel@localhost>
	<4DC31183.8060807@wi.rr.com>	 <1304706750.7222.95.camel@localhost>
	<4DD6DA14.9050402@wi.rr.com>	 <1306226504.2785.68.camel@localhost>
	<1306237382.2785.96.camel@localhost>
In-Reply-To: <1306237382.2785.96.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I had some other observations that I might as well note too.

We had added code to constantly check the value of pnode->num versus the 
  num returned from calc_pnode_num_from_parent().  We noticed errors 
mainly in two places: ubifs_pack_pnode() and ubifs_get_pnode().

The ubifs_get_pnode() was more interesting though.  We only got a 
corrupted 'num' value when the function returned the pnode from memory 
and not from flash.  In other words, when ubifs_get_pnode() followed 
this path:

branch = &parent->nbranch[iip];
pnode = branch->pnode;
if (pnode)
   return pnode;

So it seems like 'num' is getting corrupted or changed while the pnode 
is in memory.  If it being corrupted in memory, it's strange that 'num' 
is so consistently targeted and that the corruption is not more random.

Another thing we noticed was that the pnode's with the the corrupted 
'num' had lprops with LEB numbers between 7600 and 8010 (which is near 
the max of 8062 on our flash).  Maybe that's just a coincidence, but I 
might as well note it.

Thanks for any advice you might have!
Rick
