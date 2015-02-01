Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHq4u-0001ls-PT
 for linux-mtd@lists.infradead.org; Sun, 01 Feb 2015 08:40:25 +0000
Message-ID: <54CDE65E.2000002@codeaurora.org>
Date: Sun, 01 Feb 2015 10:39:58 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: Synchronization in UBIFS (zero length files)
References: <5492918F.2060704@codeaurora.org>	
 <1422708775.8637.333.camel@sauron.fi.intel.com>
 <1422709032.8637.337.camel@sauron.fi.intel.com>
In-Reply-To: <1422709032.8637.337.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "draviv@codeaurora.org" <draviv@codeaurora.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

On 1/31/2015 2:57 PM, Bityutskiy, Artem wrote:
> On Sat, 2015-01-31 at 14:52 +0200, Artem Bityutskiy wrote:
>> Well, the idea was to implement something like BIO for UBIFS.
>
> For UBI, of course. We even started doing this at some point, but then
> stopped. At that time I was confident we could do it.
>
> The workqueue suggestion I gave may or may not work. It feels easier to
> implement and less intrusive. But you never know before you try.
>

Thanks for the explanation!
This was a while back and the task already completed :) I found a long 
long discussion you had with the community back in 2009 when Ted Ts'o 
implemented the sync-on-rename/truncate hack for ext4. You were asking 
the developers opinion on whether same should be done for ubifs or the 
sync should remain the user responsibility. The conclusion was that it's 
user responsibility to sync before renaming so nothing was done for ubifs.
Unfortunately our customer thought differently so I had to go through 
with adding this hack to ubifs. Not the most elegant solution to the 
zero-length-files problem, but the quickest and the safest for the moment.


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
