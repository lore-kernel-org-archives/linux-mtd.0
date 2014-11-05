Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlz1i-0002pD-VF
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 11:45:27 +0000
Received: by mail-pd0-f172.google.com with SMTP id r10so628792pdi.3
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 03:45:06 -0800 (PST)
Date: Wed, 5 Nov 2014 03:45:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: liu.song11@zte.com.cn
Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
Message-ID: <20141105114500.GM22361@norris-Latitude-E6410>
References: <OFA26F19B7.DF3A70A5-ON48257D7B.00265361-48257D7B.0033C198@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFA26F19B7.DF3A70A5-ON48257D7B.00265361-48257D7B.0033C198@zte.com.cn>
Cc: jiang.xuexin@zte.com.cn, linux-mtd@lists.infradead.org,
 cui.yunfeng@zte.com.cn, wang.bo116@zte.com.cn, dwmw2@infradead.org,
 deng.chao1@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 24, 2014 at 05:26:05PM +0800, liu.song11@zte.com.cn wrote:
> hi everyone

Hi!

> When jffs2 with summary, during the mounting period, in 
> jffs2_build_remove_unlinked_inode will
> handle unlinke inode, but this will cause unlinked directory's deletion 
> dirent erased before
> it's obsoleted dirent.So if the directory has renamed, then could cause a 
> hard link when we 
> remount jffs2.
> We can stable reproduce the hard link only by following process.
> 1. we mount jffs2 in /mnt
> 2. create directories /mnt/SW1/, /mnt/SW2/
> 3. create directory /mnt/old/
> 4. rename /mnt/SW1/ to /mnt/old/SW1/, /mnt/SW2/ to /mnt/old/SW2/
> 5. do some data write. don't touch these directories.
> 6. rename /mnt/old/SW1/ to /mnt/SW1/, /mnt/old/SW2/ to /mnt/SW2/
> 7. delete /mnt/old/
> 
> do above process 3 - 7 several times, then reboot, during the mounting 
> process, we could found
> /mnt/SW1/ and /mnt/old/SW1/ become hard link,/mnt/SW2/ and /mnt/old/SW2/ 
> become hard link. So we
> do some job to fix this bug.We have tested this patch and the hard link 
> error will never occur.
> Thanks!
> Best Regards

This only describes the problem, but it doesn't describe the fix at all.
Please provide a proper commit description.

Also, your patch is very big and line-wrapped, so it's very hard to
figure out what it's doing, and it won't apply to my git tree. Please
check your mailer settings.

All this is addressed in Documentation/SubmittingPatches, which I
suggest you read.

Regards,
Brian
