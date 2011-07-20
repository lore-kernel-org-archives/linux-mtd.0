Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjPCR-00055U-3I
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 05:19:59 +0000
Received: by iwn35 with SMTP id 35so5292114iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2011 22:19:56 -0700 (PDT)
Subject: Re: Regression in handling of unsafe UBI shutdown
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Mack <zonque@gmail.com>
Date: Wed, 20 Jul 2011 08:21:18 +0300
In-Reply-To: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
References: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311139283.20738.150.camel@sauron>
Mime-Version: 1.0
Cc: Sven Neumann <s.neumann@raumfeld.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-07-19 at 15:57 +0200, Daniel Mack wrote:
> UBIFS: recovery needed
> Error reading superblock on volume 'ubi:RootFS'!
> UBIFS not mounted, use ubifs mount to mount volume first!
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!
> 
> 
> Hence my question is: were there any radical changes in the UBI/UBIFS
> code on the kernel side that make older code not like the new content
> anymore?

Daniel, sorry, I have no time to look at this now, could you please try
to bisect the issue?

-- 
Best Regards,
Artem Bityutskiy
