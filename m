From: jerj@coplanar.net (Jeremy Jackson)
Date: 15 Mar 2003 13:39:48 -0500
Subject: Using a DoC
In-Reply-To: <000201c2eb0d$e6053b80$4fc9580c@who5>
References: <000201c2eb0d$e6053b80$4fc9580c@who5>
Message-ID: <1047753588.1341.1.camel@contact.skynet.coplanar.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sat, 2003-03-15 at 11:14, Gregg C Levine wrote:

> Hello again from Gregg C Levine
> Not surprisingly, yes I did do that. That's how I know that kernel
> sees the DoC in on startup. I have even given it the address in memory
> where it is, to make it easier to find, rather then using probing
> methods.
> 
> But the fact is, I am still confused, and lost. Here's one reason:
> Script started on Sat Mar 15 02:53:00 2003
> root at drwho4:/usr/src/mtd/grub# ../util/doc/loadbios /dev/mtd0
> grub_firmware
> 
> Open flash device: No such device

Do you have the proper device nodes present?  Cat /proc/devices to see
if there's an mtd driver present, then ls -l /dev/mtd0 to see if it has
a matching device node (major number).

Jeremy
