Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14udhP-0005c3-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 18:12:34 +0100
Received: from [62.178.143.33] (helo=gatekeeper.home.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14udhg-0006Bl-00
	for linux-mtd@lists.infradead.org; Tue, 01 May 2001 18:12:48 +0100
From: "Erwin Authried" <eauth@softsys.co.at>
To: "'Matthew D Hancher'" <mdh@MIT.EDU>,
	<jffs-dev@axis.com>
Cc: "'Stephen Brasher'" <sbrasher@cirilium.com>,
	<uclinux-dev@uclinux.org>,
	<linux-mtd@lists.infradead.org>
Subject: RE: jffs, uxlinux, intel flash
Date: Tue, 1 May 2001 18:27:36 +0200
Message-ID: <000001c0d25b$a410df80$6401a8c0@home.at>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200105011626.MAA10533@bunsen-and-beaker.mit.edu>
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

> -----Original Message-----
> From: owner-jffs-dev@axis.com 
> [mailto:owner-jffs-dev@axis.com]On Behalf
> Of Matthew D Hancher
> Sent: Tuesday, May 01, 2001 6:27 PM
> To: jffs-dev@axis.com
> Subject: jffs, uxlinux, intel flash
> 
> 
> I have a custom DragonBallEZ-based board (uClinux) with a 2MB Intel
> flash device (28F160C3-T). I would like to get Linux to recognize the
> flash device, and then to get jffs on it. I am told this has been done
> before. Unfortunately all the detailed information I've been able to 
> find online relates to MTD and so doesn't apply to uClinux.
> 
> The (first) trouble is it looks (at first glance at least) like the 
> standard flash driver doesn't support Intel flash at all. Is this 
> true? I had been told otherwise, but not by any particular authority.
> 
> Secondly, since I have no non-volatile storage device other than the 
> flash chip in question, I will need to have the jffs 
> filesystem occupy 
> only the upper part of the flash device, with the kernel occupying 
> the lower part. It is not clear to me how to do this; first it is not 
> clear how I copy my jffs filesystem image into only the upper half, 
> and second it is not clear how to tell mount where to look for it.
> 
> Thanks in advance for helping set this new user straight. Any 
> additional 
> advice regarding getting jffs running under uClinux would be most 
> welcome.
> 
Matthew,

I'm not sure about the Intel Flash support, but I think it is
supported by cfi_cmdset0001.c. I have modified the core of MTD
to support uClinux, I have a small README for MTD with uClinux
in my uClinux Directory at http://uclinux.home.at/. I haven't 
ported back JFFS, but Stephen Brasher was working on JFFS support,
in uClinux, when I remember correctly. 

-Erwin
