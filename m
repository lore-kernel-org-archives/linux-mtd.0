Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hGqG-0006v5-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 22:47:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <004801c24892$eead6000$7800000a@derelict> 
References: <004801c24892$eead6000$7800000a@derelict> 
To: "Christopher Hoover" <ch@murgatroid.com>
Cc: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>,
    "'Jamey Hicks'" <jamey.hicks@hp.com>,
    "'Conn Clark'" <clark@esteem.com>,
    "'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: Re: How does one mount an existing jffs2 partition so it is writeable? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 20 Aug 2002 22:46:57 +0100
Message-ID: <10406.1029880017@redhat.com>
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

ch@murgatroid.com said:
> That was my first thought. I submitted such a patch (-- it should be
> in the archives), but IIRC David didn't want it applied to CVS.  He
> suggested that I move this to the SA-1100 partition code.   I did
> that, but that has its own ugliness.

I never claimed not to be fickle. If your patch did the unlock 
automatically _only_ for the C3 flash which locks itself every power cycle, 
try me again :)

--
dwmw2
