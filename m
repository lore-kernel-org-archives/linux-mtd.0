Received: from ns5a.townisp.com ([216.195.0.139] helo=ns5.townisp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAZDv-0008Nb-0J
	for linux-mtd@lists.infradead.org; Mon, 05 Apr 2004 19:53:31 +0100
Date: Mon, 5 Apr 2004 14:53:30 -0400 (EDT)
From: Jamie Guinan <guinan@bluebutton.com>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <Pine.LNX.4.44.0404051426360.32515-100000@gemini.home.net>
Message-ID: <Pine.LNX.4.44.0404051452360.32580-100000@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: SST 39VF1601
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 Apr 2004, Jamie Guinan wrote:
...
> which leaves the values as follows,
> 
>   cfi->addr_unlock1 = 0xaaaa 
>   cfi->addr_unlock2 = 0x5554
> 
> Then later in jedec_match() it fails this test,
> 
> 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): check unlock addrs 0x%.4x 0x%.4x\n",
> 	       __func__, cfi->addr_unlock1, cfi->addr_unlock2 );
> 	if ( MTD_UADDR_UNNECESSARY != uaddr && MTD_UADDR_DONT_CARE != uaddr
> 	     && ( unlock_addrs[uaddr].addr1 != cfi->addr_unlock1
> 		  || unlock_addrs[uaddr].addr2 != cfi->addr_unlock2 ) ) {
> 		DEBUG( MTD_DEBUG_LEVEL3,
> 		       "MTD %s(): 0x%.4x 0x%.4x did not match\n",
> 		       __func__,
> 		       unlock_addrs[uaddr].addr1,
> 		       unlock_addrs[uaddr].addr2 );
> 		goto match_done;
> 	}
> 
> I could try adding a new enum uaddr MTD_UADDR_0x5554_0xAAAA and
> corresponding unlock_addrs[] entry, if that doesn't sound
> unreasonable.

Erm, rather, MTD_UADDR_0xAAAA_0x5554.

-Jamie
