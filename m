Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIDOF-0003UP-Cw
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 09:33:56 +0000
Message-ID: <1422869610.8637.352.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: Is it possible to get the compressed size of a file?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: "markus.heininger@online.de" <markus.heininger@online.de>
Date: Mon, 02 Feb 2015 11:33:30 +0200
In-Reply-To: <trinity-03861656-4f4e-47fd-bcc5-aa493202c0bd-1418900934280@3capp-1and1-bs05>
References: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
 , <54912109.50505@huawei.com>
 <trinity-03861656-4f4e-47fd-bcc5-aa493202c0bd-1418900934280@3capp-1and1-bs05>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Markus,

On Thu, 2014-12-18 at 12:08 +0100, markus.heininger@online.de wrote:
> in our system we´re using ring buffers where it is necessary to
> remove old files from certain directories when the physical usage
> of each directory is above a certain level which is different for each 
> folder.
> 
> Evaluating the output of "df" after write access might be difficult
> since there are several concurrent writing processes.
> 
> But many thanks for your answer, it seems that there is no easy
> way to get the information needed and we must investigate further on
> our own.

Yes, no easy way, but I think implementing what you need is possible. I
do not have plans and time to work on this, but I can help by giving
advises and review.

The question has 2 major parts.

1. The interface
2. The implementation


For the former, one need to carefully investigate if there is something
like this already implemented for other file-systems. I think btrfs may
have it. If it is, then UBIFS should use similar interface, probably.

And whatever is the interface choice, it should be discussed in the
linux-fsdevel@vger.kernel.org mailing list, which I am CCing.


For the latter, I'd suggest to try this.

a. 'struct ubifs_ino_node' has unused space, use it to add the
compressed size field.
b. maintain this field
c. this field will only be correct for the part of the file which are on
the media. The dirty data in the page cache has not yet been compressed,
so we do not know its compressed size yet.
e. when user asks for the compressed size, you have to sync the inode
first, in order to make sure the compressed size is correct.

And the implementation should be backward-compatible. That is, if new
driver mounts the old media, you return something predicatable. I guess
uncompressed size could be it.


Hope this helps,
Artem.
