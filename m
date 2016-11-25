Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAHpL-0007IG-5t
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 14:50:12 +0000
Subject: Re: Unable to remount ubifs after many unclean reboot
To: Marek Vasut <marek.vasut@gmail.com>,
 Olivier Singla <olivier.singla@gmail.com>, linux-mtd@lists.infradead.org
References: <CACcFhEU=U1f0HM9bZvWosM0odDqg7x5QE=dWV+7fMj+4aAho4g@mail.gmail.com>
 <4318d4ee-4ed6-a3db-5783-75cef32986b7@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <47bee93e-e89a-eac7-da55-ca63ff8903a4@nod.at>
Date: Fri, 25 Nov 2016 15:49:48 +0100
MIME-Version: 1.0
In-Reply-To: <4318d4ee-4ed6-a3db-5783-75cef32986b7@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oliver, Marek,

On 25.11.2016 15:13, Marek Vasut wrote:
> So you're using ancient unsupported kernel version and a controller/CPU
> which you do not disclose. It's hard to help.
> 
> Can you check whether this problem still happens in mainline?
> 
> Are you using MLC NAND ? I suspect you do ...

Why do you think so?

> . Using a
>> simple test program, I am able to have UBIFS to fail to mount the NAND
>> partition (I am using pretty much all the 4GB of the NAND). The test
>> is quite simple: mount the ubifs partition at boot time, then write a
>> file (justa  few KB), do a sync, wait a few seconds, and then reboot
>> (/sbin/reboot, and -important point- I have a micro-controller which
>> does a power-cycle). Intentionally, I did NOT unmount the ubifs
>> partition. Later on, I changed the test to unmount the ubifs partition
>> (but I still do not detach the ubi volume). What I am seeing is that
>> after many iterations (usually around a thousand), ubifs could not
>> mount the ubifs partition, both under u-boot and Linux.
>>
>> Under Linux, this is what I see when ubifs try to mount the partition:
>>
>> [   55.646884] UBIFS: background thread "ubifs_bgt0_0" started, PID 858
>> [   56.013037] UBIFS: recovery needed
>> [   56.258731] UBI warning: ubi_io_read: error -119 while reading
>> 294912 bytes from PEB 600:753664, read only 294912 bytes, retry
>> [   56.320616] UBI warning: ubi_io_read: error -119 while reading
>> 294912 bytes from PEB 600:753664, read only 294912 bytes, retry
>> [   56.382444] UBI warning: ubi_io_read: error -119 while reading
>> 294912 bytes from PEB 600:753664, read only 294912 bytes, retry
>> [   56.444263] UBI error: ubi_io_read: error -119 while reading 294912

-119?!
What is this errno on your platform?
I suspect it is not -ENAVAIL - "No XENIX semaphores available" ;)

>> I thought that the whole idea of ubifs was to be protected again
>> unexpected loss of power. I understand that obviously I could loose
>> some data, but at least ubifs should be able to mount the partition.

Correct. UBIFS most not die in such a situation.

Thanks,
//richard
