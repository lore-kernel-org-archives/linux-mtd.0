Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cr0gu-0004nX-BX
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 16:15:09 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41ED50B7.9000107@redhat.com>
References: <41ED2EB3.1070203@redhat.com>
	<1106068748.16877.109.camel@tglx.tec.linutronix.de>
	<41ED50B7.9000107@redhat.com>
Content-Type: text/plain
Date: Tue, 18 Jan 2005 22:15:05 +0100
Message-Id: <1106082905.16877.141.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: additional error checks for AG-AND erase/write
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-01-18 at 12:08 -0600, David A. Marlin wrote:
> Yes.  Please see the flowcharts on pages 35 and 36 of the HN29V1G91T-30 
> data sheet.  They show the additional checks I referred to.

Oops, I missed them. So you have to go through the page, read it back,
do the RS error correction and check, whether the number of corrected
bit errors = 1 or not. Interesting.

> I would not disagree, but the Renesas considers this a "feature" of 
> their chips that they would like to see supported.  It could be that 
> they are trying to avoid marking blocks bad, since doing so makes 128KiB 
> unusable (JFFS2 virtual erase block size), and they think it is worth 
> the performance hit.  I'm just trying to figure out if it is practical 
> to implement in the current driver.

Hmm. Everything is possible. It's in the error path anyway so it does
not hurt anybody. What we can do to avoid the deadlock is:

Rename nand_read_ecc to do_nand_read_ecc and add an flag argument. Look
at the erase function, where we have the additional argument for
allowbbt. 
flag bits:	0-7 tolerable errors
		8   do not get chip
or something like that.
Create a new wrapper function nand_read_ecc which calls do_nand_read_ecc
with flags = 0xff. Depending on this argument we grab the device and
release it on the end and react on the error check.
The same call can be done from erase in the failure path. 

To make this actually work we should add a member like
int (*ext_errchk) (.....)
which is checked in the error path
if (this->ext_errchk) {
	res = this->ext_errchk(....);
}
This is a board supplied function, as the board driver knows how much
errors are acceptable. We return the number of corrected bits anyway in
the correct_data() function, but we check only for -1 at the moment.
An additional check does not hurt here, as we are in the slow path
again. We check the return value of correct_data() for 
(res == -1 || res > flags & 0xff) which ensures in the normal case this
tolerance will never bite us, as error correction of 256 bits is unreal.

Hope that helps. I think this will make the code not uglier than it is
anyway and keeps it nicely dependend on the board drivers featurelist.

tglx
