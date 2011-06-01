Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRn1s-0005fW-3D
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 15:08:16 +0000
Received: by ewy3 with SMTP id 3so2263118ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 08:08:14 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: fixup merged 'UBIFS: fix-up free space earlier'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <1306940008-28454-1-git-send-email-bengardiner@nanometrics.ca>
References: <1306923407.4405.94.camel@localhost>
	<1306940008-28454-1-git-send-email-bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 18:03:51 +0300
Message-ID: <1306940631.4405.122.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Matthew
	L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-01 at 10:53 -0400, Ben Gardiner wrote:
> When the patch 'UBIFS: intialize LPT earlier' was massaged before being applied
> the context of the next patch 'UBIFS: fix-up free space earlier' was muddled
> sufficiently for the order of allocate-lpt then free-space-fixup was reversed --
> I think.
> 
> Put the free-space-fixup after allocate-lpt.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

I'll take a look at this and fold this change in a bit later, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
