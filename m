Received: from qw-out-1920.google.com ([74.125.92.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjuYE-000694-4I
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 12:07:20 +0000
Received: by qw-out-1920.google.com with SMTP id 5so6060qwf.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Mar 2009 05:07:12 -0700 (PDT)
Date: Wed, 18 Mar 2009 08:06:52 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH] [MTD] mtd-utils: Use new 64-bit ioctls to access >4GiB
	devices
Message-ID: <20090318120652.GB2381@yoda.jdub.homelinux.org>
References: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
	<Pine.LNX.4.64.0903180848080.20271@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0903180848080.20271@lnxricardw.se.axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 18, 2009 at 08:50:08AM +0100, Ricard Wanderlof wrote:
>
> On Wed, 18 Mar 2009, Kevin Cernekee wrote:
>
>> This patch depends on "CORE: New ioctl calls for >4GiB device support".
>>
>> Use the new kernel ioctls to support >4GiB flash devices in mtd-utils.
>
>> -               if(ioctl(Fd,MEMGETREGIONINFO,&(reginfo[i])) != 0)
>> +               if(ioctl(Fd,MEMGETREGIONINFO64,&(reginfo[i])) != 0)
>
> Wouldn't it be an idea to support both the old and new calls for a while  
> (using compile time switching), in case someone wants to grab a newer  
> version of mtdtools but doesn't have a newer kernel for whatever reason?

Yes, it would.  In fact, it would be better to probably add a new
--large-device (or similar) option to all the utilities so that
they can use both with a runtime switch.

I'm politely NAK'ing this patch as it is.

josh
