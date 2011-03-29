Received: from [2001:470:b:3e:219:66ff:fee3:2c84] (helo=silka.with-linux.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4gxb-0000pD-Gy
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 22:00:24 +0000
Received: from [IPv6:2001:470:b:3e:d69a:20ff:fe56:76db] (comer.internal
	[IPv6:2001:470:b:3e:d69a:20ff:fe56:76db])
	by silka.with-linux.com (8.14.4/8.14.4) with ESMTP id p2TM0FCS007710
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2011 16:00:20 -0600
Message-ID: <4D92566F.7040209@silka.with-linux.com>
Date: Tue, 29 Mar 2011 16:00:15 -0600
From: Kelly Anderson <kelly@silka.with-linux.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: How to write to nand with an image containing oob data, including
	ECC?
References: <Pine.LNX.4.64.1103291723240.25520@lnxricardw.se.axis.com>
	<1301413371.21445.15.camel@localhost>
In-Reply-To: <1301413371.21445.15.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/11 09:42, Artem Bityutskiy wrote:
> On Tue, 2011-03-29 at 17:30 +0200, Ricard Wanderlof wrote:
>> Hi,
>>
>> In order to test an ECC algorithm (BCH in this case, as I recently posted
>> about), i want to write an image to a nand flash which contains bit
>> errors.
>>
>> What I want to do, and I seem to remember doing this in the past, is to
>> dump the whole image, change a single bit, and write it back, including
>> the oob.
>>
>> So what I'm doing is
>>
>> $ nandwrite -o -n /dev/mtd3 /tmp/mtd3-badimage
>>
>> where /tmp/mtd3-badimage contains an image including all oobs for all
>> pages.
>>
>> However, this fails saying
>>
>> Writing data to block 0 at offset 0x0
>> libmtd: error!: cannot write 2048 bytes to mtd3 (eraseblock 0, offset 0)
>>           error 22 (Invalid argument)
>> nandwrite: error!: /dev/mtd3: MTD write failure
>>              error 22 (Invalid argument)
>> Data was only partially written due to error
>> : Invalid argument
>>
>> Using just -o doesn't work because it seems nandwrite writes the oob, but
>> then since it doesn't write the main page in raw mode, the ecc gets
>> overwritten. Strangely enough, the ECC doesn't seem to match the data
>> written, as I get uncorrectable errors when reading back (not just with
>> BCH, but also with the standard mtd built-in algorithm). Perhaps the oob
>> gets written twice, once with my data and once more with the calculated
>> ecc?
>>
>> Is this a known bug, or are the some other options I should be using?
> Check this bug-report, probably it is about the same. Not sure, I did
> not have time to look at this:
>
> http://lists.infradead.org/pipermail/linux-mtd/2011-March/034505.html
>
> would be great if someone just sent a fix :-)
>
OK, I'll be nice.

When I sent the original bug report I was dog tired.  Now with a good 
nights sleep I've got the energy to write a fix.

Not sure if this is technically correct, or if it handles corner cases 
adequately.  In any case, it does work.  As far as 16 goes, I selected 
it based on the code that calls do_oob_op and it looked to be the 
largest clmpos that was valid.

--- ./lib/libmtd.c.orig    2011-03-29 15:24:13.000000000 -0600
+++ ./lib/libmtd.c    2011-03-29 15:42:47.000000000 -0600
@@ -1085,6 +1085,7 @@ int do_oob_op(libmtd_t desc, const struc
      unsigned long long max_offs;
      const char *cmd64_str, *cmd_str;
      struct libmtd *lib = (struct libmtd *)desc;
+    uint64_t clmpos = (start % mtd->min_io_size);

      if (cmd64 ==  MEMREADOOB64) {
          cmd64_str = "MEMREADOOB64";
@@ -1102,10 +1103,10 @@ int do_oob_op(libmtd_t desc, const struc
          errno = EINVAL;
          return -1;
      }
-    if (start % mtd->min_io_size) {
-        errmsg("unaligned address %llu, mtd%d page size is %d",
+    if ( clmpos > 16 ) {
+        errmsg("address %llu, mtd%d page size is %d, clmpos=%llu",
                 (unsigned long long)start, mtd->mtd_num,
-               mtd->min_io_size);
+               mtd->min_io_size, clmpos);
          errno = EINVAL;
          return -1;
      }
