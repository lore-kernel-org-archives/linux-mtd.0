Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JA6sX-0001tS-At
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 16:55:50 +0000
Date: Wed, 2 Jan 2008 08:52:28 -0800
From: David Brown <davidb@davidb.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: Does UBI support MLC nand flash?
Message-ID: <20080102165228.GA11327@old.davidb.org>
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
	<bae050c10801012219m71d7415du4379e5b5d5a54560@mail.gmail.com>
	<20080102063945.5355d112@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20080102063945.5355d112@zod.rchland.ibm.com>
Cc: Nancy <nancydreaming@gmail.com>, kmpark@infradead.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 02, 2008 at 06:39:45AM -0600, Josh Boyer wrote:
>On Wed, 2 Jan 2008 14:19:16 +0800
>Nancy <nancydreaming@gmail.com> wrote:
>
>> oh, forgot to metion UBI.
>> UBI has two headers for each LED/PED, they are not write at same time.
>> Is that against MLC nand's no ramdom write and  write only once
>> permission?
>
>Not to my knowledge.  The second header is written to the second page
>in the block if subpage writes aren't supported by the underlying
>chip.  That should still work fine for MLC.

Many MLC devices will not allow you to write to the second page after
having written to the third or subsequent pages.  Would this still work?

Dave
