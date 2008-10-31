Received: from yw-out-1718.google.com ([74.125.46.155])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvlWs-0004eY-Rh
	for linux-mtd@lists.infradead.org; Fri, 31 Oct 2008 04:22:35 +0000
Received: by yw-out-1718.google.com with SMTP id 5so686685ywm.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Oct 2008 21:22:33 -0700 (PDT)
Message-ID: <386072610810302122i31844850y8aac0d6033e3cc62@mail.gmail.com>
Date: Fri, 31 Oct 2008 12:22:33 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: "Kay Sievers" <kay.sievers@vrfy.org>
Subject: Re: 2.6.28-rc2: (mtd)block/partitions BUG with kobject reference count
In-Reply-To: <ac3eb2510810301451x7dbf18edgd03c1433099ce5e4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87ej1z4ep8.fsf@macbook.be.48ers.dk>
	<200810300027.19116.rjw@sisk.pl> <87abcnj810.fsf@macbook.be.48ers.dk>
	<ac3eb2510810301451x7dbf18edgd03c1433099ce5e4@mail.gmail.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 31, 2008 at 5:51 AM, Kay Sievers <kay.sievers@vrfy.org> wrote:
> On Thu, Oct 30, 2008 at 00:28, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>>> "Rafael" == Rafael J Wysocki <rjw@sisk.pl> writes:
>>
>>  Rafael> On Wednesday, 29 of October 2008, Peter Korsgaard wrote:
>>  >> Hi,
>>  >>
>>  >> I'm seing what looks like a kobject reference count issue with
>>  >> mtdblock_ro + mtd_dataflash + mtd partitions and repeated unbind/bind.
>>  >> I'm on 2.6.28-rc2, but I can reproduce the problem on 2.6.27 as well.
>>
>>  Rafael> Is it reproducible with 2.6.26 too?
>>
>> Sorry, I haven't backported my platform support code to such "old"
>> kernel. I can do it though, if you think it will help pinpoint the
>> issue.
>
> This sounds like a possible reason for the problem:
> "After digging into the mtd code, this bug is not related to our driver. It
> should be a subtle bug in mtd core code.
>
> In add_mtd_partition, for 2 partitions, 2 gendisk structures will be
> allocated. But these 2 gendisk->queue will be set to the same
> request_queue. Then when unregistering the 1st partition, from the
> same request_queue->backing_dev_info, the bdi struct will be set to
> NULL. So for the 2nd partition (bdi == NULL), the sysfs dir of 2nd
> partition will not be removed. Finally, when modprobe the module
> again, the 2nd partition won't be added"
> https://blackfin.uclinux.org/gf/tracker/4463
>

Yes, I found the similar issue on Blackfin. And kernel 2.6.26, 2.6.27
and also latest 2.6.28-rc2 have this bug.

-Bryan
