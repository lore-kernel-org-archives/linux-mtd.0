Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP8xN-0004XR-AB
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 12:47:05 +0000
Message-ID: <1439297201.31419.25.camel@gmail.com>
Subject: Re: [PATCH v3] ubifs: make ubifs_[get|set]xattr atomic
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, richard@nod.at,
 linux-mtd@lists.infradead.org
Date: Tue, 11 Aug 2015 15:46:41 +0300
In-Reply-To: <55C96CBD.6070303@cn.fujitsu.com>
References: <55C444EA.7090305@cn.fujitsu.com>
 <1438927640-14931-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439193902.26877.96.camel@gmail.com> <55C96CBD.6070303@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-08-11 at 11:32 +0800, Dongsheng Yang wrote:
> So, I think fields in host are all protected by host->ui_mutex and
> fields in xattr inodes are all protected by individual ui_mutex.
> 
> Am I missing something?

OK, on a second look, your patch is probably fine.

> BTW, I found I have to add ui_mutex in create_xattr() even if you
> agree with it. :)

I am not sure about this. I thought xattrs are not visible to anyone
while they are being created, so you do not need any locking there,
since you do not have anyone to race with you.

Artem/
