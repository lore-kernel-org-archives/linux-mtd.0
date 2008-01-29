Received: from mail4.sea5.speakeasy.net ([69.17.117.6])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJjLJ-0003ab-1D
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 05:49:15 +0000
Received: from dsl093-132-204.sfo4.dsl.speakeasy.net (HELO [192.168.1.111])
	(msundius@[66.93.132.204]) (envelope-sender <msundius@sundius.com>)
	by mail4.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 29 Jan 2008 05:48:51 -0000
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: 7bit
Message-Id: <dd468eb92fb185c81196168801fe6330@sundius.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
To: linux-mtd@lists.infradead.org
From: C Michael Sundius <msundius@sundius.com>
Subject: trouble looking up files after mount
Date: Mon, 28 Jan 2008 21:48:50 -0800
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I just started in on a contract that has a JFFS problem. my client is
in the midst of moving to 2.6.10 from 2.4.

They are mounting a jffs file system as root right off the bat with
no initrd, and while it seems to mount OK, no files subsequent
to the mount are found - I get errors indicating it cannot find
the console device and the init program. path_lookup seems
to return ENOENT. I have a BDI debugger and I have seen that
control gets to jffs2_lookup() but it doesn't find any files in the
root directory.

I checked a more recent version of mkfs.jffs2
and it seems to creat the same FS image as what we have
been using (sum gives same results) I think it was version
mtd-utils 1.0.0. my tools didnt'tcompile later versions
easily.

I'm very sure that the endian is not a probelm, I'm using
big throughout.

Here are my questions:
1) Should I really be telling my client to use an initrd? or can
they really get away without it - It was working fine without it
on 2.4. OR should I be telling him to use a more recent version
of linux.
2) Do I need to be using a newer version of mkfs.jffs2?
3) I did not fiddle with any of the advanced compression stuff
in the 2.6 jffs2 configuration.. I'm pretty sure I shouldn't touch
that, rite?
4) Does anyone have some thoughts about where I should be
looking.. it seems as though jffs should be stable enough
to at least read a directory... could it be my old compiler/tools?

thanks for your help...



C Michael Sundius
Solico Group LLC
232 Nevada St
San Francisco, CA 94110
msundius@sundius.com
(415)608-0121
http://www.sundius.com
