Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JqS4t-000176-LG
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 12:03:28 +0000
Message-ID: <4815BBDD.4090004@nokia.com>
Date: Mon, 28 Apr 2008 14:58:21 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Nancy <nancydreaming@gmail.com>
Subject: Re: UBI: badblock management confusion!
References: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>	
	<4811B6BF.9020200@nokia.com>	
	<bae050c10804250508g68df553qcce03bb6551aa5c5@mail.gmail.com>	
	<48158370.9090001@nokia.com>
	<bae050c10804280450g591c74bfn711f668863b693f1@mail.gmail.com>
In-Reply-To: <bae050c10804280450g591c74bfn711f668863b693f1@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Nancy wrote:
>>> Oh, thank you for ponting out my mistake!
>>> You mean UBI admit the amount of current badblocks are part of
>>> reserved PEBs, right?
>>>
>> Not exactly.  It is just that UBI does not mind if there are not enough
>> PEBs to meet the number desired for bad-block handling.
>>
>>> If the answer is yes, then the volume size I'm goting to create should
>>> be equal to
>>>
>>> (total number of PEB this ubi device has - total number of reserved
>>> PEBs) * LEB size
>>>
>>> not what UBI think:
>>> (number of good PEBs - total number of reserved PEBs) * LEB size
>>>
>>> Am I right?
>>>
>> I am not sure what you are trying to achieve.  You can always use
>> the -m option of ubimkvol to set volume size to maximum available size.
>>
> Let me clarify the problem I met:
> 	there are so many Nand flash for burning. Each one of them may have
> different numbers of badblocks, but that number do not exceed the reserved
> badblock number. Each one of them should have the same maximum avaliable
> volume size. But the practice tell no, the maximum avaliable volume size
> effect by number of badblocks the current MTD partition has. That's wrong.
> You can try by yourself.
> 

The following section from UBI documentation may help you:

	http://linux-mtd.infradead.org/doc/ubi.html#L_autoresize

Let us know if it doesn't meet your needs.
