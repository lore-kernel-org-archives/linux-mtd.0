Received: from mail.dekaresearch.com ([208.65.175.196]
	helo=dekaexchange07.deka.local)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9d9Z-0007pD-Ms
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 12:57:10 +0000
From: Atlant Schmidt <aschmidt@dekaresearch.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 12 Apr 2011 08:57:05 -0400
Subject: I don't understand how the counter for erasures is being maintained
	during erase failures
Message-ID: <0A40042D85E7C84DB443060EC44B3FD328119F6E7D@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks:

On my linux system (running MTD/UBI/UBIfs), the following
event occurred:


  [62452.439299] UBI error: ubi_io_write: error -5 while writing 516096 byt=
es to PEB 3982:8192, written 503808 bytes
  [62452.465874] UBI: run torture test for PEB 3982
  [62463.910000] UBI: PEB 3982 passed torture test, do not mark it a bad
  [62466.666439] UBI error: ubi_io_write: error -5 while writing 516096 byt=
es to PEB 3982:8192, written 503808 bytes
  [62466.693753] UBI: run torture test for PEB 3982
  [62477.763592] UBI: PEB 3982 passed torture test, do not mark it a bad
    :
    :
  [62622.746585] UBI error: ubi_io_write: error -5 while writing 516096 byt=
es to PEB 3982:8192, written 503808 bytes
  [62622.801612] UBI: run torture test for PEB 3982
  [62633.821650] UBI: PEB 3982 passed torture test, do not mark it a bad
  [62636.629686] UBI error: ubi_io_write: error -5 while writing 516096 byt=
es to PEB 3982:8192, written 503808 bytes
  [62636.661260] UBI: run torture test for PEB 3982
  [62643.962758] UBI error: torture_peb: read problems on freshly erased PE=
B 3982, must be bad
  [62643.992792] UBI error: erase_worker: failed to erase PEB 3982, error -=
5
  [62644.022791] UBI: mark PEB 3982 as bad
  [62644.045182] UBI: 37 PEBs left in the reserve


At this point, I dumped out the contents of PEB 3982:

  /> ubi_dump.pl 3982
  PEB f8e (3982):  ec magic number is not correct. Is: 5a5a5a5a   Should be=
: 55424923
  PEB 3982:
    00000000:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5=
A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
    00000020:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5=
A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
    00000040:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5=
A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
    00000060:   5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5A5A 5A5A5=
A5A 5A5A5A5A  ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
      :
      :


So that PEB no longer contains any ubi_ec_hdr struct.

What happens next?

When I reboot, this block *HASN'T* been added to the bad block
list (nor were the other two blocks "marked as bad" during this
linux boot session). And after the reboot, my script reports
the following information about PEB 3982:

  /> ubi_dump.pl 3982
  PEB f8e (3982):  Erased 16
  Minimum erase count: 16
  Average erase count: 16 computed across 1 blocks
  Maximum erase count: 16


This can't be accurate -- the block was tortured 14 times
during the failure and each torture represents three erase/
write cycles, right? (Per torture_peb(), OxA5, 0x5A, and 0x00.)
So even if this block had somehow been "virgin" (and it's
certainly not!), it should now have an erase count of at
least 3*14=3D42, just considering the torturing.

Also, given that it failed to erase (or at least couldn't be
successfully read when freshly erased), why doesn't the block
permanently join the pool of bad PEBs?

                           Atlant


This e-mail and the information, including any attachments, it contains are=
 intended to be a confidential communication only to the person or entity t=
o whom it is addressed and may contain information that is privileged. If t=
he reader of this message is not the intended recipient, you are hereby not=
ified that any dissemination, distribution or copying of this communication=
 is strictly prohibited. If you have received this communication in error, =
please immediately notify the sender and destroy the original message.

Thank you.

Please consider the environment before printing this email.
