Received: from yx-out-1718.google.com ([74.125.44.155])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBZY-0000iq-O0
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:55:37 +0000
Received: by yx-out-1718.google.com with SMTP id 3so11357yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:55:35 -0700 (PDT)
Message-ID: <6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:55:34 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
In-Reply-To: <200808211339.37187.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00F8.1030004@gmail.com> <48AD2AFF.5060609@de.ibm.com>
	<1219308560.2988.247.camel@pmac.infradead.org>
	<200808211339.37187.arnd@arndb.de>
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	carsteno@de.ibm.com, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 21, 2008 at 4:39 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 21 August 2008, David Woodhouse wrote:
>> On Thu, 2008-08-21 at 10:44 +0200, Carsten Otte wrote:
>> >
>> > Exporting profiling data for a file system in another file system
>> > (/proc) seems not very straigtforward to me. I think it is worth
>> > considering to export this information via the same mount point.
>>
>> I would have said sysfs, rather than 'the same mount point'.
>>
>
> Let me throw in debugfs as my preferred option. sysfs is for stable
> interfaces, while profiling generally fits into the debugging category.

Three responses, three suggestions....

1) same mount point -
I don't see how this works without an ioctl.  I can't just make up
files in my mounted filesystem.   You expect the mounted version to
match input to the mkfs.  I'd not be happy with an ioctl.  You can
just read it.

2) sysfs -
I agree with Carsten, I don't see how this fits in the sysfs hierarchy.

3) debugfs -
I don't know diddly about this.

So why not /proc?
