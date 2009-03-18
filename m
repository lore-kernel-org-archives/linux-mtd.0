Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ljv9O-0003VQ-Ub
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 12:45:46 +0000
Message-ID: <49C0ED16.1030601@nokia.com>
Date: Wed, 18 Mar 2009 14:46:14 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH] [MTD] mtd-utils: Use new 64-bit ioctls to access >4GiB
	devices
References: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
	<Pine.LNX.4.64.0903180848080.20271@lnxricardw.se.axis.com>
	<20090318120652.GB2381@yoda.jdub.homelinux.org>
	<49C0E604.9040501@nokia.com>
	<20090318122658.GC2381@yoda.jdub.homelinux.org>
In-Reply-To: <20090318122658.GC2381@yoda.jdub.homelinux.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Wed, Mar 18, 2009 at 02:16:04PM +0200, Adrian Hunter wrote:
>> Josh Boyer wrote:
>>> On Wed, Mar 18, 2009 at 08:50:08AM +0100, Ricard Wanderlof wrote:
>>>> On Wed, 18 Mar 2009, Kevin Cernekee wrote:
>>>>
>>>>> This patch depends on "CORE: New ioctl calls for >4GiB device support".
>>>>>
>>>>> Use the new kernel ioctls to support >4GiB flash devices in mtd-utils.
>>>>> -               if(ioctl(Fd,MEMGETREGIONINFO,&(reginfo[i])) != 0)
>>>>> +               if(ioctl(Fd,MEMGETREGIONINFO64,&(reginfo[i])) != 0)
>>>> Wouldn't it be an idea to support both the old and new calls for a 
>>>> while  (using compile time switching), in case someone wants to grab 
>>>> a newer  version of mtdtools but doesn't have a newer kernel for 
>>>> whatever reason?
>>> Yes, it would.  In fact, it would be better to probably add a new
>>> --large-device (or similar) option to all the utilities so that
>>> they can use both with a runtime switch.
>> I would suggest just trying MEMGETINFO64 and if it returns ENOTTY
>> then switch to the old ioctls.
> 
> Well, that's an option.  However, it would have to do that for every
> ioctl that is called and it's not exactly cheap to do a system call.

I was thinking just do it once per invocation and set a flag for the
rest of the code.

> Performance might be sort of silly to worry about though.  It would
> certainly be better than the patch as it is.
