Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1mWN-0000HD-QW
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2010 20:15:44 +0000
Received: by wwg30 with SMTP id 30so3020408wwg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Apr 2010 13:15:40 -0700 (PDT)
MIME-Version: 1.0
Sender: jonringle@gmail.com
Date: Tue, 13 Apr 2010 16:15:40 -0400
Message-ID: <n2g152584231004131315ge1d824bfm6820ccb877a0fde6@mail.gmail.com>
Subject: Erase race?
From: Jon Ringle <jon@ringle.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a few machines that have UBI and UBIFS on NOR flash that are
undergoing continuous reboot testing.
One of them just caught the following failure:

[=A0=A0 51.250000] IXP4XX-Flash.0: buffer write error (status 0xd0)
[=A0=A0 51.250000] UBI error: ubi_io_write: error -22 while writing 64
bytes to PEB 226:0, written 0 bytes
[=A0=A0 51.270000] UBI error: erase_worker: failed to erase PEB 226, error =
-22
[=A0=A0 51.270000] UBI warning: ubi_ro_mode: switch to read-only mode
[=A0=A0 51.290000] UBI error: do_work: work failed with error code -22
[=A0=A0 51.290000] UBI error: ubi_thread: ubi_bgt0d: work failed with error=
 code -22

Looking at this it appears that the failure might have been caused due
to the erase_worker and ubi_io_write occurring out of order... since
it looks like ubi_io_write was trying to write at offset 0 of the PEB,
which I imagine would have to be the EC header, which should happen
after the block is erased. But it doesn't seem to be the case here.

Jon
