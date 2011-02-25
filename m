Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PstXD-0002K5-5r
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 09:00:23 +0000
Received: by wwb29 with SMTP id 29so1268675wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 01:00:21 -0800 (PST)
Subject: Re: xattr question AGAIN!
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steve Iribarne <siribarne@grid-net.com>
In-Reply-To: <4D5C200C.3010007@grid-net.com>
References: <4D5C200C.3010007@grid-net.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 10:58:59 +0200
Message-ID: <1298624339.2798.18.camel@localhost>
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

On Wed, 2011-02-16 at 11:05 -0800, Steve Iribarne wrote:
> Sorry for the repeat but I just want to be sure I'm getting this right.
> 
> So the UBIFS supports most of the SELinux xattrs.  I believe the only 
> exception is ACL.
> 
> Is this a correct assumption? 

Yes. However, we never tried selinux, so there may be some issues. We
might forget to do some small thing.

> And we are going to start doing some extensive testing on this, so I'll 
> report any issues we find.  I also may have resources to add ACL support.

Just try if selinux xattrs are supported or not and report back please.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
