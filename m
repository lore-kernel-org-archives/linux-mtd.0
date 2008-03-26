Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeMyk-0002D4-3G
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 04:11:10 +0000
Received: by wf-out-1314.google.com with SMTP id 29so3154504wff.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Mar 2008 21:11:08 -0700 (PDT)
Message-ID: <bae050c10803252111y4a79334l6e09567d54a0539e@mail.gmail.com>
Date: Wed, 26 Mar 2008 12:11:08 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: UBI: about ubinize tool
In-Reply-To: <bae050c10803252102k373c5bddudda56bba12a0979f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803252102k373c5bddudda56bba12a0979f@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry, wrong key make the unfinished mail sent.

   If the input file which needed by ubinize can be the image file
created by mkfs.ubifs(eg: ubifs.img), then how to use the output ubi
image file (eg: ubi.img)?
Use the same tool "ubiupdatevol "?  ubifs.img works fine with
ubiupdatevol, but ubi.img can't. Sure it can't, how can one tool treat
different format image file the same? Would you please tell me a way
to use ubi.img?


--
Best wishes,
Nancy
