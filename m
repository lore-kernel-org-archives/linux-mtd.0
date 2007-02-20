Received: from inbox2.nyi.net ([64.147.100.114])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJRjn-0006zz-2A
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 04:56:46 -0500
Message-ID: <44602.172.16.0.34.1171964998.squirrel@webmail.calsoftinc.com>
In-Reply-To: <1171964069.30834.220.camel@localhost.localdomain>
References: <6b5362aa0702192237o69e7efe9wf5844bfaff91e2ff@mail.gmail.com>
	<1171964069.30834.220.camel@localhost.localdomain>
Date: Tue, 20 Feb 2007 15:19:58 +0530 (IST)
Subject: Re: Why is PEB not erased before writing???
From: brijesh.singh@calsoftinc.com
To: tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Brijesh Singh <brijesh.s.singh@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Tue, 2007-02-20 at 12:07 +0530, Brijesh Singh wrote:
>> I tried to overwrite same block.
>> Ubi should call erase before overwriting the data block.But it didn't.
>> UBI simply wrote the block again.That will write garbage for a flash.
>> So who will call erase??Is it the application's responsibility to call
>> erase before writing at same  location???
>>
>> I am stuck here because my concept was,
>> ubi will check if we are re-writing the same PEB.
>> If yes,UBI will erase the block and then write the same block.
>
> Applications and UBI kernel users have no access to physical erase
> blocks. They look at logical erase blocks. UBI manages the translation
> of logical to physical blocks. If you write to the same logical erase
> block again UBI will just write to a different physical erase block and
> erase the previous PEB later on. The internal management guarantees that
> the application looks only at the newest written block and not at the
> older one.

Yes this is what I thought it should do.If LEB is mapped to a dirty PEB
remap it and wl daemon will erase it.But it doesn't.
But here is the scenario
Steps
     *I made a 2MB ubi volume
     *Total mtd device size is 3MB
     *I wrote a 2MB file to UBI using "dd if=file of=/dev/ubi_vol"
     *Now device is full
     *Again I did the same thing.
     *Now theoretically erase should have been called,by wl or eba module
     *But it directly over-writes the device.
I am using mtdram to test if erase is called.Nop,it is not.
Cdev write interface calls eba_write which doesn't check if block is
already written.And it over-writes it with no call to erase.
Now what to do?Erase is not even called!
