Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KujDa-0003lB-66
	for linux-mtd@lists.infradead.org; Tue, 28 Oct 2008 07:42:22 +0000
Received: by fg-out-1718.google.com with SMTP id l26so2139261fgb.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Oct 2008 00:42:21 -0700 (PDT)
Message-ID: <d459bb380810280042m1f1bdf35s279c631438ed580a@mail.gmail.com>
Date: Tue, 28 Oct 2008 08:42:20 +0100
From: "Marco Braga" <marco.braga@gmail.com>
To: "Lakshmi N. Sundararajan - PTU" <lakshmi.s@promise.com>
Subject: Re: JFFS2 losing dirs/files on NAND flash
In-Reply-To: <85ABFDC4641C4847BA6088F2982EFD8F018A2549@nonamew.ptu.promise.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <d459bb380810270112i18eb2ae9q76481dab1abad2f2@mail.gmail.com>
	<deb0f030810270804q234a82ffv57d715cfbaf736f8@mail.gmail.com>
	<d459bb380810270846h3bb5cc51h27084884e2bcaa2a@mail.gmail.com>
	<deb0f030810270946l3ea3ff12vc8d318c2184cdf7e@mail.gmail.com>
	<deb0f030810271646h704ba06fvfb38a8597c971555@mail.gmail.com>
	<85ABFDC4641C4847BA6088F2982EFD8F018A2549@nonamew.ptu.promise.com>
Cc: Suresh Rajashekara <suresh@mistralsolutions.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/10/28 Lakshmi N. Sundararajan - PTU <lakshmi.s@promise.com>:
> When you expose any electronic storage device to radiation of any kind,
> then bit flips can definetely happen.

But then, why millions of mp3 players, secure digital and multimedia
cards, usb keys, etc. survive x-ray scans at airports? Might this have
something related to the shape and material of the product enclosure?
Our produce has a tubolar, cylindrical shape containing the
electronics.

> But instead I would suggest to think more on easily reproduceable
> software defined methods. That will ensure one can see a problem
> and ultimately a fix to the problem. Otherwise, this will be treated
> as a ozone hole and none will be interested!

Yes, I understand that it is difficult to belive. The point is still
that it happened to our product and I'd be very happy to fix it. The
point is to find out if anyone with experience in JFFS2 better than
mine can help out with this.

Thanks!

>> -----Original Message-----
>> From: linux-mtd-bounces@lists.infradead.org
>> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
>> Suresh Rajashekara
>> Sent: Monday, October 27, 2008 4:47 PM
>> To: Marco Braga
>> Cc: linux-mtd@lists.infradead.org
>> Subject: Re: JFFS2 losing dirs/files on NAND flash
>>
>> Hi All,
>>
>> Can this happen if the flash is exposed to X-ray/MRI machines
>> or any electromagnetic radiation?
>>
>> Thanks in advance.
>>
>> Suresh
>>
>> On Mon, Oct 27, 2008 at 9:46 AM, Suresh R
>> <suresh@mistralsolutions.com> wrote:
>> > We could not switch to a new kernel because of our internal time
>> > lines, but we have made some minor modifications to the
>> application to
>> > reduce the flash usage. This, however, does not solve the
>> issue, but
>> > if GC is what is causing this, we want to reduce the number
>> of times
>> > GC triggers.
>> >
>> > We had even planned for partition layout with more of RO partitions
>> > and less of RW partitions so that we don't run in to this condition.
>> > This would be ideal because, no matter what kernel you use.
>> >
>> > HTH,
>> >
>> > Suresh
>> >
>> > On Mon, Oct 27, 2008 at 9:16 PM, Marco Braga
>> <marco.braga@gmail.com> wrote:
>> >> Hi,
>> >>
>> >> and did the problem disappear when using the new kernel?
>> How did you
>> >> solve the problem?
>> >> Thank you!
>> >>
>> >> Marco
>> >>
>> >>
>> >> 2008/10/27 Suresh R <suresh@mistralsolutions.com>:
>> >>> Hi,
>> >>>
>> >>> Even I have faced a similar issue with the JFFS2 on onenand on
>> >>> 2.6.16-rc3. I too was not able to reproduce the issue by shutting
>> >>> down abruptly, but it happens on our products on the field.
>> >>>
>> >>> I looks to me that it happens when switched off during a GC. I am
>> >>> not sure. I was not able to prove to myself this theory.
>> Where ever
>> >>> I reported this issue, I was told to use a new kernel.
>> >>>
>> >>> Suresh
>> >>>
>> >>> On Mon, Oct 27, 2008 at 1:42 PM, Marco Braga
>> <marco.braga@gmail.com> wrote:
>> >>>> Hello,
>> >>>>
>> >>>> I am using JFFS2 on an ARM base board with a 128Mb NAND flash,
>> >>>> kernel 2.6.22.10. Sometimes the board does not boot because a
>> >>>> directory in /etc has disappeared after a JFFS2 error or
>> a file is missing data.
>> >>>> I'm trying to understand at what level (hardware,
>> kernel, MTD, file
>> >>>> system) it happens. The error appears when trying to access the
>> >>>> directory or file:
>> >>>>
>> >>>> JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes
>> >>>> found for ino #65
>> >>>> JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has
>> >>>> children so we fake some modes for it
>> >>>> JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes
>> >>>> found for ino #97
>> >>>> JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has
>> >>>> children so we fake some modes for it ...
>> >>>>
>> >>>> I've not been able to relate it to an unclean shutdown.
>> I've tried
>> >>>> powering off the board several times without being able
>> to make the
>> >>>> problem happen. Moreover I've tried a multithreaded program that
>> >>>> opens, writes, reads and deletes several files to stress
>> the FS and
>> >>>> it never happened after an overnight run.
>> >>>>
>> >>>> Can you please help understanding the cause or the
>> meaning of those log lines?
>> >>>> Thank you!
>> >>>>
>> >>>> ______________________________________________________
>> >>>> Linux MTD discussion mailing list
>> >>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> >>>>
>> >>>
>> >>
>> >
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
