Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qqxY-0007ri-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 08:05:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BC2A094.2020006@bigpond.com> 
References: <3BC2A094.2020006@bigpond.com>  <NEBBJKADBKFNCJOMHOAKAEFBCNAA.hamishl@dplanet.ch> <29826.1002609767@redhat.com> 
To: brendan.simon@bigpond.com
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd: looking for serial flash storage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 09 Oct 2001 08:14:54 +0100
Message-ID: <30579.1002611694@redhat.com>
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

brendan.simon@bigpond.com said:
> This is fantastic news.  I assumed that if the DOC had those address
> lines then it would need all of them.

They're there for compatibility. M-Systems make sure that you can drop the 
newer devices into the same hole on your board as the older devices. If you 
skimp on the address lines because you happen to know one of their devices 
doesn't need them, don't sulk if the next one doesn't work :)

> Is this information true for the 16MB TSOP-I DOC2000 and also the 32MB
>  TSOP-I DOC Millenium Plus ???  Aparently they are pin compatible and
> can  be used as a drop in replacement for each other. 

It should be true for the DOC2000. The Millennium Plus is a different beast 
entirely, and isn't supported - we only support the Millennium. In this 
context, 'pin-compatible and can be used as a drop in replacement' means 
solely that it doesn't need more than the 13 address lines and 8 data lines 
which were specified for all the DiskOnChip family. 

I doubt the Millennium Plus actually needs the A10 line either, but it's all
academic because we can't drive it anyway - we don't have any specs for it.

--
dwmw2
