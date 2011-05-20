Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNMny-0005RO-N5
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 10:19:39 +0000
Received: by ewy3 with SMTP id 3so1344343ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 03:19:36 -0700 (PDT)
Subject: Re: [PATCH v2] mkfs.ubifs: free-space-fixup: note supported kernels
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <1305807291-12774-1-git-send-email-bengardiner@nanometrics.ca>
References: <1305784599.2630.41.camel@localhost>
	<1305807291-12774-1-git-send-email-bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 13:15:45 +0300
Message-ID: <1305886545.2630.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, "Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2011-05-19 at 08:14 -0400, Ben Gardiner wrote:
>   *
>   * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
>   * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs needed
> + *                        the free space fixup will be performed only by kernel
> + *                        releases 2.6.40 or greater.
>   */

Since this is kind of an out-of-date copy of the kernel header file,
this change is not needed because it'll anyway go away when someone
syncs ubifs-media.h with the kernel.

After my changes to Matthew's patch and tweaks to your patch I've found
out that it is cleaner to just fold your patch into Mathew's and make
one single commit. I've thanked you in the commit message and pushed one
single commit instead:

http://git.infradead.org/mtd-utils.git/commit/04665066ebedb0a31335b525fb5f19df32cb8cfe

Hopefully you will not mind.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
