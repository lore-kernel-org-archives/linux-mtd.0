Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIZSN-0001PJ-FM
 for linux-mtd@lists.infradead.org; Tue, 03 Feb 2015 09:07:39 +0000
Message-ID: <1422954434.8637.372.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: Is it possible to get the compressed size of a file?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Andreas Dilger <adilger@dilger.ca>
Date: Tue, 03 Feb 2015 11:07:14 +0200
In-Reply-To: <7B8DF06B-EBC8-4C85-AEEA-C2C6A52B8789@dilger.ca>
References: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>
 <,> <54912109.50505@huawei.com>
 <trinity-03861656-4f4e-47fd-bcc5-aa493202c0bd-1418900934280@3capp-1and1-bs05>
 <1422869610.8637.352.camel@sauron.fi.intel.com>
 <7B8DF06B-EBC8-4C85-AEEA-C2C6A52B8789@dilger.ca>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.cz>,
 "markus.heininger@online.de" <markus.heininger@online.de>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-02-02 at 22:45 -0700, Andreas Dilger wrote:
> I think FIEMAP would be a good userspace API to get this kind of
> low-level allocation information about the compressed size of data.
> For most files it would probably only need a single fiemap_extent
> to return the allocation data.

Thanks Andreas,

indeed FIEMAP sounds like a good answer to the problem.

Artem.
