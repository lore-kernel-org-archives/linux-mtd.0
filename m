Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OG4e1-00089h-0A
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 06:26:41 +0000
Received: by fxm15 with SMTP id 15so1869913fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 May 2010 23:26:39 -0700 (PDT)
Subject: Re: how to pre-screen patch submissions from a newbie janitor?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
In-Reply-To: <alpine.DEB.2.00.1005181936120.3484@lynx>
References: <alpine.DEB.2.00.1005181936120.3484@lynx>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 23 May 2010 09:26:36 +0300
Message-Id: <1274595996.8881.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-18 at 19:40 -0400, Robert P. J. Day wrote:
> not that long ago, i suggested cleaning up the MTD Kconfig/Makefile
> structure since there was some definite redundancy in the inclusion of
> source files and subdirectories.  now, i could whip up those patches
> myself and submit them, but i have a local friend who's itching to get
> start doing some simple kernel work and submitting some patches, and
> he's more than smart enough to do what i described above.
> 
>   however, since he's new to patch creation and submission, i offered
> to "vet" his patches first.  i realize that my vetting carries no
> weight on the MTD list, but given that i've submitted lots and lots of
> patches elsewhere, i can still at least sanity check what he comes up
> with before it hits the list.
> 
>   is there a canonical signage for that nowadays?  is it "Reviewed-By"
> or something like that?  so that by the time it gets to the MTD list,
> he would have done the "Signed-Off-By" and i'd sign off as a reviewer.
> is that the way it works?  or is there an alternative?  thanks.

Hi,

MTD list is not something special, common Linux kernel patch submission
practices apply. So obviously, he signs off his patches, you can review,
test, ack or sign off it. I am not pedantic about which tag to use, but
you can always refer to 'Documentation/SubmittingPatches' and pick the
right one.
 
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
