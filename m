Received: from f98.law12.hotmail.com ([64.4.19.98] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zt0z-00053j-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 07:11:13 +0100
From: "fretre lewis" <fretre_lewis@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: how can I setup all head files before browsing the source code?
Date: Fri, 11 Oct 2002 06:10:35 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F987MaLJJRGE56bPkzM0001e63b@hotmail.com>
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

what I want is only to read and learn some arm-linux kernel code, please 
note, I mean not compiler kernel or toolchain etc, I just want to use LXR to 
browse source code.

before I invoke LXR to work, I need setup head files, for i386-linux, 
following is enough:

ln -s /usr/src/linux/include/asm-i386  /usr/include/asm
ln -s /usr/src/linux/include/linux     /usr/include/linux


however, I am new to arm-linux, I guess there is more setup than above, for 
example, I can't find some directories in source tree, like:

    include/asm-arm/arch
    include/asm-arm/proc
    ......
etc

and I can't find some files like:
     mach-types.h
     ......
etc

   I think there are many work, say, symlink directories,create new 
files,etc, would be done automaticly during compiling kernel, however I need 
not compiler kernel, I just want to use LXR to build cross-reference among 
the source code, so perhaps, I have to do all of these work manually about 
setup head files , without these I am afraid LXR can not generate index 
database rightly.

  supposing I am interested in code about Xscale, how can I setup all head 
files and other files/dirs referenced?

please help

thank very much

fretre





_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com
