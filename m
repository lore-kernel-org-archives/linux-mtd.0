Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uyl2-0007QJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 16:41:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0105021131120.1390-100000@xanadu.home> 
References: <Pine.LNX.4.33.0105021131120.1390-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: linux-mtd@lists.infradead.org, ahennessy@mvista.com, ds@schleef.org,
    jonas.holmberg@axis.com, cwryu@debian.org, eauth@softsys.co.at
Subject: Re: Flash driver probe/commandset separation. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 May 2001 16:39:45 +0100
Message-ID: <5116.988817985@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

nico@cam.org said:
>  Personally I think it would be best to send the curent code to Linus
> and resend another update eventually when the new stuff would have
> been proven stable.

> 	"release early, release often" 

Yes, you're probably right.

TODO list then:

	1. Make cfi_cmdset_000[12].c compile again :)
	2. Fix the partition stuff as discussed, removing VIRTUAL_ER
	3. Sanity check DiskOnChip and NFTL drivers. 

Anything else?

--
dwmw2
