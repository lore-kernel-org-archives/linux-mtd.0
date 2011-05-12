Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVlR-00025n-1A
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:17:13 +0000
Received: by eyh6 with SMTP id 6so494965eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:17:11 -0700 (PDT)
Subject: Re: [PATCH 1/1] mkfs.ubifs: add "-F" option for "free-space fixup"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1305147748-13632-1-git-send-email-mlcreech@gmail.com>
References: <BANLkTikn3wMZOKAd8qgmo_k9QeDPL3nv0g@mail.gmail.com>
	<1305147748-13632-1-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 16:13:47 +0300
Message-ID: <1305206027.14423.7.camel@localhost>
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
> +"-F, --space-fixup        fixup free space on first mount (needed for some NANDs)\n"

Could you somehow reflect in the --help output in this feature needs
up-to-date kernel. And also in the C comment. You can tell that this
feature was introduce to 2.6.39.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
