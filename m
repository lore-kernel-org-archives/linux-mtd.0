Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GjZ5D-00079J-Hp
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 05:30:45 -0500
Message-ID: <4558493E.6050905@ru.mvista.com>
Date: Mon, 13 Nov 2006 13:30:22 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: number mtd partitions on 16 limits?
References: <E1GjYhU-00007r-PL@www8.emo.freenet-rz.de>
	<1163412755.3925.34.camel@sauron>
In-Reply-To: <1163412755.3925.34.camel@sauron>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: hermes33@freenet.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Hi,
>
> On Mon, 2006-11-13 at 11:06 +0100, hermes33@freenet.de wrote:
>   
>> I need more than 16 mtd partitions on a omap1610 (arm) with kernel 2.4.20. 
>> I create 16 partitions. All ok, 'cat /proc/mtd' show mtd0 to mtd15. 
>> I create 17 partitions. 'cat /proc/mtd' show only mtd0 to mtd15. 
>> It seems to give a limit with 16 partitions. 
>> Where can I change that? can someone help me?
>>     
>
> This is because of
> #define MAX_MTD_DEVICES 16
> at include/linux/mtd/mtd.h. Increase this macro. I guess it is harmless
> to make it 32, feel free to send a patch.
>
>   
I would however like to add that if you have more than 16 partitions in 
your system, you're likely to have problems with your design and not 
with MTD.

Vitaly
