Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUMBy-0002Ie-3v
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 14:56:23 +0000
Message-ID: <4A69CB52.9090807@gmail.com>
Date: Fri, 24 Jul 2009 17:55:14 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
Subject: Re: UBIFS Corrupt during power failure
References: <1246627771.20721.191.camel@localhost.localdomain>	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>	<1246629940.20721.219.camel@localhost.localdomain>	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>	<1246633131.20721.224.camel@localhost.localdomain>	<1246854654.20721.271.camel@localhost.localdomain>	<1246855913.20721.287.camel@localhost.localdomain>	<1246862635.20721.291.camel@localhost.localdomain>	<1246949184.20721.302.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>	<20090715205217.GH3056@shareable.org>	<C77C279BA71FD14985DC8E75FB265AB703B47FC9@usw-am-xch-02.am.trimblecorp.net>	<4A69596F.8070300@gmail.com>
	<1248436825.24676.70.camel@localhost>
	<C77C279BA71FD14985DC8E75FB265AB703C161A8@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB703C161A8@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/24/2009 04:39 PM, Eric Holmberg wrote:
> Power Cycling Results
> ---------------------------
> I just finished a cycle test using 2 boards and the latest patches from
> 2.6.27 and both boards were still running after a combined power-cycle
> count of 11,178 while running a memory torture test - so the robustness
> has been improved dramatically.

Good news!

> Random LEB 1 Corruption
> --------------------------------
> Out of the 11,178 power cycles, I received 12 random corruptions of LEB
> 1.  The file system recovers the block.  The offset into the LEB where
> the error occurs changes.  This looks like it may be the remaining half
> of the problem I used to have where I would get two LEB 1's and one
> would be corrupt.  Artem's fix of corrupting the header may have solved
> the fatal issue, but I would be interested as to what this is doing.

Well, if you cut the power while UBIFS is in the middle of writing a node,
you have a half written node, and this is expectd.

> Kernel mounts the UBIFS system as read-only initially and then remounts
> it for write access later in the boot process.  This is the initial scan
> in read-only mode.

UBIFS yells about the corrupted node in the journal. If the corrupted node
is in the tail of the journal, this is an expected result of an unclean
reboot. Probably UBIFS should be smarter and print something less scary
in this case. I've just put this to my TODO list.

Anyway, you are mounting read-only, so it yells and goes forward.
>
> [42949375.180000] UBIFS error (pid 1): ubifs_check_node: bad CRC:
> calculated 0xb6a46e9c, read 0xd46336ef
> [42949375.190000] UBIFS error (pid 1): ubifs_check_node: bad node at LEB
> 1:72704
> [42949375.200000] UBIFS error (pid 1): ubifs_scanned_corruption:
> corruption at LEB 1:72704
> [42949375.250000] UBIFS error (pid 1): ubifs_scan: LEB 1 scanning failed
> [42949375.310000] UBIFS: recovery needed
> [42949375.430000] UBIFS: recovery deferred
> [42949375.440000] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [42949375.440000] UBIFS: mounted read-only
> [42949375.450000] UBIFS: file system size:   27498240 bytes (26853 KiB,
> 26 MiB, 210 LEBs)
> [42949375.450000] UBIFS: journal size:       1178497 bytes (1150 KiB, 1
> MiB, 9 LEBs)
> [42949375.460000] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [42949375.470000] UBIFS: default compressor: lzo
> [42949375.470000] UBIFS: reserved for root:  0 bytes (0 KiB)

But now it is important to see what happens when you try to remount it R/W.
At this stage it will check whether the corruption is at the end or not.
If it is at the end, UBIFS will clean it up and go forward. If it is not
at the end, UBIFS will yell and refuse remounting.

IOW, if it remounts R/W, then this corruption is expected result of unclean
reboots, nothing alarming.

But of course, to be absolutely sure, you should check your files after
you have mounted. But this is tricky and you should be very careful with
doing syncs, etc. But at least checking R/O files would not hurt.

> Truncated Files
> ------------------
> I keep a boot count in two separate files on the file system and update
> them for every boot.  This count is getting reset when it gets up to 100
> or so.  Here is a stripped down version of the boot count script.  Do
> you see anything obvious?  I will do more analysis soon to determine the
> exact cause, but just wanted to get everybody's opinion.

Err, you have not really told what is the problem.

> # set count = max(/var/boot_count_a, /var/boot_count_b)
>
> count=$(($count+1))
>
> # Write out the new boot count (do files that don't exist first)
> if [ ! -e /var/boot_count_a ]; then
>    # a doesn't exist, write it first
>    echo $count>  /var/boot_count_a
>    sync
>    echo $count>  /var/boot_count_b
>    sync
> else
>    echo $count>  /var/boot_count_b
>    sync
>    echo $count>  /var/boot_count_a
>    sync
> fi

If you never cut power before sync is finished, then you should never
loos the contents of these files. If you do, please bug us.

BTW, the other alternative to try would be to set the "sync" flag for
these files, then you would not have to call 'sync()', which is slower
a bit, because it also causes commit. I mean

if [ ! -e /var/boot_count_a ]; then
    # a doesn't exist, write it first
    echo $count>  /var/boot_count_a
    echo $count>  /var/boot_count_b
    chattr +S /var/boot_count_a
    chattr +S /var/boot_count_b
else
    echo $count>  /var/boot_count_b
    echo $count>  /var/boot_count_a
fi

I think this should be the same, but a bit more efficient. Would be
interesting to check if it really works, I checked this, but very long
time ago.

And just in case, here is some info:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
