Received: from e23smtp02.au.ibm.com ([202.81.31.144])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQYgp-0004D3-Dj
 for linux-mtd@lists.infradead.org; Tue, 23 Oct 2012 07:14:17 +0000
Received: from /spool/local
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <hejianet@linux.vnet.ibm.com>;
 Tue, 23 Oct 2012 17:11:23 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 q9N747rH49152182
 for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2012 18:04:07 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 q9N7E3Hg019025
 for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2012 18:14:03 +1100
Message-ID: <508643A5.1020901@linux.vnet.ibm.com>
Date: Tue, 23 Oct 2012 15:13:41 +0800
From: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: jffs2 copy too long after mounting
References: <5019EE49.7000208@linux.vnet.ibm.com>
 <1345794797.2848.264.camel@sauron.fi.intel.com>
In-Reply-To: <1345794797.2848.264.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, thanks for your reply
Now I can reproduce it after 2-3 days stress tests:
1.just do lots of small writing(4k bytes each time) radomly in one of 1000
 thousand file
2.remove the 1000 files,now the jffs2 fs is *very* dirty.
3.I dynamically increase the threshold nr_free_blocks to trigger the gc
in jffs2_thread_should_wake():
     if (c->nr_free_blocks + c->nr_erasing_blocks < c->resv_blocks_gctrigger &&
            (dirty > c->nospc_dirty_size))
        ret = 1;
4. I watched after a while, there were tens of  thousands of lines (I enable the
jffs2 log level to be 1)
Check potential deletion dirent at 008ddd24
Check potential deletion dirent at 008ddcf4
Check potential deletion dirent at 008ddcc4
Check potential deletion dirent at 008ddc68
Check potential deletion dirent at 008dca34
Check potential deletion dirent at 008dca04
Check potential deletion dirent at 0088d77c
Check potential deletion dirent at 0088d74c
Check potential deletion dirent at 0088d71c
Check potential deletion dirent at 0088d6ec
Check potential deletion dirent at 0088d6bc
Check potential deletion dirent at 0088c648
Check potential deletion dirent at 0088c618
Check potential deletion dirent at 0088c2a8
Check potential deletion dirent at 0088c278
Check potential deletion dirent at 0088c248
Check potential deletion dirent at 0088c218
Check potential deletion dirent at 0088c1e8
Check potential deletion dirent at 00886b50
Check potential deletion dirent at 00885388
Check potential deletion dirent at 00885358
Check potential deletion dirent at 008852a8
Check potential deletion dirent at 00885278
5. I did find that the free blocks number of jffs2 is very slowly increased

So could you give me any ideas, it is normal or abnormal?
Thanks a lot
On 2012-08-24 15:53, Artem Bityutskiy wrote:
> On Thu, 2012-08-02 at 11:04 +0800, hejianet wrote:
>> hi All
>> my kernel is 2.6.16
>> after mounting the nand flash with jffs2 partition, the first copy operation
>> for a 15M file(from jffs2 partition to jffs2 partition) take 9
>> minutes,but the
>> second copy operation takes 1 minutes.
>> the disk usage(df result) is over 85%.
>> I wonder is there any patch ported to such old kernel?
> His is because how JFFS2 is designed. When the mount operation is
> finished, JFFS2 does not really finish mounting. There is the background
> process which keeps working - it basically reads all files in the system
> and checks the CRC, which is needed to find out which nodes are new and
> which are obsolete.
>
> So what happens is that you mount JFFS2, the background thread keeps
> working (see 'top' for example).
>
> While the background thread works, you can read files. But you cannot
> write - writes will be blocked. Well, it is a bit more complex - you can
> write a little, but from some point your writes will be blocked until
> the background thread finishes. Then the write will continue and finish.
>
> In you case, you mount, start writing your 15MiB file, write gets
> blocked, waits for the background thread, then continues write. The
> background thread takes ages to finish on big partitions.
>
> The second write is fast because you do not wait for the background
> thread any longer.
>
