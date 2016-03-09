Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adlDl-00016w-PR
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 21:00:42 +0000
Subject: Re: Is ubiattach alone somehow damaging a partition?
To: john smith <wempwer@gmail.com>
References: <CAKmQUfY0tU1H_e0kYk5r4gREL55R8uHtgXrbEMuS4pSJ6cf94g@mail.gmail.com>
 <CAFLxGvzL7ujU6+OHnYGbk3pWOxSjw_Voo2=7iOYfvb+cbGvTEQ@mail.gmail.com>
 <CAKmQUfZT+S5--mQntpUrZWR4gk4YcoXChN5254hixYtrT5JFYw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56E08EDE.80909@nod.at>
Date: Wed, 9 Mar 2016 22:00:14 +0100
MIME-Version: 1.0
In-Reply-To: <CAKmQUfZT+S5--mQntpUrZWR4gk4YcoXChN5254hixYtrT5JFYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.03.2016 um 21:52 schrieb john smith:
> On 3/9/16, Richard Weinberger <richard.weinberger@gmail.com> wrote:
>> Are both mtd1 and mtd2 supposed to carry UBI?
>> I'm not rally sure what you are trying to do...
> 
> Hmm... probably not as kernel booting command does not contain
> anything similar to this:
> 
> root=ubi:rootfs rootfstype=ubifs ubi.mtd=flash1.rootfs0
> 
> However, I just thought that I can use ubiattach to be able to mount
> any given mtd device.  I was looking for a way to get access to a
> currently not used mtd device.  If ubiattach is suitable for this,
> then what may be?
> 
>> If you ask UBI to attach to an mtd it will write to it.
> 
> Where exactly?  In do_attach() there is only open(), ioctl() and
> close() called.  Where will writing take place?

We need to clarify some bits first.
UBI is kind of a volume manager on top of MTD. It offers also wear leveling
and other NAND related stuff.
Think of an LVM for flash.
Attaching and MTD to UBI means instantiating UBI and making the data
stored by UBI available.
UBI volumes can be used by high level users. The most prominent user is UBIFS.
A filesystem on top of UBI.

If you attach an MTD, UBI owns it and is obligated to write the metadata and/or
erase blocks.
For the gory details see drivers/mtd/ubi/attach.c.

So, what exactly is the expected result and what happens?
I'm still not sure what you are trying to do.

Thanks,
//richard
