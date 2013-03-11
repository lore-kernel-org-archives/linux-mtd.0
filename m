Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UExyZ-0005TK-Iv
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 08:20:56 +0000
Message-ID: <1362990111.5101.51.camel@sauron.fi.intel.com>
Subject: Re: UBIFS corruption bug
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maurizio Lombardi <m.lombardi85@gmail.com>
Date: Mon, 11 Mar 2013 10:21:51 +0200
In-Reply-To: <20130301074330.GA4075@gmail.com>
References: <20130301074330.GA4075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-03-01 at 08:43 +0100, Maurizio Lombardi wrote:
>     Hi all,
> 
> 
>     I need some help with a problem with the UBIFS on a custom MPC5125-based board.
> 
>     First of all, we are running Linux 3.5.7 with a modified mpc5125_nfc driver;
>     I ran the mtd tests and all of them were successful with the exception of the
>     mtd_oobtest that failed.
> 
>     [...]
>     mtd_oobtest: error: verify failed at 0x3da000
>     mtd_oobtest: error: verify failed at 0x3db000
>     mtd_oobtest: error: verify failed at 0x3dc000
>     [...]
> 
>     By the way, I've read that the flash device probably does not support
>     writing oob-only and that I shouldn't worry about this test.
> 
>     That said, Linux successfully boots from the ubifs-formatted NAND device and
>     apparently it works flawlessly.
>     The problem is that sometimes the filesystem gets corrupted and at mount the recovery
>     process fails to fix it. This is the error I get at boot time:
> 
>     UBIFS: recovery needed
>     UBIFS error (pid 1): ubifs_recover_leb: corruptio 0
>     UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 404:376832
>     UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 bytes from LEB 404:376832
>     UBIFS error (pid 1): ubifs_recover_leb: LEB 404 scanning failed
>     VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0): error -117
>     Please append a correct "root=" boot option; here are the available partitions:
>     1f00            2048 mtdblock0  (driver?)
>     1f01         4161536 mtdblock1  (driver?)
>     Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

Here you should see some useful advises:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

Namely, for your case, use ignore_loglevel boot option. Then you should
see useful error dump.

>     I tried to debug the ubifs to find what is going wrong, I noticed that
>     the ubifs_recover_leb() function calls ubifs_scan_a_node(),
>     the latter returns SCANNED_A CORRUPT_NODE and subsequently the no_more_nodes() function
>     is called.

OK.

>     no_more_nodes() skips the corrupt node and does a check to verify that after
>     the corrupt node there is only empty space by calling is_empty(buf + skip, len - skip);
>     is_empty() returns false and the recover procedure fails.

I think it checks that _after_ the corrupt node there is only empty
space. Because the way UBIFS works - it writes nodes sequintially from
the beginning of the eraseblock to the end. And the only acceptable type
of a corruption is when it is caused by a power cut, in which case the
corrupted node will be following by empty space.

The most often reason of these failures is when the driver does not
protect the empty space with ECC, and does not correct bit-flips there.
Let's look at your flash dump - most probably you have all FFs there
except few bits.

I agree that this is a common problem and it would be great to do
something about it in UBIFS, I guess. But currently we suggest people to
teach their driver protect the empty space and correct bit-lips there.
Some drivers, AFAIK, just somehow detect on read that the NAND page is
empty, and return all 0xFFs.

-- 
Best Regards,
Artem Bityutskiy
