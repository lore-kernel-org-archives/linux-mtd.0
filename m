Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5ygm-0005Z5-T9
	for linux-mtd@lists.infradead.org; Wed, 13 Oct 2010 10:36:09 +0000
Received: by wyg36 with SMTP id 36so134933wyg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Oct 2010 03:36:02 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Karl Beldan <karl.beldan@gmail.com>
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
	<1286825063.1742.13.camel@brekeke>
	<AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
Date: Wed, 13 Oct 2010 12:35:56 +0200
In-Reply-To: <AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
	(Karl Beldan's message of "Tue, 12 Oct 2010 15:16:40 +0200")
Message-ID: <87zkui2xdf.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Karl" == Karl Beldan <karl.beldan@gmail.com> writes:

Hi,

 >> But how about teaching squashfs to understand mtdX and mtd:name syntax
 >> instead?

 Karl> I would not do that, squashfs and co just ask for a block device,
 Karl> putting mtdx syntax awareness in each of them just does not seem
 Karl> a good fit to me.

FYI, patches for direct mtd access in squashfs (E.G. for systems not
needing the block layer at all) were posted a while ago:

http://thread.gmane.org/gmane.linux.kernel/962226/focus=968074

-- 
Bye, Peter Korsgaard
