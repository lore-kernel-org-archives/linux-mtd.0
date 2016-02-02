Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQk1y-0001lu-86
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 23:06:43 +0000
Subject: Re: [PATCH v2 00/17] Add a bakvol module in UBI layer for MLC paired
 page power loss issue
To: Bean Huo <jackyard88@gmail.com>, dedekind1@gmail.com,
 adrian.hunter@intel.com, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com, peterpandong@micron.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <56B13662.9020105@nod.at>
Date: Wed, 3 Feb 2016 00:06:10 +0100
MIME-Version: 1.0
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am 02.02.2016 um 03:30 schrieb Bean Huo:
> This version patches based on Linux kernel 4.2-rc7.
>  
>  v2:
>    1.Add CRC32 protection for user OOB area data.
>    2.Move recovery action from attach step to ubifs mount step.
>    3.Add more comments for some key function.
>    4.standard multi-plane program function.
>    5.Standard send-mail patches

It is sad to see that you've ignored almost all review comments that have been made.
Both comments made by Boris and me on the public mailing list as well as the comments
and I made on our phone call.

To summarize, I see the following major issues with this patch series:
1. It makes use of OOB, it was very clearly stated that this violates one of UBI's design principles.

2. It is not generic, you use hard coded constants for Micron 70s/80s MLC NANDs.
   And AFAICT it is not guaranteed that all MLC NANDs support multi pane writes.

3. Not all data is protected. Most of UBI's meta data (EC&VID headers, volume table)
   are explicitly not protected, as well as UBIFS's superblock and master nodes.

4. It mixes UBI and UBIFS code. Having code like this in UBI's EBA code is not acceptable:
   ubi_io_write_data(ubi, buf, pnum, offset, len, ((lnum < 3) ? 0 : 1));
   This hack is here to void safe writes of UBIFS's suberblock and master nodes.
   But UBIFS specific code has no business in UBI core code. Also See 3.

5. It does not scale. Having a backup of every important page would require much more space.
   Especially UBI EC and VID headers. I bet this is also the reason why the current implementation
   does not protect them. Otherwise the bakvol would fill up immediately.
   Another scalability problem is that the whole bakvol has to be scanned which will slow down
   the attach/mount process and may void the speedup gained by Fastmap.

6. It focuses only on UBIFS. ubi_corrupted_data_recovery() is only called from UBIFS code.
   If UBI is changed, we need a solution for all users on top of UBI.
   Now I understand also why you want the "fs:ubifs:recovery:fixup UBIFS cannot recover master node issue"
   patch. As UBIFS master nodes are not protected by bakvol they will corrupt and UBIFS is not able to recover
   nor can run ubi_corrupted_data_recovery().

7. A full bakvol is not proper handled. The implementation falls back to "unsafe" writes.
                dbg_gen("Allocate new PEB for Bakvol.\n");
                pbk = allo_new_block_for_bakvol(ubi, oppe_plane);
                if (!pbk) {
                        ubi_err(ubi, "Allocate new PEB failed.\n");
                        nobak = 1;
                        goto Only_source;
                }
   You cannot expect users to query the kernel log for such error messages.


Beside of these issues there are a lot of small implementation issues.
For example Fastmap is broken as UBI_FM_SB_VOLUME_ID clashes with UBI_BACKUP_VOLUME_ID.
Or struct list_head is part of on-Flash data structures.

That said, it don't think the bakvol approach is the solution we're looking for.
A proper solution has to fulfill the following conditions:
1. No dependency on OOB data.
2. Can work with any MLC NANDs and controllers. Boris and I have access to Hynix, Micron and Toshiba NAND so far.
3. If implemented on UBI level, it has to work for any user on top of UBI.
4. Has to be able to protect all data.
5. Must not regress current UBI or UBIFS.

Boris and I are working on such a solution and would like to invite you to join us.
The topic is complicated and not easy to solve. But with joined forces we will be able
to find a good solution. :-)

Thanks,
//richard
