Received: from wx-out-0506.google.com ([66.249.82.226])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnYRr-0004zb-GV
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 12:47:27 +0000
Received: by wx-out-0506.google.com with SMTP id s15so856817wxc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Oct 2008 05:47:26 -0700 (PDT)
Date: Wed, 8 Oct 2008 08:46:07 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Michel Stempin <michel.stempin@telecom-design.com>
Subject: Re: [PATCH] [MTD] gen_probe.c: Probe chips in decreasing device
	size (most significant first)
Message-ID: <20081008124607.GD3447@yoda.jdub.homelinux.org>
References: <1221390552.25179.14.camel@Mikeul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1221390552.25179.14.camel@Mikeul>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 14, 2008 at 01:09:12PM +0200, Michel Stempin wrote:
>Probe chips in decreasing device size to detect most significant chip
>IDs first in case there are two chips with the same LSB.
>
>This case has been found between SST39VF3201 (Mfr: 0x0020, Id: 0x235B)
>and SST49LF080A (Mfr: 0x0020, Id: 0x005B) chips.
>
>Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>

Your patch is word-wrapped.

josh
