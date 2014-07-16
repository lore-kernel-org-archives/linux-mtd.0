Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Nzi-0005NS-QP
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:07:38 +0000
Message-ID: <53C66ACD.5090508@huawei.com>
Date: Wed, 16 Jul 2014 20:06:37 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: ubifs error at boot "bad node type"
References: <53BBC39F.7010307@gmail.com>
 <1405499347.1906.2.camel@sauron.fi.intel.com>
In-Reply-To: <1405499347.1906.2.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/7/16 16:29, Artem Bityutskiy wrote:
> On Tue, 2014-07-08 at 12:10 +0200, Richard Genoud wrote:
>> ubiattach is ok:
>> # ubiattach -m 3
>> [   50.164062] UBI: default fastmap pool size: 95
>> [   50.164062] UBI: default fastmap WL pool size: 25
> 
> I do not know why this happened, I never saw reports like this before.
> Most probably this is because of fastmap. I did not hear any report that
> it was extensively verified WRT power cuts, and my theory is that there
> is a bug in fastmap which causes this, and this may be related to power
> cuts. I do not have proves, but suggest you to dig in this direction.
> E.g., setup power-cut testing.
> 

My colleague who use UBIFS with kernel v2.6.34(WR4?) hit
an error like this:

UBIFS error (pid 0): ubifs_read_node: bad node type (255 but expected 0)
UBIFS error (pid 0): ubifs_read_node: bad node at LEB 112:67824, LEB mapping status 1
UBIFS error (pid 0): ubifs_iget: failed to read inode 1, error -22

He said he was running UBIFS for 3 years and would hit this
error about one time per year.

I googled these error messages and found some same reports
in 2010~2012. So I think this problem is fixed by early
fixes, I asked him to backport this patch set

[PATCH 00/13] UBI reliability improvements

but I'm sure of that. After this error report, I was
worrying about this bug still left.
