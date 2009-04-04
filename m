Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq8rA-0005lQ-7Z
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 16:36:38 +0000
Received: by wf-out-1314.google.com with SMTP id 23so1574716wfg.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Apr 2009 09:36:30 -0700 (PDT)
Date: Sat, 4 Apr 2009 12:36:23 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: new mtd-utils release with mkfs.ubifs
Message-ID: <20090404163623.GA6104@hansolo.jdub.homelinux.org>
References: <20090404125449.GA11964@cloud.net.au>
	<8bd0f97a0904040614y434e8560nb954fcef9bdb5619@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd0f97a0904040614y434e8560nb954fcef9bdb5619@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 04, 2009 at 09:14:16AM -0400, Mike Frysinger wrote:
>On Sat, Apr 4, 2009 at 08:54, Hamish Moffatt wrote:
>> Are there any plans to make another formal release of mtd-utils now that
>> mkfs.ubifs is included and the ubi utilities have been rearranged?
>>
>> This would help with distros that need mkfs.ubifs eg buildroot.
>
>meh, grabbing snapshots from the mtd-utils.git interface is trivial

It is, yes.  But as soon as I get time (and remember how) I'll do
a release.  Might be worth waiting for the 64b-bit and/or > 4GiB
stuff to settle though.

josh
