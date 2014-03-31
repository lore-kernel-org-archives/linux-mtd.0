Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUZFb-0003i8-DT
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 10:15:31 +0000
Message-ID: <1396260879.9016.70.camel@sauron.fi.intel.com>
Subject: Re: ubifs: assertion fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dolev Raviv <draviv@codeaurora.org>
Date: Mon, 31 Mar 2014 13:14:39 +0300
In-Reply-To: <f08bbebef039d5bb28c2fcd3022165b0.squirrel@www.codeaurora.org>
References: <f08bbebef039d5bb28c2fcd3022165b0.squirrel@www.codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2014-03-24 at 06:03 +0000, Dolev Raviv wrote:
> Hi all,
> 
> Im doing my first steps learning ubifs and Im trying to understand a
> something that does not make much sense to me.
> 
> In fs/ubifs/shrinker.c, at shrink_tnc(), there is an assert condition that
> shows up every once I a while (after stressing).
> ubifs_assert(atomic_long_read(&c->clean_zn_cnt) >= 0);

When this happens, do you then see a storm of similar assertions from
other parts of the code? I am trying to understand if this assertion is
incorrect, or you really get the accounting screwed when shrinking
happens.

In the former case, this would probably be a single assertion, on the
latter you'd probably see many similar warnings from other code. E.g.,
when you unmount.

> In another place in the same file in the function ubifs_shrinker(), I
> found the following comment:
> /*
> * Due to the way UBIFS updates the clean znode counter it may
> * temporarily be negative.
> */

Yeah. The key here is this 'c->next'. If it is NULL, the accounting must
be correct, if it is not NULL, it may be incorrect. And it will be
correct when the on-going commit operation finishes and
'free_obsolete_znodes()' is called.

> Could the assertion condition be wrong?

Could be, but could also show that there is an accounting error
happening when shrinker starts.

And I saw misterious errors when shrinker starts working at some point,
but did not have time to dig this. So there is at least 1 bug in the
shrinker path which I saw.

> Can anyone share information on what are those times that the counter can
> be negative?

When the commit operation starts, it grabs the tnc_mutex, prepares the
list of nodes to commit, and release tnc_mutex. Now the accounting is
incorrect. When the commit finishes, it grabs the mutex again, does some
stuff, and also fixes the accounting. Then drops the mutex.

The idea was to make sure that commit does not block I/O. Meaning that
you can still write files while commit is going on.

-- 
Best Regards,
Artem Bityutskiy
