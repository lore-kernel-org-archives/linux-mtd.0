Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtFsj-0001Qg-Ab
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 08:19:50 +0000
Received: by bwz13 with SMTP id 13so6508414bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 01:19:48 -0700 (PDT)
Subject: Re: NOTE! mkfs.ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4C8612B9.4060305@nokia.com>
References: <1283848562-19564-1-git-send-email-dedekind1@gmail.com>
	<1283850698.2979.25.camel@localhost>  <4C8612B9.4060305@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Sep 2010 11:18:19 +0300
Message-ID: <1283933899.2979.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Arno Steffen <arno.steffen@googlemail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-07 at 13:23 +0300, Adrian Hunter wrote:
> I do not agree with changing the behaviour.  It should be a new option,
> and you could add a warning explaining what the root inode permissions
> are and why e.g.
> 
> 	Warning: Option ?? not used. Setting root inode permissions to blah
> 
> 	Warning: Option ?? used. Setting root inode permissions to blah

Sent you v2 of this patch with an alternative (less harsh) solution.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
