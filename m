Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 171BEU-0001YK-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 20:18:14 +0100
Message-ID: <3CC9A794.4070706@yottayotta.com>
Date: Fri, 26 Apr 2002 13:16:36 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Kernel removing directories
References: <3CC8C1C9.80709@yottayotta.com> <14375.1019801767@redhat.com>
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

There is nothing displayed before it... Even with debug set to 2
Just "Netwinder Floating Point Emulator"..

Murtada

David Woodhouse wrote:

>mshah@yottayotta.com said:
>
>> I'm booting from flash... but during bootup jffs2 erases some things
>>it  seems??
>>
>
>>"inode #7 was a directory with children ... removing those too" 
>>
>
>The line before that would probably have given an indication of _why_ it 
>felt it needed to remove inode #7.
>
>--
>dwmw2
>
