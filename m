Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjT7m-00082t-4e
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 09:31:30 +0000
Received: by pvg20 with SMTP id 20so31940pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 02:31:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACTFLANrd0FO9GNJpvS+MxnQgLLtXpA-sai30oYN90cjEFOErA@mail.gmail.com>
References: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
	<1311139283.20738.150.camel@sauron>
	<CACTFLANrd0FO9GNJpvS+MxnQgLLtXpA-sai30oYN90cjEFOErA@mail.gmail.com>
Date: Wed, 20 Jul 2011 11:31:19 +0200
Message-ID: <CACTFLAO0-2QDVxVD0_qFwtExaf3=UHDvZDtSVePEi4ca=DBfbw@mail.gmail.com>
Subject: Re: Regression in handling of unsafe UBI shutdown
From: Daniel Mack <zonque@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sven Neumann <s.neumann@raumfeld.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 20, 2011 at 11:18 AM, Daniel Mack <zonque@gmail.com> wrote:
> Also note that it's not the kernel itself that complains about the
> state of the file system in this case but U-Boot. If we boot a 3.0-rc7
> kernel in such a situation (via USB for example), the kernel will
> recover the FS and continue.

And I forgot to mention that the mtd-toturetest didn't show any
problems, so it's most likely not an issue with the block-device
layer.


Btw - Adrian Hunter's address <adrian.hunter@nokia.com> bounces - can
anyone care to update the UBI record in MAINTAINERS with a new
address? :)


Thanks,
Daniel
