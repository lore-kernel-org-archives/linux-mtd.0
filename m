Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OEWPK-0000Lv-4b
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 23:41:06 +0000
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OEWPF-00085r-PW
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 19:41:01 -0400
Date: Tue, 18 May 2010 19:40:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: how to pre-screen patch submissions from a newbie janitor?
Message-ID: <alpine.DEB.2.00.1005181936120.3484@lynx>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  not that long ago, i suggested cleaning up the MTD Kconfig/Makefile
structure since there was some definite redundancy in the inclusion of
source files and subdirectories.  now, i could whip up those patches
myself and submit them, but i have a local friend who's itching to get
start doing some simple kernel work and submitting some patches, and
he's more than smart enough to do what i described above.

  however, since he's new to patch creation and submission, i offered
to "vet" his patches first.  i realize that my vetting carries no
weight on the MTD list, but given that i've submitted lots and lots of
patches elsewhere, i can still at least sanity check what he comes up
with before it hits the list.

  is there a canonical signage for that nowadays?  is it "Reviewed-By"
or something like that?  so that by the time it gets to the MTD list,
he would have done the "Signed-Off-By" and i'd sign off as a reviewer.
is that the way it works?  or is there an alternative?  thanks.

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
