Received: from wproxy.gmail.com ([64.233.184.199])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Ctpk7-0000aO-NY
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2005 11:10:09 -0500
Received: by wproxy.gmail.com with SMTP id 68so75332wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2005 08:10:03 -0800 (PST)
Message-ID: <6934efce050126081035423106@mail.gmail.com>
Date: Wed, 26 Jan 2005 08:10:02 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Unnamalai Kanchi Bashyam <unnamalai.bashyam@radixs.com>
In-Reply-To: <1106618384.13763.8.camel@server11>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <1106618384.13763.8.camel@server11>
Cc: linux-mtd@lists.infradead.org
Subject: Re: New Intel chip with CFIext version 1.3 not working.
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Newer versions of the MTD fix this.  I'm not aware of a patch that
would directly apply to that kernel.  I had good luck with backporting
current MTD's to older kernels.  the patchin.sh script found in the
CVS snapshots is useful in doing this.
