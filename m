Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJubA-0003yM-Tm
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 10:04:27 -0400
Message-ID: <41751FA1.2040108@inf.u-szeged.hu>
Date: Tue, 19 Oct 2004 16:07:29 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>	
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>	
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>	
	<4174F0F3.7030604@yandex.ru> <4175035B.80101@inf.u-szeged.hu>	
	<4175065B.6040407@yandex.ru>
	<1098193380.13633.1099.camel@hades.cambridge.redhat.com>
In-Reply-To: <1098193380.13633.1099.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
>>Ferenc, thanks for story, I really interested why the proc support was 
>>removed. 
> 
> It was buggy. There were buffer overflows and similar problems with it.
> I dropped it and suggested that the reimplementation may as well use
> sysfs.

Ups, than I misunderstood you.

Good to know that the problem was not the using of procfs itself, just 
my implementation. (it is much easier to fix :) )

Bye,
Ferenc
