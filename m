Received: from patan.sun.com ([192.18.98.43])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NOxO-00040K-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 02:19:54 +0100
Message-ID: <3B578A10.2475DD64@sun.com>
Date: Thu, 19 Jul 2001 18:32:00 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: Eric <ebrower@usa.net>, MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [structure field names]
References: <20010720011341.17284.qmail@nwcst289.netaddress.usa.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Eric wrote:
> 
> There is a patch for SPARC/Linux in the patches directory
> that performs 32- to 64-bit ioctl conversions.  If you
> touch any struct member names that are used as ioctl args
> this patch will need to be rev'ed as well.
> 
> Also, I just sent a new patch to Dave Miller this morning
> for an update to these ioctl conversions-- if he accepts
> it, I will update the patch in MTD CVS (which will then
> need to merge with your changes).
> 
> Do you plan to change any of those ioctl args in mtd.h?

I was just planning to change the map_info, cfi_private, mtd_info
structures, so that the fields were more descriptive:

size -> map_size
size -> mtd_size

And the likes.  Trying to decipher the MTD layer is very hard right now :)

If there are any problems with Sparc patches, I can talk to Dave, he is
always hanging around here.

Tim
-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
