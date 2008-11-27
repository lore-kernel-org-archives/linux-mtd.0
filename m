Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L5dmH-000649-I7
	for linux-mtd@lists.infradead.org; Thu, 27 Nov 2008 10:07:18 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5dmA-0006ZS-GU
	for linux-mtd@lists.infradead.org; Thu, 27 Nov 2008 10:07:10 +0000
Received: from gw-c.sigma-chemnitz.de ([62.153.82.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2008 10:07:10 +0000
Received: from enrico.scholz by gw-c.sigma-chemnitz.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2008 10:07:10 +0000
To: linux-mtd@lists.infradead.org
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH/mtd-utils] Separate '-m' and the mode with a space when
	invoking 'install'
Date: Thu, 27 Nov 2008 10:55:35 +0100
Message-ID: <lywsepxzl4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1227706065-3067-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<8bd0f97a0811261744m71593462md64fd363cbdc5062@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@ger.gmane.org>
Cc: Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Mike Frysinger" <vapier.adi@gmail.com> writes:

>> Some 'install' versions (e.g. this of OpenEmbedded) require
>> the mode to be a separate argument and don't understand the
>> '-m0755' syntax:
>
> then why dont you fix the `install` that comes with OE

Why do you think that this 'install' needs to be fixed?  Although
'install' is not SUSv3, this standard states:

 12.2 Utility Syntax Guidelines
    ...
    Each option and option-argument should be a separate argument,
    except as noted in Utility Argument Syntax , item (2).

When the patch would be more complicated I would agree to assume
the GNU implementation of 'install' but as it is really trivial
to add a single space, the common compatibility rules should be
followed.


> rather than spuriously patching random build systems out there
> ?

At least 'autoconf' and 'imake' handle it correctly:

| INSTALL_DATA = ${INSTALL} -m 644
| #define InstBinFlags -m 0755



Enrico
