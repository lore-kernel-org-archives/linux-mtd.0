Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lk2ZM-0000Cp-D5
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 20:41:03 +0000
Received: by wf-out-1314.google.com with SMTP id 23so235597wfg.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Mar 2009 13:40:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090318120652.GB2381@yoda.jdub.homelinux.org>
References: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
	<Pine.LNX.4.64.0903180848080.20271@lnxricardw.se.axis.com>
	<20090318120652.GB2381@yoda.jdub.homelinux.org>
Date: Wed, 18 Mar 2009 13:40:54 -0700
Message-ID: <a95a62fe0903181340x25c9c828i1966fe318ec0b0e6@mail.gmail.com>
Subject: Re: [PATCH] [MTD] mtd-utils: Use new 64-bit ioctls to access >4GiB
	devices
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On Wed, Mar 18, 2009 at 5:06 AM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Wed, Mar 18, 2009 at 08:50:08AM +0100, Ricard Wanderlof wrote:
>> Wouldn't it be an idea to support both the old and new calls for a while
>> (using compile time switching), in case someone wants to grab a newer
>> version of mtdtools but doesn't have a newer kernel for whatever reason?
>
> Yes, it would.  In fact, it would be better to probably add a new
> --large-device (or similar) option to all the utilities so that
> they can use both with a runtime switch.

OK, new proposal:

In my original mtd-utils patch, I replaced each "32-bit" ioctl call
with the new "64-bit" equivalent.

Instead of replacing each "32-bit" ioctl with a "64-bit" ioctl,
replace it with a call to a wrapper function that decides which ioctl
to use.  The wrapper functions will figure out whether the kernel
supports the new ABI, and cache the answer so that it only needs to do
this once.

The wrapper functions would always return the "64-bit" structures, and
translate the old structures to the new format if they had to call the
"32-bit" ioctl.  This way, the utilities only need to deal with the
"64-bit" data structures, and do not need any backward compatibility
code of their own.

I can add this to libmtd, if that is an interface you would like to
standardize on.  Or I can just make a new "ioctl.c" file and build it
into each utility.
