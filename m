Subject: Re: JFFS2 : non-existent inode
From: David Woodhouse <dwmw2@infradead.org>
To: amul.saha@samsung.com
In-Reply-To: <12102132.458451236145386653.JavaMail.weblogic@epml05>
References: <12102132.458451236145386653.JavaMail.weblogic@epml05>
Content-Type: text/plain
Date: Mon, 09 Mar 2009 13:51:06 +0000
Message-Id: <1236606666.572.178.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-03-04 at 05:43 +0000, AMUL KUMAR SAHA wrote:
> Hello David,
> 
> Environment : Flex-OneNAND 8Gb, Apollon Board, linux-2.6.26
> 
> I have just started with JFFS2  .  
> 
> We were running fsstress on 5 Boards for 5 Days .
> On 2 out of 5 boards, we observed the message "requestied to read an nonexistent ino",
> On Repetition, the BUG seems to be random.
> 
> Dwelled inside the code and thought of a possible scenario for the occurence.
> I found the following explanation to it, appropriate; to my minimal knowledge :
> 
> 1) 2 or more processes(say, P1 and P2) handling
> GC(jffs2_gc_fetch_inode) enter the function jffs2_iget almost
> together, before getting a mutex_lock.

They shouldn't be very close together -- GC is protected by the
alloc_sem mutex, and shouldn't be happening concurrently at all. But
maybe it's one thread doing GC while another thread is actually trying
to open the inode in question for real?

> 2) When a request for a lock is raised, one of the processes(P1) gets
> the mutex_lock(&f->sem) and the other one waits.

It uses iget_locked(). The first caller will get a _locked_ inode with
the I_NEW bit set. It will go ahead and fill in the inode appropriately,
then call unlock_new_inode() to clear the I_NEW bit and unlock the
inode.

Then the second caller will return from iget_locked(). The I_NEW bit
won't be set, and it'll return immediately. So I don't think your
scenario is possible.

> 3) P1 deletes the inode-cache(f->inocache), and releases the lock.

Why would it delete the inode-cache? Doesn't that only ever happen in GC
when the final physical node of the inode has been deleted from the
medium?

> 4) Now, when P2 ends up calling jffs2_do_read_inode with 'inode->ino'
> available locally in that function (unaware of the fact that, this
> particular inode was just destroyed).
> 5) JFFS2-Error with the message "requestied to read an nonexistent
> ino" is displayed.

Hm, can you make that a WARN() and show the backtrace?


> In the mean time, I have come up with my own fix to this situation.
> Just wanting to know if my explanation makes sense, so that I can go
> ahead with posting the patch in mailing-list.

You might be close, but I'm not convinced you have it exactly right.

-- 
dwmw2
