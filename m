Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm7zs-0003Ns-Di
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 07:11:42 -0500
Message-ID: <45619B79.7090805@ru.mvista.com>
Date: Mon, 20 Nov 2006 15:11:37 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
References: <20061117184055.569da7ad@localhost.localdomain>
	<1163855713.5597.70.camel@sauron>
In-Reply-To: <1163855713.5597.70.camel@sauron>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kbaidarov <kbaidarov@dev.rtsoft.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Artem Bityutskiy wrote:
> Hello Konstantin,
>
> On Fri, 2006-11-17 at 18:40 +0300, kbaidarov wrote:
>   
>> Description:
>> The following patch adds readonly block device layer over mtd
>> that allows to use any filesystem on this device in RO mode and
>> thus gain faster mount times and better throughput rates.
>>     
>
> This is very ambition claim. In comparison with what?
>   
With JFFS2, for instance. I hope you won't argue than squashfs is faster 
to mount than JFFS2. :-)
Please keep in mind that this is for read-only access.
> So basically this is bad eraseblock-aware mtdblock_ro? But why you
> created a new driver and with so weird name :-) ? Why didn't you just
> changed mtdblock_ro? IOW, why you didn't adapt Pantelis' patch instead
> and re-send it? (I have no idea why this patch isn't im MTD still,
>
>   
Erm, these are several questions in one.
First, this "shim" was arranged as a new driver per dwmw2's request. It 
was our first idea to modify mtdblock_ro, but it didn't work for David.
Next, I pretty much don't understand your phrase about the "weird name", 
though I might be missing something.
And the final thing is this approach is a derivative of Pantelis's 
patch. There were several "points of evolution" within. Please note that 
unlikely to Pantelis's patch, we now don't introduce *any* new fields or 
ifdef's in the generic code, there's no modifications in the existing 
code as well. It became a separate solution 5 screens worth :) It's a 
very low price for being able to use cramfs/squashfs/fat in read-only on 
NAND flash for embedded systems.

Vitaly
