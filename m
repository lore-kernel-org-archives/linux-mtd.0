Received: from [203.34.180.8] (helo=mail.microbits.com.au)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 154e1R-0006Js-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 08:34:34 +0100
Message-Id: <sb13d79c.074@mail.microbits.com.au>
Date: Tue, 29 May 2001 17:08:33 +0930
From: "Daniel Cox" <DCox@microbits.com.au>
To: <linux-mtd@lists.infradead.org>
Subject: Grub
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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

Hi,

I am trying to use Grub on a DOC2000.

Using Kernel 2.4.5 and MTD from 28May.
Grub 0.5.95 from (www.gnu.org/software/grub) with both patches -doc & =
-doc-boot applied.
There is no patch for .5.96 and I cant find grub .5.97!

I have built the grub_firmware and installed with doc_loadbios - Grub =
loads correctly on rebooting.=20
However even with the --enable-diskonchip option for ./configure, root =
(dc0) does not work - selected disk does not exist!
For now I am running from a hard disk (hd0).

Once the firmware is installed, the following appears
  Could not find valid boot record
  Could not mount NFTL device

nftl_format works but removes the firmware.

How can I get the firmware installed along with a formatted partition?

How can I access the DOC device from Grub?

Does JFFS work with the DOC? I read the archive and it was recently =
mentioned that it does not work.

Thanks for your help.
Daniel.
