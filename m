Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172Izp-0007f2-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 22:47:45 +0100
Message-ID: <3CCDBF21.40004@yottayotta.com>
Date: Mon, 29 Apr 2002 15:46:09 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Kernel removing directories
References: <3CC9A794.4070706@yottayotta.com>  <3CC8C1C9.80709@yottayotta.com> <14375.1019801767@redhat.com> <24028.1019859603@redhat.com>
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

When I set jffs2 debug level to 1... and default_console_loglevel to 
9...  I get output for an extremely long time. Is this normal? I've been 
waiting for about 3 hours now and it's still not done. Normally it takes 
several seconds to load the filesystems.

Right now it's at the stage of:

adding node 6b000-6bfff @0x00785628 on flash, newfrag *c0ec4680
j_a_f_d_t_f: skipping frag 0x0000-0x1000;......
j_a_f_.............
.. and many lines of j_a_f_d_t_f and then a "adding node..." again for 
the next hex addresses...

Should I continue with this? MTD debug level is set to 3

Murtada

David Woodhouse wrote:

>mshah@yottayotta.com said:
>
>>There is nothing displayed before it... Even with debug set to 2 Just
>>"Netwinder Floating Point Emulator"..
>>
>
>Can you set DEFAULT_CONSOLE_LOGLEVEL in kernel/printk.c to 9 and try again? 
>You'll want to use a serial console with _logging_.
>
>--
>dwmw2
>
