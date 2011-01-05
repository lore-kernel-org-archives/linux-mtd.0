Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaOjH-00004s-CO
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 08:28:24 +0000
Received: by fxm19 with SMTP id 19so14148729fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 00:28:19 -0800 (PST)
Subject: Re: UBIFS reboots issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Boaz Ben-David <boaz.bd@wellsense-tech.com>
In-Reply-To: <39A4B204C321D34DA3490E3B119D5A6C68BF77674A@SBS2008.wellsense.local>
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
	<1293049245.2051.4.camel@koala>
	<39A4B204C321D34DA3490E3B119D5A6C68BF77674A@SBS2008.wellsense.local>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 Jan 2011 10:28:14 +0200
Message-ID: <1294216094.2179.5.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-23 at 14:51 +0200, Boaz Ben-David wrote:
> I am using kernel 2.6.31 for iMX35 and I'm not sure what version of
> UBIFS is patched in there.
> What do I need to do in order to patch to the latest version? 
> Is is enough to clone UBIFS 2.6.31 and copy over the fs/ubifs and
> mtd/ubi directories or are there any other directories I need to take
> into account?

You need to 'git pull' the ubifs-v2.6.31 tree.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
