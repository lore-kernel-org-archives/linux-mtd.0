Received: from na3sys009aog107.obsmtp.com ([74.125.149.197])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOsii-0000Sm-Oy
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 14:36:29 +0000
Received: by mail-bw0-f44.google.com with SMTP id 13so6579414bwz.31
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 07:36:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1305886545.2630.129.camel@localhost>
References: <1305784599.2630.41.camel@localhost>
	<1305807291-12774-1-git-send-email-bengardiner@nanometrics.ca>
	<1305886545.2630.129.camel@localhost>
Date: Tue, 24 May 2011 10:36:25 -0400
Message-ID: <BANLkTimW4zv0fuG=GE3vWUZQ++Nsoyo8AA@mail.gmail.com>
Subject: Re: [PATCH v2] mkfs.ubifs: free-space-fixup: note supported kernels
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, "Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 20, 2011 at 6:15 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> [...]
> After my changes to Matthew's patch and tweaks to your patch I've found
> out that it is cleaner to just fold your patch into Mathew's and make
> one single commit. I've thanked you in the commit message and pushed one
> single commit instead:
>
> http://git.infradead.org/mtd-utils.git/commit/04665066ebedb0a31335b525fb5f19df32cb8cfe
>
> Hopefully you will not mind.

Not at all. I'm happy to see the free-space-fixup merged.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
