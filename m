Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvQ86-0001Vq-Vc
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 08:45:11 +0000
Received: by yic13 with SMTP id 13so4202053yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 01:45:09 -0700 (PDT)
Subject: Re: [RFC 3/5] mtd: do not assume oobsize is power of 2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 22 Aug 2011 11:46:56 +0300
In-Reply-To: <1313625029-19546-4-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314002821.2644.77.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> Previous generations of MTDs all used OOB sizes that were powers of 2,
> (e.g., 64, 128). However, newer generations of flash, especially NAND,
> use irregular OOB sizes that are not powers of 2 (e.g., 218, 224, 448).
> This means we cannot use masks like "mtd->oobsize - 1" to assume that we
> will get a proper bitmask for OOB operations.
> 
> As I see it, we don't actually need these masks anyway, so kill them.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Once you double checked that you caught all the places which assume
power-of-2 and do things like "x & (mtd->oobsize - 1", and once you
confirmed that you did some basic test by running few nandwrite commands
which involve OOB operations, I think this patch can go in
independently.

IOW, this does need to be RFC, IMO.

But yes, if there is a buggy piece of user-space code which uses
non-aligned offsets, and kernel alignes them - this change will break
it. IOW, this patch may expose bugs in user-space code. This is kind of
ABI break, but I think for MTD which is not very widely used, we can do
things like this.

IOW, I understand that this may break some user-space program, but
working with MTD for many years I thing there are very very little of
such programs and I think it is not a huge issue.

-- 
Best Regards,
Artem Bityutskiy
