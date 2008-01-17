Received: from ipn36372-d52026.cidr.lightship.net ([216.204.15.186]
	helo=zeus.bittware.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFXJY-00045G-5L
	for linux-mtd@lists.infradead.org; Thu, 17 Jan 2008 16:10:06 +0000
Message-ID: <478F7D11.30606@bittware.com>
Date: Thu, 17 Jan 2008 11:06:41 -0500
From: DMcLeod <dmcleod@bittware.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: JFFS2 access time
References: <478E0D5E.8070508@bittware.com>
	<20080116183458.2c997320@zod.rchland.ibm.com>
In-Reply-To: <20080116183458.2c997320@zod.rchland.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Wed, 16 Jan 2008 08:57:50 -0500
> DMcLeod <dmcleod@bittware.com> wrote:
>
>   
>> Hi all,
>>
>> We are using uClinux git 2.6.23. We have 4 2.5MB files sitting in a 
>> directory on a ~40MB jffs2 partition (on NOR flash). The very first time 
>> we do an 'ls' in that directory, the response takes literally minutes. 
>> After the initial delay, any accesses to those files are very 
>> quick.,,
>>     
>
> That is normal for large files.  JFFS2 has do the CRC checking on all
> the nodes for those large files.  That is a lot of nodes to check.  You
> might want to look into using the eraseblock summary feature.
>
>   
>> Originally, we started off with the Microtronix 1.4 kernel and 
>> it did not have this problem. The pre-git version of uClinux-dist had 
>> this problem but not as severe - it was more like 40 seconds to list the 
>> contents of that directory.
>>     
> I have no idea what those two kernels are, but older JFFS2 used to do
> all the CRC checking at mount time.  So mount would be slow and runtime
> access would be relatively quick.
>   
The Microtronix kernel is the kernel built by Altera's Quartus 6.1 
suite. By "pre-git" version, we just meant the packaged version from 
nioswiki, rather than getting it from the git server.

At any rate, it turns out that having the verbosity level set to 2 in 
the jffs2 section of menuconfig was our problem. The kernel was so 
dragged down by having to bombard /proc/kmsg with jffs2 printk's that it 
caused the huge delays we were seeing. We set verbosity back to 0 and 
all is well.

Thanks :-)
> josh
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>   
