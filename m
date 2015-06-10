Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2ec0-0007vD-0d
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 11:56:04 +0000
Message-ID: <557825BA.6030104@codeaurora.org>
Date: Wed, 10 Jun 2015 14:55:38 +0300
From: "Brokhman, Tanya" <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Smitha Rathnam <rathnam.smitha@gmail.com>
Subject: Re: Trouble with UBIFS
References: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
 <CAFLxGvzA8N4PUK_7-jM9FcnrqLnyOsNcomfLOSMMGKc5Ed5D9Q@mail.gmail.com>
In-Reply-To: <CAFLxGvzA8N4PUK_7-jM9FcnrqLnyOsNcomfLOSMMGKc5Ed5D9Q@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard

On 6/10/2015 2:25 PM, Richard Weinberger wrote:
> Hi!
>
> On Wed, Jun 10, 2015 at 12:08 PM, Smitha Rathnam
> <rathnam.smitha@gmail.com> wrote:
>>   Hi,
>>
>>   We have an embedded linux (2.6) system. Since the past few months, we
>> have been seeing a corruption of the log filesystem.
>>   The filesystem is using mtd5 device.
>>   The error looks like this;
>>   user.notice kernel: klogd started: BusyBox v1.20.0 (2012-09-18 17:42:52 MST)
>>
>>   Jan  1 00:00:05 user.debug kernel: 00001fa0: 00000000 00000000
>> 00000000 00000000 00000000 00000000 00000000 00000000
>> ................................
>>   Jan  1 00:00:05 user.debug kernel: 00001fc0: 00000000 00000000
>> 00000000 00000000 00000000 00000000 00000000 00000000
>> ................................
>>   Jan  1 00:00:05 user.debug kernel: 00001fe0: 00000000 00000000
>> 00000000 00000000 00000000 00000000 00000000 00000000
>> ................................
>>   *Jan  1 00:00:05 user.err kernel: UBIFS error (pid 1110):
>> ubifs_recover_leb: LEB 24 scanning failed*
>>
>>   Is there a way to retrieve data from the partition? How do we fix this error?
> To fix the problem one has to analyze it first.
> The kernel output you've posted is incomplete and most likely unrelated.
> Do you have a complete kernel log?
>
> Retrieving data from the filesystem is not easy, it depends how much UBIFS
> is corrupted.
> What I do in such cases is dumping all nodes and running them thought a
> semi-automated script which can deal with UBIFS.
Could you please share the script? I'm facing same issues at the moment 
(debugging ubifs corruption). I have a binary dump of the partition. 
Looking for the most user-friendly tool to look at it.

Thanks
-Tanya
