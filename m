Received: from zose-mta15.web4all.fr ([176.31.217.11])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SNVww-0007bT-QL
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2012 21:10:03 +0000
Message-ID: <4F99B9A0.10605@tribudubois.net>
Date: Thu, 26 Apr 2012 23:09:52 +0200
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive number
 in case of unrecoverable error
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
 <1335100568.28267.12.camel@brekeke> <4F944165.4010400@tribudubois.net>
 <1335362381.5114.17.camel@koala>
In-Reply-To: <1335362381.5114.17.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25/04/2012 15:59, Artem Bityutskiy wrote:
> On Sun, 2012-04-22 at 19:35 +0200, Jean-Christophe DUBOIS wrote:
>>>    Also, please,
>>> tell  whether this fixes a real-life bug or you are fixing a complaint
>>> of a static analysis tools or something like this?
>>>    And please, tell how
>>> you tested it.
> I'd like to get some answers to the above questions.
Well, this patch certainly tries to fix a "real-life" bug.

It mainly intend to re-enable the xattr related self-healing code 
present in JFFS2.

So first, let's try to reproduce this bug in an emulated/controlled 
environment.

# mkdir /tmp/jffs2
# modprobe mtdblock
# modprobe nandsim first_id_byte=0x20 second_id_byte=0x33
# modprobe jffs2
# mount -t jffs2 /dev/mtdblock0 /tmp/jffs2

We create a file and add an attribute
# cp /etc/passwd /tmp/jffs2
# attr -s attr1 -V "TUTU" /tmp/jffs2/passwd

So now we are going to corrupt the attribute:
# umount /tmp/jffs2
# hexedit /dev/mtdblock0

Search for the string TUTU and replace it with tutu and save the all 
thing (Ctrl-X).

Now we remount the jffs2 file:
# mount -t jffs2 /dev/mtdblock0 /tmp/jffs2

And we check "dmesg"
# dmesg
...
[972157.159571] JFFS2 notice: (3038) jffs2_build_xattr_subsystem: 
complete building xattr subsystem, 1 of xdatum (0 unchecked, 0 orphan) 
and 1 of xref (0 dead, 0 orphan) found.

No error found so far. Ok, let's try to check the attribute:
# attr -l /tmp/jffs2/passwd
attr_list: Input/output error
Could not list "(null)" for /tmp/jffs2/passwd
# dmesg
...
[972244.173098] JFFS2 warning: (3068) do_load_xattr_datum: node CRC 
failed (JFFS2_NODETYPE_XREF) at 0xfc8600, read: 0xe46f3e72 calculated: 
0xd2fad3c6

Let's try again ...
# attr -l /tmp/jffs2/passwd
attr_list: Input/output error
Could not list "(null)" for /tmp/jffs2/passwd
#

If you unmount the file system and then remount it, you end up in the 
same situation. Nothing can cure the problem except deleting the file 
(or patching the data back to TUTU in the mtd device).

So, now we modify the jffs2 code to return positive values for 
unrecoverable error and recompile the module (run the usual make ...)

Now let's try the new jffs2 module on the corrupted mtd.
# umount /tmp/jffs2
# rmmod jffs2
# insmod /wherever/fs/jffs2/jffs2.ko
# mount -t jffs2 /dev/mtdblock0 /tmp/jffs2

Let's check for the attribute:
# attr -l /tmp/jffs2/passwd
# dmesg
...
[973190.247650] JFFS2 notice: (10804) jffs2_build_xattr_subsystem: 
complete building xattr subsystem, 1 of xdatum (0 unchecked, 0 orphan) 
and 1 of xref (0 dead, 0 orphan) found.
[973212.584130] JFFS2 warning: (10813) do_load_xattr_datum: node CRC 
failed (JFFS2_NODETYPE_XREF) at 0xfc8600, read: 0xe46f3e72 calculated: 
0xd2fad3c6

No error, this time in user space. The corrupted attribute has been 
automatically discarded from the file system and there are no attributes 
left for this file.

Let's try something else:

# attr -s attr1 -V "TITI" /tmp/jffs2/passwd
# attr -s attr1 -V "TOTO" /tmp/jffs2/passwd
# attr -g attr1 /tmp/jffs2/passwd
Attribute "attr1" had a 4 byte value for /tmp/jffs2/passwd:
TOTO

So this is the last value associated to "attr1". Now we are going to 
corrupt the attribute:
# umount /tmp/jffs2
# hexedit /dev/mtdblock0

Search for the string TOTO and replace it with toto and save the all 
thing (Ctrl-X).

Now we remount the jffs2 file:
# mount -t jffs2 /dev/mtdblock0 /tmp/jffs2

# attr -g attr1 /tmp/jffs2/passwd
Attribute "attr1" had a 4 byte value for /tmp/jffs2/passwd:
TITI

As we can see the attribute value is back to the only left good value. 
The TOTO and TUTU values have been discarded.
If we check dmesg, we find:
# dmesg:
[973559.872703] JFFS2 notice: (10913) jffs2_build_xattr_subsystem: 
complete building xattr subsystem, 3 of xdatum (0 unchecked, 0 orphan) 
and 3 of xref (0 dead, 0 orphan) found.
[973590.824723] JFFS2 warning: (10922) do_load_xattr_datum: node CRC 
failed (JFFS2_NODETYPE_XREF) at 0xfc8600, read: 0xe46f3e72 calculated: 
0xd2fad3c6
[973590.824746] JFFS2 warning: (10922) do_load_xattr_datum: node CRC 
failed (JFFS2_NODETYPE_XREF) at 0xfc8848, read: 0x08bce1ae calculated: 
0x3e290c1a

So the attributes are still allocated and linked to the file but they 
are discarded on first failed access. The value of the only valid 
attribute left is retrieved.

Is this convincing enough?

You might think that the attibute corruption I am showing here is very 
artificial but I can assure you that it does happen in the wild when you 
get a power cut on your equipment while the GC was moving an attribute 
node for example.

Regards

JC
> The reason I am
> asking is that JFFS2 is old and does not see too much maintanance
> anymore, so I feel that it is important important to be careful about
> merging something which does not fix a real life issue.
