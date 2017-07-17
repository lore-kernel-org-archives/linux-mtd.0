Received: from smtp1.ascom-ws.com ([195.81.148.76] helo=mail.ascom-ws.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dX5By-0006Al-T5
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 12:32:04 +0000
From: Danesh Daroui <Danesh.Daroui@ascom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Why data is moved upon fixable bit-flip
Date: Mon, 17 Jul 2017 12:31:43 +0000
Message-ID: <39BC08CB3FF4C84CB6397533D4FC79097E950CA8@SEGOTEXCH02.ascom-Resource.ads>
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

Hi all,

I am running some torture tests on a NAND flash memory having UBIFS on it. =
Running the tests for few days shows some errors which are apparently fixab=
le by UBI. Some errors look like:

UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 557
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1627
UBI: run torture test for PEB 1627
UBI: PEB 1627 passed torture test, do not mark it a bad
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 557
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1627
UBI: run torture test for PEB 1627
UBI: PEB 1627 passed torture test, do not mark it a bad
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 557
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1627
UBI: run torture test for PEB 1627
UBI: PEB 1627 passed torture test, do not mark it a bad

which are promising since it seems that the file system has been able to fi=
x the error as it says "fixable bit-flip'. However, some other errors are l=
ike:

UBI DBG (pid 1691): ubi_io_read: fixable bit-flip detected at PEB 1546
UBI DBG (pid 1691): ubi_wl_scrub_peb: schedule PEB 1546 for scrubbing
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1546
UBI: scrubbed PEB 1546 (LEB 3:177), data moved to PEB 1875
UBI DBG (pid 1691): ubi_io_read: fixable bit-flip detected at PEB 217
UBI DBG (pid 1691): ubi_wl_scrub_peb: schedule PEB 217 for scrubbing
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 217
UBI: scrubbed PEB 217 (LEB 3:937), data moved to PEB 1875
UBI DBG (pid 1691): ubi_io_read: fixable bit-flip detected at PEB 1546
UBI DBG (pid 1691): ubi_wl_scrub_peb: schedule PEB 1546 for scrubbing
UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1546
UBI: scrubbed PEB 1546 (LEB 3:1054), data moved to PEB 1875

This is a bit strange though, because the data is moved even when the error=
 was fixable because of bit-flip as the log says.

Now I would like to know why the data is moved even when it is fixable? Is =
it something that we need to be worried about? Why the bit-flip is not simp=
ly corrected as it is in the former case but it is rather scrubbed and the =
data is moved? Also, will the PEB be marked as unusable bad cell when it is=
 scrubbed and the data is moved to another PEB?

Thanks a lot for your help,

Danesh Daroui
