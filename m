Received: from [192.55.52.30] (helo=fmsfmr003.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtIiE-0006ec-RS
	for linux-mtd@lists.infradead.org; Wed, 18 Feb 2004 03:49:27 +0000
Received: from petasus.fm.intel.com (petasus.fm.intel.com [10.1.192.37])
	major-outer.mc,v 1.14 2004/01/09 00:51:16 root Exp $) with ESMTP id
	i1I3khfW016925
	for <linux-mtd@lists.infradead.org>; Wed, 18 Feb 2004 03:46:43 GMT
Received: from fmsmsxvs043.fm.intel.com (fmsmsxvs043.fm.intel.com
	[132.233.42.129])
	major-inner.mc,v 1.7 2003/12/18 18:58:10 root Exp $) with SMTP id
	i1I3p1JN004515
	for <linux-mtd@lists.infradead.org>; Wed, 18 Feb 2004 03:51:04 GMT
Received: from fmsmsx331.amr.corp.intel.com ([132.233.42.135])
	M2004021719490325399
	for <linux-mtd@lists.infradead.org>; Tue, 17 Feb 2004 19:49:03 -0800
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Feb 2004 22:49:02 -0500
Message-ID: <BF1FE1855350A0479097B3A0D2A80EE0025ACFE3@hdsmsx402.hd.intel.com>
From: "Chagas, Jason" <jason.chagas@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: Chaining "mtd_info->read" failed !
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I wrote a kernel driver that attempts to sniff MTD flash reads but I ran
into problems. The driver first properly registers itself as an MTD user
(register_mtd_user(&notifier)), receives the expected notifications for
the [3] mtdblock devices on the system, and saves their respective
pointers to the "mtd_info" structure, and finally, replaces the 'read'
structure element with my own "my_read" routine. Here is a simplified
version of "my_read":

----
static int my_read (struct mtd_info *mtd, loff_t from, size_t len,
size_t *retlen, u_char *buf)
{
  /* Sniff data here */

  /* Call original device function */
  return ((mtd_info_ptr)->read)(mtd, from, len, retlen, buf);
}
----

Note, "my_read" simply chains the original 'read' function call in the
"mtd_info" structure. Should have been simple enough, however, when
accessing flash, "my_read" receives a series of repeated messages with
exactly the same values in "loff_t from" and "size_t len" until the
kernel hangs and the kernel heartbeat LED stops blinking.  BTW, "size_t
len" is equal to zero.

Am I missing something? Any ideas?

Thanks,

Jason
