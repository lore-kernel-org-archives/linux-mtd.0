Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REe9r-0001xt-HP
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 09:34:28 +0000
Received: by wwg9 with SMTP id 9so585162wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 02:34:25 -0700 (PDT)
Message-ID: <4E98021F.1060200@gmail.com>
Date: Fri, 14 Oct 2011 11:34:23 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: erase block < 8KiB
References: <4E8977DF.1030808@gmail.com> <1318581933.12351.70.camel@sauron>	
	<4E97F7C2.1050803@gmail.com> <1318583721.12351.80.camel@sauron>
In-Reply-To: <1318583721.12351.80.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,
i already managed my issue, this flash and jffs2 works perfect with a 
64KB sector. There should be in the archive my patch posted.

CFI driver actually do an operation called "fixup". It detect this 
flash, and know that this flash has 2 sector sizes, 4KB and 64KB.
The fixup chose the 4KB as erasesize, so excluding the jffs2 usage.

The patch to mkfs.jffs2 tool to allow the usage of 4KB erasesize works, 
but is not safe.
If 4KB was not allowed, there was a reason.

So i also tried to use some other FS, like logfs or UBIFS. But i 
couldn't easily port all the tools needed since i am in a "Coldfire" 
architecture and using uClinux for coldfire.
So i decided to patch the erasesize to 64KB.

At the end, who is interested can use it, the patch is very simple and 
is available searching the archive.

Regards.
angelo





On 14/10/2011 11:15, Artem Bityutskiy wrote:
> On Fri, 2011-10-14 at 10:50 +0200, angelo wrote:
>    
>> I already done this, and posted the patch for 64 KB sector.
>>
>> But i none here still answered to the question :
>> why the cfi_cmdset_0002 selects for this flash the 4KB sector instead of
>> the 64KB  ? In this way, the non-working of jffs2 is guaranteed, since
>> the minimal block size is 4K + some bytes.
>>      
> I do not know CFI, sorry, but you probably should do this on a higher
> level than CFI, something between JFFS2 and MTD.
>
>    
