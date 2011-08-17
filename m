Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qtb4a-00008q-0a
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 08:02:00 +0000
Received: by iyf13 with SMTP id 13so1458039iyf.16
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Aug 2011 01:01:57 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd_debug: report ecc layout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Date: Wed, 17 Aug 2011 11:03:39 +0300
In-Reply-To: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
	<e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313568224.20534.1.camel@sauron>
Mime-Version: 1.0
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

On Tue, 2011-08-09 at 16:57 -0400, Ben Gardiner wrote:
> The mtd_debug 'info' command reports a great deal of useful information about
> the mtd device is it given for a query.
> 
> Add the ECC size and OOB available to that list. The other entries in the
> ecclayout struct are arrays and are not as meaningful as eccsize and oobavail.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
> ---
> 
> I noticed that the struct nand_ecclayout_user and its corresponding ioctl
> has been marked deprecated; however, since this is a 'debug' utility and at
> least one person found it useful I thought it would be a good idea to propose
> these changes anyways.

I think we could just kill depricated ioctls as soon as we make
mtd-utils stop using them. If you add this dependency - it will be more
difficult to kill them.

-- 
Best Regards,
Artem Bityutskiy
