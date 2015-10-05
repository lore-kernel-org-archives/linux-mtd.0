Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjA8e-0007uY-NG
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2015 18:05:29 +0000
Message-ID: <5612BBD2.9010708@codeaurora.org>
Date: Mon, 05 Oct 2015 11:05:06 -0700
From: Nikhilesh Reddy <reddyn@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: Add new mount option to force fdatasync before
 rename
References: <560984B4.7090105@codeaurora.org> <560EF960.50808@nod.at>
In-Reply-To: <560EF960.50808@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/02/2015 02:38 PM, Richard Weinberger wrote:
> Hi!
>
> Am 28.09.2015 um 20:19 schrieb Nikhilesh Reddy:
>> The rename operation in UBIFS is synchronous (or nearly synchronous)
>> while the write operation is not. This can result in zero length files when
>> renaming of files followed by an abrupt power down or a crash.
>>
>> For example:
>> 1) Say a file a.txt exists with size 1KB.
>> 2) Create a file b.tmp (open)
>> 3) Update the data in b.tmp with new values (write and close)
>> 4) rename b.tmp to a.txt
>> 5) Abrupt power down or crash
>>
>> This above scenario can result in a.txt becoming a file of zero length and
>> giving the impression of a.txt being truncated.
>> This scenario can ofcourse be prevented by calling fsync or fdatasync
>> before the rename operation.
>
> I gave this a try and hacked up something to emulate a powercut *exactly* after
> rename() in UBIFS.
>
> fd = open("b.tmp", ...)
> write(fd, "foo", ...)
> close(fd)
> rename("b.tmp", "a.txt")
> ^---- powercut
>
> After remounting UBIFS both a.txt and b.tmp are present
> but b.tmp is truncated. Not a.txt as you said.
>
> Can you please double check?
> I want to make sure that we're talking about the same things.

Since you mentioned a.txt and b.tmp are both present... i assume the 
file a.txt was present even before b.tmp was created?

I will try and explain as to what i understand the situation to be.

If both the files are present then the rename didnt actually get written 
to the device and was probably still in the internal ubifs write buffer.
I believe there is a small delay between the rename call and the inodes
being updated on the the device from the internal ubifs write buffer.

The scenario i described above seems to occur when the inode update is 
committed to the device... i.e here the b.tmp should not exist since the 
rename was successfully written but the file data writeback (that is in 
the page cache) has not yet been committed to the device.
Since the writeback buffer is way smaller than the page cache the inode 
update occurs first or is likely to have.


Hopefully i did not mess up on my understanding or explanation.
Please do correct me if i messed up.

>
> Thanks,
> //richard
>


-- 
Thanks
Nikhilesh Reddy

Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
