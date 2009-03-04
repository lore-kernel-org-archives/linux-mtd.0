Received: from host2.bln.innominate.com ([77.245.32.75]
	helo=home.innominate.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LevJb-0003Zw-NZ
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 17:55:34 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by home.innominate.com (Postfix) with ESMTP id 9A6692311E
	for <linux-mtd@lists.infradead.org>;
	Wed,  4 Mar 2009 18:55:30 +0100 (CET)
Received: from home.innominate.com ([127.0.0.1])
	by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id amZlKXy7LYTl for <linux-mtd@lists.infradead.org>;
	Wed,  4 Mar 2009 18:55:30 +0100 (CET)
Received: from tomo.bln.innominate.local (gw-dev-ext.bln.innominate.local
	[10.10.0.1])
	by home.innominate.com (Postfix) with ESMTP id 62F1F23117
	for <linux-mtd@lists.infradead.org>;
	Wed,  4 Mar 2009 18:55:30 +0100 (CET)
Received: from localhost
	([127.0.0.1] helo=tomo.bln.innominate.local ident=pvollmer)
	by tomo.bln.innominate.local with esmtp (Exim 4.69)
	(envelope-from <pvollmer-linux-mtd@innominate.com>)
	id 1LevJa-0000Nf-AE
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 18:55:30 +0100
Date: Wed, 04 Mar 2009 18:55:30 +0100
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: using BDI2000 to access Secured Silicon Sector on Spansion Flash
	(CFI commandset 0002)
From: "Peter Vollmer" <pvollmer-linux-mtd@innominate.com>
Content-Type: text/plain; format=flowed; delsp=yes; charset=utf-8
MIME-Version: 1.0
References: <op.up9pwgzonpibwm@tomo.bln.innominate.local>
Content-Transfer-Encoding: 7bit
Message-ID: <op.up932sjunpibwm@tomo.bln.innominate.local>
In-Reply-To: <op.up9pwgzonpibwm@tomo.bln.innominate.local>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 04 Mar 2009 13:49:18 +0100, Peter Vollmer  
<pvollmer-linux-mtd@innominate.com> wrote:

> Hi all,
>
> I'm sorry if this is slightly off-topic, but I hope to reach somebody  
> with
> experience using the BDI2000 (or other jtag tools) to run cfi commands
> (command set 0002) directly, i.e without booting the linux kernel.

Hi,

answering my own post, sorry. I found my problem, somehow I have to shift  
the addresses: addr<<2
instead of 0xfe0002aa its 0xfe000aa8
instead of 0xfe000555 its 0xfe001554

when doing this I can easily access the secured sector using just the  
BDI2000 :

#enter secured sector
SEC>mm 0xfe001554 0x00aa00aa ; mm 0xfe000aa8 0x00550055 ; mm 0xfe001554  
0x00880088
SEC>md 0xfe000000
fe000000 : ffffffff ffffffff ffffffff ffffffff  ................
...
# write access (!!! works only once !!!)
SEC>mm 0xfe001554 0x00aa00aa ; mm 0xfe000aa8 0x00550055 ; mm 0xfe001554  
0x00A000A0 ; mm 0xfe000000 0x7FFFFFFF
# read back
SEC>md 0xfe000000
fe000000 : 7fffffff ffffffff ffffffff ffffffff  ................
...
# leave secured sector
SEC>mm 0xfe001554 0x00aa00aa ; mm 0xfe000aa8 0x00550055 ; mm 0xfe001554  
0x00900090 ; mm 0xfe000aa8 0x00000000


just for the record, the CFI ID of this chip is 0x2101, and the linux mtd  
drivers work flawlessly.

best regards

-- 
Peter Vollmer
Innominate Security Technologies AG
Berlin / Germany
