Received: from mail1.bemta8.messagelabs.com ([216.82.243.208])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ0jL-00044E-U6
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 16:24:05 +0000
Subject: Re: [PATCH v1] mtd: nandbiterrs: Have init function return 0 on
 success
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Iwo Mergler
 <iwo.mergler@netcommwireless.com>, Brian Norris
 <computersforpeace@gmail.com>, David Oberhollenzer
 <david.oberhollenzer@sigma-star.at>, Thibaud Cornic
 <thibaud_cornic@sigmadesigns.com>
References: <49b7d473-ad61-57fa-dfb0-f0b47ed32f76@sigmadesigns.com>
 <20161219132035.08da2a93@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <7888a846-93a7-b2bf-8163-c55446558153@sigmadesigns.com>
Date: Mon, 19 Dec 2016 17:23:39 +0100
MIME-Version: 1.0
In-Reply-To: <20161219132035.08da2a93@bbrezillon>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Language: 
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19/12/2016 13:20, Boris Brezillon wrote:

> On Tue, 13 Dec 2016 15:36:07 +0100
> Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:
> 
>> The init function currently returns -EIO on success. This behavior
>> was probably chosen in order to avoid a subsequent rmmod, but this
>> complicates failure detection from user-space.
>>
>> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
>> ---
>> I'm not sure failures are reported as expected. I would expect
>> the test to report a failure if the driver cannot fix less than
>> $STRENGTH bit flips, but it doesn't, AFAICT.
>> cf. incremental_errors_test which sets err to 0 in the 
>> "After %d biterrors per subpage, read reported error %d\n"
>> code path.
> 
> I'm not strongly opposed to this change, but please note that it's
> changing the module behavior, and some people might depend on this
> rather unusual 'module probe never succeeds' thing.
> 
> If all maintainers are okay with that, then I'll ack the patch, but I'd
> still prefer if you could switch to the userspace equivalent (recently
> added in mtd-utils) to do your regression tests.
> 
> One last thing: I'd really like to remove the in-kernel MTD tests at
> some point (assuming all the tests have been ported to mtd-utils, or
> kselftest), so it's probably not a good idea to design something that
> is based on it.

I don't have strong feelings about this patch, either.

I just found that the nandbiterrs module doesn't handle insertion
the same way as other test modules. As discussed on IRC, I was
asked to provide an automatic regression test which can be run
without user intervention.

With nandbiterrs in its current form, I can't really determine
whether the test has succeeded or failed.

Here's my current script:

set -ex
modprobe -a tango_nand ubifs
ls -l /dev/mtd*
sleep 1
time modprobe mtd_readtest    dev=0 && rmmod mtd_readtest
time modprobe mtd_readtest    dev=1 && rmmod mtd_readtest
time modprobe mtd_pagetest    dev=1 && rmmod mtd_pagetest
time modprobe mtd_speedtest   dev=1 && rmmod mtd_speedtest
time modprobe mtd_stresstest  dev=1 && rmmod mtd_stresstest
time modprobe mtd_nandbiterrs dev=1 || true # ignore return code
time flash_erase /dev/mtd1 0 0
ubiattach -m 1 -d 7
ubimkvol /dev/ubi7 -s 400MiB -N foo
mkdir /mnt/ubifs
mount -t ubifs /dev/ubi7_0 /mnt/ubifs
time bonnie++ -d /mnt/ubifs/ -u root -n 50
sleep 1
umount /mnt/ubifs
ubirmvol /dev/ubi7 -N foo
ubidetach -d 7
modprobe -r tango_nand ubifs

(The sleeps are to prevent kernel messages and user-space messages
from inter-mixing. This script is supposed to be run on a console.)

I did see David's announcement of mtd-utils-2.0.0-rc1, but right now
QA is using a 2014 buildroot-based system; so until buildroot includes
these tools, and we upgrade QA to a modern buildroot, they are stuck
with the kernel modules.

Regards.


>> ---
>>  drivers/mtd/tests/nandbiterrs.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
>> index f26dec896afa..41050bcae9f1 100644
>> --- a/drivers/mtd/tests/nandbiterrs.c
>> +++ b/drivers/mtd/tests/nandbiterrs.c
>> @@ -403,7 +403,6 @@ static int __init mtd_nandbiterrs_init(void)
>>  	if (err)
>>  		goto exit_error;
>>  
>> -	err = -EIO;
>>  	pr_info("finished successfully.\n");
>>  	printk(KERN_INFO "==================================================\n");
>>  
