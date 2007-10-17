Received: from e23smtp02.au.ibm.com ([202.81.18.163])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ii522-00038H-PF
	for linux-mtd@lists.infradead.org; Wed, 17 Oct 2007 10:17:48 +0100
Received: from sd0109e.au.ibm.com (d23rh905.au.ibm.com [202.81.18.225])
	by e23smtp02.au.ibm.com (8.13.1/8.13.1) with ESMTP id l9H7TD02006151
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2007 17:29:13 +1000
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by sd0109e.au.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l9H7WjeD280816
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2007 17:32:45 +1000
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l9H7TAwG028527
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2007 17:29:11 +1000
Message-ID: <4715B9C4.8000904@linux.vnet.ibm.com>
Date: Wed, 17 Oct 2007 12:59:08 +0530
From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
MIME-Version: 1.0
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [BUG] 2.6.23-rc9 kernel panic - simple_map_write+0x4e/0x75
References: <4710686C.8060603@linux.vnet.ibm.com>
	<20071016134620.7b3ce56f.akpm@linux-foundation.org>
	<4715B5A5.9050005@linux.vnet.ibm.com>
	<20071017002317.7ae2cbf4.akpm@linux-foundation.org>
In-Reply-To: <20071017002317.7ae2cbf4.akpm@linux-foundation.org>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Morton wrote:
> On Wed, 17 Oct 2007 12:41:33 +0530 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> wrote:
> 
>>>> [  321.592882] Code: 83 f8 01 75 0a 03 7b 10 8b 45 d4 88 07 eb 35 83 f8 02 75 0c
>>>> 0f b7 45 d4 03 7b 10 66 89 07 eb 24 83 f8 04 75 0a 03 7b 10 8b 45 d4 <89> 07 eb
>>>> 15 7e 13 03 7b 10 89 c1 c1 e9 02 f3 a5 89 c1 83 e1 03 
>>>> [  321.668990] EIP: [<c0d7e4e2>] simple_map_write+0x4e/0x75 SS:ESP 0068:c3ca8d6c
>>>> [  321.695750] Kernel panic - not syncing: Attempted to kill init!
>>> Would I be correct in assuming that the machine has no mtd devices, but
>>> you happened to link that driver into your vmlinux?
>>>
>> Hi Andrew,
>>
>> The machine do not have the mtd device, and the mtd is compiled into the vmlinuz.
>> This configuration works fine for other kernels and is reproducible with
>> 2.6.23-rc9 only.
> 
> So 2.6.23 is OK?

Hi Andrew,

The kernel panic is not seen in 2.6.23 kernel with CONFIG_MTD set.

-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
