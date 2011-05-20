Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNLzu-00052I-3Y
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 09:27:54 +0000
Received: by eyh6 with SMTP id 6so1332898eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 02:27:52 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: document the "free space fixup" flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1305783137-13374-1-git-send-email-mlcreech@gmail.com>
References: <1305197870.2713.95.camel@localhost>
	<1305783137-13374-1-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 12:24:01 +0300
Message-ID: <1305883441.2630.122.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 01:32 -0400, Matthew L. Creech wrote:
> Several parts of the UBI and UBIFS documentation already mention the need to
> use ubiformat when flashing UBIFS images.  Add a new FAQ entry for the "free
> space fixup" flag as an alternative in recent kernels, and put links to it in
> these existing locations.
> ---

Pushed, thanks. I've only added few changes as a patch on top of yours,
also pushed.

> -why you should use <code>ubiformat</code>.</p>
> +why you should use <code>ubiformat</code>, or generate your UBIFS images with
> +the <a href="ubifs.html#L_free_space_fixup">free space fixup</a> flag if that
> +is not possible.</p>

I've removed this change because the first link already contains the
"fixup" link.

Pluse I've updated news and added a bit more information about the fixup
thingy.

Thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
