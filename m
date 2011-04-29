Received: from bosmailout04.eigbox.net ([66.96.189.4])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QFbyA-0005CG-PJ
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 00:54:07 +0000
Received: from bosmailscan07.eigbox.net ([10.20.15.7])
	by bosmailout04.eigbox.net with esmtp (Exim) id 1QFby9-0001cY-2X
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 20:54:05 -0400
Message-ID: <15edd46a20ed4a605833b904c2f25010.squirrel@emailmg.startlogic.com>
In-Reply-To: <1304012894.2737.19.camel@localhost>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<4DB7C9F9.9000609@free-electrons.com>
	<d7bb9e8d1c11cece8092e2f4c40436e2.squirrel@emailmg.startlogic.com>
	<201104281427.52402.IwoM@netcomm.com.au>
	<7bc099d4301235c5f76f9689cb956f2c.squirrel@emailmg.startlogic.com>
	<1304012894.2737.19.camel@localhost>
Date: Thu, 28 Apr 2011 20:53:54 -0400
Subject: Re: Discovering current MTD partition
From: umar@janteq.com
To: dedekind1@gmail.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: umar@janteq.com
Cc: David Wagner <david.wagner@free-electrons.com>,
	Iwo Mergler <iwom@netcomm.com.au>, umar@janteq.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Thu, 2011-04-28 at 13:26 -0400, umar@janteq.com wrote:
>> # cat /proc/mounts
>> rootfs / rootfs rw 0 0
>> ubi0:rootfs / ubifs rw,sync,relatime 0 0
>> proc /proc proc rw,relatime 0 0
>> tmpfs /tmp tmpfs rw,relatime 0 0
>> devpts /dev/pts devpts rw,relatime,gid=5,mode=620 0 0
>> sysfs /sys sysfs rw,relatime 0 0
>> debugfs /debug debugfs rw,relatime 0 0
>> tmpfs /webSvr/logs tmpfs rw,relatime 0 0
>>
>> # cat /proc/mtd
>> dev:    size   erasesize  name
>> mtd0: 00020000 00020000 "bst"
>> mtd1: 00500000 00020000 "ptb"
>> mtd2: 00500000 00020000 "bld"
>> mtd3: 00500000 00020000 "hal"
>> mtd4: 00500000 00020000 "pba"
>> mtd5: 00800000 00020000 "pri"
>> mtd6: 00800000 00020000 "sec"
>> mtd7: 03c00000 00020000 "bak"
>> mtd8: 03c00000 00020000 "rmd"
>> mtd9: 03c00000 00020000 "rom"
>> mtd10: 00300000 00020000 "dsp"
>> mtd11: 03c00000 00020000 "lnx"
>>
>> # df
>> Filesystem                Size      Used Available Use% Mounted on
>> ubi0:rootfs              52.7M     35.1M     17.5M  67% /
>> tmpfs                    65.4M     32.0K     65.4M   0% /tmp
>> tmpfs                    65.4M     32.0K     65.4M   0% /webSvr/logs
>>
>> There's nothing above I can use to infer about which /dev/mtdXX is
>> currently booted - at least on this system.
>> I have resorted to my backup strategy of parsing /proc/cmdline within
>> Python to determine which partition is booted. *sigh*
>
> Yes, this is a bit messy and complex. Anyway, here is the algorithm for
> you, in short. Ask specific questions if it is not clear, I do not have
> time right now to write long mails. Anyway, you need to spend some time
> and understand the relations between all these mtdX, ubiY, ubiY_Z,
> ubiY:name...
>
> So, in your case you know your rootfs is "ubi0:rootfs". This means that
>    a) your rootfs is an UBI volume
>    b) this UBI volume belongs to the UBI device 0 (there may be several
>       of them - ubi1, ubi2, etc). This is the typical case, I do not
>       know if anyone really has more than one UBI device ever.
>    c) You know that the volume name is "rootfs".
>
> You also should know that there is 1-1 correspondence between MTD and
> UBI devices - one UBI device sits on top (and fully controls) one MTD
> device. To find out the MTD device number you look
> at: /sys/class/ubi/ubi0/mtd_num
>
> There you see the number X, this means your MTD device is mtdX
>
> P.S. If you had set-up similar to Ricard's, you' also need to look
> at /proc/cmdline to translate "rootfs" or "/dev/rootfs" to
> "ubi0:rootfs". Not, in this case it is just co-incidence that you named
> your volume "rootfs", if you named it "pussy_cat", you' have the
> following in your /proc/mounts:
>
> rootfs / rootfs rw 0 0
> ubi0:pussy_cat / ubifs rw,sync,relatime 0 0
>
> HTH.
>

Yes, that definitely helps!

# cat /sys/class/ubi/ubi0/mtd_num
11

Thanks :)
