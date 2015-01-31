Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHUip-00019m-8y
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 09:52:11 +0000
Message-ID: <1422697906.8637.295.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] UBIFS: return -EINVAL if first log leb is empty
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Sat, 31 Jan 2015 11:51:46 +0200
In-Reply-To: <54CC4F77.1000801@huawei.com>
References: <54CC4F77.1000801@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hujianyang,

On Sat, 2015-01-31 at 11:43 +0800, hujianyang wrote:
> CS node is recognized as a sign in UBIFS log replay mechanism.
> Log relaying during mount should find the CS node in first log
> leb at beginning and then replay the following uncommitted
> buds.

Lets use the "log head" term instead of "the first log LEB", just to be
consistent.

> Here is a bug in log replay path: If first log leb, which is
> indicated by @log_lnum in mst_node, is empty, current UBIFS
> replay nothing and directly mount the partition without any
> warning. This action will put filesystem in an abnormal state,
> e.g. space management in LPT area is incorrect to the real
> space usage in main area.

Looks like a good catch, thank you! I have few requests, though.

> 
>  	if (sleb->nodes_cnt == 0) {
> -		err = 1;
> +		if (unlikely(c->cs_sqnum == 0)) {

Please, do not use unlikely(), it may only be used on hot-paths, which
the replay code is certainly not.

IIUC, this if translates to "is this the head of the log?". If I am
right, then the better place for doing this check is the caller function
- 'ubifs_replay_journal()'. In that function you just do

if (lnum == c->lhead_lnum)

which is way easier to understand than "if (c->cs_sqnum == 0)", I think.

> +			/* This is the first log LEB, should not be empty */

I'd expand this comment a bit to:

The head of the log must always start with the "commit start" node on a
properly formatted UBIFS. But we found no nodes at all, which means that
something went wrong and we cannot proceed mounting the file-system.

I think the next developer who looks at the will appreciate these kinds
of commentaries.

> +			ubifs_err("first log leb LEB %d:%d is empty, no CS node exist",
> +				  lnum, offs);

Lets use consistent terminology. We call it the "log head".

I'd phrase it like this:

no UBIFS nodes found at the log head LEB %d:%d, possibly the FS is
corrupted.
