Date: Fri, 16 May 2008 13:59:43 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: jkimble@one.net
Subject: Re: Porting to Intel P33 flash
In-Reply-To: <39423.137.237.242.42.1210941221.squirrel@webmail.nuvox.net>
Message-ID: <Pine.LNX.4.64.0805161337350.5602@pentafluge.infradead.org>
References: <57616.137.237.242.138.1210774371.squirrel@webmail.nuvox.net><Pine.LNX.4.64.0805141752210.5183@pentafluge.infradead.org>
	<20080516055424.GA10763@cloud.net.au>
	<39423.137.237.242.42.1210941221.squirrel@webmail.nuvox.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Hamish Moffatt <hamish@cloud.net.au>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

> 
> Funny you say that...  I just modified the code where it checks CFI
> version  and it seems to be working without further modification. I've not
> tested much though so I may have more to do. I do have to write to this
> but not much.
> 
> James
It is good to hear this. Please check number of RWW partitons
(numvirtchips variable) and 9th bit of extp->FeatureSupport. 
Everything is Ok if numvirtchips == 1 or extp->FeatureSupport bit 9 is 0.

As I remember some versions of MTD prior to 2.6.17 had
problems with CFI offset calculation. It led chip to be identified as
multiple partitioned device when it should have 1 partiton. 

Thanks,
Alexey
