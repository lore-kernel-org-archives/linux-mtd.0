Received: from qb-out-1314.google.com ([72.14.204.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KuVF4-0008BG-IZ
	for linux-mtd@lists.infradead.org; Mon, 27 Oct 2008 16:46:59 +0000
Received: by qb-out-1314.google.com with SMTP id q13so1691195qbq.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Oct 2008 09:46:57 -0700 (PDT)
Message-ID: <deb0f030810270946l3ea3ff12vc8d318c2184cdf7e@mail.gmail.com>
Date: Mon, 27 Oct 2008 22:16:56 +0530
From: "Suresh R" <suresh@mistralsolutions.com>
To: "Marco Braga" <marco.braga@gmail.com>
Subject: Re: JFFS2 losing dirs/files on NAND flash
In-Reply-To: <d459bb380810270846h3bb5cc51h27084884e2bcaa2a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <d459bb380810270112i18eb2ae9q76481dab1abad2f2@mail.gmail.com>
	<deb0f030810270804q234a82ffv57d715cfbaf736f8@mail.gmail.com>
	<d459bb380810270846h3bb5cc51h27084884e2bcaa2a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We could not switch to a new kernel because of our internal time
lines, but we have made some minor modifications to the application to
reduce the flash usage. This, however, does not solve the issue, but
if GC is what is causing this, we want to reduce the number of times
GC triggers.

We had even planned for partition layout with more of RO partitions
and less of RW partitions so that we don't run in to this condition.
This would be ideal because, no matter what kernel you use.

HTH,

Suresh

On Mon, Oct 27, 2008 at 9:16 PM, Marco Braga <marco.braga@gmail.com> wrote:
> Hi,
>
> and did the problem disappear when using the new kernel? How did you
> solve the problem?
> Thank you!
>
> Marco
>
>
> 2008/10/27 Suresh R <suresh@mistralsolutions.com>:
>> Hi,
>>
>> Even I have faced a similar issue with the JFFS2 on onenand on
>> 2.6.16-rc3. I too was not able to reproduce the issue by shutting down
>> abruptly, but it happens on our products on the field.
>>
>> I looks to me that it happens when switched off during a GC. I am not
>> sure. I was not able to prove to myself this theory. Where ever I
>> reported this issue, I was told to use a new kernel.
>>
>> Suresh
>>
>> On Mon, Oct 27, 2008 at 1:42 PM, Marco Braga <marco.braga@gmail.com> wrote:
>>> Hello,
>>>
>>> I am using JFFS2 on an ARM base board with a 128Mb NAND flash, kernel
>>> 2.6.22.10. Sometimes the board does not boot because a directory in
>>> /etc has disappeared after a JFFS2 error or a file is missing data.
>>> I'm trying to understand at what level (hardware, kernel, MTD, file
>>> system) it happens. The error appears when trying to access the
>>> directory or file:
>>>
>>> JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes found
>>> for ino #65
>>> JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has children
>>> so we fake some modes for it
>>> JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes found
>>> for ino #97
>>> JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has children
>>> so we fake some modes for it
>>> ...
>>>
>>> I've not been able to relate it to an unclean shutdown. I've tried
>>> powering off the board several times without being able to make the
>>> problem happen. Moreover I've tried a multithreaded program that
>>> opens, writes, reads and deletes several files to stress the FS and it
>>> never happened after an overnight run.
>>>
>>> Can you please help understanding the cause or the meaning of those log lines?
>>> Thank you!
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
>>
>
