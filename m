Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7mHs-0001uk-6E
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 02:41:48 +0100
Message-ID: <3F860E15.1060008@hectrix.com>
Date: Fri, 10 Oct 2003 09:40:37 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: Slim <slimaffi@yahoo.com>
References: <20031009163345.54331.qmail@web9907.mail.yahoo.com>
In-Reply-To: <20031009163345.54331.qmail@web9907.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/10/2003 12:33 AM, Slim wrote:
> Worked fine - thanks.  I'd like to incorporate the ctrl-key bypass
> or better yet, have it recognize the bios setting to boot from C
> instead.

AFAIK, the ctrl-bypass is the only option to make the grub on doc return
control to the bios.

>    mount /dev/nftla /mnt/doc
> and I get
>    mount: /dev/nftla: unknown device
> but 
>    ls -l /dev/nftla
> gives
>    brw-r--r--   1  root     93,   0 Sep 23 10:22 /dev/nftla

/dev/nftla is the nftl device representing your doc, but not a
partition. You have to create a new partition on it. You may use fdisk
/dev/nftla to do create one. Suppose you only create one partition, you
will get /dev/nftla1, representing the first partition. Then, you should
use mke2fs /dev/nftla1 to create a ext-2 filesystem on it (assuming you
choose ext-2.

Selwyn
