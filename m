From: dave@krausecentral.com (David Krause)
Date: Sat, 8 Mar 2003 18:32:50 -0600
Subject: DoC Debug Level Issue
Message-ID: <000401c2e5d3$6cb4e5d0$9d00a8c0@SPEEDWOLF>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I have a 64 Mb DoC that boots Linux using GRUB.  However, depending on
what I set the MTD debug level to, the system will either work well, or
hang when accessing the DoC.  I am using kernel 2.4.18 with the MTD CVS
as of about one week ago.  The device has one ext2 partition on it.

With the debug verbosity set to 3 (highest), the system boots fine, but
rapidly fills up the kernel log file, especially when the DoC is the
only device in the system.  With the debug level set to 2 or lower, the
system hangs at the point during boot where the kernel tries to launch
the init process.

If I boot the system from a hard drive, and then mount the DoC as a
separate filesystem, I get similar hang-ups when I try to access the
device, again strictly depending on the debug level.  Some accesses will
work, but an e2fsck will always hang shortly after starting.  With the
debug level at 3, the e2fsck completes normally in a very short time
period.

To clarify, when I say "hang-up", the process I started from the command
line never completes, and cannot be killed.  I've only been able to
access the device by rebooting after this happens.  The last thing I
usually see in the kernel log is "NFTL read request of ....", but there
is no corresponding message that the read request completed.

I've searched the mailing list and seen that several people have posted
about a similar issue, but no responses were ever sent to the list.

Any suggestions are appreciated.

-- Dave
