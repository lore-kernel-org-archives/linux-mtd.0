Received: from mail018.syd.optusnet.com.au ([210.49.20.176])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cDoa-0007oc-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 00:32:36 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail018.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g76NWVj18030
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 09:32:32 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=ctam.com.au)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17cDoN-00055n-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 09:32:23 +1000
Message-ID: <3D505C85.80705@ctam.com.au>
Date: Wed, 07 Aug 2002 09:32:21 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: kernel hangs on DOC2000 root filesystem
References: <3D4F89CF.3010809@ctam.com.au> <4518.1028624265@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


David Woodhouse wrote:

>brendan.simon@ctam.com.au said:
>
>> Any ideas why the kernel just hangs ? 
>>
>>>>>>>>>>BJS: nftl_release(): invalidate_device()
>>>>>>>>>>

Is this because get_super() fails ???

I've done an fsck.ext2 and it passed with no problems.  This should mean 
that the super blocks are OK, should it ???

I formatted the DOC with nftl_format if that makes any difference.
I also used the latest fdisk from util-linux for format the drive with 
an MSDOS partition table and one ext2 partition.

Thanks for any help or advice.
Brendan Simon.
