Received: from adsl-67-64-89-145.dsl.austtx.swbell.net ([67.64.89.145]
	helo=draal.badgers-hill.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1C5XfC-0006ev-NJ
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2004 18:45:12 -0400
Received: from [10.1.0.2] (ivanova.badgers-hill.net [10.1.0.2])
	by draal.badgers-hill.net (8.12.9/8.12.9) with ESMTP id i89MtB94003887
	for <linux-mtd@lists.infradead.org>;
	Thu, 9 Sep 2004 17:55:18 -0500 (CDT)
	(envelope-from kurt@badgers-hill.net)
Message-ID: <4140DCE8.10800@badgers-hill.net>
Date: Thu, 09 Sep 2004 17:44:56 -0500
From: "Kurt A. Freiberger" <kurt@badgers-hill.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <4111AEA6.2080605@fastmail.fm><003f01c47aeb$706113d0$0100a8c0@superfortress>	<4119723E.8050205@fastmail.fm>	<032f01c47fa1$ae533f50$0100a8c0@superfortress>	<411AFFAF.5030908@fastmail.fm>
	<413FCAFE.6090002@fastmail.fm>
In-Reply-To: <413FCAFE.6090002@fastmail.fm>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: 96MB/128MB DOC2000 with 2.4.X kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brendan Simon wrote:
> Brendan Simon wrote:
> 
>>
>>>> Is the 96MB DOC2000 more like the 64MB model or the 128MB model?
>>>> i.e. can I use a 96MB DOC2000 with my existing 2.4.18 kernel or will I
>>>> have the same problems as the 128MB DOC.
>>>>   
>>>
>>>
>>> INFTL [Inverse NAND Flash Translation Layer] M-Systems' latest flash
>>> management algorithm, used by the TrueFFS driver for the following 
>>> devices:
>>>
>>> - DiskOnChip Millennium Plus
>>> - Mobile DiskOnChip Plus
>>> - DiskOnChip 2000 DIP (high), 384Mbytes and higher.
>>> - DiskOnChip 2000 DIP (low), 192Mbytes and higher.
>>>
>>> If I had reviewed this table before I responded to your email, I 
>>> would have
>>> noticed that the 128M DOC ought to use NFTL.  Are you sure you have a 
>>> part
>>> that "looks like a Millennium"?  (All DOC2000 parts that use the 
>>> Millennium
>>> hardware interface also use INFTL, and vice versa.)  I'm willing to 
>>> believe
>>> the MSYS docs I have might be out of date (I'm pretty sure the
>>> low-profile/high-profile boundary has changed), but it would be good to
>>> confirm this.
>>>  
>>
>>
>> I can confirm that the 128MB DOC I received in Australia definately 
>> DOES NOT work.  i.e. it looks like it has the new ASIC embedded in 
>> it.  A friend of mine in the USA also sees the same thing on his newly 
>> received 128MB DOC.  Therefore I think the M-System docs are wrong.
>>
>> Anyone know about the 96MB DOC2000 ????
>> Is it an old style or new style DOC2000 ????
> 
> 
> 
> A colleague of mine just tested a 96MB DOC and he says that it works 
> perfectly with the 2.4 kernel.
> i.e. it is correctly detected as a DOC2000 device.
> 
> Brendan Simon.

I have trie the DOC2000 with both 2.4 and 2.6 kernels.  It seems to be 
detected correctly, but I get a message about it being "temporarily 
unavailable".  What gives?

Thanks,
Kurt

-- 
Kurt A. Freiberger     Austin, TX	kurt@badgers-hill.net
Amateur Radio Callsign WB5BBW  		AIM Handle: WB5BBW
"Some people are like Slinkys - Generally considered useless, but
  you can't help smiling when you see them falling down the stairs."
