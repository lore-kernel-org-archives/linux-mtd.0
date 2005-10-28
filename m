Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVb1d-0003Mn-Dc
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 16:40:38 -0400
Received: by zproxy.gmail.com with SMTP id 34so443857nzf
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2005 13:40:29 -0700 (PDT)
Message-ID: <6934efce0510281340x609b1872r25da4a07246b0cd4@mail.gmail.com>
Date: Fri, 28 Oct 2005 13:40:28 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1130524729.3775.39.camel@windu.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/28/05, Josh Boyer <jdub@us.ibm.com> wrote:
> Hi all,
>
> I'll preface this with a disclaimer that we saw this on 2.4, however the
> same general issue still seems to be present in MTD CVS.
>
> We recently had an issue where we were getting some poor write
> performance to flash through JFFS2.  Specifically, a write of about
> 256KiB was taking between 20-50 seconds at times.  After debugging this
> for a couple days, we realized the following was happening:
>
> Kupdated woke up and started erasing blocks on JFFS2's erase_pending
> list.  The application writing continued to write in 256KiB chunks.  In
> do_write_buffer, the chip is put into FL_WRITING mode and then
> cfi_udelay(1) is called, which will call schedule_timeout if needed.
>
> Here is where the difficult part comes in.  Kupdated got scheduled in
> due to the wake_up at the end of do_write_buffer, but since the chip was
> in FL_WRITING mode, it couldn't make any progress and got stuck on the
> wait queue again.  So then the writing thread came in and finished it's
> write, and called wake_up again.  But wake_up doesn't actually call
> schedule, so the writing thread called do_write_buffer again with the
> next chunk of data to be written and it wasn't scheduled out until
> cfi_udelay was called after putting the chip into FL_WRITING state
> again.  Repeat this until the overall 256KiB write was done.
>
> Basically, the writing thread was starving kupdated from making any
> progress and since kupdated was never charged with any time, the writing
> thread was always being marked as needing to be scheduled in the wake_up
> code.  This cause it to do a schedule_timeout(1) every buffer write (32
> bytes).  In 2.4, that's approximately 10 milliseconds of wait time
> because it's based on jiffies.
>
> For a fix, we added a conditional reschedule in the loop that calls
> do_write_buffer in the cfi_intelext_write_buffers function.  This made
> write times of 256KiB go from 20-50 seconds to 1-6 seconds on average.
>
> In 2.6 the problem is a bit less drastic since HZ is 1000 (or was at one
> point) which means each jiffy is 1 ms instead of 10.  Also, you'd have
> to be writing a _lot_ of data to probably see this happen.  But the fact
> remains that it is possible.
>
> Would adding a conditional reschedule be an acceptable fix?
>
> josh
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


Can't wait to see the patch.  Not sure I understand what the conditions are=
.
