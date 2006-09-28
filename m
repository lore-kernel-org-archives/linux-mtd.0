Subject: Re: Exporting jffs2 by nfs with kernel 2.6
From: David Woodhouse <dwmw2@infradead.org>
To: Gregory CLEMENT <gclement00@gmail.com>
In-Reply-To: <305035a40609270731n150513b4obe4249b461a3d1bc@mail.gmail.com>
References: <305035a40609270731n150513b4obe4249b461a3d1bc@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 28 Sep 2006 07:43:19 +0100
Message-Id: <1159425799.3309.168.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, neilb@cse.unsw.edu.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-09-27 at 16:31 +0200, Gregory CLEMENT wrote:
> Hi all,
> 
> On 2.4.18 we managed to export a jffs2 filesystem by nfs.
> Now on 2.6.16 we can't.
> I found 2 problems for it:
> First, changed was made in nfs, and now they test if
> s_export_op is not a void pointer. By dding a pointer on
> this structure (even this structure is void) makes nfs happy.

> If the structure is void nfs use generic function, so for this part
> I think it's ok

Hm, OK. What are the implications of providing _none_ of our own
functions and just using the defaults? Shouldn't we provide at least a
get_parent() function?

By do we need that anyway? I thought we used to just have disconnected
dentries until we happen to find their place in the tree, at which point
we connect them.

> Second, nfs need to identify the filesystem to export. It is done
> either by the device of the filesystem or by a "fsid". I didfn't see any
> filesystem use a "fsid" and I don't know how to use it. So identification
> is made if FS_REQUIRES_DEV is set. The problem was in kernel 2.5.7,
> this flag was removed because "We never really used the block device anyway".
> Do you mind setting this flag again? Or have you a better idea?

I suspect that we should add another export_ops function for get_fsid().

-- 
dwmw2
