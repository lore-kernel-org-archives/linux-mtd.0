Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LhQ6i-0002Zq-BA
	for linux-mtd@lists.infradead.org; Wed, 11 Mar 2009 15:12:39 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KGC009N1KVOCP@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 00:11:48 +0900 (KST)
Received: from amulsaha ([107.108.214.36])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KGC00IE4KVMQ0@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 12 Mar 2009 00:11:48 +0900 (KST)
Date: Wed, 11 Mar 2009 20:40:47 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: JFFS2 : non-existent inode
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <6AA6F8E0F3CE410EB4381F9EF2B0C00C@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; reply-type=original; charset=iso-8859-1;
	format=flowed
Content-transfer-encoding: 7BIT
References: <12102132.458451236145386653.JavaMail.weblogic@epml05>
	<1236606666.572.178.camel@macbook.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>> 1) 2 or more processes(say, P1 and P2) handling
>> GC(jffs2_gc_fetch_inode) enter the function jffs2_iget almost
>> together, before getting a mutex_lock.
>
> They shouldn't be very close together -- GC is protected by the
> alloc_sem mutex, and shouldn't be happening concurrently at all. But
> maybe it's one thread doing GC while another thread is actually trying
> to open the inode in question for real?
>>
>> 2) When a request for a lock is raised, one of the processes(P1) gets
>> the mutex_lock(&f->sem) and the other one waits.
>
> It uses iget_locked(). The first caller will get a _locked_ inode with
> the I_NEW bit set. It will go ahead and fill in the inode appropriately,
> then call unlock_new_inode() to clear the I_NEW bit and unlock the
> inode.
>
> Then the second caller will return from iget_locked(). The I_NEW bit
> won't be set, and it'll return immediately. So I don't think your
> scenario is possible.
>>
>> 3) P1 deletes the inode-cache(f->inocache), and releases the lock.
>
> Why would it delete the inode-cache? Doesn't that only ever happen in GC
> when the final physical node of the inode has been deleted from the
> medium?
>

Thanks for adding to my knowledge. It would be of great help.

>> 4) Now, when P2 ends up calling jffs2_do_read_inode with 'inode->ino'
>> available locally in that function (unaware of the fact that, this
>> particular inode was just destroyed).
>> 5) JFFS2-Error with the message "requestied to read an nonexistent
>> ino" is displayed.
>
> Hm, can you make that a WARN() and show the backtrace?
>

I have put a WARN(), just before the print message, "requestied to read an
nonexistent ino", and I'm trying to get a backtrace.
Since, the BUG is random, we would have to wait for few days.

The following is the LOG, that we got, around the time when we encountered 
the ERROR.

JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (16442) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979147
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
iget() failed for ino #14979147
JFFS2 error: (16442) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979659
iget() failed for ino #14979659
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe/d299/d341/d4fd/d77b/d196/d187': 
Directory not empty
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe/d299/d341/d4fd/d77b/d196': 
Directory not empty
rm: unable to stat `/tmJFFS2 error: (16442) jffs2_do_read_inode: requestied 
to read an nonexistent ino 14979147
p/p0/d3/d25/d28/d30/d50/d24b/dccJFFS2 error: (245) jffs2_do_read_inode: 
requestied to read an nonexistent ino 14979433
9/d193/d203/d2ee/d384/dafe/d299/iget() failed for ino #14979147
d341/d4fd/d77b/d257/ff3': Input/output error
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe/d299/d341/d4fd/d77b/d257': 
Directory not empty
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe/d299/d341/d4fd/d77b': 
Dire
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
ctory not empty
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe/d299/d341/d4fd': 
Directory not empty
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe/d299/d341': 
Directory not empty
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe/d299': 
Directory not empty
rm: unable to remove 
`/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384/dafe': Directory 
not empty
rm: unable to remove `/tmp/p0/d3/d25/JFFS2 error: (245) jffs2_do_read_inode: 
requestied to read an nonexistent ino 14979433
d28/d30/d50/d24b/dcc9/d193/d203/d2ee/d384': Directory not empty
rm: unable to remove `/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203/d2ee': 
Directory not empty
rm: unable to remove `/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193/d203': 
Directory not empty
rmJFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
unable to remove `/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9/d193': Directory not 
empty
rm: unable to remove `/tmp/p0/d3/d25/d28/d30/d50/d24b/dcc9': Directory not 
empty
rm: unable to remove `/tmp/p0/d3/d25/d28/d30/d50/d24b': Directory not empty
rm: unable tJFFS2 error: (245) jffs2_do_read_inode: requestied to read an 
nonexistent ino 14979433
Count : 22418, Log : 2008-10-15 07:57:42:00 : o remove 
`/tmp/p0/d3/d25/d28/d30/d50': Directory not empty
rm: unable to remove `/tmp/p0/d3/d25/d28/d30': Directory not empty
rm: unable to remove `/tmp/p0/d3/d25/d28': Directory not empty
rm: unable to remove `/tmp/p0/d3/d25': Directory not empty
rm: unable to remove `/tmp/p0/d3/d1b/d39/d1d2/d25b': Directory not empty
rm: unable to remove `/tmp/p0/d3/d1b/d39/d1d2': Directory not empty
rm: unable to remove `/tmp/p0/d3/d1b/d39': Directory not empty
rm: unable to remove `/tmp/p0/d3/d1b': Directory not empty
rm: unable to remove `/tmJFFS2 error: (245) jffs2_do_read_inode: requestied 
to read an nonexistent ino 14979433
p/p0/d3': Directory not empty
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (84) jffs2_do_read_inode: requestied to read an nonexistent ino 
14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
rm: unable to remove `/tmp/p0': DireJFFS2 error: (16442) 
jffs2_do_read_inode: requestied to read an nonexistent ino 14979019
ctory not empty
iget() failed for ino #14979019
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433
JFFS2 error: (245) jffs2_do_read_inode: requestied to read an nonexistent 
ino 14979433

Thanks and Regards,
Amul Kumar Saha 
