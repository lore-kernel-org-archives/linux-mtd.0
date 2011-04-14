Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAGmw-0001kH-76
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 07:16:27 +0000
Received: by ewy3 with SMTP id 3so440488ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 00:16:24 -0700 (PDT)
Subject: Re: I don't understand how the counter for erasures is being
	maintained during erase failures
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD328119F6E7D@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD328119F6E7D@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 10:13:31 +0300
Message-ID: <1302765211.2796.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2011-04-12 at 08:57 -0400, Atlant Schmidt wrote:
> Folks:
> 
> On my linux system (running MTD/UBI/UBIfs), the following
> event occurred:
> 
> 
>   [62452.439299] UBI error: ubi_io_write: error -5 while writing 516096 bytes to PEB 3982:8192, written 503808 bytes
>   [62452.465874] UBI: run torture test for PEB 3982
>   [62463.910000] UBI: PEB 3982 passed torture test, do not mark it a bad
>   [62466.666439] UBI error: ubi_io_write: error -5 while writing 516096 bytes to PEB 3982:8192, written 503808 bytes
>   [62466.693753] UBI: run torture test for PEB 3982
>   [62477.763592] UBI: PEB 3982 passed torture test, do not mark it a bad
>     :
>     :
>   [62622.746585] UBI error: ubi_io_write: error -5 while writing 516096 bytes to PEB 3982:8192, written 503808 bytes
>   [62622.801612] UBI: run torture test for PEB 3982
>   [62633.821650] UBI: PEB 3982 passed torture test, do not mark it a bad
>   [62636.629686] UBI error: ubi_io_write: error -5 while writing 516096 bytes to PEB 3982:8192, written 503808 bytes
>   [62636.661260] UBI: run torture test for PEB 3982
>   [62643.962758] UBI error: torture_peb: read problems on freshly erased PEB 3982, must be bad
>   [62643.992792] UBI error: erase_worker: failed to erase PEB 3982, error -5
>   [62644.022791] UBI: mark PEB 3982 as bad
>   [62644.045182] UBI: 37 PEBs left in the reserve

What is the flash? Is it MLC?

> At this point, I dumped out the contents of PEB 3982:
> 
>   /> ubi_dump.pl 3982
>   PEB f8e (3982):  ec magic number is not correct. Is: 5a5a5a5a   Should be: 55424923
>   PEB 3982:
>     00000000:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
>     00000020:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
>     00000040:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
>     00000060:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
>       :
>       :
> 
> 
> So that PEB no longer contains any ubi_ec_hdr struct.

May be we should change the torture test a bit and emulate real usage:
write patterns in 3 steps, not 1 go. I mean, write pattern to where EC
header should be, then to where VID header should be, and then where the
data should be. I think in your case the problem would have been spotted
quicker then. You can try to do this.

> What happens next?

It should be marked as bad.

> 
> When I reboot, this block *HASN'T* been added to the bad block
> list (nor were the other two blocks "marked as bad" during this
> linux boot session).

This is a real problem, you should dig this and fix your drivers.

>  And after the reboot, my script reports
> the following information about PEB 3982:
> 
>   /> ubi_dump.pl 3982
>   PEB f8e (3982):  Erased 16
>   Minimum erase count: 16
>   Average erase count: 16 computed across 1 blocks
>   Maximum erase count: 16

Yes, the erase counter was lost and the average was used.

> This can't be accurate -- the block was tortured 14 times
> during the failure and each torture represents three erase/
> write cycles, right? (Per torture_peb(), OxA5, 0x5A, and 0x00.)
> So even if this block had somehow been "virgin" (and it's
> certainly not!), it should now have an erase count of at
> least 3*14=42, just considering the torturing.

If the blocked passed the torture test, the EC would be correct. But it
did not, and it should have been marked bad. UBI should not use it at
all.

So wrong EC counter is not something you should worry about. This is not
a problem.

> Also, given that it failed to erase (or at least couldn't be
> successfully read when freshly erased), why doesn't the block
> permanently join the pool of bad PEBs?

That's the real problem. I do not know, this is an issue in your driver
- below the UBI level, somewhere in the MTD level. You need to dig this.

> Please consider the environment before printing this email.

Sure, I won't print it! :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
