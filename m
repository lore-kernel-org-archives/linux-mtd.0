Received: from 198.142.103.111.optusnet.com.au ([198.142.103.111] helo=max.ctam.local)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qqjk-0007nu-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 07:51:33 +0100
Received: from k9.ctam.local ([192.168.0.55] helo=bigpond.com)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 15qqsX-0007vz-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 17:00:37 +1000
Message-ID: <3BC2A094.2020006@bigpond.com>
Date: Tue, 09 Oct 2001 17:00:36 +1000
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd: looking for serial flash storage
References: <NEBBJKADBKFNCJOMHOAKAEFBCNAA.hamishl@dplanet.ch> <29826.1002609767@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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


David Woodhouse wrote:

>hamishl@dplanet.ch said:
>
>>You need 13 address lines for a DoC (A0..A12). 
>>
>
>That's only for backwards-compatibility with the DiskOnChip1000 sockets.
>
>You should be able to omit half of them - just make sure you have A11 and
>A12 connected, and also the bottom six lines. 
>
>Take a look at the addresses in include/linux/mtd/doc2000.h and observe 
>that we never address the chip such that (addr & 0x7c0). So you can just 
>tie those address lines (A6-A10) low from the DiskOnChip. Connect your 
>CPU's A6 and A7 to the DiskOnChip's A11 and A12, and make your ReadDOC_ and 
>WriteDOC_ macros use (adr & 0x3f | ((adr |0x1800)>>4) as the offset they 
>use.
>
>If you want to boot from it, then use a DiskOnChip Millennium where you can 
>change its firmware to deal with this setup, and wire as many of the extra 
>address lines as you can so you can use as much of the IPL SRAM as possible. 
>If you're only missing one address line, you should be able to see the 
>whole of the IPL SRAM without problems too - wire up A0-A9 normally, and 
>A10,A11 to the DiskOnChip's A11,12. 
>
This is fantastic news.  I assumed that if the DOC had those address 
lines then it would need all of them.

Is this information true for the 16MB TSOP-I DOC2000 and also the 32MB 
TSOP-I DOC Millenium Plus ???  Aparently they are pin compatible and can 
be used as a drop in replacement for each other.

Thanks,
Brendan Simon.
