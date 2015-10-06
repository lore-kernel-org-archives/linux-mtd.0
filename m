Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjNJo-0005Su-26
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 08:09:53 +0000
Subject: Re: [PATCH] ubifs: Add new mount option to force fdatasync before
 rename
To: Nikhilesh Reddy <reddyn@codeaurora.org>
References: <560984B4.7090105@codeaurora.org> <560EF960.50808@nod.at>
 <5612BBD2.9010708@codeaurora.org>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <561381B2.2090705@nod.at>
Date: Tue, 6 Oct 2015 10:09:22 +0200
MIME-Version: 1.0
In-Reply-To: <5612BBD2.9010708@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.10.2015 um 20:05 schrieb Nikhilesh Reddy:
> On 10/02/2015 02:38 PM, Richard Weinberger wrote:
>> Hi!
>>
>> Am 28.09.2015 um 20:19 schrieb Nikhilesh Reddy:
>>> The rename operation in UBIFS is synchronous (or nearly synchronous)
>>> while the write operation is not. This can result in zero length files when
>>> renaming of files followed by an abrupt power down or a crash.
>>>
>>> For example:
>>> 1) Say a file a.txt exists with size 1KB.
>>> 2) Create a file b.tmp (open)
>>> 3) Update the data in b.tmp with new values (write and close)
>>> 4) rename b.tmp to a.txt
>>> 5) Abrupt power down or crash
>>>
>>> This above scenario can result in a.txt becoming a file of zero length and
>>> giving the impression of a.txt being truncated.
>>> This scenario can ofcourse be prevented by calling fsync or fdatasync
>>> before the rename operation.
>>
>> I gave this a try and hacked up something to emulate a powercut *exactly* after
>> rename() in UBIFS.
>>
>> fd = open("b.tmp", ...)
>> write(fd, "foo", ...)
>> close(fd)
>> rename("b.tmp", "a.txt")
>> ^---- powercut
>>
>> After remounting UBIFS both a.txt and b.tmp are present
>> but b.tmp is truncated. Not a.txt as you said.
>>
>> Can you please double check?
>> I want to make sure that we're talking about the same things.
> 
> Since you mentioned a.txt and b.tmp are both present... i assume the file a.txt was present even before b.tmp was created?

Yes.

> I will try and explain as to what i understand the situation to be.
> 
> If both the files are present then the rename didnt actually get written to the device and was probably still in the internal ubifs write buffer.

A rename operation does not trigger a commit, therefore a powercut directly after rename() would make the rename() void.
In this context "both files present" means a.txt and b.tmp exist and are both synched to disk?

> I believe there is a small delay between the rename call and the inodes
> being updated on the the device from the internal ubifs write buffer.
> 
> The scenario i described above seems to occur when the inode update is committed to the device... i.e here the b.tmp should not exist since the rename was successfully written but
> the file data writeback (that is in the page cache) has not yet been committed to the device.
> Since the writeback buffer is way smaller than the page cache the inode update occurs first or is likely to have.
> 
> 
> Hopefully i did not mess up on my understanding or explanation.

Can you please share a reproducer?
A simple sequence of syscall would also do it.

Thanks,
//richard
