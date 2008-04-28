Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JqU6Y-0006d0-SI
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 14:13:20 +0000
Message-ID: <4815DA46.60403@nokia.com>
Date: Mon, 28 Apr 2008 17:08:06 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Nancy <nancydreaming@gmail.com>
Subject: Re: UBI: badblock management confusion!
References: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>	
	<4811B6BF.9020200@nokia.com>	
	<bae050c10804250508g68df553qcce03bb6551aa5c5@mail.gmail.com>	
	<48158370.9090001@nokia.com>	
	<bae050c10804280450g591c74bfn711f668863b693f1@mail.gmail.com>	
	<4815BBDD.4090004@nokia.com>
	<bae050c10804280524o6555551cm90088d816674965b@mail.gmail.com>
In-Reply-To: <bae050c10804280524o6555551cm90088d816674965b@mail.gmail.com>
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

Nancy wrote:
>>> Let me clarify the problem I met:
>>>        there are so many Nand flash for burning. Each one of them may have
>>> different numbers of badblocks, but that number do not exceed the reserved
>>> badblock number. Each one of them should have the same maximum avaliable
>>> volume size. But the practice tell no, the maximum avaliable volume size
>>> effect by number of badblocks the current MTD partition has. That's wrong.
>>> You can try by yourself.
>>>
>>>
>> The following section from UBI documentation may help you:
>>
>>
>> http://linux-mtd.infradead.org/doc/ubi.html#L_autoresize
>>
>> Let us know if it doesn't meet your needs.
> 
> Sorry, my bad english, I can't get what autoresize for.
> I just want to set every Nand same! Just like I defined my MTD
> partitions. Each product has same partitions table.
> same reserved badblock number.
> same user space useable blocks.
> Is that requirement abnormal?

Well, the number of initial bad blocks does not affect how many will become
bad over time.  So it is not part of the calculation.  For example, if you
have 2048 PEBs and 17 are bad initially and you want to reserve 1% for (more)
bad blocks then the number reserved is (2048 - 17) / 100 = 20.  That makes the
default maximum volume size 2048 - 17 - 20 = 2011.  Whereas, if you are lucky
and there are no initial bad blocks, then the number reserved for bad block
handling is 2048 / 100 = 20, and the default maximum volume size is
2048 - 20 = 2028.

Just because 17 are initially bad in the first case does not mean only 3 more
will become bad in the time it takes for 20 to become bad in the second case.

So 20 are reserved for bad block handling in both cases.

And that means that the maximum volume size varies.

What we do here is we don't have the same partition table.  We fix the size of
every partition except the last and let the start of each partition be adjusted
if there are bad blocks.  For the last partition, it ends up being smaller by the
total number of bad blocks.  We then use the "autoresize" of UBI to automatically
fit the volume size of the last volume to the partition size.  Since our last
volume is UBIFS, there is no problem because UBIFS also automatically adjusts
(so long as the volume size is larger that the flashed image created by
mkfs.ubifs).

If you want to have the same volume size, then you can but you must make the
size smaller than the maximum.  You will need to consult your documentation
about what the maximum number of initial bad blocks is.  For example, for
OneNAND with 2048 PEBs, when a OneNAND comes from the factory it may have
as many as 40 PEBs that are bad.  So 2048 - 40 = 2008 good PEBs minimum.
2008 / 100 = 20 PEBs reserved for (more) bad blocks (assuming you use the 1%
setting).  2008 - 20 = 1988 PEBs for the volume size.  The exact volume size is
then 1988 * LEB size = 1988 * 258048 (in your case) = 512999424.
