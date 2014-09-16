Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTuy1-0004PC-ND
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:46:58 +0000
Message-ID: <1410882292.28850.60.camel@sauron.fi.intel.com>
Subject: Re: xfstests on UBIFS - first findings
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Tue, 16 Sep 2014 18:44:52 +0300
In-Reply-To: <5416ADB8.80301@nod.at>
References: <5416ADB8.80301@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-09-15 at 11:13 +0200, Richard Weinberger wrote:
> One can simple trigger it by doing:
> # mknod foo c 0 0
> # setfattr -h -n trusted.name foo
> 
> dir_ui->data_len is 4 instead of 0.

I think the assertion is bogus. It was correct before the xattr support
was added.

The assertion basically is: if the inode is a directory inode, it should
not have data in it.

In that function, dir_ui (directory UBIFS inode) may be also be the
"host" inode for the xattr entry, so it is not necessarily a directory
inode at all.

So the variable should be re-named to "host_ui" instead of "dir_ui".

-- 
Best Regards,
Artem Bityutskiy
