Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
From: David Woodhouse <dwmw2@infradead.org>
To: R&D4 <r&d4@dave-tech.it>
In-Reply-To: <45EFDC0D.4090409@dave-tech.it>
References: <45EFDC0D.4090409@dave-tech.it>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 10:51:38 +0000
Message-Id: <1173351098.3461.414.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 10:49 +0100, R&D4 wrote:
> Hi all MTD developers,
> 
> we are currently using an MTD partition on a NAND device, of course with
> JFFS2 on it ;-) , for transaction logging purpose.
> This transacion is mission critical and we cannot afford to lose data
> (or, even worse, have corrupted data!)
> 
> For this reason we also use a battery-backed SRAM as temporary storage
> for the transaction state machine. After the transacion has been
> completed we flush the content of the SRAM to a file and (after the
> written is completed) we can overwrite the temporary storage with new data.
> Of course the machine can be interrupted in any moment without notice
> (e.g. watchdog, power failure). Only the content of the SRAM is
> guaranteed to be valid at any time.
> 
> The "main" problem, of course, is to know "when" we can say "ok the data
> has been _completely_ written to the final storage".
> 
> By reading back on this mailing list, "goooogling" on internet and
> reading JFFS2 FAQ
> (http://www.linux-mtd.infradead.org/faq/jffs2.html#L_writewell) I think
> I have found some kind of solution (I'm currently running some test on
> it) depending on the storage medium (NOR vs NAND):
> 
> - on *NOR*: in our understanding, we can just use a simple fwrite()
> followed by fsync() or sync(). After the sync() return the control to
> the user's program, we can be sure that the data has been written on the
> device. So

...

> QUESTION: Is this pseudo code correct? Is fsync() needed? (O_SYNC is not
> supported by JFFS2, AFAIK) or data has been _completely_ written right
> before the fwrite() return (so no sync() required)?

On NOR you don't need the sync(). At least, if you're using write() you
don't need the sync. I make no claims about what glibc does with
fwrite(), but I believe fsync() ought to be perfectly sufficient.

JFFS2 doesn't support O_SYNC because it's _already_ synchronous.

> 
> - on *NAND*: things are a bit tricky ;-). Even if you call fsync() data
> may not have been written to storage, due the fact that "it's better to
> fill a NAND page before commit"

If you call fsync() an the data for the given file isn't actually
written to the NAND before the system call returns, that's a very
serious bug. We went to great lengths to ensure that fsync() works as it
should. If you think this is misbehaving, please show JFFS2 debugging
output demonstrating the error.

Your proposal of using 'sleep()' really ought to fill you with dread.
Adding an extra sleep is almost _never_ the way to achieve reliable
operation. I hope you did that only to draw attention to the problem and
weren't _honestly_ considering it in production :)

-- 
dwmw2
