Received: from [2002:c053:f936::1] (helo=terminus.zytor.com)
	by pentafluge.infradead.org with esmtps (Exim 4.60 #1 (Red Hat Linux))
	id 1FQbvz-0000G2-5z
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 04:10:27 +0100
Message-ID: <4431E304.6020908@zytor.com>
Date: Mon, 03 Apr 2006 20:07:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
To: "Eric W. Biederman" <ebiederman@lnxi.com>
References: <20060329232520.1677d2b3.akpm@osdl.org>	<442C0494.2040609@zytor.com>
	<20060330114014.53150d1b.akpm@osdl.org>	<442C6B78.3060706@zytor.com>
	<m3hd5anj51.fsf@maxwell.lnxi.com>
In-Reply-To: <m3hd5anj51.fsf@maxwell.lnxi.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric W. Biederman wrote:
> "H. Peter Anvin" <hpa@zytor.com> writes:
> 
>> There seems to be a few options, in order from least work to more work:
>>
>> - Removing the blkmtd driver and tell people to use block2mtd;
>> - Have kinit intercept blkmtd configuration options and emulate them using
>> block2mtd;
>> - Adjust blkmtd to have a configuration interface, and then make kinit configure
>> it.
> 
> Block devices are not especially interesting when working with flash chips, as they
> are an emulation layer.  The character devices are much more interesting,
> and the native filesystems don't go through a block or a character device.
> So killing blkmtd sounds like a reasonable thing to do.
> 

I thought (am I wrong?) that blkmtd referred to using a block device as 
an MTD device.  Either which way, Jörn tells me that blkmtd is 
deprecated by block2mtd anyway, and only retained for boot support, 
which is pretty easy to do in klibc.

> Given that klibc will reduce the size of the kernel I expect most embedded
> users will in general be in favor of it.
> 
> So I suggest what happens is that we deprecate blkmtd in Documentation/FeatureRemoval
> of 2.6.17 and delete it in the -mm tree.
> 
> Then you can merge klibc.
> 
> Does any one have a problem with that plan?

That certainly works for me.  Jörn indicated he's going to sign off on a 
patch to remove blkmtd, which will solve my problem.

	-hpa
