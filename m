Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6w0B-0004IR-GK
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 14:28:52 -0500
Received: from dsl-082-082-158-091.arcor-ip.net
	([82.82.158.91]:34930 helo=zappa ident=mail)
	by mail.ku-gbr.de with asmtp (Exim 4.24 #1 (Debian))
	id 1D6w09-0003rF-GE
	for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2005 20:28:49 +0100
Received: from [10.10.0.17] (helo=sexmachine.doom)
	by zappa with esmtp (Exim 3.36 #1 (Debian)) id 1D6w08-0005Hh-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2005 20:28:48 +0100
Received: from konsti by sexmachine.doom with local (Exim 4.43)
	id 1D6w07-0002bS-5E
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 20:28:47 +0100
Date: Thu, 3 Mar 2005 20:28:47 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050303192846.GA9989@ku-gbr.de>
References: <20050303140816.GA17270@synertronixx3>
	<6934efce05030310155f826538@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6934efce05030310155f826538@mail.gmail.com>
Subject: Re: xip AND sync burst modus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-03 10:15 -0800 schrieb Jared Hulbert:

> What is PageModeEmulation?

That is a access mode which is a bit faster than the classical 
bus arbitration mode possible with the interface between the i.MX cpu
and the intel K3 devices. I think this is nit i.MX specific but intel
specific to their sync burst devices.

> > But XIP is only saving time on my computer, if I succesfully enable the
> > sync burst modus of the flash interface.
> 
> I don't understand this statement.  Can you clarify?

I wan't to save boot up time on this computer. xip saves time there due
to the fact it does not copy itself into SDRAM.

> > crc32 around varying regions with different length _always_ have same
> > checksums when repeated.
> 
> Can you give an example?
> Is the crc32 for a given length always the same?

Yes.

> If the XIP kernel is working but jffs2 fails I would assume one of the
> following is true:
> 1-your kernel code is not bursting
> 2-your jffs2 image is bad
> 3-your jffs2 code is bad
> 4-your flash is in status mode when the system starts mounting

I later figured out this evening, that mounting the jffs2 breaks even
with kernel running out of SDRAM with sync burst enabled in the same
way (same sector addresses).
So 1 is false, 2 also since the same image works fine when not bursting.
The jffs code _may_ be bad because a delay is required after probing
before mounting the flash.
So 3 is true or 4 or still my fault because I am to stupid to set up
burst mode.
My initial mail was also intended to get to know, if there are any
people who say they implemented the same and their hardware is ok and
bursts fine with jffs2.

> I would try another flash based fs.  If another flash based fs mounts.
>  Then it is less likely 2,3, and 4 are problems.  Try using cramfs
> patched with the CELF cramfs-linear-xip-3.patch from
> http://tree.celinuxforum.org/CelfPubWiki/PatchArchive it doesn't patch
> cleanly to 2.6.10 but the fix is easy to do manually.

Does this apply to 2.6.11-rc2 also? I will try to do so.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
