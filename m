Received: from gamwsm02.mwga.mailwatch.com ([216.157.255.16])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIc5S-00019V-3B
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 21:11:08 -0400
Received: from gamwsc12.mwga.mailwatch.com
	(ltm-3-4-floating.mwga.mailwatch.com [216.157.255.9])
	by gamwsm02.mwga.mailwatch.com (8.13.4/8.12.9) with ESMTP id
	j8MJWadq001292 for <linux-mtd@lists.infradead.org>;
	Thu, 22 Sep 2005 15:32:36 -0400 (EDT)
Received: from linkex.interlink.local ( [207.178.156.186] (may be forged))
	by gamwsm07.mwga.mailwatch.com (8.13.4/8.12.9) with ESMTP id
	j8MJWZhX000732 for <linux-mtd@lists.infradead.org>;
	Thu, 22 Sep 2005 15:32:35 -0400 (EDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Sep 2005 12:32:37 -0700
Message-ID: <BF08AC56BA03AE4C93BC111167C8725393C001@linkex2.interlink.local>
From: "Van Beveren, David" <dvanbeveren@interlinkelec.com>
To: <linux-mtd@lists.infradead.org>
Subject: Raw character access to mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At the following MTD documentation page:

http://www.linux-mtd.infradead.org/doc/general.html

There is a reference to a planned user agent for raw character access of
mtd partitions.=20

Should I be able to read and write to my (NOR flash) /dev/mtdc1 given it
is correctly aligned on an erase sector boundary? Can I treat this
device the same way I would treat a file with respect to simple
open/lseek/read/write/close system calls?

Or, do I need a user module of some kind? If so, guidance on where to
look would be appreciated.=20

Thanks,

David
*********************************
**** Appended by Interlink Electronics. ***** 
This e-mail and any attachments may contain information which is confidential, proprietary, privileged or otherwise protected by law. The information is solely intended for the named addressee (or a person responsible for delivering it to the addressee). If you are not the intended recipient of this message, you are not authorized to read, print, retain, copy or disseminate this message or any part of it. If you have received this e-mail in error, please notify the sender immediately by return e-mail and delete it from your computer.
