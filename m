Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNMju-0005PL-Dq
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 10:15:27 +0000
Received: by bwz1 with SMTP id 1so3509634bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 03:15:23 -0700 (PDT)
Subject: Re: [PATCH 1/1] mkfs.ubifs: add "-F" option for "free-space fixup"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1305147748-13632-1-git-send-email-mlcreech@gmail.com>
References: <BANLkTikn3wMZOKAd8qgmo_k9QeDPL3nv0g@mail.gmail.com>
	<1305147748-13632-1-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 13:11:32 +0300
Message-ID: <1305886292.2630.125.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: bengardiner@nanometrics.ca, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-05-11 at 17:02 -0400, Matthew L. Creech wrote:
> This adds a superblock flag indicating that "free-space fixup" is needed, and
> allows it to be set by the user via the "-F" command-line option.  The first
> time the filesystem is mounted, this flag will trigger a one-time re-mapping of
> all LEBs containing free space.  This fixes problems seen on some NAND flashes
> when a non-UBIFS-aware flash programmer is used.
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>

I've tweaked your patch and added some more help text and pushed,
thanks.

I think we'll need to make a new mtd-utils release at some point. We
need to wait a bit and let people test this a bit more. Please, be
encourage to remind me to release mtd-utils if I forget about this.
Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
