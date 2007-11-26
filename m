Received: from fe-relay04.albacom.net ([217.220.57.147])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IweVU-0008Ob-QB
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 14:00:26 +0000
Message-ID: <474AD10E.4030005@eptar.com>
Date: Mon, 26 Nov 2007 14:58:38 +0100
From: Claudio Lanconelli <lanconelli.claudio@eptar.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
References: <20071121213257.GI20871@lazybastard.org>	<305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>	<20071121225425.GA24327@lazybastard.org>	<Pine.LNX.4.64.0711220858190.523@lnxricardw.se.axis.com>	<20071122132650.GA27525@lazybastard.org>	<Pine.LNX.4.64.0711230836240.523@lnxricardw.se.axis.com>	<1195805904.3231.87.camel@sauron>	<Pine.LNX.4.64.0711231007070.523@lnxricardw.se.axis.com>	<1195809712.3231.96.camel@sauron>	<Pine.LNX.4.64.0711231026510.523@lnxricardw.se.axis.com>	<20071123184029.GA11033@old.davidb.org>
	<Pine.LNX.4.64.0711261031170.523@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0711261031170.523@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Brown <mtd@davidb.org>, Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> On Fri, 23 Nov 2007, David Brown wrote:
>
>   
>> Flash should be reasonably immune to degradation from reads.  In fact, 
>> it is fairly resiliant to degradation at all.
>>     
>
> I beg to differ; we ran some tests here on a 256 Mbit NAND flash where I 
> work which showed a marked degradation in read integrity if the block had 
> been written many times. For this particular chip in the setup used, after 
> 100 000 read/write cycles, non-correctable ECC errors started popping up 
> after about 43 million reads. For blocks that had only been written a 
> couple of times, we didn't detect any read errors whatsoever after 4.5e+10 
> reads (during three months of continuous reading of the same block).
>
> I would however love to see some hard data, or at least an application 
> note, on the frequency of various errors. Most of the information I've 
> seen is of the 'it is a known fact that ...' - type, without any 
> references. And the data sheets seem very silent on this subject, only 
> acknowledging the fact that bit flips do occur.
>   
Hi,
I find very useful this paper, it talks about "read disturb" on page 22:
http://www.edn.com/contents/images/ToshibaNANDFlash1.pdf

Cheers,
Claudio Lanconelli
