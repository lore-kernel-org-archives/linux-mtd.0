Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnG4Q-0005qi-PQ
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2011 19:51:25 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=iso-8859-1
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <9B4086AB-27D0-4EEE-9915-5F4CE94CED04@prograde.net>
Date: Wed, 9 Feb 2011 14:52:23 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>	
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>	
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>			
	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net> <OF2C1ABD39
	<4D5005E4.1040506@keymile.com> <OFFF2C6D34.91E5D6C3-ONC1257	
	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46DCBA1-ONC1257830.00591756-C1257830.0059F97E@transmode.se>
	<3FD201B7-C633-4D5D-A5D5-42952E6FFC28@prograde.net>
	<4D502727.5010208@keymile.com>
	<9B4086AB-27D0-4EEE-9915-5F4CE94CED04@p rograde.net>
To: Michael Cashwell <mboards@prograde.net>
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	stefan.bigler@keymile.com, Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 7, 2011, at 2:04 PM, Michael Cashwell wrote:

> To avoid masking the failure I think I need to collect information =
into a static buffer and printk the buffered data only on the error =
path. That way, the timing of the code hopefully won't change enough to =
hide the problem. That's more complicated to do, of course.
>=20
> More as I find it.

I added a simple buffer to log the last N map_writes() in =
cfi_cmdset_0001.c. As expected, I had to be very selective about what =
and how much to log and the logging code itself could take enough on the =
hot path to make my failure vanish. But I have been able to distill down =
the results.

It doesn't look like a threading/locking/mutex problem after all. It =
looks like a straight timing issue on these chips. Here's my reduced =
log:

Dumping flash write history:
... ongoing write buffer data ...
...cfi_cmdset_0001.c line 1793 writes 216c  <     last data word
...cfi_cmdset_0001.c line 1808 writes 00d0  <---  write confirm
...cfi_cmdset_0001.c line 1051 writes 0050  +	  presumably the buffer =
write finished and called put_chip.
...cfi_cmdset_0001.c line 1052 writes 00d0  + <-- put_chip(), oldstate =
FL_ERASING -> erase resume.
...cfi_cmdset_0001.c line 1053 writes 0070  +     =3D=3D 20=B5s delay or =
discard-read of status register here hides problem =3D=3D=3D
...cfi_cmdset_0001.c line 832 writes 00b0   <---| erase suspend.
...cfi_cmdset_0001.c line 839 writes 0070   <---| presumably in =
get_chip/chip_ready for FL_WRITING at start of
...cfi_cmdset_0001.c line 1743 writes 00e8  <---  buffer write
...cfi_cmdset_0001.c line 1771 writes 01ff  <---  number of words
...cfi_cmdset_0001.c line 1793 writes 0001  <     data word 1
... 510 words of data ...
...cfi_cmdset_0001.c line 1793 writes 5c0c  <     data word 512
...cfi_cmdset_0001.c line 1808 writes 00d0  <---  write confirm
...cfi_cmdset_0001.c line 1829 writes 0050  +     write error path
...cfi_cmdset_0001.c line 1830 writes 0070  +     write error has been =
sensed
NOR Flash: buffer write error (block locked) status 0xffff (priv =3D =
(null), chip =3D c7cf2ef8)
UBI error: ubi_io_write: error -30 while writing 1960 bytes to PEB =
30:57800, written 568 bytes
UBI warning: ubi_eba_write_leb: failed to write data to PEB 30
UBI warning: ubi_ro_mode: switch to read-only mode
UBIFS error (pid 404): ubifs_wbuf_write_nolock: cannot write 1956 bytes =
to LEB 17:57664, error -30
UBIFS warning (pid 404): ubifs_ro_mode: switched to read-only mode, =
error -30

So when a buffered write fails, it's when the previous write suspended =
an erase. But more specifically, it seems that if the suspended erase is =
resumed and then immediately suspended again things go off the rails. =
This is between entries for lines 1053 and 832 above.

The chip seems to malfunction if an erase-resume is followed "too soon" =
by an erase-suspend.

I'd like to do things like sys_gettid() or perhaps get_timeofday() but I =
find that if I log more than 2 words per map_write() the failure is =
masked. Still working on that.

The only other thing I've done is ensure that following an erase-suspend =
for (;;) loop that map_word_bitset(map, status, CMD(0x40)) is true. If =
not then the erase that was being suspended completed instead (which can =
happen according to the data sheet). That assertion has not failed in my =
testing so that's not my problem.

I'm still digging but it's really looking like a straight timing problem =
with this batch of chips. At what point should I declare defeat and =
propose my simple fix even though it's just for these chips? The file =
has several instances of similar "Parts XYZ act funny without this even =
though it should be unnecessary" workarounds.

-Mike
